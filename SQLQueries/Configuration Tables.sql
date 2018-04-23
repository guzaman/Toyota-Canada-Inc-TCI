--------------------------------------------
--SYSTEM CONFIGURATION TABLES
--------------------------------------------
SELECT TOP 10 * FROM Programs WITH(NOLOCK)
SELECT TOP 10 * FROM Channels WITH(NOLOCK)
SELECT TOP 10 * FROM ImportFileInfo WITH(NOLOCK)
SELECT TOP 10 * FROM UsageWindow WITH(NOLOCK)
SELECT TOP 10 * FROM NMSCPrograms WITH(NOLOCK)
SELECT TOP 10 * FROM NmscPreferences WITH(NOLOCK)
SELECT TOP 10 * FROM Scrubrules WITH(NOLOCK)
SELECT TOP 10 * FROM NMSCScrubRules  WITH(NOLOCK)
SELECT TOP 10 * FROM NMSCQuota WITH(NOLOCK)
SELECT TOP 10 * FROM FTPInfo WITH(NOLOCK)
SELECT TOP 10 * FROM countryholidays WITH(NOLOCK)
SELECT TOP 10 * FROM ReconciliationFileInfo WITH(NOLOCK)
SELECT TOP 10 * FROM RecycleRecords WITH(NOLOCK)
SELECT TOP 10 * FROM NMSCAllowedChannelInfo WITH(NOLOCK)
SELECT TOP 10 * FROM NMSCCCustomerIdentification WITH(NOLOCK)
SELECT TOP 10 * FROM NMSCCodes WITH(NOLOCK)
SELECT TOP 10 * FROM NMSCImportConfig WITH(NOLOCK)
SELECT TOP 10 * FROM NMSCImportQualifierQuestion WITH(NOLOCK)
SELECT TOP 10 * FROM NMSCImportQualifierQuestionRating WITH(NOLOCK)

--------------------------------------------
--WEB SURVEY CONFIGURATION TABLES
--------------------------------------------

SELECT TOP 10 * FROM NMSCAnonymousResponses WITH(NOLOCK)
SELECT TOP 10 * FROM NMSCLanguages WITH(NOLOCK)
SELECT TOP 10 * FROM SurveyInvitationConfiguration WITH(NOLOCK)


SELECT TOP 10 * FROM NMSCSurveyText WITH(NOLOCK)
SELECT TOP 10 * FROM Question WITH(NOLOCK)
SELECT TOP 10 * FROM Questiontext WITH(NOLOCK)
SELECT TOP 10 * FROM QuestionRating WITH(NOLOCK)
SELECT TOP 10 * FROM QuestionRatingText WITH(NOLOCK)

SELECT TOP 10 * FROM NMSCOptionalQuestions WITH(NOLOCK)
 
--------------------------------------------
-- REPORTING CONFIGURATION TABLES
--------------------------------------------

SELECT TOP 10 * FROM NMSCPrograms WITH(NOLOCK)
SELECT TOP 10 * FROM NMSCOptionalQuestions WITH(NOLOCK)
SELECT TOP 10 * FROM Translations WITH(NOLOCK)
SELECT TOP 10 * FROM Languages WITH(NOLOCK)
SELECT TOP 10 * FROM NMSCPortalLanguages WITH(NOLOCK)


-- Import Process Procedure Name
--ImportProcess 

-- Scrub Process Procedure Name
--ScrubProcess

