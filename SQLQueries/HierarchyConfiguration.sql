--use TCISystemQA

USE TCIReportingQA


select * from ORGS where OrgID = 101
select * from OrgHierarchy


select * from orgs
select org.*,o.OrgLevel,o.OrgType,org.hPath.GetAncestor(1) [parent] 
from orghierarchy org inner join orgs o on o.OrgId = org.OrgID


---- Check for Default Hierarchies --
SELECT * FROM orgs WHERE Terminated IS null
SELECT * FROM dbo.OrgHierarchy WHERE IsDefault=1 AND HierarchyID<>505
SELECT * FROM orgs WHERE orgid IN (SELECT DISTINCT hierarchyid FROM dbo.OrgHierarchy WHERE  IsDefault=1)
SELECT * FROM dbo.OrgHierarchy WHERE HierarchyID=505
SELECT * FROM orgs WHERE Orgcode='USA'
SELECT * FROM orgs WHERE ClientCd='USA'

select * from OrgHierarchy OH where oh.OrgID in( 1217,518,102)


select * from ORGS O
join OrgHierarchy OH
on o.OrgId = oh.OrgID
where OH.HierarchyID = '11'


SELECT * 
from 
OrgHierarchy OH with(nolock)

select * from ORGS where OrgId = 1248


select 
--distinct O.OrgID, o_a.*
OH.HierarchyID,OH.OrgID,O.OrgId,o_a.OrgId,o_a.*
from Orgs O 
inner join OrgHierarchy OH  on o.OrgId        = oh.OrgID
inner join  OrgHierarchy OH_A on OH.hPath.IsDescendantOf(OH_A.hPath) = 1
inner join  Orgs O_A   on OH_A.OrgID       = O_A.OrgID
--where o.orgid = 1217 -- Retailer ID
where o_a.OrgLevel = 2 and OH.HierarchyID <> o_a.OrgId
order by O_A.OrgId


---- Check Dulication of Hpath for the same organization--
SELECT orgid,Hpath,COUNT(*)
FROM dbo.OrgHierarchy
GROUP BY orgid,Hpath
HAVING COUNT(*) > 1

SELECT Hpath,COUNT(*)
FROM dbo.OrgHierarchy
GROUP BY Hpath
HAVING COUNT(*) > 1


SELECT o.OrgType,o.OrgName,o.Terminated,ee.* FROM employee ee INNER JOIN 
dbo.ORGS o ON ee.retailerid=o.OrgId
WHERE o.ClientCd='CN' AND o.orgtype='dealer' --AND ee.EmpId='ESUnk' 
AND o.Terminated='N' AND ISNULL(ee.eStatus,'')<>'A'

SELECT o.OrgType,o.OrgName,o.Terminated,ee.* FROM employee ee INNER JOIN 
dbo.ORGS o ON ee.retailerid=o.OrgId
WHERE o.ClientCd='USA' AND o.orgtype='retailer' --AND ee.EmpId='ESUnk' 
AND o.Terminated='Y' AND ee.eStatus<>'D'

SELECT DISTINCT OrgId,OrgCode,OrgName FROM orgs WHERE --ClientCd='USA' AND 
OrgType='Dealer'
ORDER BY orgname asc

Select * from OrgsMapping

EXEC [CvGetDynamicHierarchies] 1

sp_helptext CvGetDynamicHierarchies

select * from OrgsMapping OM where OM.orgid in ( 1007,509,107,101,11,12)

select OMP.Orgid,OM.OrgID [ParentID],OMP.Rno,OM.Rno,* 
from OrgsMapping OMP  
inner join OrgsMapping OM on OMP.ParentOrgID = OM.OrgID
where OMP.orgid = 101

select * from ORGS OG with(nolock) where OG.Terminated = 'N' order by orgid

select 
OG.ClientCd,OG.OrgId,OH.HierarchyID,OH.IsDefault,OG.OrgCode,OG.Orgname,OG.orgtype,OG.orglevel,
OGP.OrgLevel [ParentOrglevel],OGP.OrgId [ParentORGid],OGP.OrgCode [ParentOrgCode],OGP.Orgname [ParentOrgName],OGP.orgtype [ParentOrgType],
ROW_NUMBER() over (order by OG.OrgId) [RNo]
into #ORGMapping
from 
		OrgHierarchy OH with(nolock) 
LEFT join OrgHierarchy OHP with(NOLOCK) on OHP.hPATH = OH.hPATH.GetAncestor(1)
LEFT join ORGS OG with(nolock) on OG.OrgId = OH.OrgID
LEFT join ORGS OGP with(Nolock) on OGP.OrgId = OHP.OrgID
--where OH.OrgID in ( 1007,509,107,101,11,12)
order by 2,3,4


select * from #ORGMapping
select *,
(select OMP.Rno from #ORGMapping OMP where OMP.OrgID = OM.ParentORGid and OMP.HierarchyID = OM.HierarchyID ) [ParentRno]
from #ORGMapping OM
order by 2,3,4


select OM.* 
from OrgsMapping OM inner join ORGS OG on OG.OrgId = OM.OrgID
--where OM.orgid in ( 1007,509,107,101,11,12) 
order by 2,3,4


select * from OrgsMapping OM where OM.orgtype = 'Employee' and orgid = 200001
select OG.ClientCd,e.EmployeeID OrgID,OH.HierarchyID,OH.IsDefault,
E.EmployeeCode [OrgCode],E.EmployeeName [OrgName],'employee' [OrgType],'7' [OrgLevel],
'6' [ParentOrgLevel],E.*
from 
			Employee E with(nolock)  
inner join	OrgHierarchy OH with(nolock) on OH.OrgID = E.RetailerID
inner join	ORGS		 OG with(nolock) on OG.OrgId = e.RetailerID
inner join	EmployeeType ET with(nolock) on ET.EmployeeTypeID = E.EmployeeTypeID
where E.eStatus = 'A'and  E.EmployeeID = 200001 

select * from EmployeeType ET with(nolock) 
select top 10 * from Employee






