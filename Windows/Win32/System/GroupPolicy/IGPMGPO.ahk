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
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_DisplayName(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_DisplayName(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(8, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Path(pVal) {
        result := ComCall(9, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ID(pVal) {
        result := ComCall(10, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_DomainName(pVal) {
        result := ComCall(11, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pDate 
     * @returns {HRESULT} 
     */
    get_CreationTime(pDate) {
        result := ComCall(12, this, "double*", pDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pDate 
     * @returns {HRESULT} 
     */
    get_ModificationTime(pDate) {
        result := ComCall(13, this, "double*", pDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_UserDSVersionNumber(pVal) {
        result := ComCall(14, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_ComputerDSVersionNumber(pVal) {
        result := ComCall(15, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_UserSysvolVersionNumber(pVal) {
        result := ComCall(16, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_ComputerSysvolVersionNumber(pVal) {
        result := ComCall(17, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IGPMWMIFilter>} ppIGPMWMIFilter 
     * @returns {HRESULT} 
     */
    GetWMIFilter(ppIGPMWMIFilter) {
        result := ComCall(18, this, "ptr", ppIGPMWMIFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IGPMWMIFilter>} pIGPMWMIFilter 
     * @returns {HRESULT} 
     */
    SetWMIFilter(pIGPMWMIFilter) {
        result := ComCall(19, this, "ptr", pIGPMWMIFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbEnabled 
     * @returns {HRESULT} 
     */
    SetUserEnabled(vbEnabled) {
        result := ComCall(20, this, "short", vbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbEnabled 
     * @returns {HRESULT} 
     */
    SetComputerEnabled(vbEnabled) {
        result := ComCall(21, this, "short", vbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbEnabled 
     * @returns {HRESULT} 
     */
    IsUserEnabled(pvbEnabled) {
        result := ComCall(22, this, "ptr", pvbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbEnabled 
     * @returns {HRESULT} 
     */
    IsComputerEnabled(pvbEnabled) {
        result := ComCall(23, this, "ptr", pvbEnabled, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(24, this, "ptr", ppSecurityInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets specified security information in the security descriptor of a specified object. The caller identifies the object by a handle.
     * @param {Pointer<IGPMSecurityInfo>} pSecurityInfo 
     * @returns {HRESULT} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//aclapi/nf-aclapi-setsecurityinfo
     */
    SetSecurityInfo(pSecurityInfo) {
        result := ComCall(25, this, "ptr", pSecurityInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(26, this, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    Backup(bstrBackupDir, bstrComment, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        bstrBackupDir := bstrBackupDir is String ? BSTR.Alloc(bstrBackupDir).Value : bstrBackupDir
        bstrComment := bstrComment is String ? BSTR.Alloc(bstrComment).Value : bstrComment

        result := ComCall(27, this, "ptr", bstrBackupDir, "ptr", bstrComment, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr", ppIGPMResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IGPMBackup>} pIGPMBackup 
     * @param {Pointer<VARIANT>} pvarMigrationTable 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     */
    Import(lFlags, pIGPMBackup, pvarMigrationTable, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(28, this, "int", lFlags, "ptr", pIGPMBackup, "ptr", pvarMigrationTable, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr", ppIGPMResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     */
    GenerateReport(gpmReportType, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(29, this, "int", gpmReportType, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr", ppIGPMResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {BSTR} bstrTargetFilePath 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     */
    GenerateReportToFile(gpmReportType, bstrTargetFilePath, ppIGPMResult) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(30, this, "int", gpmReportType, "ptr", bstrTargetFilePath, "ptr", ppIGPMResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IGPMDomain>} pIGPMDomain 
     * @param {Pointer<VARIANT>} pvarNewDisplayName 
     * @param {Pointer<VARIANT>} pvarMigrationTable 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     */
    CopyTo(lFlags, pIGPMDomain, pvarNewDisplayName, pvarMigrationTable, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(31, this, "int", lFlags, "ptr", pIGPMDomain, "ptr", pvarNewDisplayName, "ptr", pvarMigrationTable, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr", ppIGPMResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IDispatch>} pSD 
     * @returns {HRESULT} 
     */
    SetSecurityDescriptor(lFlags, pSD) {
        result := ComCall(32, this, "int", lFlags, "ptr", pSD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IDispatch>} ppSD 
     * @returns {HRESULT} 
     */
    GetSecurityDescriptor(lFlags, ppSD) {
        result := ComCall(33, this, "int", lFlags, "ptr", ppSD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbConsistent 
     * @returns {HRESULT} 
     */
    IsACLConsistent(pvbConsistent) {
        result := ComCall(34, this, "ptr", pvbConsistent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MakeACLConsistent() {
        result := ComCall(35, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
