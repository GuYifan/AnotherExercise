# README

This is the same application as in home test, except there are 3 new features:
  1. Ability to login/signup through facebook
  2. Ability to login/signup through gmail
  3. Raffle

1) && 2) credentials:
  * password: oneclasspassword123456
  * email:oneclass.fb.test@gmail.com

3) Raffle rules:
  * Only logged in users may participate
  * Each user may participate only once every 10 seconds
  * Win/Loose detect by time of request. If time to_i by the moment when request was made is even - than user win, otherwise - loose
  * Wins count shows on the top nav menu
  * If user retry new attempt in less than 10 seconds from last attempt - show alert msg with time left for the next attempt.


Task to do:

  1. Write test for login/signup facebook and gmail
  2. Write test for raffle campaign



