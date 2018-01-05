class PagesController < ApplicationController
  def home
    if current_user
      @orders = current_user.orders
    end
  end

  def raffle
    if current_user
      time_i                  = Time.now.to_i
      last_attempt_time       = current_user.raffles.last.created_at.to_i rescue 0
      diff_from_last_attempt  = time_i - last_attempt_time
      puts time_i
      if diff_from_last_attempt >= Raffle::SECONDS_DIFF
        if time_i%2 == 0
          @success = true
        else
          @success = false
          @msg = 'You loose'
        end
        current_user.raffles.create win: @success
      else
        @success = false
        @msg     = "You can retry in #{Raffle::SECONDS_DIFF-diff_from_last_attempt} seconds"
      end
    else
      @success = false
      @msg = 'You should be loggedin user!'
    end
    render json: { success: @success, msg: @msg }
  end
end
