#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRegisterPackageOptions.ahk
#Include .\IRegisterPackageOptions2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the deployment options that you can configure when you use the [RegisterPackageByUriAsync](packagemanager_registerpackagebyuriasync_1415074502.md) method to register a [Package](/uwp/api/windows.applicationmodel.package).
 * @remarks
 * You can pass an initialized instance of this class to the *options* parameter of the [RegisterPackageByUriAsync](packagemanager_registerpackagebyuriasync_1415074502.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class RegisterPackageOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRegisterPackageOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRegisterPackageOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of URIs of the dependency [Packages](/uwp/api/windows.applicationmodel.package) to add.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.dependencypackageuris
     * @type {IVector<Uri>} 
     */
    DependencyPackageUris {
        get => this.get_DependencyPackageUris()
    }

    /**
     * Gets or sets the target volume on which to store app data.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.appdatavolume
     * @type {PackageVolume} 
     */
    AppDataVolume {
        get => this.get_AppDataVolume()
        set => this.put_AppDataVolume(value)
    }

    /**
     * Gets the list of [Package](/uwp/api/windows.applicationmodel.package) family names from the main bundle to be registered.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.optionalpackagefamilynames
     * @type {IVector<HSTRING>} 
     */
    OptionalPackageFamilyNames {
        get => this.get_OptionalPackageFamilyNames()
    }

    /**
     * Gets or sets the URI of an external disk location outside of the MSIX [Package](/uwp/api/windows.applicationmodel.package) where the package manifest can reference application content.
     * @remarks
     * This property can be used when you are granting package identity by packaging with external location. A package with external location contains only a package manifest (not an executable or other application content). The package manifest references application content in an external disk location outside of the package.
     * 
     * In this scenario, you can use the **ExternalLocationUri** property to specify the location where your application's executable and other content are installed to. In code that is run by your installer or your application, create a [RegisterPackageOptions](registerpackageoptions.md) object and assign this property to the external location. Then, call the [RegisterPackageByUriAsync](packagemanager_registerpackagebyuriasync_1415074502.md) method and pass the [RegisterPackageOptions](registerpackageoptions.md) object to *options* parameter.
     * 
     * In most cases, we recommend that you use the [ExternalLocationUri](addpackageoptions_externallocationuri.md) property of an [AddPackageOptions](addpackageoptions.md) object in conjunction with the [AddPackageByUriAsync](packagemanager_addpackagebyuriasync_797417417.md) method instead of this property and the [RegisterPackageByUriAsync](packagemanager_registerpackagebyuriasync_1415074502.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.externallocationuri
     * @type {Uri} 
     */
    ExternalLocationUri {
        get => this.get_ExternalLocationUri()
        set => this.put_ExternalLocationUri(value)
    }

    /**
     * Gets or sets a value that indicates whether the app is installed in developer mode.
     * @remarks
     * For more information, see the details about development mode in the remarks section of [DeploymentOptions](deploymentoptions.md).
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.developermode
     * @type {Boolean} 
     */
    DeveloperMode {
        get => this.get_DeveloperMode()
        set => this.put_DeveloperMode(value)
    }

    /**
     * Gets or sets a value that indicates whether the processes associated with the [Package](/uwp/api/windows.applicationmodel.package) will be shut down forcibly so that registration can continue if the package, or any package that depends on the package, is currently in use.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.forceappshutdown
     * @type {Boolean} 
     */
    ForceAppShutdown {
        get => this.get_ForceAppShutdown()
        set => this.put_ForceAppShutdown(value)
    }

    /**
     * Gets or sets a value that indicates whether the processes associated with the [Package](/uwp/api/windows.applicationmodel.package) will be shut down forcibly so that registration can continue if the package is currently in use.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.forcetargetappshutdown
     * @type {Boolean} 
     */
    ForceTargetAppShutdown {
        get => this.get_ForceTargetAppShutdown()
        set => this.put_ForceTargetAppShutdown(value)
    }

    /**
     * Gets or sets a value that indicates whether to force a specific version of a [Package](/uwp/api/windows.applicationmodel.package) to be staged/registered, regardless of if a higher version is already staged/registered.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.forceupdatefromanyversion
     * @type {Boolean} 
     */
    ForceUpdateFromAnyVersion {
        get => this.get_ForceUpdateFromAnyVersion()
        set => this.put_ForceUpdateFromAnyVersion(value)
    }

    /**
     * Gets or sets a value that indicates whether the app skips resource applicability checks. This effectively stages or registers all resource [Packages](/uwp/api/windows.applicationmodel.package) that a user passes in to the command, which forces applicability for all packages contained in a bundle. If a user passes in a bundle, all contained resource packages will be registered.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.installallresources
     * @type {Boolean} 
     */
    InstallAllResources {
        get => this.get_InstallAllResources()
        set => this.put_InstallAllResources(value)
    }

    /**
     * Gets or sets a value that indicates whether to stage the [Package](/uwp/api/windows.applicationmodel.package) in place.
     * @remarks
     * This property is useful for notifying the system to prepare for app registration in virtual desktop scenarios.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.stageinplace
     * @type {Boolean} 
     */
    StageInPlace {
        get => this.get_StageInPlace()
        set => this.put_StageInPlace(value)
    }

    /**
     * Gets or sets a value that indicates whether to allow an unsigned [Package](/uwp/api/windows.applicationmodel.package) to be registered.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.allowunsigned
     * @type {Boolean} 
     */
    AllowUnsigned {
        get => this.get_AllowUnsigned()
        set => this.put_AllowUnsigned(value)
    }

    /**
     * Gets or sets a value that indicates whether to delay registration of the main [Package](/uwp/api/windows.applicationmodel.package) or dependency packages if the packages are currently in use.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.deferregistrationwhenpackagesareinuse
     * @type {Boolean} 
     */
    DeferRegistrationWhenPackagesAreInUse {
        get => this.get_DeferRegistrationWhenPackagesAreInUse()
        set => this.put_DeferRegistrationWhenPackagesAreInUse(value)
    }

    /**
     * Gets a dictionary that maps the URIs associated with a **RegisterPackageOptions** with the corresponding digest string.
     * @remarks
     * A digest string is a hashed representation of the contents of the package URI. Get the digest for a package URI by calling [IAppxDigestProvider::GetDigest](/windows/win32/api/appxpackaging/nf-appxpackaging-iappxdigestprovider-getdigest.md) and then add the value to the collection returned by **ExpectedDigests**. Digests may be specified for any or all URIs included in the **RegisterPackageOptions**.  If a digest is specified for a URI and the content at that URI doesn’t match its digest, the deployment operation will fail.  If a digest is not specified for a URI, then the package manager will proceed without validating its digest.  If a digest is specified for a URI which the package manager doesn’t need to read, the digest is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.registerpackageoptions.expecteddigests
     * @type {IMap<Uri, HSTRING>} 
     */
    ExpectedDigests {
        get => this.get_ExpectedDigests()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [RegisterPackageOptions](registerpackageoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.RegisterPackageOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_DependencyPackageUris() {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.get_DependencyPackageUris()
    }

    /**
     * 
     * @returns {PackageVolume} 
     */
    get_AppDataVolume() {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.get_AppDataVolume()
    }

    /**
     * 
     * @param {PackageVolume} value 
     * @returns {HRESULT} 
     */
    put_AppDataVolume(value) {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.put_AppDataVolume(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_OptionalPackageFamilyNames() {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.get_OptionalPackageFamilyNames()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ExternalLocationUri() {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.get_ExternalLocationUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ExternalLocationUri(value) {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.put_ExternalLocationUri(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeveloperMode() {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.get_DeveloperMode()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DeveloperMode(value) {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.put_DeveloperMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceAppShutdown() {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.get_ForceAppShutdown()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceAppShutdown(value) {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.put_ForceAppShutdown(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceTargetAppShutdown() {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.get_ForceTargetAppShutdown()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceTargetAppShutdown(value) {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.put_ForceTargetAppShutdown(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceUpdateFromAnyVersion() {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.get_ForceUpdateFromAnyVersion()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceUpdateFromAnyVersion(value) {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.put_ForceUpdateFromAnyVersion(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InstallAllResources() {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.get_InstallAllResources()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_InstallAllResources(value) {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.put_InstallAllResources(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StageInPlace() {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.get_StageInPlace()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_StageInPlace(value) {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.put_StageInPlace(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowUnsigned() {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.get_AllowUnsigned()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowUnsigned(value) {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.put_AllowUnsigned(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeferRegistrationWhenPackagesAreInUse() {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.get_DeferRegistrationWhenPackagesAreInUse()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DeferRegistrationWhenPackagesAreInUse(value) {
        if (!this.HasProp("__IRegisterPackageOptions")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions := IRegisterPackageOptions(outPtr)
        }

        return this.__IRegisterPackageOptions.put_DeferRegistrationWhenPackagesAreInUse(value)
    }

    /**
     * 
     * @returns {IMap<Uri, HSTRING>} 
     */
    get_ExpectedDigests() {
        if (!this.HasProp("__IRegisterPackageOptions2")) {
            if ((queryResult := this.QueryInterface(IRegisterPackageOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRegisterPackageOptions2 := IRegisterPackageOptions2(outPtr)
        }

        return this.__IRegisterPackageOptions2.get_ExpectedDigests()
    }

;@endregion Instance Methods
}
