/*
Author      : q1035274
Modified On : 12-Jan-2021 
Schema      : EEL3
Database    :
    Test    : ELVISTST
    Prod    : ELVISPRD
Description : Disables PDF re-rendering for all active EEL profiles hosted under ELVIS
            : if you disable PDF file you need to disable OCR also aswell, why because OCR is the subtype of PDF
*/
update eel3.e3_study_profile_rendering
set render_yn        = 0,
    keep_original_yn = 1,
    ocr_yn = 0
where content_type = 'PDF'
  and profile_id in (
    select profile_id
    from eel3.e3_study_profile
    where study_locked = 0
      and hosting_env = 'ELVIS'
);




