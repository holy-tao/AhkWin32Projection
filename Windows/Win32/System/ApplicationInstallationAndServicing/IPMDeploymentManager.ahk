#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\PM_INSTALLINFO.ahk" { PM_INSTALLINFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\PM_UPDATEINFO.ahk" { PM_UPDATEINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PM_UPDATEINFO_LEGACY.ahk" { PM_UPDATEINFO_LEGACY }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMDeploymentManager extends IUnknown {
    /**
     * The interface identifier for IPMDeploymentManager
     * @type {Guid}
     */
    static IID := Guid("{35f785fa-1979-4a8b-bc8f-fd70eb0d1544}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMDeploymentManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReportDownloadBegin                    : IntPtr
        ReportDownloadProgress                 : IntPtr
        ReportDownloadComplete                 : IntPtr
        BeginInstall                           : IntPtr
        BeginUpdate                            : IntPtr
        BeginDeployPackage                     : IntPtr
        BeginUpdateDeployedPackageLegacy       : IntPtr
        BeginUninstall                         : IntPtr
        BeginEnterpriseAppInstall              : IntPtr
        BeginEnterpriseAppUpdate               : IntPtr
        BeginUpdateLicense                     : IntPtr
        GetLicenseChallenge                    : IntPtr
        GetLicenseChallengeByProductID         : IntPtr
        GetLicenseChallengeByProductID2        : IntPtr
        RevokeLicense                          : IntPtr
        RebindMdilBinaries                     : IntPtr
        RebindAllMdilBinaries                  : IntPtr
        RegenerateXbf                          : IntPtr
        GenerateXbfForCurrentLocale            : IntPtr
        BeginProvision                         : IntPtr
        BeginDeprovision                       : IntPtr
        ReindexSQLCEDatabases                  : IntPtr
        SetApplicationsNeedMaintenance         : IntPtr
        UpdateChamberProfile                   : IntPtr
        EnterprisePolicyIsApplicationAllowed   : IntPtr
        BeginUpdateDeployedPackage             : IntPtr
        ReportRestoreCancelled                 : IntPtr
        ResolveResourceString                  : IntPtr
        UpdateCapabilitiesForModernApps        : IntPtr
        ReportDownloadStatusUpdate             : IntPtr
        BeginUninstallWithOptions              : IntPtr
        BindDeferredMdilBinaries               : IntPtr
        GenerateXamlLightupXbfForCurrentLocale : IntPtr
        AddLicenseForAppx                      : IntPtr
        FixJunctionsForAppsOnSDCard            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMDeploymentManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Guid} productID 
     * @returns {HRESULT} 
     */
    ReportDownloadBegin(productID) {
        result := ComCall(3, this, Guid, productID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @param {Integer} usProgress 
     * @returns {HRESULT} 
     */
    ReportDownloadProgress(productID, usProgress) {
        result := ComCall(4, this, Guid, productID, "ushort", usProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     */
    ReportDownloadComplete(productID, hrResult) {
        result := ComCall(5, this, Guid, productID, "int", hrResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_INSTALLINFO>} pInstallInfo 
     * @returns {HRESULT} 
     */
    BeginInstall(pInstallInfo) {
        result := ComCall(6, this, PM_INSTALLINFO.Ptr, pInstallInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginUpdate(pUpdateInfo) {
        result := ComCall(7, this, PM_UPDATEINFO.Ptr, pUpdateInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_INSTALLINFO>} pInstallInfo 
     * @returns {HRESULT} 
     */
    BeginDeployPackage(pInstallInfo) {
        result := ComCall(8, this, PM_INSTALLINFO.Ptr, pInstallInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO_LEGACY>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginUpdateDeployedPackageLegacy(pUpdateInfo) {
        result := ComCall(9, this, PM_UPDATEINFO_LEGACY.Ptr, pUpdateInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @returns {HRESULT} 
     */
    BeginUninstall(productID) {
        result := ComCall(10, this, Guid, productID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_INSTALLINFO>} pInstallInfo 
     * @returns {HRESULT} 
     */
    BeginEnterpriseAppInstall(pInstallInfo) {
        result := ComCall(11, this, PM_INSTALLINFO.Ptr, pInstallInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginEnterpriseAppUpdate(pUpdateInfo) {
        result := ComCall(12, this, PM_UPDATEINFO.Ptr, pUpdateInfo, "HRESULT")
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

        result := ComCall(13, this, Guid, productID, Guid, offerID, pbLicenseMarshal, pbLicense, "uint", cbLicense, "HRESULT")
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

        result := ComCall(14, this, BSTR, PackagePath, ppbChallengeMarshal, ppbChallenge, pcbChallengeMarshal, pcbChallenge, ppbKIDMarshal, ppbKID, pcbKIDMarshal, pcbKID, ppbDeviceIDMarshal, ppbDeviceID, pcbDeviceIDMarshal, pcbDeviceID, ppbSaltValueMarshal, ppbSaltValue, pcbSaltValueMarshal, pcbSaltValue, ppbKGVValueMarshal, ppbKGVValue, pcbKGVValueMarshal, pcbKGVValue, "HRESULT")
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

        result := ComCall(15, this, Guid, ProductID, ppbChallengeMarshal, ppbChallenge, pcbLicenseMarshal, pcbLicense, "HRESULT")
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

        result := ComCall(16, this, Guid, ProductID, ppbChallengeMarshal, ppbChallenge, pcbLicenseMarshal, pcbLicense, ppbKIDMarshal, ppbKID, pcbKIDMarshal, pcbKID, ppbDeviceIDMarshal, ppbDeviceID, pcbDeviceIDMarshal, pcbDeviceID, ppbSaltValueMarshal, ppbSaltValue, pcbSaltValueMarshal, pcbSaltValue, ppbKGVValueMarshal, ppbKGVValue, pcbKGVValueMarshal, pcbKGVValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @returns {HRESULT} 
     */
    RevokeLicense(productID) {
        result := ComCall(17, this, Guid, productID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Pointer<SAFEARRAY>} FileNames 
     * @returns {HRESULT} 
     */
    RebindMdilBinaries(ProductID, FileNames) {
        result := ComCall(18, this, Guid, ProductID, SAFEARRAY.Ptr, FileNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Guid} InstanceID 
     * @returns {HRESULT} 
     */
    RebindAllMdilBinaries(ProductID, InstanceID) {
        result := ComCall(19, this, Guid, ProductID, Guid, InstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Pointer<SAFEARRAY>} AssemblyPaths 
     * @returns {HRESULT} 
     */
    RegenerateXbf(ProductID, AssemblyPaths) {
        result := ComCall(20, this, Guid, ProductID, SAFEARRAY.Ptr, AssemblyPaths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {HRESULT} 
     */
    GenerateXbfForCurrentLocale(ProductID) {
        result := ComCall(21, this, Guid, ProductID, "HRESULT")
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

        result := ComCall(22, this, Guid, ProductID, BSTR, XMLpath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {HRESULT} 
     */
    BeginDeprovision(ProductID) {
        result := ComCall(23, this, Guid, ProductID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {HRESULT} 
     */
    ReindexSQLCEDatabases(ProductID) {
        result := ComCall(24, this, Guid, ProductID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RequiredMaintenanceOperations 
     * @returns {Integer} 
     */
    SetApplicationsNeedMaintenance(RequiredMaintenanceOperations) {
        result := ComCall(25, this, "uint", RequiredMaintenanceOperations, "uint*", &pcApplications := 0, "HRESULT")
        return pcApplications
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {HRESULT} 
     */
    UpdateChamberProfile(ProductID) {
        result := ComCall(26, this, Guid, ProductID, "HRESULT")
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

        result := ComCall(27, this, Guid, productId, "ptr", publisherName, BOOL.Ptr, &pIsAllowed := 0, "HRESULT")
        return pIsAllowed
    }

    /**
     * 
     * @param {Pointer<PM_UPDATEINFO>} pUpdateInfo 
     * @returns {HRESULT} 
     */
    BeginUpdateDeployedPackage(pUpdateInfo) {
        result := ComCall(28, this, PM_UPDATEINFO.Ptr, pUpdateInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @returns {HRESULT} 
     */
    ReportRestoreCancelled(productID) {
        result := ComCall(29, this, Guid, productID, "HRESULT")
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

        result := ComCall(30, this, "ptr", resourceString, BSTR.Ptr, pResolvedResourceString, "HRESULT")
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
        result := ComCall(32, this, Guid, productId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} productID 
     * @param {Integer} removalOptions 
     * @returns {HRESULT} 
     */
    BeginUninstallWithOptions(productID, removalOptions) {
        result := ComCall(33, this, Guid, productID, "uint", removalOptions, "HRESULT")
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

        result := ComCall(35, this, BSTR, PackageFamilyName, "HRESULT")
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

        result := ComCall(36, this, Guid, productID, pbLicenseMarshal, pbLicense, "uint", cbLicense, pbPlayReadyHeaderMarshal, pbPlayReadyHeader, "uint", cbPlayReadyHeader, "HRESULT")
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

    Query(iid) {
        if (IPMDeploymentManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReportDownloadBegin := CallbackCreate(GetMethod(implObj, "ReportDownloadBegin"), flags, 2)
        this.vtbl.ReportDownloadProgress := CallbackCreate(GetMethod(implObj, "ReportDownloadProgress"), flags, 3)
        this.vtbl.ReportDownloadComplete := CallbackCreate(GetMethod(implObj, "ReportDownloadComplete"), flags, 3)
        this.vtbl.BeginInstall := CallbackCreate(GetMethod(implObj, "BeginInstall"), flags, 2)
        this.vtbl.BeginUpdate := CallbackCreate(GetMethod(implObj, "BeginUpdate"), flags, 2)
        this.vtbl.BeginDeployPackage := CallbackCreate(GetMethod(implObj, "BeginDeployPackage"), flags, 2)
        this.vtbl.BeginUpdateDeployedPackageLegacy := CallbackCreate(GetMethod(implObj, "BeginUpdateDeployedPackageLegacy"), flags, 2)
        this.vtbl.BeginUninstall := CallbackCreate(GetMethod(implObj, "BeginUninstall"), flags, 2)
        this.vtbl.BeginEnterpriseAppInstall := CallbackCreate(GetMethod(implObj, "BeginEnterpriseAppInstall"), flags, 2)
        this.vtbl.BeginEnterpriseAppUpdate := CallbackCreate(GetMethod(implObj, "BeginEnterpriseAppUpdate"), flags, 2)
        this.vtbl.BeginUpdateLicense := CallbackCreate(GetMethod(implObj, "BeginUpdateLicense"), flags, 5)
        this.vtbl.GetLicenseChallenge := CallbackCreate(GetMethod(implObj, "GetLicenseChallenge"), flags, 12)
        this.vtbl.GetLicenseChallengeByProductID := CallbackCreate(GetMethod(implObj, "GetLicenseChallengeByProductID"), flags, 4)
        this.vtbl.GetLicenseChallengeByProductID2 := CallbackCreate(GetMethod(implObj, "GetLicenseChallengeByProductID2"), flags, 12)
        this.vtbl.RevokeLicense := CallbackCreate(GetMethod(implObj, "RevokeLicense"), flags, 2)
        this.vtbl.RebindMdilBinaries := CallbackCreate(GetMethod(implObj, "RebindMdilBinaries"), flags, 3)
        this.vtbl.RebindAllMdilBinaries := CallbackCreate(GetMethod(implObj, "RebindAllMdilBinaries"), flags, 3)
        this.vtbl.RegenerateXbf := CallbackCreate(GetMethod(implObj, "RegenerateXbf"), flags, 3)
        this.vtbl.GenerateXbfForCurrentLocale := CallbackCreate(GetMethod(implObj, "GenerateXbfForCurrentLocale"), flags, 2)
        this.vtbl.BeginProvision := CallbackCreate(GetMethod(implObj, "BeginProvision"), flags, 3)
        this.vtbl.BeginDeprovision := CallbackCreate(GetMethod(implObj, "BeginDeprovision"), flags, 2)
        this.vtbl.ReindexSQLCEDatabases := CallbackCreate(GetMethod(implObj, "ReindexSQLCEDatabases"), flags, 2)
        this.vtbl.SetApplicationsNeedMaintenance := CallbackCreate(GetMethod(implObj, "SetApplicationsNeedMaintenance"), flags, 3)
        this.vtbl.UpdateChamberProfile := CallbackCreate(GetMethod(implObj, "UpdateChamberProfile"), flags, 2)
        this.vtbl.EnterprisePolicyIsApplicationAllowed := CallbackCreate(GetMethod(implObj, "EnterprisePolicyIsApplicationAllowed"), flags, 4)
        this.vtbl.BeginUpdateDeployedPackage := CallbackCreate(GetMethod(implObj, "BeginUpdateDeployedPackage"), flags, 2)
        this.vtbl.ReportRestoreCancelled := CallbackCreate(GetMethod(implObj, "ReportRestoreCancelled"), flags, 2)
        this.vtbl.ResolveResourceString := CallbackCreate(GetMethod(implObj, "ResolveResourceString"), flags, 3)
        this.vtbl.UpdateCapabilitiesForModernApps := CallbackCreate(GetMethod(implObj, "UpdateCapabilitiesForModernApps"), flags, 1)
        this.vtbl.ReportDownloadStatusUpdate := CallbackCreate(GetMethod(implObj, "ReportDownloadStatusUpdate"), flags, 2)
        this.vtbl.BeginUninstallWithOptions := CallbackCreate(GetMethod(implObj, "BeginUninstallWithOptions"), flags, 3)
        this.vtbl.BindDeferredMdilBinaries := CallbackCreate(GetMethod(implObj, "BindDeferredMdilBinaries"), flags, 1)
        this.vtbl.GenerateXamlLightupXbfForCurrentLocale := CallbackCreate(GetMethod(implObj, "GenerateXamlLightupXbfForCurrentLocale"), flags, 2)
        this.vtbl.AddLicenseForAppx := CallbackCreate(GetMethod(implObj, "AddLicenseForAppx"), flags, 6)
        this.vtbl.FixJunctionsForAppsOnSDCard := CallbackCreate(GetMethod(implObj, "FixJunctionsForAppsOnSDCard"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReportDownloadBegin)
        CallbackFree(this.vtbl.ReportDownloadProgress)
        CallbackFree(this.vtbl.ReportDownloadComplete)
        CallbackFree(this.vtbl.BeginInstall)
        CallbackFree(this.vtbl.BeginUpdate)
        CallbackFree(this.vtbl.BeginDeployPackage)
        CallbackFree(this.vtbl.BeginUpdateDeployedPackageLegacy)
        CallbackFree(this.vtbl.BeginUninstall)
        CallbackFree(this.vtbl.BeginEnterpriseAppInstall)
        CallbackFree(this.vtbl.BeginEnterpriseAppUpdate)
        CallbackFree(this.vtbl.BeginUpdateLicense)
        CallbackFree(this.vtbl.GetLicenseChallenge)
        CallbackFree(this.vtbl.GetLicenseChallengeByProductID)
        CallbackFree(this.vtbl.GetLicenseChallengeByProductID2)
        CallbackFree(this.vtbl.RevokeLicense)
        CallbackFree(this.vtbl.RebindMdilBinaries)
        CallbackFree(this.vtbl.RebindAllMdilBinaries)
        CallbackFree(this.vtbl.RegenerateXbf)
        CallbackFree(this.vtbl.GenerateXbfForCurrentLocale)
        CallbackFree(this.vtbl.BeginProvision)
        CallbackFree(this.vtbl.BeginDeprovision)
        CallbackFree(this.vtbl.ReindexSQLCEDatabases)
        CallbackFree(this.vtbl.SetApplicationsNeedMaintenance)
        CallbackFree(this.vtbl.UpdateChamberProfile)
        CallbackFree(this.vtbl.EnterprisePolicyIsApplicationAllowed)
        CallbackFree(this.vtbl.BeginUpdateDeployedPackage)
        CallbackFree(this.vtbl.ReportRestoreCancelled)
        CallbackFree(this.vtbl.ResolveResourceString)
        CallbackFree(this.vtbl.UpdateCapabilitiesForModernApps)
        CallbackFree(this.vtbl.ReportDownloadStatusUpdate)
        CallbackFree(this.vtbl.BeginUninstallWithOptions)
        CallbackFree(this.vtbl.BindDeferredMdilBinaries)
        CallbackFree(this.vtbl.GenerateXamlLightupXbfForCurrentLocale)
        CallbackFree(this.vtbl.AddLicenseForAppx)
        CallbackFree(this.vtbl.FixJunctionsForAppsOnSDCard)
    }
}
