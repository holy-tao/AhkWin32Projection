#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPM interface provides methods that access other interfaces of the Group Policy Management Console (GPMC) and methods that create other objects on which various search operations can be performed.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpm
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPM extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPM
     * @type {Guid}
     */
    static IID => Guid("{f5fae809-3bd6-4da9-a65e-17665b41d763}")

    /**
     * The class identifier for GPM
     * @type {Guid}
     */
    static CLSID => Guid("{f5694708-88fe-4b35-babf-e56162d5fbc8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDomain", "GetBackupDir", "GetSitesContainer", "GetRSOP", "CreatePermission", "CreateSearchCriteria", "CreateTrustee", "GetClientSideExtensions", "GetConstants", "GetMigrationTable", "CreateMigrationTable", "InitializeReporting"]

    /**
     * 
     * @param {BSTR} bstrDomain 
     * @param {BSTR} bstrDomainController 
     * @param {Integer} lDCFlags 
     * @param {Pointer<IGPMDomain>} pIGPMDomain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm-getdomain
     */
    GetDomain(bstrDomain, bstrDomainController, lDCFlags, pIGPMDomain) {
        bstrDomain := bstrDomain is String ? BSTR.Alloc(bstrDomain).Value : bstrDomain
        bstrDomainController := bstrDomainController is String ? BSTR.Alloc(bstrDomainController).Value : bstrDomainController

        result := ComCall(7, this, "ptr", bstrDomain, "ptr", bstrDomainController, "int", lDCFlags, "ptr*", pIGPMDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrBackupDir 
     * @param {Pointer<IGPMBackupDir>} pIGPMBackupDir 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm-getbackupdir
     */
    GetBackupDir(bstrBackupDir, pIGPMBackupDir) {
        bstrBackupDir := bstrBackupDir is String ? BSTR.Alloc(bstrBackupDir).Value : bstrBackupDir

        result := ComCall(8, this, "ptr", bstrBackupDir, "ptr*", pIGPMBackupDir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrForest 
     * @param {BSTR} bstrDomain 
     * @param {BSTR} bstrDomainController 
     * @param {Integer} lDCFlags 
     * @param {Pointer<IGPMSitesContainer>} ppIGPMSitesContainer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm-getsitescontainer
     */
    GetSitesContainer(bstrForest, bstrDomain, bstrDomainController, lDCFlags, ppIGPMSitesContainer) {
        bstrForest := bstrForest is String ? BSTR.Alloc(bstrForest).Value : bstrForest
        bstrDomain := bstrDomain is String ? BSTR.Alloc(bstrDomain).Value : bstrDomain
        bstrDomainController := bstrDomainController is String ? BSTR.Alloc(bstrDomainController).Value : bstrDomainController

        result := ComCall(9, this, "ptr", bstrForest, "ptr", bstrDomain, "ptr", bstrDomainController, "int", lDCFlags, "ptr*", ppIGPMSitesContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gpmRSoPMode 
     * @param {BSTR} bstrNamespace 
     * @param {Integer} lFlags 
     * @param {Pointer<IGPMRSOP>} ppIGPMRSOP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm-getrsop
     */
    GetRSOP(gpmRSoPMode, bstrNamespace, lFlags, ppIGPMRSOP) {
        bstrNamespace := bstrNamespace is String ? BSTR.Alloc(bstrNamespace).Value : bstrNamespace

        result := ComCall(10, this, "int", gpmRSoPMode, "ptr", bstrNamespace, "int", lFlags, "ptr*", ppIGPMRSOP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTrustee 
     * @param {Integer} perm 
     * @param {VARIANT_BOOL} bInheritable 
     * @param {Pointer<IGPMPermission>} ppPerm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm-createpermission
     */
    CreatePermission(bstrTrustee, perm, bInheritable, ppPerm) {
        bstrTrustee := bstrTrustee is String ? BSTR.Alloc(bstrTrustee).Value : bstrTrustee

        result := ComCall(11, this, "ptr", bstrTrustee, "int", perm, "short", bInheritable, "ptr*", ppPerm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IGPMSearchCriteria>} ppIGPMSearchCriteria 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm-createsearchcriteria
     */
    CreateSearchCriteria(ppIGPMSearchCriteria) {
        result := ComCall(12, this, "ptr*", ppIGPMSearchCriteria, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTrustee 
     * @param {Pointer<IGPMTrustee>} ppIGPMTrustee 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm-createtrustee
     */
    CreateTrustee(bstrTrustee, ppIGPMTrustee) {
        bstrTrustee := bstrTrustee is String ? BSTR.Alloc(bstrTrustee).Value : bstrTrustee

        result := ComCall(13, this, "ptr", bstrTrustee, "ptr*", ppIGPMTrustee, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IGPMCSECollection>} ppIGPMCSECollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm-getclientsideextensions
     */
    GetClientSideExtensions(ppIGPMCSECollection) {
        result := ComCall(14, this, "ptr*", ppIGPMCSECollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IGPMConstants>} ppIGPMConstants 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm-getconstants
     */
    GetConstants(ppIGPMConstants) {
        result := ComCall(15, this, "ptr*", ppIGPMConstants, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMigrationTablePath 
     * @param {Pointer<IGPMMigrationTable>} ppMigrationTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm-getmigrationtable
     */
    GetMigrationTable(bstrMigrationTablePath, ppMigrationTable) {
        bstrMigrationTablePath := bstrMigrationTablePath is String ? BSTR.Alloc(bstrMigrationTablePath).Value : bstrMigrationTablePath

        result := ComCall(16, this, "ptr", bstrMigrationTablePath, "ptr*", ppMigrationTable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IGPMMigrationTable>} ppMigrationTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm-createmigrationtable
     */
    CreateMigrationTable(ppMigrationTable) {
        result := ComCall(17, this, "ptr*", ppMigrationTable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpm-initializereporting
     */
    InitializeReporting(bstrAdmPath) {
        bstrAdmPath := bstrAdmPath is String ? BSTR.Alloc(bstrAdmPath).Value : bstrAdmPath

        result := ComCall(18, this, "ptr", bstrAdmPath, "HRESULT")
        return result
    }
}
