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
     * 
     * @param {Pointer<Guid>} productID 
     * @returns {HRESULT} 
     */
    ReportDownloadBegin(productID) {
        result := ComCall(3, this, "ptr", productID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} productID 
     * @param {Integer} usProgress 
     * @returns {HRESULT} 
     */
    ReportDownloadProgress(productID, usProgress) {
        result := ComCall(4, this, "ptr", productID, "ushort", usProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} productID 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     */
    ReportDownloadComplete(productID, hrResult) {
        result := ComCall(5, this, "ptr", productID, "int", hrResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PM_INSTALLINFO>} pInstallInfo 
     * @returns {HRESULT} 
     */
    BeginInstall(pInstallInfo) {
        result := ComCall(6, this, "ptr", pInstallInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginUpdate(pUpdateInfo) {
        result := ComCall(7, this, "ptr", pUpdateInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PM_INSTALLINFO>} pInstallInfo 
     * @returns {HRESULT} 
     */
    BeginDeployPackage(pInstallInfo) {
        result := ComCall(8, this, "ptr", pInstallInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO_LEGACY>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginUpdateDeployedPackageLegacy(pUpdateInfo) {
        result := ComCall(9, this, "ptr", pUpdateInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} productID 
     * @returns {HRESULT} 
     */
    BeginUninstall(productID) {
        result := ComCall(10, this, "ptr", productID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PM_INSTALLINFO>} pInstallInfo 
     * @returns {HRESULT} 
     */
    BeginEnterpriseAppInstall(pInstallInfo) {
        result := ComCall(11, this, "ptr", pInstallInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginEnterpriseAppUpdate(pUpdateInfo) {
        result := ComCall(12, this, "ptr", pUpdateInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} productID 
     * @param {Pointer<Guid>} offerID 
     * @param {Pointer<Byte>} pbLicense 
     * @param {Integer} cbLicense 
     * @returns {HRESULT} 
     */
    BeginUpdateLicense(productID, offerID, pbLicense, cbLicense) {
        result := ComCall(13, this, "ptr", productID, "ptr", offerID, "char*", pbLicense, "uint", cbLicense, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PackagePath 
     * @param {Pointer<Byte>} ppbChallenge 
     * @param {Pointer<UInt32>} pcbChallenge 
     * @param {Pointer<Byte>} ppbKID 
     * @param {Pointer<UInt32>} pcbKID 
     * @param {Pointer<Byte>} ppbDeviceID 
     * @param {Pointer<UInt32>} pcbDeviceID 
     * @param {Pointer<Byte>} ppbSaltValue 
     * @param {Pointer<UInt32>} pcbSaltValue 
     * @param {Pointer<Byte>} ppbKGVValue 
     * @param {Pointer<UInt32>} pcbKGVValue 
     * @returns {HRESULT} 
     */
    GetLicenseChallenge(PackagePath, ppbChallenge, pcbChallenge, ppbKID, pcbKID, ppbDeviceID, pcbDeviceID, ppbSaltValue, pcbSaltValue, ppbKGVValue, pcbKGVValue) {
        PackagePath := PackagePath is String ? BSTR.Alloc(PackagePath).Value : PackagePath

        result := ComCall(14, this, "ptr", PackagePath, "char*", ppbChallenge, "uint*", pcbChallenge, "char*", ppbKID, "uint*", pcbKID, "char*", ppbDeviceID, "uint*", pcbDeviceID, "char*", ppbSaltValue, "uint*", pcbSaltValue, "char*", ppbKGVValue, "uint*", pcbKGVValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProductID 
     * @param {Pointer<Byte>} ppbChallenge 
     * @param {Pointer<UInt32>} pcbLicense 
     * @returns {HRESULT} 
     */
    GetLicenseChallengeByProductID(ProductID, ppbChallenge, pcbLicense) {
        result := ComCall(15, this, "ptr", ProductID, "char*", ppbChallenge, "uint*", pcbLicense, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProductID 
     * @param {Pointer<Byte>} ppbChallenge 
     * @param {Pointer<UInt32>} pcbLicense 
     * @param {Pointer<Byte>} ppbKID 
     * @param {Pointer<UInt32>} pcbKID 
     * @param {Pointer<Byte>} ppbDeviceID 
     * @param {Pointer<UInt32>} pcbDeviceID 
     * @param {Pointer<Byte>} ppbSaltValue 
     * @param {Pointer<UInt32>} pcbSaltValue 
     * @param {Pointer<Byte>} ppbKGVValue 
     * @param {Pointer<UInt32>} pcbKGVValue 
     * @returns {HRESULT} 
     */
    GetLicenseChallengeByProductID2(ProductID, ppbChallenge, pcbLicense, ppbKID, pcbKID, ppbDeviceID, pcbDeviceID, ppbSaltValue, pcbSaltValue, ppbKGVValue, pcbKGVValue) {
        result := ComCall(16, this, "ptr", ProductID, "char*", ppbChallenge, "uint*", pcbLicense, "char*", ppbKID, "uint*", pcbKID, "char*", ppbDeviceID, "uint*", pcbDeviceID, "char*", ppbSaltValue, "uint*", pcbSaltValue, "char*", ppbKGVValue, "uint*", pcbKGVValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} productID 
     * @returns {HRESULT} 
     */
    RevokeLicense(productID) {
        result := ComCall(17, this, "ptr", productID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProductID 
     * @param {Pointer<SAFEARRAY>} FileNames 
     * @returns {HRESULT} 
     */
    RebindMdilBinaries(ProductID, FileNames) {
        result := ComCall(18, this, "ptr", ProductID, "ptr", FileNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProductID 
     * @param {Pointer<Guid>} InstanceID 
     * @returns {HRESULT} 
     */
    RebindAllMdilBinaries(ProductID, InstanceID) {
        result := ComCall(19, this, "ptr", ProductID, "ptr", InstanceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProductID 
     * @param {Pointer<SAFEARRAY>} AssemblyPaths 
     * @returns {HRESULT} 
     */
    RegenerateXbf(ProductID, AssemblyPaths) {
        result := ComCall(20, this, "ptr", ProductID, "ptr", AssemblyPaths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProductID 
     * @returns {HRESULT} 
     */
    GenerateXbfForCurrentLocale(ProductID) {
        result := ComCall(21, this, "ptr", ProductID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProductID 
     * @param {BSTR} XMLpath 
     * @returns {HRESULT} 
     */
    BeginProvision(ProductID, XMLpath) {
        XMLpath := XMLpath is String ? BSTR.Alloc(XMLpath).Value : XMLpath

        result := ComCall(22, this, "ptr", ProductID, "ptr", XMLpath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProductID 
     * @returns {HRESULT} 
     */
    BeginDeprovision(ProductID) {
        result := ComCall(23, this, "ptr", ProductID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProductID 
     * @returns {HRESULT} 
     */
    ReindexSQLCEDatabases(ProductID) {
        result := ComCall(24, this, "ptr", ProductID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RequiredMaintenanceOperations 
     * @param {Pointer<UInt32>} pcApplications 
     * @returns {HRESULT} 
     */
    SetApplicationsNeedMaintenance(RequiredMaintenanceOperations, pcApplications) {
        result := ComCall(25, this, "uint", RequiredMaintenanceOperations, "uint*", pcApplications, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProductID 
     * @returns {HRESULT} 
     */
    UpdateChamberProfile(ProductID) {
        result := ComCall(26, this, "ptr", ProductID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} productId 
     * @param {PWSTR} publisherName 
     * @param {Pointer<BOOL>} pIsAllowed 
     * @returns {HRESULT} 
     */
    EnterprisePolicyIsApplicationAllowed(productId, publisherName, pIsAllowed) {
        publisherName := publisherName is String ? StrPtr(publisherName) : publisherName

        result := ComCall(27, this, "ptr", productId, "ptr", publisherName, "ptr", pIsAllowed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginUpdateDeployedPackage(pUpdateInfo) {
        result := ComCall(28, this, "ptr", pUpdateInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} productID 
     * @returns {HRESULT} 
     */
    ReportRestoreCancelled(productID) {
        result := ComCall(29, this, "ptr", productID, "int")
        if(result != 0)
            throw OSError(result)

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
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateCapabilitiesForModernApps() {
        result := ComCall(31, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} productId 
     * @returns {HRESULT} 
     */
    ReportDownloadStatusUpdate(productId) {
        result := ComCall(32, this, "ptr", productId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} productID 
     * @param {Integer} removalOptions 
     * @returns {HRESULT} 
     */
    BeginUninstallWithOptions(productID, removalOptions) {
        result := ComCall(33, this, "ptr", productID, "uint", removalOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BindDeferredMdilBinaries() {
        result := ComCall(34, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PackageFamilyName 
     * @returns {HRESULT} 
     */
    GenerateXamlLightupXbfForCurrentLocale(PackageFamilyName) {
        PackageFamilyName := PackageFamilyName is String ? BSTR.Alloc(PackageFamilyName).Value : PackageFamilyName

        result := ComCall(35, this, "ptr", PackageFamilyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} productID 
     * @param {Pointer<Byte>} pbLicense 
     * @param {Integer} cbLicense 
     * @param {Pointer<Byte>} pbPlayReadyHeader 
     * @param {Integer} cbPlayReadyHeader 
     * @returns {HRESULT} 
     */
    AddLicenseForAppx(productID, pbLicense, cbLicense, pbPlayReadyHeader, cbPlayReadyHeader) {
        result := ComCall(36, this, "ptr", productID, "char*", pbLicense, "uint", cbLicense, "char*", pbPlayReadyHeader, "uint", cbPlayReadyHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FixJunctionsForAppsOnSDCard() {
        result := ComCall(37, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
