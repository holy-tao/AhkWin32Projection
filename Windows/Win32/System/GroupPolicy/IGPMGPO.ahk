#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMGPO interface supports methods that enable you to manage Group Policy Objects (GPOs) in the directory service.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmgpo
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMGPO extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMGPO
     * @type {Guid}
     */
    static IID => Guid("{58cc4352-1ca3-48e5-9864-1da4d6e0d60f}")

    /**
     * The class identifier for GPMGPO
     * @type {Guid}
     */
    static CLSID => Guid("{d2ce2994-59b5-4064-b581-4d68486a16c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayName", "put_DisplayName", "get_Path", "get_ID", "get_DomainName", "get_CreationTime", "get_ModificationTime", "get_UserDSVersionNumber", "get_ComputerDSVersionNumber", "get_UserSysvolVersionNumber", "get_ComputerSysvolVersionNumber", "GetWMIFilter", "SetWMIFilter", "SetUserEnabled", "SetComputerEnabled", "IsUserEnabled", "IsComputerEnabled", "GetSecurityInfo", "SetSecurityInfo", "Delete", "Backup", "Import", "GenerateReport", "GenerateReportToFile", "CopyTo", "SetSecurityDescriptor", "GetSecurityDescriptor", "IsACLConsistent", "MakeACLConsistent"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_DisplayName(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_DisplayName(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(8, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Path(pVal) {
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ID(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_DomainName(pVal) {
        result := ComCall(11, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pDate 
     * @returns {HRESULT} 
     */
    get_CreationTime(pDate) {
        pDateMarshal := pDate is VarRef ? "double*" : "ptr"

        result := ComCall(12, this, pDateMarshal, pDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pDate 
     * @returns {HRESULT} 
     */
    get_ModificationTime(pDate) {
        pDateMarshal := pDate is VarRef ? "double*" : "ptr"

        result := ComCall(13, this, pDateMarshal, pDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_UserDSVersionNumber(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ComputerDSVersionNumber(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_UserSysvolVersionNumber(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ComputerSysvolVersionNumber(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IGPMWMIFilter>} ppIGPMWMIFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-getwmifilter
     */
    GetWMIFilter(ppIGPMWMIFilter) {
        result := ComCall(18, this, "ptr*", ppIGPMWMIFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGPMWMIFilter} pIGPMWMIFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-setwmifilter
     */
    SetWMIFilter(pIGPMWMIFilter) {
        result := ComCall(19, this, "ptr", pIGPMWMIFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-setuserenabled
     */
    SetUserEnabled(vbEnabled) {
        result := ComCall(20, this, "short", vbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-setcomputerenabled
     */
    SetComputerEnabled(vbEnabled) {
        result := ComCall(21, this, "short", vbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-isuserenabled
     */
    IsUserEnabled(pvbEnabled) {
        result := ComCall(22, this, "ptr", pvbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-iscomputerenabled
     */
    IsComputerEnabled(pvbEnabled) {
        result := ComCall(23, this, "ptr", pvbEnabled, "HRESULT")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for an object specified by a handle.
     * @param {Pointer<IGPMSecurityInfo>} ppSecurityInfo 
     * @returns {HRESULT} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//aclapi/nf-aclapi-getsecurityinfo
     */
    GetSecurityInfo(ppSecurityInfo) {
        result := ComCall(24, this, "ptr*", ppSecurityInfo, "HRESULT")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a specified object. The caller identifies the object by a handle.
     * @param {IGPMSecurityInfo} pSecurityInfo 
     * @returns {HRESULT} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//aclapi/nf-aclapi-setsecurityinfo
     */
    SetSecurityInfo(pSecurityInfo) {
        result := ComCall(25, this, "ptr", pSecurityInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-delete
     */
    Delete() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrBackupDir 
     * @param {BSTR} bstrComment 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-backup
     */
    Backup(bstrBackupDir, bstrComment, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        bstrBackupDir := bstrBackupDir is String ? BSTR.Alloc(bstrBackupDir).Value : bstrBackupDir
        bstrComment := bstrComment is String ? BSTR.Alloc(bstrComment).Value : bstrComment

        result := ComCall(27, this, "ptr", bstrBackupDir, "ptr", bstrComment, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IGPMBackup} pIGPMBackup 
     * @param {Pointer<VARIANT>} pvarMigrationTable 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-import
     */
    Import(lFlags, pIGPMBackup, pvarMigrationTable, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(28, this, "int", lFlags, "ptr", pIGPMBackup, "ptr", pvarMigrationTable, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-generatereport
     */
    GenerateReport(gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(29, this, "int", gpmReportType, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {BSTR} bstrTargetFilePath 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-generatereporttofile
     */
    GenerateReportToFile(gpmReportType, bstrTargetFilePath, ppIGPMResult) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(30, this, "int", gpmReportType, "ptr", bstrTargetFilePath, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IGPMDomain} pIGPMDomain 
     * @param {Pointer<VARIANT>} pvarNewDisplayName 
     * @param {Pointer<VARIANT>} pvarMigrationTable 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-copyto
     */
    CopyTo(lFlags, pIGPMDomain, pvarNewDisplayName, pvarMigrationTable, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(31, this, "int", lFlags, "ptr", pIGPMDomain, "ptr", pvarNewDisplayName, "ptr", pvarMigrationTable, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IDispatch} pSD 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-setsecuritydescriptor
     */
    SetSecurityDescriptor(lFlags, pSD) {
        result := ComCall(32, this, "int", lFlags, "ptr", pSD, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IDispatch>} ppSD 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-getsecuritydescriptor
     */
    GetSecurityDescriptor(lFlags, ppSD) {
        result := ComCall(33, this, "int", lFlags, "ptr*", ppSD, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbConsistent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-isaclconsistent
     */
    IsACLConsistent(pvbConsistent) {
        result := ComCall(34, this, "ptr", pvbConsistent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-makeaclconsistent
     */
    MakeACLConsistent() {
        result := ComCall(35, this, "HRESULT")
        return result
    }
}
