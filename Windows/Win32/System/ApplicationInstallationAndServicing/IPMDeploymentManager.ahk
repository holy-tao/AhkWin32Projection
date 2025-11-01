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
        result := ComCall(3, this, "ptr", productID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @param {Integer} usProgress 
     * @returns {HRESULT} 
     */
    ReportDownloadProgress(productID, usProgress) {
        result := ComCall(4, this, "ptr", productID, "ushort", usProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     */
    ReportDownloadComplete(productID, hrResult) {
        result := ComCall(5, this, "ptr", productID, "int", hrResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_INSTALLINFO>} pInstallInfo 
     * @returns {HRESULT} 
     */
    BeginInstall(pInstallInfo) {
        result := ComCall(6, this, "ptr", pInstallInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginUpdate(pUpdateInfo) {
        result := ComCall(7, this, "ptr", pUpdateInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_INSTALLINFO>} pInstallInfo 
     * @returns {HRESULT} 
     */
    BeginDeployPackage(pInstallInfo) {
        result := ComCall(8, this, "ptr", pInstallInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO_LEGACY>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginUpdateDeployedPackageLegacy(pUpdateInfo) {
        result := ComCall(9, this, "ptr", pUpdateInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @returns {HRESULT} 
     */
    BeginUninstall(productID) {
        result := ComCall(10, this, "ptr", productID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_INSTALLINFO>} pInstallInfo 
     * @returns {HRESULT} 
     */
    BeginEnterpriseAppInstall(pInstallInfo) {
        result := ComCall(11, this, "ptr", pInstallInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginEnterpriseAppUpdate(pUpdateInfo) {
        result := ComCall(12, this, "ptr", pUpdateInfo, "HRESULT")
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

        result := ComCall(13, this, "ptr", productID, "ptr", offerID, pbLicenseMarshal, pbLicense, "uint", cbLicense, "HRESULT")
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
        PackagePath := PackagePath is String ? BSTR.Alloc(PackagePath).Value : PackagePath

        pcbChallengeMarshal := pcbChallenge is VarRef ? "uint*" : "ptr"
        pcbKIDMarshal := pcbKID is VarRef ? "uint*" : "ptr"
        pcbDeviceIDMarshal := pcbDeviceID is VarRef ? "uint*" : "ptr"
        pcbSaltValueMarshal := pcbSaltValue is VarRef ? "uint*" : "ptr"
        pcbKGVValueMarshal := pcbKGVValue is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", PackagePath, "ptr*", ppbChallenge, pcbChallengeMarshal, pcbChallenge, "ptr*", ppbKID, pcbKIDMarshal, pcbKID, "ptr*", ppbDeviceID, pcbDeviceIDMarshal, pcbDeviceID, "ptr*", ppbSaltValue, pcbSaltValueMarshal, pcbSaltValue, "ptr*", ppbKGVValue, pcbKGVValueMarshal, pcbKGVValue, "HRESULT")
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
        pcbLicenseMarshal := pcbLicense is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", ProductID, "ptr*", ppbChallenge, pcbLicenseMarshal, pcbLicense, "HRESULT")
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
        pcbLicenseMarshal := pcbLicense is VarRef ? "uint*" : "ptr"
        pcbKIDMarshal := pcbKID is VarRef ? "uint*" : "ptr"
        pcbDeviceIDMarshal := pcbDeviceID is VarRef ? "uint*" : "ptr"
        pcbSaltValueMarshal := pcbSaltValue is VarRef ? "uint*" : "ptr"
        pcbKGVValueMarshal := pcbKGVValue is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", ProductID, "ptr*", ppbChallenge, pcbLicenseMarshal, pcbLicense, "ptr*", ppbKID, pcbKIDMarshal, pcbKID, "ptr*", ppbDeviceID, pcbDeviceIDMarshal, pcbDeviceID, "ptr*", ppbSaltValue, pcbSaltValueMarshal, pcbSaltValue, "ptr*", ppbKGVValue, pcbKGVValueMarshal, pcbKGVValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @returns {HRESULT} 
     */
    RevokeLicense(productID) {
        result := ComCall(17, this, "ptr", productID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Pointer<SAFEARRAY>} FileNames 
     * @returns {HRESULT} 
     */
    RebindMdilBinaries(ProductID, FileNames) {
        result := ComCall(18, this, "ptr", ProductID, "ptr", FileNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Guid} InstanceID 
     * @returns {HRESULT} 
     */
    RebindAllMdilBinaries(ProductID, InstanceID) {
        result := ComCall(19, this, "ptr", ProductID, "ptr", InstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Pointer<SAFEARRAY>} AssemblyPaths 
     * @returns {HRESULT} 
     */
    RegenerateXbf(ProductID, AssemblyPaths) {
        result := ComCall(20, this, "ptr", ProductID, "ptr", AssemblyPaths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {HRESULT} 
     */
    GenerateXbfForCurrentLocale(ProductID) {
        result := ComCall(21, this, "ptr", ProductID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {BSTR} XMLpath 
     * @returns {HRESULT} 
     */
    BeginProvision(ProductID, XMLpath) {
        XMLpath := XMLpath is String ? BSTR.Alloc(XMLpath).Value : XMLpath

        result := ComCall(22, this, "ptr", ProductID, "ptr", XMLpath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {HRESULT} 
     */
    BeginDeprovision(ProductID) {
        result := ComCall(23, this, "ptr", ProductID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {HRESULT} 
     */
    ReindexSQLCEDatabases(ProductID) {
        result := ComCall(24, this, "ptr", ProductID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RequiredMaintenanceOperations 
     * @param {Pointer<Integer>} pcApplications 
     * @returns {HRESULT} 
     */
    SetApplicationsNeedMaintenance(RequiredMaintenanceOperations, pcApplications) {
        pcApplicationsMarshal := pcApplications is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "uint", RequiredMaintenanceOperations, pcApplicationsMarshal, pcApplications, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {HRESULT} 
     */
    UpdateChamberProfile(ProductID) {
        result := ComCall(26, this, "ptr", ProductID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productId 
     * @param {PWSTR} publisherName 
     * @param {Pointer<BOOL>} pIsAllowed 
     * @returns {HRESULT} 
     */
    EnterprisePolicyIsApplicationAllowed(productId, publisherName, pIsAllowed) {
        publisherName := publisherName is String ? StrPtr(publisherName) : publisherName

        result := ComCall(27, this, "ptr", productId, "ptr", publisherName, "ptr", pIsAllowed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginUpdateDeployedPackage(pUpdateInfo) {
        result := ComCall(28, this, "ptr", pUpdateInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @returns {HRESULT} 
     */
    ReportRestoreCancelled(productID) {
        result := ComCall(29, this, "ptr", productID, "HRESULT")
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

        result := ComCall(30, this, "ptr", resourceString, "ptr", pResolvedResourceString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateCapabilitiesForModernApps() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productId 
     * @returns {HRESULT} 
     */
    ReportDownloadStatusUpdate(productId) {
        result := ComCall(32, this, "ptr", productId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @param {Integer} removalOptions 
     * @returns {HRESULT} 
     */
    BeginUninstallWithOptions(productID, removalOptions) {
        result := ComCall(33, this, "ptr", productID, "uint", removalOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BindDeferredMdilBinaries() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} PackageFamilyName 
     * @returns {HRESULT} 
     */
    GenerateXamlLightupXbfForCurrentLocale(PackageFamilyName) {
        PackageFamilyName := PackageFamilyName is String ? BSTR.Alloc(PackageFamilyName).Value : PackageFamilyName

        result := ComCall(35, this, "ptr", PackageFamilyName, "HRESULT")
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

        result := ComCall(36, this, "ptr", productID, pbLicenseMarshal, pbLicense, "uint", cbLicense, pbPlayReadyHeaderMarshal, pbPlayReadyHeader, "uint", cbPlayReadyHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FixJunctionsForAppsOnSDCard() {
        result := ComCall(37, this, "HRESULT")
        return result
    }
}
