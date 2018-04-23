--------------------------------------------
--SYSTEM CONFIGURATION TABLES
--------------------------------------------
use TCIsystemQA

SELECT  * FROM Programs WITH(NOLOCK) 
SELECT * FROM NMSCPrograms WITH(NOLOCK) where NMSCCode='CN'
select * from NMSCScrubRules
SELECT * FROM Channels WITH(NOLOCK)
SELECT * FROM ReconciliationFileInfo WITH(NOLOCK)
select * from FTPInfo
SELECT * FROM ImportFileInfo WITH(NOLOCK)
Select * from ImportFileFormat
SELECT * FROM UsageWindow WITH(NOLOCK)
SELECT * FROM NmscPreferences WITH(NOLOCK)
SELECT * FROM countryholidays WITH(NOLOCK)
SELECT * FROM RecycleRecords WITH(NOLOCK) --blank for both INF/CN
SELECT * FROM NMSCAllowedChannelInfo WITH(NOLOCK) --blank for both INF/CN
SELECT * FROM NMSCCCustomerIdentification WITH(NOLOCK)
SELECT * FROM NMSCCodes WITH(NOLOCK)
SELECT * FROM NMSCImportConfig WITH(NOLOCK)
SELECT * FROM NMSCImportQualifierQuestion WITH(NOLOCK) ---blank
SELECT * FROM NMSCImportQualifierQuestionRating WITH(NOLOCK) --blank
SELECT * FROM dbo.VINModelDetail WITH(NOLOCK)
SELECT * FROM dbo.VINModelYear WITH(NOLOCK)
SELECT * FROM dbo.OperationCode WITH(NOLOCK)
SELECT  * FROM dbo.RestrictedRecords WITH(NOLOCK)
select * from EventType WITH(NOLOCK)
select * from SurveyEmployee with (nolock)
select * from  EmployeeType
select * from AspNetUsers
select * from AspNetRoles
SELECT * FROM SurveyType
SELECT * FROM Clients
select * from NMSCCCustomerIdentification
select * from FromEmailAnswers
select * from FromEmailRecords
select * from CustomerPreferences
---Scrub Rules verification
---22
SELECT dbo.Disposition.Description,Scrubrules.* 
from scrubrules with (nolock)
inner join NMSCScrubRules  with (nolock) on NMSCScrubRules.RuleID = ScrubRules.Id
INNER JOIN dbo.Disposition
ON dbo.Disposition.DispID = dbo.ScrubRules.DispId
where NMSCCd = 'CN' 
and pgmcd ='SER'
ORDER BY ruleorder asc


---16
SELECT dbo.Disposition.Description,ClientCd,orderid,ProcName,Disposition.DispID,Disposition.ActiveInd,*
from scrubrules with (nolock)
inner join NMSCScrubRules  with (nolock) on NMSCScrubRules.RuleID = ScrubRules.Id
INNER JOIN dbo.Disposition
ON dbo.Disposition.DispID = dbo.ScrubRules.DispId
where NMSCCd = 'CN' 
and pgmcd ='NVD'
ORDER BY ruleorder asc


---16
SELECT dbo.Disposition.Description,ClientCd,orderid,ProcName,Disposition.DispID,Disposition.ActiveInd,*
from scrubrules with (nolock)
inner join NMSCScrubRules  with (nolock) on NMSCScrubRules.RuleID = ScrubRules.Id
INNER JOIN dbo.Disposition
ON dbo.Disposition.DispID = dbo.ScrubRules.DispId
where NMSCCd = 'CN' 
and pgmcd ='CPO'
ORDER BY ruleorder asc


SELECT * FROM NMSCQuota WITH(NOLOCK) ---blank
SELECT * FROM FTPInfo WITH(NOLOCK)
--SELECT  * FROM Orgs WITH(NOLOCK) --verified by maria
--SELECT  *,hpath.ToString() FROM Orghierarchy WITH(NOLOCK) --verified by maria


-------------------------------------------
--Import Process
-------------------------------------------

SELECT * FROM ImportFileCatalog WITH(NOLOCK)
SELECT * FROM importfileformat WITH(NOLOCK)
SELECT * FROM ApplicationParameter WITH(NOLOCK) where ClientCD like 'TMC'
--------------------------------------------
--WEB SURVEY CONFIGURATION TABLES
--------------------------------------------

SELECT  * FROM NMSCAnonymousResponses WITH(NOLOCK)
SELECT  * FROM NMSCLanguages WITH(NOLOCK)
SELECT  * FROM SurveyInvitationConfiguration WITH(NOLOCK)
select * from SurveyType
SELECT * FROM NMSCSurveyText WITH(NOLOCK)
SELECT  * FROM Question WITH(NOLOCK) where PgmCD='Ser' and QuestionType='Q'
SELECT  * FROM Questiontext WITH(NOLOCK) 

SELECT  QR.QuestionID,Q.ShortName,QR.SeqNo,QR.RatingKey,* FROM QuestionRating QR WITH(NOLOCK) inner join Question Q
on QR.QuestionID=Q.QuestionID
order by QR.QuestionID asc

SELECT  * FROM QuestionRatingText WITH(NOLOCK)
SELECT  * FROM NMSCOptionalQuestions WITH(NOLOCK)

--Reporting Tables
--these tables are not part of configurations(Not Verified)
--SELECT  * FROM Processsurveyids WITH(NOLOCK)
--SELECT  * FROM EmailRecords WITH(NOLOCK)
--SELECT * FROM EmailControl WITH(NOLOCK)
--SELECT  * FROM Websurveyquestion WITH(NOLOCK)
--SELECT * FROM WebSurveyComments WITH(NOLOCK)
--SELECT  * FROM Surveyquestion WITH(NOLOCK)
--SELECT * FROM PhoneRecords WITH(NOLOCK)
--Select * from surveyfact
--Select * from importrecords

 
--------------------------------------------
-- REPORTING CONFIGURATION TABLES
--------------------------------------------
use TCIReportingDev

--SELECT   *
--		FROM	DataBaseLinkServer WITH(NOLOCK)
--		WHERE	LinkServerType = 'System'

SELECT * FROM NMSCPrograms WITH(NOLOCK)
SELECT * FROM Translations WITH(NOLOCK)
SELECT * FROM Languages WITH(NOLOCK)
select * from NMSCLanguages with(nolock)
SELECT * FROM NMSCPortalLanguages WITH(NOLOCK)

select * from model
select * from modelType
select * from modelmapping
