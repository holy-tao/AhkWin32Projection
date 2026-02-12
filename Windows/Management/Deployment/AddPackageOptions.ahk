#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAddPackageOptions.ahk
#Include .\IAddPackageOptions2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the deployment options that you can configure when you use the [AddPackageByUriAsync](packagemanager_addpackagebyuriasync_797417417.md) method to add a package, package manifest, or App Installer file.
 * @remarks
 * You can pass an initialized instance of this class to the *options* parameter of the [AddPackageByUriAsync](packagemanager_addpackagebyuriasync_797417417.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class AddPackageOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAddPackageOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAddPackageOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of URIs of the dependency packages to add.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.dependencypackageuris
     * @type {IVector<Uri>} 
     */
    DependencyPackageUris {
        get => this.get_DependencyPackageUris()
    }

    /**
     * Gets or sets the volume to which the package is added.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.targetvolume
     * @type {PackageVolume} 
     */
    TargetVolume {
        get => this.get_TargetVolume()
        set => this.put_TargetVolume(value)
    }

    /**
     * Gets the list of package family names from the main bundle to be added.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.optionalpackagefamilynames
     * @type {IVector<HSTRING>} 
     */
    OptionalPackageFamilyNames {
        get => this.get_OptionalPackageFamilyNames()
    }

    /**
     * Gets the list of URIs of related optional packages to be updated to the same version as the new optional packages.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.optionalpackageuris
     * @type {IVector<Uri>} 
     */
    OptionalPackageUris {
        get => this.get_OptionalPackageUris()
    }

    /**
     * Gets the list of URIs of related optional packages to be updated to the same version as the new optional packages.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.relatedpackageuris
     * @type {IVector<Uri>} 
     */
    RelatedPackageUris {
        get => this.get_RelatedPackageUris()
    }

    /**
     * Gets or sets the URI of an external disk location outside of the MSIX package where the package manifest can reference application content.
     * @remarks
     * This property is intended to be used when you are granting package identity by packaging with external location. A package with external location contains only a package manifest (not an executable or other application content). The package manifest references application content in an external disk location outside of the package.
     * 
     * In this scenario, you can use this property property to specify the location where your application's executable and other content are installed to. In code that is run by your installer or your application, create a [AddPackageOptions](addpackageoptions.md) object and assign this property to the external location. Then, call the [AddPackageByUriAsync](packagemanager_addpackagebyuriasync_797417417.md) method and pass the [AddPackageOptions](addpackageoptions.md) object to *options* parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.externallocationuri
     * @type {Uri} 
     */
    ExternalLocationUri {
        get => this.get_ExternalLocationUri()
        set => this.put_ExternalLocationUri(value)
    }

    /**
     * Gets or sets the stub options for the package.
     * @remarks
     * > [!NOTE]
     * > The ability for an app to run as a stub is currently available only to certain apps that are built by Microsoft.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.stubpackageoption
     * @type {Integer} 
     */
    StubPackageOption {
        get => this.get_StubPackageOption()
        set => this.put_StubPackageOption(value)
    }

    /**
     * Gets or sets a value that indicates whether the app is installed in developer mode.
     * @remarks
     * For more information, see the details about development mode in the remarks section of [DeploymentOptions](deploymentoptions.md).
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.developermode
     * @type {Boolean} 
     */
    DeveloperMode {
        get => this.get_DeveloperMode()
        set => this.put_DeveloperMode(value)
    }

    /**
     * Gets or sets a value that indicates whether the processes associated with the package will be shut down forcibly so that registration can continue if the package, or any package that depends on the package, is currently in use.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.forceappshutdown
     * @type {Boolean} 
     */
    ForceAppShutdown {
        get => this.get_ForceAppShutdown()
        set => this.put_ForceAppShutdown(value)
    }

    /**
     * Gets or sets a value that indicates whether the processes associated with the package will be shut down forcibly so that registration can continue if the package is currently in use.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.forcetargetappshutdown
     * @type {Boolean} 
     */
    ForceTargetAppShutdown {
        get => this.get_ForceTargetAppShutdown()
        set => this.put_ForceTargetAppShutdown(value)
    }

    /**
     * Gets or sets a value that indicates whether to force a specific version of a package to be added, regardless of if a higher version is already added.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.forceupdatefromanyversion
     * @type {Boolean} 
     */
    ForceUpdateFromAnyVersion {
        get => this.get_ForceUpdateFromAnyVersion()
        set => this.put_ForceUpdateFromAnyVersion(value)
    }

    /**
     * Gets or sets a value that indicates whether the app skips resource applicability checks. This effectively stages or registers all resource packages that a user passes in to the command, which forces applicability for all packages contained in a bundle. If a user passes in a bundle, all contained resource packages will be registered.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.installallresources
     * @type {Boolean} 
     */
    InstallAllResources {
        get => this.get_InstallAllResources()
        set => this.put_InstallAllResources(value)
    }

    /**
     * Gets or sets a value that indicates whether only the required content group will be added. An app can be installed as a package with the required content group alone.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.requiredcontentgrouponly
     * @type {Boolean} 
     */
    RequiredContentGroupOnly {
        get => this.get_RequiredContentGroupOnly()
        set => this.put_RequiredContentGroupOnly(value)
    }

    /**
     * Gets or sets a value that indicates whether to remove files that have been created on the target machine during the install process in the case of a failed deployment.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.retainfilesonfailure
     * @type {Boolean} 
     */
    RetainFilesOnFailure {
        get => this.get_RetainFilesOnFailure()
        set => this.put_RetainFilesOnFailure(value)
    }

    /**
     * Gets or sets a value that indicates whether to stage the package in place.
     * @remarks
     * This property is useful for notifying the system to prepare for app registration in virtual desktop scenarios.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.stageinplace
     * @type {Boolean} 
     */
    StageInPlace {
        get => this.get_StageInPlace()
        set => this.put_StageInPlace(value)
    }

    /**
     * Gets or sets a value that indicates whether to allow an unsigned package to be added.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.allowunsigned
     * @type {Boolean} 
     */
    AllowUnsigned {
        get => this.get_AllowUnsigned()
        set => this.put_AllowUnsigned(value)
    }

    /**
     * Gets or sets a value that indicates whether to delay registration of the main package or dependency packages if the packages are currently in use.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.deferregistrationwhenpackagesareinuse
     * @type {Boolean} 
     */
    DeferRegistrationWhenPackagesAreInUse {
        get => this.get_DeferRegistrationWhenPackagesAreInUse()
        set => this.put_DeferRegistrationWhenPackagesAreInUse(value)
    }

    /**
     * Gets a dictionary that maps the URIs associated with an **AddPackageOptions** with the corresponding digest string.
     * @remarks
     * A digest string is a hashed representation of the contents of the package URI. Get the digest for a package URI by calling [IAppxDigestProvider::GetDigest](/windows/win32/api/appxpackaging/nf-appxpackaging-iappxdigestprovider-getdigest.md) and then add the value to the collection returned by **ExpectedDigests**. Digests may be specified for any or all URIs included in the **AddPackageOptions**.  If a digest is specified for a URI and the content at that URI doesn’t match its digest, the deployment operation will fail.  If a digest is not specified for a URI, then the package manager will proceed without validating its digest.  If a digest is specified for a URI which the package manager doesn’t need to read, the digest is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.expecteddigests
     * @type {IMap<Uri, HSTRING>} 
     */
    ExpectedDigests {
        get => this.get_ExpectedDigests()
    }

    /**
     * Gets or sets a value indicating whether missing referenced packages should be downloaded.
     * @remarks
     * This property is only applicable if a URI to an .appinstaller file is used in the [AddPackageByUri](/uwp/api/windows.management.deployment.packagemanager.addpackagebyuriasync)) call. This does nothing if the associated URI is for a package.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackageoptions.limittoexistingpackages
     * @type {Boolean} 
     */
    LimitToExistingPackages {
        get => this.get_LimitToExistingPackages()
        set => this.put_LimitToExistingPackages(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [AddPackageOptions](addpackageoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.AddPackageOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_DependencyPackageUris() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_DependencyPackageUris()
    }

    /**
     * 
     * @returns {PackageVolume} 
     */
    get_TargetVolume() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_TargetVolume()
    }

    /**
     * 
     * @param {PackageVolume} value 
     * @returns {HRESULT} 
     */
    put_TargetVolume(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_TargetVolume(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_OptionalPackageFamilyNames() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_OptionalPackageFamilyNames()
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_OptionalPackageUris() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_OptionalPackageUris()
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_RelatedPackageUris() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_RelatedPackageUris()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ExternalLocationUri() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_ExternalLocationUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ExternalLocationUri(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_ExternalLocationUri(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StubPackageOption() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_StubPackageOption()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StubPackageOption(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_StubPackageOption(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeveloperMode() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_DeveloperMode()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DeveloperMode(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_DeveloperMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceAppShutdown() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_ForceAppShutdown()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceAppShutdown(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_ForceAppShutdown(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceTargetAppShutdown() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_ForceTargetAppShutdown()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceTargetAppShutdown(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_ForceTargetAppShutdown(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceUpdateFromAnyVersion() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_ForceUpdateFromAnyVersion()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceUpdateFromAnyVersion(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_ForceUpdateFromAnyVersion(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InstallAllResources() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_InstallAllResources()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_InstallAllResources(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_InstallAllResources(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RequiredContentGroupOnly() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_RequiredContentGroupOnly()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RequiredContentGroupOnly(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_RequiredContentGroupOnly(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RetainFilesOnFailure() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_RetainFilesOnFailure()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RetainFilesOnFailure(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_RetainFilesOnFailure(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StageInPlace() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_StageInPlace()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_StageInPlace(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_StageInPlace(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowUnsigned() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_AllowUnsigned()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowUnsigned(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_AllowUnsigned(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeferRegistrationWhenPackagesAreInUse() {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.get_DeferRegistrationWhenPackagesAreInUse()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DeferRegistrationWhenPackagesAreInUse(value) {
        if (!this.HasProp("__IAddPackageOptions")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions := IAddPackageOptions(outPtr)
        }

        return this.__IAddPackageOptions.put_DeferRegistrationWhenPackagesAreInUse(value)
    }

    /**
     * 
     * @returns {IMap<Uri, HSTRING>} 
     */
    get_ExpectedDigests() {
        if (!this.HasProp("__IAddPackageOptions2")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions2 := IAddPackageOptions2(outPtr)
        }

        return this.__IAddPackageOptions2.get_ExpectedDigests()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LimitToExistingPackages() {
        if (!this.HasProp("__IAddPackageOptions2")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions2 := IAddPackageOptions2(outPtr)
        }

        return this.__IAddPackageOptions2.get_LimitToExistingPackages()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_LimitToExistingPackages(value) {
        if (!this.HasProp("__IAddPackageOptions2")) {
            if ((queryResult := this.QueryInterface(IAddPackageOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddPackageOptions2 := IAddPackageOptions2(outPtr)
        }

        return this.__IAddPackageOptions2.put_LimitToExistingPackages(value)
    }

;@endregion Instance Methods
}
