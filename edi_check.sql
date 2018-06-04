select tmp.job_no , concat(t.chk_name,'  :  ', t.desc_cn) error_message 
from 
(select a.job_no,substring_index(substring_index(a.chk_result,',',b.chk_id),',',-1) id 
from 
edi_check_result_xh a
join
edi_check_ae_xh b
on b.chk_id <= (length(a.chk_result) - length(replace(a.chk_result,',',''))+1)
order by a.job_no ) tmp left join edi_check_ae_xh t  on t.chk_id = tmp.id 
where tmp.id <> -1
