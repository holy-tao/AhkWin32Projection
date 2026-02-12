#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMDeploymentManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMDeploymentManager
     * @type {Guid}
     */
    static IID => Guid("{35f785fa-1979-4a8b-bc8f-fd70eb0d1544}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportDownloadBegin", "ReportDownloadProgress", "ReportDownloadComplete", "BeginInstall", "BeginUpdate", "BeginDeployPackage", "BeginUpdateDeployedPackageLegacy", "BeginUninstall", "BeginEnterpriseAppInstall", "BeginEnterpriseAppUpdate", "BeginUpdateLicense", "GetLicenseChallenge", "GetLicenseChallengeByProductID", "GetLicenseChallengeByProductID2", "RevokeLicense", "RebindMdilBinaries", "RebindAllMdilBinaries", "RegenerateXbf", "GenerateXbfForCurrentLocale", "BeginProvision", "BeginDeprovision", "ReindexSQLCEDatabases", "SetApplicationsNeedMaintenance", "UpdateChamberProfile", "EnterprisePolicyIsApplicationAllowed", "BeginUpdateDeployedPackage", "ReportRestoreCancelled", "ResolveResourceString", "UpdateCapabilitiesForModernApps", "ReportDownloadStatusUpdate", "BeginUninstallWithOptions", "BindDeferredMdilBinaries", "GenerateXamlLightupXbfForCurrentLocale", "AddLicenseForAppx", "FixJunctionsForAppsOnSDCard"]

    /**
     * 
     * @param {Guid} productID 
     * @returns {HRESULT} 
     */
    ReportDownloadBegin(productID) {
        result := ComCall(3, this, "ptr", productID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @param {Integer} usProgress 
     * @returns {HRESULT} 
     */
    ReportDownloadProgress(productID, usProgress) {
        result := ComCall(4, this, "ptr", productID, "ushort", usProgress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     */
    ReportDownloadComplete(productID, hrResult) {
        result := ComCall(5, this, "ptr", productID, "int", hrResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<PM_INSTALLINFO>} pInstallInfo 
     * @returns {HRESULT} 
     */
    BeginInstall(pInstallInfo) {
        result := ComCall(6, this, "ptr", pInstallInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a handle that can be used by the UpdateResource function to add, delete, or replace resources in a binary module. (Unicode)
     * @remarks
     * It is recommended that the resource file is not loaded before this function is called. However, if that file is already loaded, it will not cause an error to be returned.
     * 
     * There are some restrictions on resource updates in files that contain  Resource Configuration(RC Config) data: LN files and the associated .mui files. Details on which types of resources are allowed to be updated in these files are in the Remarks section for the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> function.
     * 
     * This function can update resources within modules that contain both code and resources. As noted above, there are restrictions on resource updates in LN files and .mui files, both of which contain RC Config data; details of the restrictions are in the reference for the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> function.
     * @param {Pointer<PM_UPDATEINFO>} pUpdateInfo 
     * @returns {HRESULT} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, the return value is a handle that can be used by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-updateresourcea">UpdateResource</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-endupdateresourcea">EndUpdateResource</a> functions. The return value is <b>NULL</b> if the specified file is not a PE, the file does not exist, or the file cannot be opened for writing. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-beginupdateresourcew
     */
    BeginUpdate(pUpdateInfo) {
        result := ComCall(7, this, "ptr", pUpdateInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<PM_INSTALLINFO>} pInstallInfo 
     * @returns {HRESULT} 
     */
    BeginDeployPackage(pInstallInfo) {
        result := ComCall(8, this, "ptr", pInstallInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO_LEGACY>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginUpdateDeployedPackageLegacy(pUpdateInfo) {
        result := ComCall(9, this, "ptr", pUpdateInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @returns {HRESULT} 
     */
    BeginUninstall(productID) {
        result := ComCall(10, this, "ptr", productID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<PM_INSTALLINFO>} pInstallInfo 
     * @returns {HRESULT} 
     */
    BeginEnterpriseAppInstall(pInstallInfo) {
        result := ComCall(11, this, "ptr", pInstallInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginEnterpriseAppUpdate(pUpdateInfo) {
        result := ComCall(12, this, "ptr", pUpdateInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @param {Guid} offerID 
     * @param {Pointer<Integer>} pbLicense 
     * @param {Integer} cbLicense 
     * @returns {HRESULT} 
     */
    BeginUpdateLicense(productID, offerID, pbLicense, cbLicense) {
        pbLicenseMarshal := pbLicense is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "ptr", productID, "ptr", offerID, pbLicenseMarshal, pbLicense, "uint", cbLicense, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} PackagePath 
     * @param {Pointer<Pointer<Integer>>} ppbChallenge 
     * @param {Pointer<Integer>} pcbChallenge 
     * @param {Pointer<Pointer<Integer>>} ppbKID 
     * @param {Pointer<Integer>} pcbKID 
     * @param {Pointer<Pointer<Integer>>} ppbDeviceID 
     * @param {Pointer<Integer>} pcbDeviceID 
     * @param {Pointer<Pointer<Integer>>} ppbSaltValue 
     * @param {Pointer<Integer>} pcbSaltValue 
     * @param {Pointer<Pointer<Integer>>} ppbKGVValue 
     * @param {Pointer<Integer>} pcbKGVValue 
     * @returns {HRESULT} 
     */
    GetLicenseChallenge(PackagePath, ppbChallenge, pcbChallenge, ppbKID, pcbKID, ppbDeviceID, pcbDeviceID, ppbSaltValue, pcbSaltValue, ppbKGVValue, pcbKGVValue) {
        if(PackagePath is String) {
            pin := BSTR.Alloc(PackagePath)
            PackagePath := pin.Value
        }

        ppbChallengeMarshal := ppbChallenge is VarRef ? "ptr*" : "ptr"
        pcbChallengeMarshal := pcbChallenge is VarRef ? "uint*" : "ptr"
        ppbKIDMarshal := ppbKID is VarRef ? "ptr*" : "ptr"
        pcbKIDMarshal := pcbKID is VarRef ? "uint*" : "ptr"
        ppbDeviceIDMarshal := ppbDeviceID is VarRef ? "ptr*" : "ptr"
        pcbDeviceIDMarshal := pcbDeviceID is VarRef ? "uint*" : "ptr"
        ppbSaltValueMarshal := ppbSaltValue is VarRef ? "ptr*" : "ptr"
        pcbSaltValueMarshal := pcbSaltValue is VarRef ? "uint*" : "ptr"
        ppbKGVValueMarshal := ppbKGVValue is VarRef ? "ptr*" : "ptr"
        pcbKGVValueMarshal := pcbKGVValue is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", PackagePath, ppbChallengeMarshal, ppbChallenge, pcbChallengeMarshal, pcbChallenge, ppbKIDMarshal, ppbKID, pcbKIDMarshal, pcbKID, ppbDeviceIDMarshal, ppbDeviceID, pcbDeviceIDMarshal, pcbDeviceID, ppbSaltValueMarshal, ppbSaltValue, pcbSaltValueMarshal, pcbSaltValue, ppbKGVValueMarshal, ppbKGVValue, pcbKGVValueMarshal, pcbKGVValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Pointer<Pointer<Integer>>} ppbChallenge 
     * @param {Pointer<Integer>} pcbLicense 
     * @returns {HRESULT} 
     */
    GetLicenseChallengeByProductID(ProductID, ppbChallenge, pcbLicense) {
        ppbChallengeMarshal := ppbChallenge is VarRef ? "ptr*" : "ptr"
        pcbLicenseMarshal := pcbLicense is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", ProductID, ppbChallengeMarshal, ppbChallenge, pcbLicenseMarshal, pcbLicense, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Pointer<Pointer<Integer>>} ppbChallenge 
     * @param {Pointer<Integer>} pcbLicense 
     * @param {Pointer<Pointer<Integer>>} ppbKID 
     * @param {Pointer<Integer>} pcbKID 
     * @param {Pointer<Pointer<Integer>>} ppbDeviceID 
     * @param {Pointer<Integer>} pcbDeviceID 
     * @param {Pointer<Pointer<Integer>>} ppbSaltValue 
     * @param {Pointer<Integer>} pcbSaltValue 
     * @param {Pointer<Pointer<Integer>>} ppbKGVValue 
     * @param {Pointer<Integer>} pcbKGVValue 
     * @returns {HRESULT} 
     */
    GetLicenseChallengeByProductID2(ProductID, ppbChallenge, pcbLicense, ppbKID, pcbKID, ppbDeviceID, pcbDeviceID, ppbSaltValue, pcbSaltValue, ppbKGVValue, pcbKGVValue) {
        ppbChallengeMarshal := ppbChallenge is VarRef ? "ptr*" : "ptr"
        pcbLicenseMarshal := pcbLicense is VarRef ? "uint*" : "ptr"
        ppbKIDMarshal := ppbKID is VarRef ? "ptr*" : "ptr"
        pcbKIDMarshal := pcbKID is VarRef ? "uint*" : "ptr"
        ppbDeviceIDMarshal := ppbDeviceID is VarRef ? "ptr*" : "ptr"
        pcbDeviceIDMarshal := pcbDeviceID is VarRef ? "uint*" : "ptr"
        ppbSaltValueMarshal := ppbSaltValue is VarRef ? "ptr*" : "ptr"
        pcbSaltValueMarshal := pcbSaltValue is VarRef ? "uint*" : "ptr"
        ppbKGVValueMarshal := ppbKGVValue is VarRef ? "ptr*" : "ptr"
        pcbKGVValueMarshal := pcbKGVValue is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", ProductID, ppbChallengeMarshal, ppbChallenge, pcbLicenseMarshal, pcbLicense, ppbKIDMarshal, ppbKID, pcbKIDMarshal, pcbKID, ppbDeviceIDMarshal, ppbDeviceID, pcbDeviceIDMarshal, pcbDeviceID, ppbSaltValueMarshal, ppbSaltValue, pcbSaltValueMarshal, pcbSaltValue, ppbKGVValueMarshal, ppbKGVValue, pcbKGVValueMarshal, pcbKGVValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @returns {HRESULT} 
     */
    RevokeLicense(productID) {
        result := ComCall(17, this, "ptr", productID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Pointer<SAFEARRAY>} FileNames 
     * @returns {HRESULT} 
     */
    RebindMdilBinaries(ProductID, FileNames) {
        result := ComCall(18, this, "ptr", ProductID, "ptr", FileNames, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Guid} InstanceID 
     * @returns {HRESULT} 
     */
    RebindAllMdilBinaries(ProductID, InstanceID) {
        result := ComCall(19, this, "ptr", ProductID, "ptr", InstanceID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Pointer<SAFEARRAY>} AssemblyPaths 
     * @returns {HRESULT} 
     */
    RegenerateXbf(ProductID, AssemblyPaths) {
        result := ComCall(20, this, "ptr", ProductID, "ptr", AssemblyPaths, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {HRESULT} 
     */
    GenerateXbfForCurrentLocale(ProductID) {
        result := ComCall(21, this, "ptr", ProductID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {BSTR} XMLpath 
     * @returns {HRESULT} 
     */
    BeginProvision(ProductID, XMLpath) {
        if(XMLpath is String) {
            pin := BSTR.Alloc(XMLpath)
            XMLpath := pin.Value
        }

        result := ComCall(22, this, "ptr", ProductID, "ptr", XMLpath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {HRESULT} 
     */
    BeginDeprovision(ProductID) {
        result := ComCall(23, this, "ptr", ProductID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {HRESULT} 
     */
    ReindexSQLCEDatabases(ProductID) {
        result := ComCall(24, this, "ptr", ProductID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} RequiredMaintenanceOperations 
     * @returns {Integer} 
     */
    SetApplicationsNeedMaintenance(RequiredMaintenanceOperations) {
        result := ComCall(25, this, "uint", RequiredMaintenanceOperations, "uint*", &pcApplications := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcApplications
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {HRESULT} 
     */
    UpdateChamberProfile(ProductID) {
        result := ComCall(26, this, "ptr", ProductID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} productId 
     * @param {PWSTR} publisherName 
     * @returns {BOOL} 
     */
    EnterprisePolicyIsApplicationAllowed(productId, publisherName) {
        publisherName := publisherName is String ? StrPtr(publisherName) : publisherName

        result := ComCall(27, this, "ptr", productId, "ptr", publisherName, "int*", &pIsAllowed := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIsAllowed
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginUpdateDeployedPackage(pUpdateInfo) {
        result := ComCall(28, this, "ptr", pUpdateInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @returns {HRESULT} 
     */
    ReportRestoreCancelled(productID) {
        result := ComCall(29, this, "ptr", productID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} resourceString 
     * @param {Pointer<BSTR>} pResolvedResourceString 
     * @returns {HRESULT} 
     */
    ResolveResourceString(resourceString, pResolvedResourceString) {
        resourceString := resourceString is String ? StrPtr(resourceString) : resourceString

        result := ComCall(30, this, "ptr", resourceString, "ptr", pResolvedResourceString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateCapabilitiesForModernApps() {
        result := ComCall(31, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} productId 
     * @returns {HRESULT} 
     */
    ReportDownloadStatusUpdate(productId) {
        result := ComCall(32, this, "ptr", productId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @param {Integer} removalOptions 
     * @returns {HRESULT} 
     */
    BeginUninstallWithOptions(productID, removalOptions) {
        result := ComCall(33, this, "ptr", productID, "uint", removalOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BindDeferredMdilBinaries() {
        result := ComCall(34, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} PackageFamilyName 
     * @returns {HRESULT} 
     */
    GenerateXamlLightupXbfForCurrentLocale(PackageFamilyName) {
        if(PackageFamilyName is String) {
            pin := BSTR.Alloc(PackageFamilyName)
            PackageFamilyName := pin.Value
        }

        result := ComCall(35, this, "ptr", PackageFamilyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @param {Pointer<Integer>} pbLicense 
     * @param {Integer} cbLicense 
     * @param {Pointer<Integer>} pbPlayReadyHeader 
     * @param {Integer} cbPlayReadyHeader 
     * @returns {HRESULT} 
     */
    AddLicenseForAppx(productID, pbLicense, cbLicense, pbPlayReadyHeader, cbPlayReadyHeader) {
        pbLicenseMarshal := pbLicense is VarRef ? "char*" : "ptr"
        pbPlayReadyHeaderMarshal := pbPlayReadyHeader is VarRef ? "char*" : "ptr"

        result := ComCall(36, this, "ptr", productID, pbLicenseMarshal, pbLicense, "uint", cbLicense, pbPlayReadyHeaderMarshal, pbPlayReadyHeader, "uint", cbPlayReadyHeader, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FixJunctionsForAppsOnSDCard() {
        result := ComCall(37, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
