select *from finance_1;
select*from finance_2;
describe table finance_1;
select count(*)from finance_1;
select count(*)from finance_2;

# 1)Year wise loan amount Stats
select year(issue_d) as Year_of_Issue_date,
sum(loan_amnt) as Total_Loan_amount
from finance_1
group by Year_of_Issue_date
order by Year_of_Issue_date;
#--------------------------------------------------------------------------------------------#

# 2)Grade and sub grade wise revol_bal
select 
grade,sub_grade,sum(revol_bal) as Total_revol_bal
from finance_1 join finance_2 
on(finance_1.id=finance_2.id)
group by grade,sub_grade
order by grade,sub_grade;
#---------------------------------------------------------------------------------------------#

# 3)Total Payment for Verified Status Vs Total Payment for Non Verified Status
select verification_status,sum(total_pymnt) as Final_Payment
from
finance_1 join finance_2 
on(finance_1.id = finance_2.id)
group by verification_status
order by verification_status;
#-----------------------------------------------------------------------------------------------#

# 4) State wise and month wise loan status
select 
addr_state,last_credit_pull_D,loan_status from 
finance_1 join finance_2 
on(finance_1.id = finance_2.id);
#order by loan_status;
#------------------------------------------------------------------------------------------------#

# 5) Home ownership Vs last payment date stats
select
year(last_pymnt_D) as Year_,
round(sum(last_pymnt_amnt))as Total_Last_Payment,
home_ownership
from 
finance_1 join finance_2 
on(finance_1.id = finance_2.id)
group by home_ownership,Year_
order by home_ownership,Year_;



