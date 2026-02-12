#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStagePackageOptions.ahk
#Include .\IStagePackageOptions2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the deployment options that you can configure when you use the [StagePackageByUriAsync](packagemanager_stagepackagebyuriasync_446584280.md) method to stage a package.
 * @remarks
 * You can pass an initialized instance of this class to the *options* parameter of the [StagePackageByUriAsync](packagemanager_stagepackagebyuriasync_446584280.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class StagePackageOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStagePackageOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStagePackageOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of URIs of the dependency packages to stage.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.dependencypackageuris
     * @type {IVector<Uri>} 
     */
    DependencyPackageUris {
        get => this.get_DependencyPackageUris()
    }

    /**
     * Gets or sets the volume to which the package is staged.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.targetvolume
     * @type {PackageVolume} 
     */
    TargetVolume {
        get => this.get_TargetVolume()
        set => this.put_TargetVolume(value)
    }

    /**
     * Gets the list of package family names from the main bundle to be registered.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.optionalpackagefamilynames
     * @type {IVector<HSTRING>} 
     */
    OptionalPackageFamilyNames {
        get => this.get_OptionalPackageFamilyNames()
    }

    /**
     * Gets the list of URIs of related optional packages to be updated to the same version as the new optional packages.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.optionalpackageuris
     * @type {IVector<Uri>} 
     */
    OptionalPackageUris {
        get => this.get_OptionalPackageUris()
    }

    /**
     * Gets the list of URIs of related optional packages to be updated to the same version as the new optional packages.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.relatedpackageuris
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
     * In this scenario, you can use the **ExternalLocationUri** property to specify the location where your application's executable and other content are installed to. In code that is run by your installer or your application, create a [StagePackageOptions](stagepackageoptions.md) object and assign this property to the external location. Then, call the [StagePackageByUriAsync](packagemanager_stagepackagebyuriasync_446584280.md) method and pass the [StagePackageOptions](stagepackageoptions.md) object to *options* parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.externallocationuri
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
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.stubpackageoption
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
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.developermode
     * @type {Boolean} 
     */
    DeveloperMode {
        get => this.get_DeveloperMode()
        set => this.put_DeveloperMode(value)
    }

    /**
     * Gets or sets a value that indicates whether to force a specific version of a package to be staged/registered, regardless of if a higher version is already staged/registered.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.forceupdatefromanyversion
     * @type {Boolean} 
     */
    ForceUpdateFromAnyVersion {
        get => this.get_ForceUpdateFromAnyVersion()
        set => this.put_ForceUpdateFromAnyVersion(value)
    }

    /**
     * Gets or sets a value that indicates whether the app skips resource applicability checks. This effectively stages or registers all resource packages that a user passes in to the command, which forces applicability for all packages contained in a bundle. If a user passes in a bundle, all contained resource packages will be registered.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.installallresources
     * @type {Boolean} 
     */
    InstallAllResources {
        get => this.get_InstallAllResources()
        set => this.put_InstallAllResources(value)
    }

    /**
     * Gets or sets a value that indicates whether only the required content group will be staged. An app can be installed as a package with the required content group alone.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.requiredcontentgrouponly
     * @type {Boolean} 
     */
    RequiredContentGroupOnly {
        get => this.get_RequiredContentGroupOnly()
        set => this.put_RequiredContentGroupOnly(value)
    }

    /**
     * Gets or sets a value that indicates whether to stage the package in place.
     * @remarks
     * This property is useful for notifying the system to prepare for app registration in virtual desktop scenarios.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.stageinplace
     * @type {Boolean} 
     */
    StageInPlace {
        get => this.get_StageInPlace()
        set => this.put_StageInPlace(value)
    }

    /**
     * Gets or sets a value that indicates whether to allow an unsigned package to be added.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.allowunsigned
     * @type {Boolean} 
     */
    AllowUnsigned {
        get => this.get_AllowUnsigned()
        set => this.put_AllowUnsigned(value)
    }

    /**
     * Gets a dictionary that maps the URIs associated with a **StagePackageOptions** with the corresponding digest string.
     * @remarks
     * A digest string is a hashed representation of the contents of the package URI. Get the digest for a package URI by calling [IAppxDigestProvider::GetDigest](/windows/win32/api/appxpackaging/nf-appxpackaging-iappxdigestprovider-getdigest.md) and then add the value to the collection returned by **ExpectedDigests**. Digests may be specified for any or all URIs included in the **StagePackageOptions**.  If a digest is specified for a URI and the content at that URI doesn’t match its digest, the deployment operation will fail.  If a digest is not specified for a URI, then the package manager will proceed without validating its digest.  If a digest is specified for a URI which the package manager doesn’t need to read, the digest is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stagepackageoptions.expecteddigests
     * @type {IMap<Uri, HSTRING>} 
     */
    ExpectedDigests {
        get => this.get_ExpectedDigests()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [StagePackageOptions](stagepackageoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.StagePackageOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_DependencyPackageUris() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_DependencyPackageUris()
    }

    /**
     * 
     * @returns {PackageVolume} 
     */
    get_TargetVolume() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_TargetVolume()
    }

    /**
     * 
     * @param {PackageVolume} value 
     * @returns {HRESULT} 
     */
    put_TargetVolume(value) {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.put_TargetVolume(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_OptionalPackageFamilyNames() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_OptionalPackageFamilyNames()
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_OptionalPackageUris() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_OptionalPackageUris()
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_RelatedPackageUris() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_RelatedPackageUris()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ExternalLocationUri() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_ExternalLocationUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ExternalLocationUri(value) {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.put_ExternalLocationUri(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StubPackageOption() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_StubPackageOption()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StubPackageOption(value) {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.put_StubPackageOption(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeveloperMode() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_DeveloperMode()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DeveloperMode(value) {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.put_DeveloperMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceUpdateFromAnyVersion() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_ForceUpdateFromAnyVersion()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceUpdateFromAnyVersion(value) {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.put_ForceUpdateFromAnyVersion(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InstallAllResources() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_InstallAllResources()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_InstallAllResources(value) {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.put_InstallAllResources(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RequiredContentGroupOnly() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_RequiredContentGroupOnly()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RequiredContentGroupOnly(value) {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.put_RequiredContentGroupOnly(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StageInPlace() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_StageInPlace()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_StageInPlace(value) {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.put_StageInPlace(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowUnsigned() {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.get_AllowUnsigned()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowUnsigned(value) {
        if (!this.HasProp("__IStagePackageOptions")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions := IStagePackageOptions(outPtr)
        }

        return this.__IStagePackageOptions.put_AllowUnsigned(value)
    }

    /**
     * 
     * @returns {IMap<Uri, HSTRING>} 
     */
    get_ExpectedDigests() {
        if (!this.HasProp("__IStagePackageOptions2")) {
            if ((queryResult := this.QueryInterface(IStagePackageOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStagePackageOptions2 := IStagePackageOptions2(outPtr)
        }

        return this.__IStagePackageOptions2.get_ExpectedDigests()
    }

;@endregion Instance Methods
}
