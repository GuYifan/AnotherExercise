# README

This is the same application that you completed from the take home test, except three new features has been added:

  1. Ability to login/signup through facebook
  2. Ability to login/signup through gmail
  3. Raffle

The credentials for 1) && 2) are:
  * password: oneclasspassword123456
  * email:oneclass.fb.test@gmail.com

The rules for the Raffle:
  * Only logged in users may participate
  * Each user may participate only once every 10 seconds
  * Win/Lose detect by time of request after user click on the "Raffle" button on the top nav. If time to_i by the moment when request was made is even - then user wins, otherwise - lose.
  * Wins count shows on the top nav menu
  * If user retry new attempt in less than 10 seconds from last attempt - show alert message with time left in order to try the next attempt.


Task to do:

  1. Write test for login/signup Facebook
  2. Write test for login/signup Gmail
  3. Write test for raffle campaign



