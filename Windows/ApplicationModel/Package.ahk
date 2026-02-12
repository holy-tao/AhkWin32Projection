#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackage.ahk
#Include .\IPackage2.ahk
#Include .\IPackage3.ahk
#Include .\IPackageWithMetadata.ahk
#Include .\IPackage4.ahk
#Include .\IPackage5.ahk
#Include .\IPackage6.ahk
#Include .\IPackage7.ahk
#Include .\IPackage8.ahk
#Include .\IPackage9.ahk
#Include .\IPackageStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information about a package.
 * @remarks
 * > [!IMPORTANT]
 * > Although the **Package** class is supported in an unpackaged process (that is, a process belonging to an app that lacks package identity), some members of this class are supported only in a *packaged* process (that is, a process belonging to an app that *has* package identity). For those members, the **Remarks** section of their topics contain more info. And for more info about packaging, see [Package a desktop or UWP app in Visual Studio](/windows/msix/package/packaging-uwp-apps).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class Package extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackage.IID

    /**
     * Gets the package for the current app.
     * @remarks
     * > [!IMPORTANT]
     * > Although the [Package](package.md) class is supported in an unpackaged process (that is, a process belonging to an app that lacks package identity), the **Package.Current** property is supported only in a *packaged* process (that is, a process belonging to an app that *has* package identity). To access a package object from an unpackaged process, use [Windows.Management.Deployment.PackageManager](../windows.management.deployment/packagemanager.md). And for more info about packaging, see [Package a desktop or UWP app in Visual Studio](/windows/msix/package/packaging-uwp-apps).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.current
     * @type {Package} 
     */
    static Current {
        get => Package.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Package} 
     */
    static get_Current() {
        if (!Package.HasProp("__IPackageStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Package")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPackageStatics.IID)
            Package.__IPackageStatics := IPackageStatics(factoryPtr)
        }

        return Package.__IPackageStatics.get_Current()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the package identity of the current package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.id
     * @type {PackageId} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the current package's path in the original install folder for the current package.
     * @remarks
     * There are several other ways to refer to a file in a package.
     * 
     * 
     * + You can just begin a URI with a "/" to refer to the package root. For example: `<img src="/file.png" alt="" />`
     * + You can use the "ms-appx:///" protocol. For example:`<img src="ms-appx://packageFullName/file.png" alt="" />`
     * + You can also omit the package name to let the system fill in the domain, as shown here:
     * 
     * `<img src="ms-appx:///file.png" alt="" />`
     * For more info about how to refer to files in an app's package, see [URI schemes](/windows/uwp/app-resources/uri-schemes) and [Reference an image or other asset from XAML markup and code](/windows/uwp/app-resources/images-tailored-for-scale-theme-contrast#reference-an-image-or-other-asset-from-xaml-markup-and-code).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.installedlocation
     * @type {StorageFolder} 
     */
    InstalledLocation {
        get => this.get_InstalledLocation()
    }

    /**
     * Indicates whether other packages can declare a dependency on this package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.isframework
     * @type {Boolean} 
     */
    IsFramework {
        get => this.get_IsFramework()
    }

    /**
     * Gets the packages on which the current package depends.
     * @remarks
     * > [!IMPORTANT]
     * > Although the [Package](package.md) class is supported in an unpackaged process (that is, a process belonging to an app that lacks package identity), the **Package.Current** property is supported only in a *packaged* process (that is, a process belonging to an app that *has* package identity). To access a package's dependencies from an unpackaged process, use [GetPackageInfo](/windows/desktop/api/appmodel/nf-appmodel-getpackageinfo). And for more info about packaging, see [Package a desktop or UWP app in Visual Studio](/windows/msix/package/packaging-uwp-apps).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.dependencies
     * @type {IVectorView<Package>} 
     */
    Dependencies {
        get => this.get_Dependencies()
    }

    /**
     * Gets the display name of the package.
     * @remarks
     * On operating systems earlier than 10.0.19041.0, you must call this property on the package returned by [Package.Current](package_current.md), otherwise **DisplayName** will return an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the publisher display name of the package.
     * @remarks
     * On operating systems earlier than 10.0.19041.0, you must call this property on the package returned by [Package.Current](package_current.md), otherwise **PublisherDisplayName** will return an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.publisherdisplayname
     * @type {HSTRING} 
     */
    PublisherDisplayName {
        get => this.get_PublisherDisplayName()
    }

    /**
     * Gets the description of the package.
     * @remarks
     * On operating systems earlier than 10.0.19041.0, you must call this property on the package returned by [Package.Current](package_current.md), otherwise **Description** will return an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets the logo of the package.
     * @remarks
     * On operating systems earlier than 10.0.19041.0, you must call this property on the package returned by [Package.Current](package_current.md), otherwise **Logo** will throw an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.logo
     * @type {Uri} 
     */
    Logo {
        get => this.get_Logo()
    }

    /**
     * Indicates whether the package is a resource package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.isresourcepackage
     * @type {Boolean} 
     */
    IsResourcePackage {
        get => this.get_IsResourcePackage()
    }

    /**
     * Indicates whether the package is a bundle package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.isbundle
     * @type {Boolean} 
     */
    IsBundle {
        get => this.get_IsBundle()
    }

    /**
     * Indicates whether the package is installed in development mode.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.isdevelopmentmode
     * @type {Boolean} 
     */
    IsDevelopmentMode {
        get => this.get_IsDevelopmentMode()
    }

    /**
     * Get the current status of the package for the user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.status
     * @type {PackageStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the date on which the application package was installed or last updated.
     * @remarks
     * Note that this property will not be updated when package updates are deployed directly from Visual Studio to a device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.installeddate
     * @type {DateTime} 
     */
    InstalledDate {
        get => this.get_InstalledDate()
    }

    /**
     * Windows Phone only. Gets the date the application package was installed on the user's phone.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.installdate
     * @type {DateTime} 
     */
    InstallDate {
        get => this.get_InstallDate()
    }

    /**
     * How the app package is signed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.signaturekind
     * @type {Integer} 
     */
    SignatureKind {
        get => this.get_SignatureKind()
    }

    /**
     * Indicates whether the package is optional.
     * @remarks
     * Optional packages are dependent on another package that must be installed first. For example a map application may have optional geographic area packages.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.isoptional
     * @type {Boolean} 
     */
    IsOptional {
        get => this.get_IsOptional()
    }

    /**
     * Gets the current package's path in the mutable folder for the installed package, if the app is declared to be mutable in its package manifest.
     * @remarks
     * If the app is declared to be mutable by including the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in its package manifest, it exposes a folder under C:\Program Files\ModifiableWindowsApps where the contents of the application's install folder are projected so that users can modify the installation files. This folder is called the *mutable folder*. The mutable folder feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.mutablelocation
     * @type {StorageFolder} 
     */
    MutableLocation {
        get => this.get_MutableLocation()
    }

    /**
     * Gets the effective location for the installed package, depending on how the app is declared in its package manifest. For details, see **Remarks**.
     * @remarks
     * If the package has a User-External location, then get that folder. Otherwise, if the package has a Machine-External location, then get that folder. Otherwise, if the package has a [Mutable location](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop8-mutablepackagedirectories), then get the Mutable folder for the installed package (that is, the folder under `C:\Program Files\ModifiableWindowsApps` where users can add files that modify the app). Also see [Create a directory in any location based on packaged app directory](/windows/msix/manage/create-directory). Otherwise, get the same value as the [InstalledLocation](package_installedlocation.md) property. The mutable folder feature is currently available only for certain types of desktop PC games that are published by Microsoft and partners, and it enables those types of games to support modifications (mods).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.effectivelocation
     * @type {StorageFolder} 
     */
    EffectiveLocation {
        get => this.get_EffectiveLocation()
    }

    /**
     * Gets the location of the machine-wide or per-user external folder specified in the package manifest for the current package, depending on how the app is installed.
     * @remarks
     * The external folder is a disk location outside of the package where the package manifest can reference application content. This property returns either the machine-wide or per-user location of the external folder for the current package as a [StorageFolder](../windows.storage/storagefolder.md) object, depending on whether the app is provisioned for all users on the machine or on a per-user basis.
     * 
     * This property is intended to be used when you are granting package identity by packaging with external location. A package with external location contains only a package manifest (not an executable or other application content). The package manifest references application content in an external disk location outside of the package.
     * 
     * To set the external folder, use one of the following combinations of [PackageManager](../windows.management.deployment/packagemanager.md) methods and related options properties:
     * 
     * * [AddPackageByUriAsync](../windows.management.deployment/packagemanager_addpackagebyuriasync_797417417.md): Set the [ExternalLocationUri](../windows.management.deployment/addpackageoptions_externallocationuri.md) property of the *options* parameter.
     * * [RegisterPackageByUriAsync](../windows.management.deployment/packagemanager_registerpackagebyuriasync_1415074502.md): Set the [ExternalLocationUri](../windows.management.deployment/registerpackageoptions_externallocationuri.md) property of the *options* parameter.
     * * [StagePackageByUriAsync](../windows.management.deployment/packagemanager_stagepackagebyuriasync_446584280.md): Set the [ExternalLocationUri](../windows.management.deployment/stagepackageoptions_externallocationuri.md) property of the *options* parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.effectiveexternallocation
     * @type {StorageFolder} 
     */
    EffectiveExternalLocation {
        get => this.get_EffectiveExternalLocation()
    }

    /**
     * Gets the location of the machine-wide external folder specified in the package manifest for the current package.
     * @remarks
     * The external folder is a disk location outside of the package where the package manifest can reference application content. This property returns the location of the external folder as a [StorageFolder](../windows.storage/storagefolder.md) object for an app that is provisioned for all users on the machine.
     * 
     * This property is intended to be used when you are granting package identity by packaging with external location. A package with external location contains only a package manifest (not an executable or other application content). The package manifest references application content in an external disk location outside of the package.
     * 
     * To set the external folder, use one of the following combinations of [PackageManager](../windows.management.deployment/packagemanager.md) methods and related options properties:
     * 
     * * [AddPackageByUriAsync](../windows.management.deployment/packagemanager_addpackagebyuriasync_797417417.md): Set the [ExternalLocationUri](../windows.management.deployment/addpackageoptions_externallocationuri.md) property of the *options* parameter.
     * * [RegisterPackageByUriAsync](../windows.management.deployment/packagemanager_registerpackagebyuriasync_1415074502.md): Set the [ExternalLocationUri](../windows.management.deployment/registerpackageoptions_externallocationuri.md) property of the *options* parameter.
     * * [StagePackageByUriAsync](../windows.management.deployment/packagemanager_stagepackagebyuriasync_446584280.md): Set the [ExternalLocationUri](../windows.management.deployment/stagepackageoptions_externallocationuri.md) property of the *options* parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.machineexternallocation
     * @type {StorageFolder} 
     */
    MachineExternalLocation {
        get => this.get_MachineExternalLocation()
    }

    /**
     * Gets the location of the per-user external folder specified in the package manifest for the current package.
     * @remarks
     * The external folder is a disk location outside of the package where the package manifest can reference application content. This property returns the location of the external folder as a [StorageFolder](../windows.storage/storagefolder.md) object for an app that is installed on a per-user basis.
     * 
     * This property is intended to be used when you are granting package identity by packaging with external location. A package with external location contains only a package manifest (not an executable or other application content). The package manifest references application content in an external disk location outside of the package.
     * 
     * To set the external folder, use one of the following combinations of [PackageManager](../windows.management.deployment/packagemanager.md) methods and related options properties:
     * 
     * * [AddPackageByUriAsync](../windows.management.deployment/packagemanager_addpackagebyuriasync_797417417.md): Set the [ExternalLocationUri](../windows.management.deployment/addpackageoptions_externallocationuri.md) property of the *options* parameter.
     * * [RegisterPackageByUriAsync](../windows.management.deployment/packagemanager_registerpackagebyuriasync_1415074502.md): Set the [ExternalLocationUri](../windows.management.deployment/registerpackageoptions_externallocationuri.md) property of the *options* parameter.
     * * [StagePackageByUriAsync](../windows.management.deployment/packagemanager_stagepackagebyuriasync_446584280.md): Set the [ExternalLocationUri](../windows.management.deployment/stagepackageoptions_externallocationuri.md) property of the *options* parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.userexternallocation
     * @type {StorageFolder} 
     */
    UserExternalLocation {
        get => this.get_UserExternalLocation()
    }

    /**
     * Gets the current package's path in the original install folder for the current package.
     * @remarks
     * There are several other ways to refer to a file in a package.
     * 
     * + You can just begin a URI with a "/" to refer to the package root: `<img src="/file.png" alt="" />`
     * + You can use the "ms-appx:///" protocol: `<img src="ms-appx://packageFullName/file.png" alt="" />`
     * + You can also omit the package name to let the system fill in the domain: `<img src="ms-appx:///file.png" alt="" />`
     * 
     * For more info about how to refer to files in an app's package, see [URI schemes](/windows/uwp/app-resources/uri-schemes) and [Reference an image or other asset from XAML markup and code](/windows/uwp/app-resources/images-tailored-for-scale-theme-contrast#reference-an-image-or-other-asset-from-xaml-markup-and-code).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.installedpath
     * @type {HSTRING} 
     */
    InstalledPath {
        get => this.get_InstalledPath()
    }

    /**
     * Gets the current package's path in the mutable folder for the installed package, if the app is declared to be mutable in its package manifest.
     * @remarks
     * If the app is declared to be mutable by including the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in its package manifest, it exposes a folder under C:\Program Files\ModifiableWindowsApps where the contents of the application's install folder are projected so that users can modify the installation files. This folder is called the *mutable folder*. The mutable folder feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.mutablepath
     * @type {HSTRING} 
     */
    MutablePath {
        get => this.get_MutablePath()
    }

    /**
     * Gets either the path of the installed folder or the mutable folder for the installed package, depending on whether the app is declared to be mutable in its package manifest.
     * @remarks
     * If the app is declared to be mutable by including the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in its package manifest, this property gets the path of the mutable folder for the installed package (that is, the folder under C:\Program Files\ModifiableWindowsApps where users can add files that modify the app). If the app is not declared to be mutable, this property gets the same value as the [InstalledPath](package_installedpath.md) property. The mutable folder feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.effectivepath
     * @type {HSTRING} 
     */
    EffectivePath {
        get => this.get_EffectivePath()
    }

    /**
     * Gets the location of the machine-wide or per-user external folder specified in the package manifest for the current package, depending on how the app is installed.
     * @remarks
     * The external folder is a disk location outside of the package where the package manifest can reference application content. This property returns either the machine-wide or per-user location of the external folder for the current package, depending on whether the app is provisioned for all users on the machine or on a per-user basis.
     * 
     * This property is intended to be used when you are granting package identity by packaging with external location. A package with external location contains only a package manifest (not an executable or other application content). The package manifest references application content in an external disk location outside of the package.
     * 
     * To set the external folder, use one of the following combinations of [PackageManager](../windows.management.deployment/packagemanager.md) methods and related options properties:
     * 
     * * [AddPackageByUriAsync](../windows.management.deployment/packagemanager_addpackagebyuriasync_797417417.md): Set the [ExternalLocationUri](../windows.management.deployment/addpackageoptions_externallocationuri.md) property of the *options* parameter.
     * * [RegisterPackageByUriAsync](../windows.management.deployment/packagemanager_registerpackagebyuriasync_1415074502.md): Set the [ExternalLocationUri](../windows.management.deployment/registerpackageoptions_externallocationuri.md) property of the *options* parameter.
     * * [StagePackageByUriAsync](../windows.management.deployment/packagemanager_stagepackagebyuriasync_446584280.md): Set the [ExternalLocationUri](../windows.management.deployment/stagepackageoptions_externallocationuri.md) property of the *options* parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.effectiveexternalpath
     * @type {HSTRING} 
     */
    EffectiveExternalPath {
        get => this.get_EffectiveExternalPath()
    }

    /**
     * Gets the location of the machine-wide external folder specified in the package manifest for the current package.
     * @remarks
     * The external folder is a disk location outside of the package where the package manifest can reference application content. This property returns the location of the external folder for an app that is provisioned for all users on the machine.
     * 
     * This property is intended to be used when you are granting package identity by packaging with external location. A package with external location contains only a package manifest (not an executable or other application content). The package manifest references application content in an external disk location outside of the package.
     * 
     * To set the external folder, use one of the following combinations of [PackageManager](../windows.management.deployment/packagemanager.md) methods and related options properties:
     * 
     * * [AddPackageByUriAsync](../windows.management.deployment/packagemanager_addpackagebyuriasync_797417417.md): Set the [ExternalLocationUri](../windows.management.deployment/addpackageoptions_externallocationuri.md) property of the *options* parameter.
     * * [RegisterPackageByUriAsync](../windows.management.deployment/packagemanager_registerpackagebyuriasync_1415074502.md): Set the [ExternalLocationUri](../windows.management.deployment/registerpackageoptions_externallocationuri.md) property of the *options* parameter.
     * * [StagePackageByUriAsync](../windows.management.deployment/packagemanager_stagepackagebyuriasync_446584280.md): Set the [ExternalLocationUri](../windows.management.deployment/stagepackageoptions_externallocationuri.md) property of the *options* parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.machineexternalpath
     * @type {HSTRING} 
     */
    MachineExternalPath {
        get => this.get_MachineExternalPath()
    }

    /**
     * Gets the path of the per-user external folder specified in the package manifest for the current package.
     * @remarks
     * The external folder is a disk location outside of the package where the package manifest can reference application content. This property returns the path of the external folder for an app that is installed on a per-user basis.
     * 
     * This property is intended to be used when you are granting package identity by packaging with external location. A package with external location contains only a package manifest (not an executable or other application content). The package manifest references application content in an external disk location outside of the package.
     * 
     * To set the external folder, use one of the following combinations of [PackageManager](../windows.management.deployment/packagemanager.md) methods and related options properties:
     * 
     * * [AddPackageByUriAsync](../windows.management.deployment/packagemanager_addpackagebyuriasync_797417417.md): Set the [ExternalLocationUri](../windows.management.deployment/addpackageoptions_externallocationuri.md) property of the *options* parameter.
     * * [RegisterPackageByUriAsync](../windows.management.deployment/packagemanager_registerpackagebyuriasync_1415074502.md): Set the [ExternalLocationUri](../windows.management.deployment/registerpackageoptions_externallocationuri.md) property of the *options* parameter.
     * * [StagePackageByUriAsync](../windows.management.deployment/packagemanager_stagepackagebyuriasync_446584280.md): Set the [ExternalLocationUri](../windows.management.deployment/stagepackageoptions_externallocationuri.md) property of the *options* parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.userexternalpath
     * @type {HSTRING} 
     */
    UserExternalPath {
        get => this.get_UserExternalPath()
    }

    /**
     * Gets a value that indicates whether the application in the current package is a stub application.
     * @remarks
     * > [!NOTE]
     * > The ability for an app to run as a stub is currently available only to certain apps that are built by Microsoft.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.isstub
     * @type {Boolean} 
     */
    IsStub {
        get => this.get_IsStub()
    }

    /**
     * Contains the scheme part of the URI that was used to install the package.
     * @remarks
     * Some common scheme examples:
     * 
     * | Scheme | Description |
     * |-----|-----|
     * | http | Installed from a package hosted on a web server. |
     * | https | Installed from a package hosted on a web server with SSL. |
     * | file | Installed from a package on a local or network disk. |
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.sourceurischemename
     * @type {HSTRING} 
     */
    SourceUriSchemeName {
        get => this.get_SourceUriSchemeName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PackageId} 
     */
    get_Id() {
        if (!this.HasProp("__IPackage")) {
            if ((queryResult := this.QueryInterface(IPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage := IPackage(outPtr)
        }

        return this.__IPackage.get_Id()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_InstalledLocation() {
        if (!this.HasProp("__IPackage")) {
            if ((queryResult := this.QueryInterface(IPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage := IPackage(outPtr)
        }

        return this.__IPackage.get_InstalledLocation()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFramework() {
        if (!this.HasProp("__IPackage")) {
            if ((queryResult := this.QueryInterface(IPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage := IPackage(outPtr)
        }

        return this.__IPackage.get_IsFramework()
    }

    /**
     * 
     * @returns {IVectorView<Package>} 
     */
    get_Dependencies() {
        if (!this.HasProp("__IPackage")) {
            if ((queryResult := this.QueryInterface(IPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage := IPackage(outPtr)
        }

        return this.__IPackage.get_Dependencies()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPackage2")) {
            if ((queryResult := this.QueryInterface(IPackage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage2 := IPackage2(outPtr)
        }

        return this.__IPackage2.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PublisherDisplayName() {
        if (!this.HasProp("__IPackage2")) {
            if ((queryResult := this.QueryInterface(IPackage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage2 := IPackage2(outPtr)
        }

        return this.__IPackage2.get_PublisherDisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IPackage2")) {
            if ((queryResult := this.QueryInterface(IPackage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage2 := IPackage2(outPtr)
        }

        return this.__IPackage2.get_Description()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Logo() {
        if (!this.HasProp("__IPackage2")) {
            if ((queryResult := this.QueryInterface(IPackage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage2 := IPackage2(outPtr)
        }

        return this.__IPackage2.get_Logo()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsResourcePackage() {
        if (!this.HasProp("__IPackage2")) {
            if ((queryResult := this.QueryInterface(IPackage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage2 := IPackage2(outPtr)
        }

        return this.__IPackage2.get_IsResourcePackage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBundle() {
        if (!this.HasProp("__IPackage2")) {
            if ((queryResult := this.QueryInterface(IPackage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage2 := IPackage2(outPtr)
        }

        return this.__IPackage2.get_IsBundle()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDevelopmentMode() {
        if (!this.HasProp("__IPackage2")) {
            if ((queryResult := this.QueryInterface(IPackage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage2 := IPackage2(outPtr)
        }

        return this.__IPackage2.get_IsDevelopmentMode()
    }

    /**
     * 
     * @returns {PackageStatus} 
     */
    get_Status() {
        if (!this.HasProp("__IPackage3")) {
            if ((queryResult := this.QueryInterface(IPackage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage3 := IPackage3(outPtr)
        }

        return this.__IPackage3.get_Status()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_InstalledDate() {
        if (!this.HasProp("__IPackage3")) {
            if ((queryResult := this.QueryInterface(IPackage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage3 := IPackage3(outPtr)
        }

        return this.__IPackage3.get_InstalledDate()
    }

    /**
     * Enumerates the packaged apps on the device and returns the list asynchronously. Only apps included in the current package are returned.
     * @returns {IAsyncOperation<IVectorView<AppListEntry>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.getapplistentriesasync
     */
    GetAppListEntriesAsync() {
        if (!this.HasProp("__IPackage3")) {
            if ((queryResult := this.QueryInterface(IPackage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage3 := IPackage3(outPtr)
        }

        return this.__IPackage3.GetAppListEntriesAsync()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_InstallDate() {
        if (!this.HasProp("__IPackageWithMetadata")) {
            if ((queryResult := this.QueryInterface(IPackageWithMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageWithMetadata := IPackageWithMetadata(outPtr)
        }

        return this.__IPackageWithMetadata.get_InstallDate()
    }

    /**
     * Windows Phone only. Returns a token that can be used to retrieve the thumbnail image associated with this application package.
     * @remarks
     * Use the [GetSharedFileName](https://msdn.microsoft.com/library/24fdc8cf-ded4-49f5-b73a-b79731afafcd) method passing the token returned by this method to retrieve the thumbnail image associated with this application package.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.getthumbnailtoken
     */
    GetThumbnailToken() {
        if (!this.HasProp("__IPackageWithMetadata")) {
            if ((queryResult := this.QueryInterface(IPackageWithMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageWithMetadata := IPackageWithMetadata(outPtr)
        }

        return this.__IPackageWithMetadata.GetThumbnailToken()
    }

    /**
     * Windows Phone only. Launches the specified application.
     * @remarks
     * The Launch parameter has the same format as the **NavigationUri** format. The following table shows some examples:
     * 
     * <table>
     *    <tr><th>Scenario</th><th>Launch parameter</th><th>Example</th></tr>
     *    <tr><td>You just want to launch the app with the default page.</td><td>Specify an empty string.</td><td>`pkg.Launch("");`</td></tr>
     *    <tr><td>You want to launch to a particular XAML page.</td><td>Start with a forward slash (/) followed by the XAML page name.</td><td>`pkg.Launch("/Page1.xaml");`</td></tr>
     *    <tr><td>You want to pass parameters to the default page.</td><td>Start with a question mark (?) followed by name/value pairs. Use an equal sign (=) between the name and value. Separate multiple name/value pairs with an ampersand (&amp;).</td><td>`pkg.Launch("?content=1234&param2=test");`</td></tr>
     *    <tr><td>You want to launch to a particular XAML page and pass in parameters.</td><td>Use a combination of the previous two examples.</td><td>`pkg.Launch("/Page1.xaml?content=1234&param2=test ");`</td></tr>
     * </table>
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > The Launch method only works if it is called from a Windows Phone Silverlight app.
     * @param {HSTRING} parameters The navigation URI that specifies the page to launch and optional parameters. Use an empty string to specify the default page for the app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.launch
     */
    Launch(parameters) {
        if (!this.HasProp("__IPackageWithMetadata")) {
            if ((queryResult := this.QueryInterface(IPackageWithMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageWithMetadata := IPackageWithMetadata(outPtr)
        }

        return this.__IPackageWithMetadata.Launch(parameters)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SignatureKind() {
        if (!this.HasProp("__IPackage4")) {
            if ((queryResult := this.QueryInterface(IPackage4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage4 := IPackage4(outPtr)
        }

        return this.__IPackage4.get_SignatureKind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOptional() {
        if (!this.HasProp("__IPackage4")) {
            if ((queryResult := this.QueryInterface(IPackage4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage4 := IPackage4(outPtr)
        }

        return this.__IPackage4.get_IsOptional()
    }

    /**
     * Ensures that the package has not been modified or tampered with before being loaded.
     * @remarks
     * This function only verifies that the package's contents have not been modified. It does not verify the package's status, origin, and so on.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.verifycontentintegrityasync
     */
    VerifyContentIntegrityAsync() {
        if (!this.HasProp("__IPackage4")) {
            if ((queryResult := this.QueryInterface(IPackage4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage4 := IPackage4(outPtr)
        }

        return this.__IPackage4.VerifyContentIntegrityAsync()
    }

    /**
     * Provides information about all of the package content groups in the app and their state, name, whether they are required, and so on.
     * @remarks
     * The returned collection may be empty if the package does not contain any content groups.
     * @returns {IAsyncOperation<IVector<PackageContentGroup>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.getcontentgroupsasync
     */
    GetContentGroupsAsync() {
        if (!this.HasProp("__IPackage5")) {
            if ((queryResult := this.QueryInterface(IPackage5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage5 := IPackage5(outPtr)
        }

        return this.__IPackage5.GetContentGroupsAsync()
    }

    /**
     * Provides information about the package content group such as its state, name, whether it is required, and so on.
     * @param {HSTRING} name The name of the content group to get.
     * @returns {IAsyncOperation<PackageContentGroup>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.getcontentgroupasync
     */
    GetContentGroupAsync(name) {
        if (!this.HasProp("__IPackage5")) {
            if ((queryResult := this.QueryInterface(IPackage5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage5 := IPackage5(outPtr)
        }

        return this.__IPackage5.GetContentGroupAsync(name)
    }

    /**
     * Put the packages in the specified content groups into the staging queue; optionally placing the content groups at the head of the queue.
     * @remarks
     * This function completes when all requested groups are staged. The returned list may contain a null element if the named group in that position does not exist. Use  [PackageCatalog.PackageContentGroupStaging](packagecatalog_packagecontentgroupstaging.md) to observe staging progress.
     * 
     * Be sure to check [PackageContentGroup.State](packagecontentgroupstate.md) to verify that the group was successfully staged. Referencing files in a group that is not fully staged may result in unexpected application behavior. Content groups return to the **PackageContentGroupState.NotStaged** state if the staging operation cannot be completed.
     * @param {IIterable<HSTRING>} names The names of the content groups to stage.
     * @returns {IAsyncOperation<IVector<PackageContentGroup>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.stagecontentgroupsasync
     */
    StageContentGroupsAsync(names) {
        if (!this.HasProp("__IPackage5")) {
            if ((queryResult := this.QueryInterface(IPackage5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage5 := IPackage5(outPtr)
        }

        return this.__IPackage5.StageContentGroupsAsync(names)
    }

    /**
     * Put the packages in the specified content groups into the staging queue.
     * @remarks
     * This function completes when all requested groups are staged. The returned list may contain a null element if the named group in that position does not exist. Use  [PackageCatalog.PackageContentGroupStaging](packagecatalog_packagecontentgroupstaging.md) to observe staging progress.
     * 
     * Be sure to check [PackageContentGroup.State](packagecontentgroupstate.md) to verify that the group was successfully staged. Referencing files in a group that is not fully staged may result in unexpected application behavior. Content groups return to the **PackageContentGroupState.NotStaged** state if the staging operation cannot be completed.
     * @param {IIterable<HSTRING>} names The names of the content groups to stage.
     * @param {Boolean} moveToHeadOfQueue 
     * @returns {IAsyncOperation<IVector<PackageContentGroup>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.stagecontentgroupsasync
     */
    StageContentGroupsWithPriorityAsync(names, moveToHeadOfQueue) {
        if (!this.HasProp("__IPackage5")) {
            if ((queryResult := this.QueryInterface(IPackage5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage5 := IPackage5(outPtr)
        }

        return this.__IPackage5.StageContentGroupsWithPriorityAsync(names, moveToHeadOfQueue)
    }

    /**
     * Sets whether the package is in use or not.
     * @remarks
     * This API specifies whether the app is using an optional package. With this information the system can determine whether servicing the optional package will require shutting down the app. This provides a better user experience because the app can manage when it is shut down for optional package updates or removals.
     * 
     * By default, all optional packages are in use. Servicing an optional package causes the app to shut down. To avoid shutting down the app when an optional package that is not being used is updated or removed, call this API with **inUse** set to **false**.
     * @param {Boolean} inUse **True** to specify that the package is in use; **false** otherwise.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.setinuseasync
     */
    SetInUseAsync(inUse) {
        if (!this.HasProp("__IPackage5")) {
            if ((queryResult := this.QueryInterface(IPackage5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage5 := IPackage5(outPtr)
        }

        return this.__IPackage5.SetInUseAsync(inUse)
    }

    /**
     * Returns the .appinstaller XML file location. Use this method when you need to retrieve the .appinstaller XML file location for your app. For example, this is useful if your app needs to share a URI to its associated .appinstaller file. You can optionally add arguments to the URI.
     * @remarks
     * Use this method if you want to get the URI to the .appinstaller file associated with the current app so you can share the URI with users. If a user who doesn't have the app clicks the URI, they are taken through the install process for the app. If a user who already has the app clicks the URI, the app is updated if needed and then it opens.
     * 
     * You can optionally add arguments to the URI. In this case, the behavior is the same as described above, but the app can then use the arguments when it opens. The arguments must use a protocol that the app supports. For more information, see [Handle URI activation](/windows/uwp/launch-resume/handle-uri-activation).
     * @returns {AppInstallerInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.getappinstallerinfo
     */
    GetAppInstallerInfo() {
        if (!this.HasProp("__IPackage6")) {
            if ((queryResult := this.QueryInterface(IPackage6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage6 := IPackage6(outPtr)
        }

        return this.__IPackage6.GetAppInstallerInfo()
    }

    /**
     * The *`CheckUpdateAvailabilityAsync` method allows developers to check for updates to the main app package listed in the .appinstaller file. It allows the developer to determine if the updates are required due to .appinstaller policy. This method currently only works for applications installed via .appinstaller files.
     * @remarks
     * If you try to use this method on the [Package](package.md) object returned by the [Current](package_current.md) property, this method will fail with an "Access denied" error. This is a known issue that may be fixed in a future release. The example on this page demonstrates how to retrieve update information about the current app's package.
     * 
     * This method is not supported in JavaScript. However, you can create a Windows Runtime component that calls this method and then call this component from a JavaScript UWP app. For more information, see [App Installer file API issues](/windows/msix/app-installer/app-installer-api-issues).
     * @returns {IAsyncOperation<PackageUpdateAvailabilityResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.checkupdateavailabilityasync
     */
    CheckUpdateAvailabilityAsync() {
        if (!this.HasProp("__IPackage6")) {
            if ((queryResult := this.QueryInterface(IPackage6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage6 := IPackage6(outPtr)
        }

        return this.__IPackage6.CheckUpdateAvailabilityAsync()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_MutableLocation() {
        if (!this.HasProp("__IPackage7")) {
            if ((queryResult := this.QueryInterface(IPackage7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage7 := IPackage7(outPtr)
        }

        return this.__IPackage7.get_MutableLocation()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_EffectiveLocation() {
        if (!this.HasProp("__IPackage7")) {
            if ((queryResult := this.QueryInterface(IPackage7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage7 := IPackage7(outPtr)
        }

        return this.__IPackage7.get_EffectiveLocation()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_EffectiveExternalLocation() {
        if (!this.HasProp("__IPackage8")) {
            if ((queryResult := this.QueryInterface(IPackage8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage8 := IPackage8(outPtr)
        }

        return this.__IPackage8.get_EffectiveExternalLocation()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_MachineExternalLocation() {
        if (!this.HasProp("__IPackage8")) {
            if ((queryResult := this.QueryInterface(IPackage8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage8 := IPackage8(outPtr)
        }

        return this.__IPackage8.get_MachineExternalLocation()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_UserExternalLocation() {
        if (!this.HasProp("__IPackage8")) {
            if ((queryResult := this.QueryInterface(IPackage8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage8 := IPackage8(outPtr)
        }

        return this.__IPackage8.get_UserExternalLocation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InstalledPath() {
        if (!this.HasProp("__IPackage8")) {
            if ((queryResult := this.QueryInterface(IPackage8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage8 := IPackage8(outPtr)
        }

        return this.__IPackage8.get_InstalledPath()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MutablePath() {
        if (!this.HasProp("__IPackage8")) {
            if ((queryResult := this.QueryInterface(IPackage8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage8 := IPackage8(outPtr)
        }

        return this.__IPackage8.get_MutablePath()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EffectivePath() {
        if (!this.HasProp("__IPackage8")) {
            if ((queryResult := this.QueryInterface(IPackage8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage8 := IPackage8(outPtr)
        }

        return this.__IPackage8.get_EffectivePath()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EffectiveExternalPath() {
        if (!this.HasProp("__IPackage8")) {
            if ((queryResult := this.QueryInterface(IPackage8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage8 := IPackage8(outPtr)
        }

        return this.__IPackage8.get_EffectiveExternalPath()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MachineExternalPath() {
        if (!this.HasProp("__IPackage8")) {
            if ((queryResult := this.QueryInterface(IPackage8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage8 := IPackage8(outPtr)
        }

        return this.__IPackage8.get_MachineExternalPath()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserExternalPath() {
        if (!this.HasProp("__IPackage8")) {
            if ((queryResult := this.QueryInterface(IPackage8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage8 := IPackage8(outPtr)
        }

        return this.__IPackage8.get_UserExternalPath()
    }

    /**
     * Gets the application logo of the package as a random access stream.
     * @param {SIZE} size_ The size of the application logo to get.
     * @returns {RandomAccessStreamReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.getlogoasrandomaccessstreamreference
     */
    GetLogoAsRandomAccessStreamReference(size_) {
        if (!this.HasProp("__IPackage8")) {
            if ((queryResult := this.QueryInterface(IPackage8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage8 := IPackage8(outPtr)
        }

        return this.__IPackage8.GetLogoAsRandomAccessStreamReference(size_)
    }

    /**
     * Enumerates the packaged apps on the device and returns the list synchronously. Only apps included in the current package are returned.
     * @returns {IVectorView<AppListEntry>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.getapplistentries
     */
    GetAppListEntries() {
        if (!this.HasProp("__IPackage8")) {
            if ((queryResult := this.QueryInterface(IPackage8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage8 := IPackage8(outPtr)
        }

        return this.__IPackage8.GetAppListEntries()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStub() {
        if (!this.HasProp("__IPackage8")) {
            if ((queryResult := this.QueryInterface(IPackage8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage8 := IPackage8(outPtr)
        }

        return this.__IPackage8.get_IsStub()
    }

    /**
     * The **FindRelatedPackages** method provides the dependencies and then dependents for a given package as a Package list. The list can be filtered by the type of dependency using the **options** parameter.
     * @remarks
     * Any caller (with the **packageQuery** capability or Medium IL, or without if the call is for the current package) can use this API to get the list of dependents (any package which defines a **Dependency** in its manifest) of a given Package. The package can use this data to display its consumers to the user or make servicing decisions based on it. For example, Edge can display all PWAs installed on the device. This API is aware of all registered packages.
     * @param {FindRelatedPackagesOptions} options The [FindRelatedPackageOptions](findrelatedpackagesoptions.md) which defines the search options.
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.package.findrelatedpackages
     */
    FindRelatedPackages(options) {
        if (!this.HasProp("__IPackage9")) {
            if ((queryResult := this.QueryInterface(IPackage9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage9 := IPackage9(outPtr)
        }

        return this.__IPackage9.FindRelatedPackages(options)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceUriSchemeName() {
        if (!this.HasProp("__IPackage9")) {
            if ((queryResult := this.QueryInterface(IPackage9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackage9 := IPackage9(outPtr)
        }

        return this.__IPackage9.get_SourceUriSchemeName()
    }

;@endregion Instance Methods
}
