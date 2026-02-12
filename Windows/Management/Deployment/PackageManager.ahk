#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageManager.ahk
#Include .\IPackageManager2.ahk
#Include .\IPackageManager3.ahk
#Include .\IPackageManager4.ahk
#Include .\IPackageManager5.ahk
#Include .\IPackageManager6.ahk
#Include .\IPackageManager7.ahk
#Include .\IPackageManager8.ahk
#Include .\IPackageManager9.ahk
#Include .\IPackageManager10.ahk
#Include .\IPackageManager11.ahk
#Include .\IPackageManager12.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages the software available to a user.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class PackageManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Get the debugging settings for [Package](/uwp/api/windows.applicationmodel.package) deployment.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.debugsettings
     * @type {PackageManagerDebugSettings} 
     */
    DebugSettings {
        get => this.get_DebugSettings()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.PackageManager")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Adds a [Package](/uwp/api/windows.applicationmodel.package) (the main package) and its dependency packages to the specified volume for the current user, using the specified deployment options.
     * @param {Uri} packageUri The Uri of the package to add. The URI must follow the file URI scheme (file://) since the only supported URI schemes are local file paths and local network paths.
     * @param {IIterable<Uri>} dependencyPackageUris The Uris of the dependency packages to add. If there are no dependency packages or if the dependency packages are already registered, this parameter can be null.
     * @param {Integer} deploymentOptions_ A bitwise combination of enumeration values from the [DeploymentOptions](deploymentoptions.md) enumeration. **ForceApplicationShutdown** and **None** are the only valid options for this method. Specifying any other option results in an E_INVALIDARG return value.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.addpackageasync
     */
    AddPackageAsync(packageUri, dependencyPackageUris, deploymentOptions_) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.AddPackageAsync(packageUri, dependencyPackageUris, deploymentOptions_)
    }

    /**
     * Updates an installed [Package](/uwp/api/windows.applicationmodel.package) or its dependency packages for the current user.
     * @remarks
     * An installed package can be updated only if the version of the update package is higher than that of the installed package. If no previous version of the package exists, the operation fails.
     * @param {Uri} packageUri The source URI of the main package.
     * @param {IIterable<Uri>} dependencyPackageUris The source URIs of the dependency packages.
     * @param {Integer} deploymentOptions_ One of the permitted enumeration values. **ForceApplicationShutdown** and **None** are the only valid options for this method and specifying any other deployment option results in an E_INVALIDARG return value.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.updatepackageasync
     */
    UpdatePackageAsync(packageUri, dependencyPackageUris, deploymentOptions_) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.UpdatePackageAsync(packageUri, dependencyPackageUris, deploymentOptions_)
    }

    /**
     * Removes a [Package](/uwp/api/windows.applicationmodel.package) for the current user asynchronously and receives progress and status messages on the removal operation. Dependency packages are also removed for the user if no other packages installed for the user depend on them.
     * @remarks
     * For a call to this method to be successful, the caller needs to fulfil one of these conditions:
     * 
     * * The caller is running in an AppContainer (Low IL) *and* it has the **packageManagement** restricted capability.
     * * The caller is running with Medium IL, or higher.
     * * The caller’s publisher matches the publisher of the package (or volume) being removed.
     * 
     * For descriptions of the terms above, and links to more info, see [Packaging, deployment, and process](/windows/apps/get-started/intro-pack-dep-proc).
     * @param {HSTRING} packageFullName A string representation of the package identity to identify the package to be removed.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.removepackageasync
     */
    RemovePackageAsync(packageFullName) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.RemovePackageAsync(packageFullName)
    }

    /**
     * Stages a [Package](/uwp/api/windows.applicationmodel.package) to the system without registering it.
     * @param {Uri} packageUri The source URI of the main package.
     * @param {IIterable<Uri>} dependencyPackageUris The source URIs of the dependency packages. If there are no dependency packages or dependency packages are already staged, this parameter can be null.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.stagepackageasync
     */
    StagePackageAsync(packageUri, dependencyPackageUris) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.StagePackageAsync(packageUri, dependencyPackageUris)
    }

    /**
     * Registers a [Package](/uwp/api/windows.applicationmodel.package) (the main package) and its dependency packages on the specified volume for the current user, using the specified deployment options.
     * @param {Uri} manifestUri The Uri of the main package.
     * @param {IIterable<Uri>} dependencyPackageUris The Uris of the dependency packages.
     * @param {Integer} deploymentOptions_ A bitwise combination of enumeration values from the [DeploymentOptions](deploymentoptions.md) enumeration that specify deployment options.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.registerpackageasync
     */
    RegisterPackageAsync(manifestUri, dependencyPackageUris, deploymentOptions_) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.RegisterPackageAsync(manifestUri, dependencyPackageUris, deploymentOptions_)
    }

    /**
     * Retrieves information about a specified family of [Packages](/uwp/api/windows.applicationmodel.package) installed across all users.
     * @remarks
     * This method requires administrative privileges. Each package in the [IIterable(Package)](../windows.foundation.collections/iiterable_1.md) collection may be installed for the current user or for another user. This method differs from [FindPackages(String packageName, String pulisherName)](packagemanager_findpackages_1597689551.md) method. Here the *packageFamilyName* parameter is a single string, comprised of the package name and package publisher hash.
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackages
     */
    FindPackages() {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.FindPackages()
    }

    /**
     * Retrieves information about a specified family of [Packages](/uwp/api/windows.applicationmodel.package) installed for a specific user.
     * @param {HSTRING} userSecurityId The user security identifier (SID). If this parameter is String.Empty, the packages are retrieved for the current user.
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackagesforuser
     */
    FindPackagesByUserSecurityId(userSecurityId) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.FindPackagesByUserSecurityId(userSecurityId)
    }

    /**
     * Retrieves information about a specified family of [Packages](/uwp/api/windows.applicationmodel.package) installed across all users.
     * @remarks
     * This method requires administrative privileges. Otherwise, an **AccessDeniedException** is thrown.
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackages
     */
    FindPackagesByNamePublisher(packageName, packagePublisher) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.FindPackagesByNamePublisher(packageName, packagePublisher)
    }

    /**
     * Finds all [Packages](/uwp/api/windows.applicationmodel.package) installed for the specified user.
     * @remarks
     * This method and its overloads require administrative privileges if the user security ID specified is different from the user security ID of the calling user. Otherwise, an **AccessDeniedException** is thrown. Similar to the [FindPackages](packagemanager_findpackages_1246181969.md) method, this method and its overloads can be used to enumerate the installed packages for a particular user.
     * @param {HSTRING} userSecurityId The user security identifier (SID). If this parameter is **string.Empty**, the packages are retrieved for the current user.
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackagesforuser
     */
    FindPackagesByUserSecurityIdNamePublisher(userSecurityId, packageName, packagePublisher) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.FindPackagesByUserSecurityIdNamePublisher(userSecurityId, packageName, packagePublisher)
    }

    /**
     * Finds the users who have installed the specified [Package](/uwp/api/windows.applicationmodel.package).
     * @remarks
     * This method requires administrative privileges.
     * @param {HSTRING} packageFullName The full name of the package. This parameter cannot be **null**.
     * @returns {IIterable<PackageUserInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findusers
     */
    FindUsers(packageFullName) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.FindUsers(packageFullName)
    }

    /**
     * Sets the state of a [Package](/uwp/api/windows.applicationmodel.package), for example, to usable, tampered with, and so on.
     * @remarks
     * When SetPackageState is used with a [PackageState](packagestate.md) of **Tampered**, all processes that are part of the package are terminated. If the package is a framework package, all processes for all packages that depend on the framework are also terminated. This method requires administrative privileges
     * <!--[jjacks - WinBlue bug 492738 directed to remove because the info is not to be public] and the package state is stored under HKLM\Software\\Microsoft\\Windows\\CurrentVersion\\AppModel\\StateChange\\PackageList. It can be set for one user or across all users.-->
     * and alters the status for all users.
     * @param {HSTRING} packageFullName The full name of the package.
     * @param {Integer} packageState_ One of the enumeration values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.setpackagestate
     */
    SetPackageState(packageFullName, packageState_) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.SetPackageState(packageFullName, packageState_)
    }

    /**
     * Retrieves information about the specified [Package](/uwp/api/windows.applicationmodel.package) installed for any user.
     * @remarks
     * This method requires administrative privileges. The returned package may be installed for the current user or for another user.
     * @param {HSTRING} packageFullName The full name of the package. This parameter cannot be null.
     * @returns {Package} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackage
     */
    FindPackageByPackageFullName(packageFullName) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.FindPackageByPackageFullName(packageFullName)
    }

    /**
     * Cleans up a specified [Package](/uwp/api/windows.applicationmodel.package) for a specified user. Used to cleanup packages installed for a user after their user profile is deleted.
     * @remarks
     * The app binaries are not cleaned up unless the app is installed for has no other users. This method does not clear the registration of the app from the user's profile. Before you call this method, be sure that the user's profile is deleted. If the user profile is not deleted and the user logs back to the profile, the profile may show traces of the app. There may also be broken file type associations and broken tile links for the app. The caller must have administrative privilege or the call fails. In addition, the policy to allow deployment operations in special profiles must be enabled. By default, this policy is disabled.
     * @param {HSTRING} packageName The package name.
     * @param {HSTRING} userSecurityId The user security identifier (SID).
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.cleanuppackageforuserasync
     */
    CleanupPackageForUserAsync(packageName, userSecurityId) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.CleanupPackageForUserAsync(packageName, userSecurityId)
    }

    /**
     * Finds all installed [Packages](/uwp/api/windows.applicationmodel.package) with the specified name and publisher.
     * @remarks
     * This method requires administrative privileges.
     * @param {HSTRING} packageFamilyName 
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackages
     */
    FindPackagesByPackageFamilyName(packageFamilyName) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.FindPackagesByPackageFamilyName(packageFamilyName)
    }

    /**
     * Retrieves information about all [Packages](/uwp/api/windows.applicationmodel.package) with the specified package name and publisher name, installed for a specific user.
     * @param {HSTRING} userSecurityId The user security identifier (SID). If this parameter is an empty string (""), the packages are retrieved for the current user.
     * @param {HSTRING} packageFamilyName 
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackagesforuser
     */
    FindPackagesByUserSecurityIdPackageFamilyName(userSecurityId, packageFamilyName) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.FindPackagesByUserSecurityIdPackageFamilyName(userSecurityId, packageFamilyName)
    }

    /**
     * Retrieves information about a specific [Package](/uwp/api/windows.applicationmodel.package) installed for a specific user or for all users.
     * @remarks
     * This method requires administrative privileges if the user security ID specified is different from the user security ID of the calling user. Otherwise, an AccessDeniedException is thrown.
     * @param {HSTRING} userSecurityId The user security identifier (SID). If this parameter is string.Empty, the packages are retrieved for the current user.
     * @param {HSTRING} packageFullName The full name of the package.
     * @returns {Package} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackageforuser
     */
    FindPackageByUserSecurityIdPackageFullName(userSecurityId, packageFullName) {
        if (!this.HasProp("__IPackageManager")) {
            if ((queryResult := this.QueryInterface(IPackageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager := IPackageManager(outPtr)
        }

        return this.__IPackageManager.FindPackageByUserSecurityIdPackageFullName(userSecurityId, packageFullName)
    }

    /**
     * Removes a [Package](/uwp/api/windows.applicationmodel.package) for the current user asynchronously and receives progress and status messages on the removal operation. Dependency packages are also removed for the user if no other packages installed for the user depend on them.
     * @remarks
     * For a call to this method to be successful, the caller needs to fulfil one of these conditions:
     * 
     * * The caller is running in an AppContainer (Low IL) *and* it has the **packageManagement** restricted capability.
     * * The caller is running with Medium IL, or higher.
     * * The caller’s publisher matches the publisher of the package (or volume) being removed.
     * 
     * For descriptions of the terms above, and links to more info, see [Packaging, deployment, and process](/windows/apps/get-started/intro-pack-dep-proc).
     * 
     * This request can't be canceled. The package full name is an alternate form of the package identity that is shorter and is suitable for naming objects such as files and directories. A package identity is represented by the [Identity](/uwp/schemas/appxpackage/appxmanifestschema/element-identity) element of the package manifest. When a package is removed it is removed for the current user, which means that the package payload continues to exist if other users have installed the package, but it will not be accessible to the current user. If no other users have the specified package installed, its payload will be removed from the %ProgramFiles%\WindowsApps directory. Any app associated with the package that is being removed will be shutdown automatically as part of the package removal.
     * @param {HSTRING} packageFullName A string representation of the package identity to identify the package to be removed.
     * @param {Integer} removalOptions_ 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.removepackageasync
     */
    RemovePackageWithOptionsAsync(packageFullName, removalOptions_) {
        if (!this.HasProp("__IPackageManager2")) {
            if ((queryResult := this.QueryInterface(IPackageManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager2 := IPackageManager2(outPtr)
        }

        return this.__IPackageManager2.RemovePackageWithOptionsAsync(packageFullName, removalOptions_)
    }

    /**
     * Stages a [Package](/uwp/api/windows.applicationmodel.package) to the system without registering it.
     * @param {Uri} packageUri The source URI of the main package.
     * @param {IIterable<Uri>} dependencyPackageUris The source URIs of the dependency packages. If there are no dependency packages or dependency packages are already staged, this parameter can be null.
     * @param {Integer} deploymentOptions_ A bitwise combination of enumeration values from the [DeploymentOptions](deploymentoptions.md) enumeration. The resulting value specifies the package deployment options.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.stagepackageasync
     */
    StagePackageWithOptionsAsync(packageUri, dependencyPackageUris, deploymentOptions_) {
        if (!this.HasProp("__IPackageManager2")) {
            if ((queryResult := this.QueryInterface(IPackageManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager2 := IPackageManager2(outPtr)
        }

        return this.__IPackageManager2.StagePackageWithOptionsAsync(packageUri, dependencyPackageUris, deploymentOptions_)
    }

    /**
     * Registers a [Package](/uwp/api/windows.applicationmodel.package) (the main package) by its full name and its dependency packages for the current user.
     * @remarks
     * To hide specifics about the manifest of a bundle package, instead of calling [RegisterPackageAsync](/uwp/api/windows.management.deployment.packagemanager.registerpackageasync), you can call RegisterPackageByFullNameAsync to register a package by its full name. Bundle packages and regular packages are both referenced by the common package full name and thus registration by full name reduces the amount of domain knowledge required by the caller.
     * 
     * RegisterPackageByFullNameAsync can't install a package for any user other than the caller. The *dependencyPackageFullNames* can contain 0 elements if there aren't any dependency packages.
     * @param {HSTRING} mainPackageFullName A string that specifies the full name of the main package to be registered.
     * @param {IIterable<HSTRING>} dependencyPackageFullNames Strings that specify the full names of the dependency packages to be registered.
     * @param {Integer} deploymentOptions_ A [DeploymentOptions](deploymentoptions.md)-typed value that specifies the package deployment option.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.registerpackagebyfullnameasync
     */
    RegisterPackageByFullNameAsync(mainPackageFullName, dependencyPackageFullNames, deploymentOptions_) {
        if (!this.HasProp("__IPackageManager2")) {
            if ((queryResult := this.QueryInterface(IPackageManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager2 := IPackageManager2(outPtr)
        }

        return this.__IPackageManager2.RegisterPackageByFullNameAsync(mainPackageFullName, dependencyPackageFullNames, deploymentOptions_)
    }

    /**
     * Retrieves information about a specified family of [Packages](/uwp/api/windows.applicationmodel.package) and specific package types that are installed across all users.
     * @param {Integer} packageTypes_ A combination of [PackageTypes](packagetypes.md)-typed values that are combined by using a bitwise OR operation. The resulting value specifies the types of packages to be included in the result set.
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackageswithpackagetypes
     */
    FindPackagesWithPackageTypes(packageTypes_) {
        if (!this.HasProp("__IPackageManager2")) {
            if ((queryResult := this.QueryInterface(IPackageManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager2 := IPackageManager2(outPtr)
        }

        return this.__IPackageManager2.FindPackagesWithPackageTypes(packageTypes_)
    }

    /**
     * Retrieves information about a specified family of [Packages](/uwp/api/windows.applicationmodel.package) and of specific types that are installed for the specified user.
     * @param {HSTRING} userSecurityId The user security identifier (SID). If this parameter is **String.Empty**, the packages are retrieved for the current user. Any user SID other than that of current user requires administrative privileges.
     * @param {Integer} packageTypes_ A combination of [PackageTypes](packagetypes.md)-typed values that are combined by using a bitwise OR operation. The resulting value specifies the types of packages to be included in the result set.
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackagesforuserwithpackagetypes
     */
    FindPackagesByUserSecurityIdWithPackageTypes(userSecurityId, packageTypes_) {
        if (!this.HasProp("__IPackageManager2")) {
            if ((queryResult := this.QueryInterface(IPackageManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager2 := IPackageManager2(outPtr)
        }

        return this.__IPackageManager2.FindPackagesByUserSecurityIdWithPackageTypes(userSecurityId, packageTypes_)
    }

    /**
     * Retrieves information about specific [Package](/uwp/api/windows.applicationmodel.package) types that are installed across all users.
     * @remarks
     * This method and its overloads require administrative privileges.
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @param {Integer} packageTypes_ A combination of [PackageTypes](packagetypes.md)-typed values that are combined by using a bitwise OR operation. The resulting value specifies the types of packages to be included in the result set.
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackageswithpackagetypes
     */
    FindPackagesByNamePublisherWithPackageTypes(packageName, packagePublisher, packageTypes_) {
        if (!this.HasProp("__IPackageManager2")) {
            if ((queryResult := this.QueryInterface(IPackageManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager2 := IPackageManager2(outPtr)
        }

        return this.__IPackageManager2.FindPackagesByNamePublisherWithPackageTypes(packageName, packagePublisher, packageTypes_)
    }

    /**
     * Finds packages of specific types that are installed for the specified user.
     * @remarks
     * This method and its overloads require administrative privileges if the user SID specified is different from the user SID of the calling user. Otherwise, an **AccessDeniedException** is thrown.
     * @param {HSTRING} userSecurityId The user security identifier (SID). If this parameter is **null**, the packages are retrieved for the current user. Any user SID other than that of current user requires administrative privileges.
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @param {Integer} packageTypes_ A combination of [PackageTypes](packagetypes.md)-typed values that are combined by using a bitwise OR operation. The resulting value specifies the types of packages to be included in the result set.
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackagesforuserwithpackagetypes
     */
    FindPackagesByUserSecurityIdNamePublisherWithPackageTypes(userSecurityId, packageName, packagePublisher, packageTypes_) {
        if (!this.HasProp("__IPackageManager2")) {
            if ((queryResult := this.QueryInterface(IPackageManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager2 := IPackageManager2(outPtr)
        }

        return this.__IPackageManager2.FindPackagesByUserSecurityIdNamePublisherWithPackageTypes(userSecurityId, packageName, packagePublisher, packageTypes_)
    }

    /**
     * Finds all installed [Packages](/uwp/api/windows.applicationmodel.package) of specific types with the specified name and publisher.
     * @param {HSTRING} packageFamilyName 
     * @param {Integer} packageTypes_ A combination of [PackageTypes](packagetypes.md)-typed values that are combined by using a bitwise OR operation. The resulting value specifies the types of packages to be included in the result set.
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackageswithpackagetypes
     */
    FindPackagesByPackageFamilyNameWithPackageTypes(packageFamilyName, packageTypes_) {
        if (!this.HasProp("__IPackageManager2")) {
            if ((queryResult := this.QueryInterface(IPackageManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager2 := IPackageManager2(outPtr)
        }

        return this.__IPackageManager2.FindPackagesByPackageFamilyNameWithPackageTypes(packageFamilyName, packageTypes_)
    }

    /**
     * Retrieves information about [Packages](/uwp/api/windows.applicationmodel.package) of specific types with the specified package name and publisher name, installed for a specific user.
     * @param {HSTRING} userSecurityId The user security identifier (SID). If this parameter is **null**, the packages are retrieved for the current user. Any user SID other than that of current user requires administrative privileges.
     * @param {HSTRING} packageFamilyName 
     * @param {Integer} packageTypes_ A combination of [PackageTypes](packagetypes.md)-typed values that are combined by using a bitwise OR operation. The resulting value specifies the types of packages to be included in the result set.
     * @returns {IIterable<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackagesforuserwithpackagetypes
     */
    FindPackagesByUserSecurityIdPackageFamilyNameWithPackageTypes(userSecurityId, packageFamilyName, packageTypes_) {
        if (!this.HasProp("__IPackageManager2")) {
            if ((queryResult := this.QueryInterface(IPackageManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager2 := IPackageManager2(outPtr)
        }

        return this.__IPackageManager2.FindPackagesByUserSecurityIdPackageFamilyNameWithPackageTypes(userSecurityId, packageFamilyName, packageTypes_)
    }

    /**
     * Stages a [Package's](/uwp/api/windows.applicationmodel.package) roaming data to the system without registering the package. Call this method after staging the package but before registering the package for a particular user.
     * @param {HSTRING} packageFullName The full name of the package.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.stageuserdataasync
     */
    StageUserDataAsync(packageFullName) {
        if (!this.HasProp("__IPackageManager2")) {
            if ((queryResult := this.QueryInterface(IPackageManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager2 := IPackageManager2(outPtr)
        }

        return this.__IPackageManager2.StageUserDataAsync(packageFullName)
    }

    /**
     * Creates a new volume. The caller must be a member of the administrators group.
     * @param {HSTRING} packageStorePath The absolute path of the [Package](/uwp/api/windows.applicationmodel.package) store.
     * @returns {IAsyncOperation<PackageVolume>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.addpackagevolumeasync
     */
    AddPackageVolumeAsync(packageStorePath) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.AddPackageVolumeAsync(packageStorePath)
    }

    /**
     * Adds a [Package](/uwp/api/windows.applicationmodel.package) (the main package) and its dependency packages for the current user, using the specified deployment options.
     * @param {Uri} packageUri The Uri of the package to add. The URI must follow the file URI scheme (file://) since the only supported URI schemes are local file paths and local network paths.
     * @param {IIterable<Uri>} dependencyPackageUris The Uris of the dependency packages to add. If there are no dependency packages or if the dependency packages are already registered, this parameter can be null.
     * @param {Integer} deploymentOptions_ A bitwise combination of enumeration values from the [DeploymentOptions](deploymentoptions.md) enumeration. **ForceApplicationShutdown** and **None** are the only valid options for this method. Specifying any other option results in an E_INVALIDARG return value.
     * @param {PackageVolume} targetVolume 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.addpackageasync
     */
    AddPackageToVolumeAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.AddPackageToVolumeAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume)
    }

    /**
     * Clears the status of a [Package](/uwp/api/windows.applicationmodel.package).
     * @param {HSTRING} packageFullName The full name of the package.
     * @param {Integer} status_ One of the enumeration values that specifies the status to clear.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.clearpackagestatus
     */
    ClearPackageStatus(packageFullName, status_) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.ClearPackageStatus(packageFullName, status_)
    }

    /**
     * Registers a [Package](/uwp/api/windows.applicationmodel.package) (the main package) and its dependency packages for the current user, using the specified deployment options.
     * @param {Uri} manifestUri The Uri of the main package.
     * @param {IIterable<Uri>} dependencyPackageUris The Uris of the dependency packages.
     * @param {Integer} deploymentOptions_ A bitwise combination of enumeration values from the [DeploymentOptions](deploymentoptions.md) enumeration that specify deployment options.
     * @param {PackageVolume} appDataVolume 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.registerpackageasync
     */
    RegisterPackageWithAppDataVolumeAsync(manifestUri, dependencyPackageUris, deploymentOptions_, appDataVolume) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.RegisterPackageWithAppDataVolumeAsync(manifestUri, dependencyPackageUris, deploymentOptions_, appDataVolume)
    }

    /**
     * Gets the specified volume.
     * @param {HSTRING} volumeName The volume media ID, which is a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) value.
     * @returns {PackageVolume} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackagevolume
     */
    FindPackageVolumeByName(volumeName) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.FindPackageVolumeByName(volumeName)
    }

    /**
     * Gets all the known volumes, regardless of their current state.
     * @returns {IIterable<PackageVolume>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findpackagevolumes
     */
    FindPackageVolumes() {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.FindPackageVolumes()
    }

    /**
     * Gets the default [Package](/uwp/api/windows.applicationmodel.package) volume, which is the target of deployment operations such as the [AddPackageAsync](/uwp/api/windows.management.deployment.packagemanager.addpackageasync) method.
     * @returns {PackageVolume} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.getdefaultpackagevolume
     */
    GetDefaultPackageVolume() {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.GetDefaultPackageVolume()
    }

    /**
     * Moves the specified [Package](/uwp/api/windows.applicationmodel.package) to the specified volume using the specified deployment options.
     * @remarks
     * This method lets the caller move a package from one logical volume to another.
     * @param {HSTRING} packageFullName The full name of the package to move.
     * @param {Integer} deploymentOptions_ One of the enumeration values that specifies a deployment option.
     * @param {PackageVolume} targetVolume The target volume.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.movepackagetovolumeasync
     */
    MovePackageToVolumeAsync(packageFullName, deploymentOptions_, targetVolume) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.MovePackageToVolumeAsync(packageFullName, deploymentOptions_, targetVolume)
    }

    /**
     * Removes the specified volume.
     * @remarks
     * For a call to this method to be successful, the caller needs to fulfil one of these conditions:
     * 
     * * The caller is running in an AppContainer (Low IL) *and* it has the **packageManagement** restricted capability.
     * * The caller is running with Medium IL, or higher.
     * * The caller’s publisher matches the publisher of the package (or volume) being removed.
     * 
     * For descriptions of the terms above, and links to more info, see [Packaging, deployment, and process](/windows/apps/get-started/intro-pack-dep-proc).
     * @param {PackageVolume} volume The volume to remove.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.removepackagevolumeasync
     */
    RemovePackageVolumeAsync(volume) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.RemovePackageVolumeAsync(volume)
    }

    /**
     * Sets the default [Package](/uwp/api/windows.applicationmodel.package) volume, which is the target of deployment operations such as the [AddPackageAsync](/uwp/api/windows.management.deployment.packagemanager.addpackageasync) method.
     * @param {PackageVolume} volume The default package volume, which is the target of deployment operations such as the [AddPackageAsync](/uwp/api/windows.management.deployment.packagemanager.addpackageasync) method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.setdefaultpackagevolume
     */
    SetDefaultPackageVolume(volume) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.SetDefaultPackageVolume(volume)
    }

    /**
     * Sets the status of the specified [Package](/uwp/api/windows.applicationmodel.package).
     * @param {HSTRING} packageFullName The full name of the package.
     * @param {Integer} status_ One of the enumeration values that describes the status of the package.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.setpackagestatus
     */
    SetPackageStatus(packageFullName, status_) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.SetPackageStatus(packageFullName, status_)
    }

    /**
     * Sets the specified volume to an offline state. The caller must be a member of the administrators group.
     * @param {PackageVolume} packageVolume_ The volume to take offline.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.setpackagevolumeofflineasync
     */
    SetPackageVolumeOfflineAsync(packageVolume_) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.SetPackageVolumeOfflineAsync(packageVolume_)
    }

    /**
     * Sets the specified volume to an online state. The caller must be a member of the administrators group.
     * @param {PackageVolume} packageVolume_ The volume to bring online.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.setpackagevolumeonlineasync
     */
    SetPackageVolumeOnlineAsync(packageVolume_) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.SetPackageVolumeOnlineAsync(packageVolume_)
    }

    /**
     * Stages a [Package](/uwp/api/windows.applicationmodel.package) to the system without registering it.
     * @remarks
     * The stage operation will extract the package payload to disk under %ProgramFiles%\WindowsApps.
     * @param {Uri} packageUri The source URI of the main package.
     * @param {IIterable<Uri>} dependencyPackageUris The source URIs of the dependency packages. If there are no dependency packages or dependency packages are already staged, this parameter can be null.
     * @param {Integer} deploymentOptions_ 
     * @param {PackageVolume} targetVolume 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.stagepackageasync
     */
    StagePackageToVolumeAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.StagePackageToVolumeAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume)
    }

    /**
     * Stages a [Package's](/uwp/api/windows.applicationmodel.package) roaming data to the system without registering the package. Call this method after staging the package but before registering the package for a particular user.
     * @param {HSTRING} packageFullName The full name of the package.
     * @param {Integer} deploymentOptions_ 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.stageuserdataasync
     */
    StageUserDataWithOptionsAsync(packageFullName, deploymentOptions_) {
        if (!this.HasProp("__IPackageManager3")) {
            if ((queryResult := this.QueryInterface(IPackageManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager3 := IPackageManager3(outPtr)
        }

        return this.__IPackageManager3.StageUserDataWithOptionsAsync(packageFullName, deploymentOptions_)
    }

    /**
     * Gets the [Package](/uwp/api/windows.applicationmodel.package) volumes on the device.
     * @returns {IAsyncOperation<IVectorView<PackageVolume>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.getpackagevolumesasync
     */
    GetPackageVolumesAsync() {
        if (!this.HasProp("__IPackageManager4")) {
            if ((queryResult := this.QueryInterface(IPackageManager4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager4 := IPackageManager4(outPtr)
        }

        return this.__IPackageManager4.GetPackageVolumesAsync()
    }

    /**
     * Adds a [Package](/uwp/api/windows.applicationmodel.package) (the main package) and its dependency packages for the current user, using the specified deployment options.
     * @param {Uri} packageUri The URI of the package to add. The URI must follow the file URI scheme (file://) since the only supported URI schemes are local file paths and local network paths.
     * @param {IIterable<Uri>} dependencyPackageUris The URIs of framework dependencies to add. If there are no dependency packages or if the dependency packages are already registered, this parameter can be null.
     * @param {Integer} deploymentOptions_ 
     * @param {PackageVolume} targetVolume The volume to which the package is added.
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames The package family names from the main bundle to be registered.
     * @param {IIterable<Uri>} externalPackageUris 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.addpackageasync
     */
    AddPackageToVolumeAndOptionalPackagesAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume, optionalPackageFamilyNames, externalPackageUris) {
        if (!this.HasProp("__IPackageManager5")) {
            if ((queryResult := this.QueryInterface(IPackageManager5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager5 := IPackageManager5(outPtr)
        }

        return this.__IPackageManager5.AddPackageToVolumeAndOptionalPackagesAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume, optionalPackageFamilyNames, externalPackageUris)
    }

    /**
     * Stages a [Package](/uwp/api/windows.applicationmodel.package) to the system without registering it.
     * @param {Uri} packageUri The source URI of the main package.
     * @param {IIterable<Uri>} dependencyPackageUris The URIs of framework dependencies to add. If there are no dependency packages or if the dependency packages are already registered, this parameter can be null.
     * @param {Integer} deploymentOptions_ 
     * @param {PackageVolume} targetVolume The volume to which the package is added.
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames The package family names from the main bundle to be staged.
     * @param {IIterable<Uri>} externalPackageUris 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.stagepackageasync
     */
    StagePackageToVolumeAndOptionalPackagesAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume, optionalPackageFamilyNames, externalPackageUris) {
        if (!this.HasProp("__IPackageManager5")) {
            if ((queryResult := this.QueryInterface(IPackageManager5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager5 := IPackageManager5(outPtr)
        }

        return this.__IPackageManager5.StagePackageToVolumeAndOptionalPackagesAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume, optionalPackageFamilyNames, externalPackageUris)
    }

    /**
     * Registers a [Package](/uwp/api/windows.applicationmodel.package) (the main package) by its family name and its dependency packages for the current user.
     * @param {HSTRING} mainPackageFamilyName A string that specifies the family name of the main package to be registered.
     * @param {IIterable<HSTRING>} dependencyPackageFamilyNames Strings that specify the family names of the dependency packages to be registered.
     * @param {Integer} deploymentOptions_ A [DeploymentOptions](deploymentoptions.md)-typed value that specifies the package deployment option.
     * @param {PackageVolume} appDataVolume The package volume to store that app data on.
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames Strings that specify the optional package family names from the main bundle to be registered.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.registerpackagebyfamilynameasync
     */
    RegisterPackageByFamilyNameAndOptionalPackagesAsync(mainPackageFamilyName, dependencyPackageFamilyNames, deploymentOptions_, appDataVolume, optionalPackageFamilyNames) {
        if (!this.HasProp("__IPackageManager5")) {
            if ((queryResult := this.QueryInterface(IPackageManager5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager5 := IPackageManager5(outPtr)
        }

        return this.__IPackageManager5.RegisterPackageByFamilyNameAndOptionalPackagesAsync(mainPackageFamilyName, dependencyPackageFamilyNames, deploymentOptions_, appDataVolume, optionalPackageFamilyNames)
    }

    /**
     * 
     * @returns {PackageManagerDebugSettings} 
     */
    get_DebugSettings() {
        if (!this.HasProp("__IPackageManager5")) {
            if ((queryResult := this.QueryInterface(IPackageManager5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager5 := IPackageManager5(outPtr)
        }

        return this.__IPackageManager5.get_DebugSettings()
    }

    /**
     * Enables an app [Package](/uwp/api/windows.applicationmodel.package) to be installed for all users on a device, including options for specifying additional optional packages to be installed.
     * @remarks
     * The caller of this method must have administrator privilege. The app package to be provisioned must be staged, and it must be on the system volume.
     * 
     * If the package is already provisioned, this performs a "clean" reprovision. A "clean" reprovision will remove all previous installs of this package so the package will behave as if this were its first installation.
     * @param {HSTRING} packageFamilyName 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.provisionpackageforallusersasync
     */
    ProvisionPackageForAllUsersAsync(packageFamilyName) {
        if (!this.HasProp("__IPackageManager6")) {
            if ((queryResult := this.QueryInterface(IPackageManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager6 := IPackageManager6(outPtr)
        }

        return this.__IPackageManager6.ProvisionPackageForAllUsersAsync(packageFamilyName)
    }

    /**
     * Allows single or multiple app [Packages](/uwp/api/windows.applicationmodel.package) to be installed with an .appinstaller file.
     * @remarks
     * This method is not supported in JavaScript. However, you can create a Windows Runtime component that calls this method and then call this component from a JavaScript UWP app. For more information, see [App Installer file API issues](/windows/msix/app-installer/app-installer-api-issues).
     * @param {Uri} appInstallerFileUri A Uri to the .appinstaller file.
     * @param {Integer} options The options as specified in [AddPackageByAppInstallerOptions](addpackagebyappinstalleroptions.md).
     * @param {PackageVolume} targetVolume The volume that the package is installed to.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.addpackagebyappinstallerfileasync
     */
    AddPackageByAppInstallerFileAsync(appInstallerFileUri, options, targetVolume) {
        if (!this.HasProp("__IPackageManager6")) {
            if ((queryResult := this.QueryInterface(IPackageManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager6 := IPackageManager6(outPtr)
        }

        return this.__IPackageManager6.AddPackageByAppInstallerFileAsync(appInstallerFileUri, options, targetVolume)
    }

    /**
     * Allows single or multiple app [Packages](/uwp/api/windows.applicationmodel.package) to be installed with an .appinstaller file. This will perform a SmartScreen filter and user verification before installing the app package(s).
     * @remarks
     * This method is identical to [AddPackageByAppInstallerAsync](packagemanager_addpackagebyappinstallerfileasync_1097728195.md) except this uses the SmartScreen filter.
     * 
     * This method is not supported in JavaScript. However, you can create a Windows Runtime component that calls this method and then call this component from a JavaScript UWP app. For more information, see [App Installer file API issues](/windows/msix/app-installer/app-installer-api-issues).
     * @param {Uri} appInstallerFileUri A Uri to the .appinstaller file.
     * @param {Integer} options The options as specified in [AddPackageByAppInstallerOptions](addpackagebyappinstalleroptions.md).
     * @param {PackageVolume} targetVolume The volume that the package is installed to.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.requestaddpackagebyappinstallerfileasync
     */
    RequestAddPackageByAppInstallerFileAsync(appInstallerFileUri, options, targetVolume) {
        if (!this.HasProp("__IPackageManager6")) {
            if ((queryResult := this.QueryInterface(IPackageManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager6 := IPackageManager6(outPtr)
        }

        return this.__IPackageManager6.RequestAddPackageByAppInstallerFileAsync(appInstallerFileUri, options, targetVolume)
    }

    /**
     * Adds a [Package](/uwp/api/windows.applicationmodel.package) (the main package) and its dependency packages for the current user, using the specified deployment options.
     * @param {Uri} packageUri The Uri of the package to add. The URI must follow the file URI scheme (file://) since the only supported URI schemes are local file paths and local network paths.
     * @param {IIterable<Uri>} dependencyPackageUris The Uris of the dependency packages to add. If there are no dependency packages or if the dependency packages are already registered, this parameter can be null.
     * @param {Integer} options 
     * @param {PackageVolume} targetVolume 
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames 
     * @param {IIterable<Uri>} packageUrisToInstall 
     * @param {IIterable<Uri>} relatedPackageUris 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.addpackageasync
     */
    AddPackageToVolumeAndRelatedSetAsync(packageUri, dependencyPackageUris, options, targetVolume, optionalPackageFamilyNames, packageUrisToInstall, relatedPackageUris) {
        if (!this.HasProp("__IPackageManager6")) {
            if ((queryResult := this.QueryInterface(IPackageManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager6 := IPackageManager6(outPtr)
        }

        return this.__IPackageManager6.AddPackageToVolumeAndRelatedSetAsync(packageUri, dependencyPackageUris, options, targetVolume, optionalPackageFamilyNames, packageUrisToInstall, relatedPackageUris)
    }

    /**
     * Stages a [Package](/uwp/api/windows.applicationmodel.package) to the system without registering it.
     * @remarks
     * The stage operation will extract the package payload to disk under %ProgramFiles%\WindowsApps.
     * @param {Uri} packageUri The source URI of the main package.
     * @param {IIterable<Uri>} dependencyPackageUris The source URIs of the dependency packages. If there are no dependency packages or dependency packages are already staged, this parameter can be null.
     * @param {Integer} options 
     * @param {PackageVolume} targetVolume 
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames 
     * @param {IIterable<Uri>} packageUrisToInstall 
     * @param {IIterable<Uri>} relatedPackageUris 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.stagepackageasync
     */
    StagePackageToVolumeAndRelatedSetAsync(packageUri, dependencyPackageUris, options, targetVolume, optionalPackageFamilyNames, packageUrisToInstall, relatedPackageUris) {
        if (!this.HasProp("__IPackageManager6")) {
            if ((queryResult := this.QueryInterface(IPackageManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager6 := IPackageManager6(outPtr)
        }

        return this.__IPackageManager6.StagePackageToVolumeAndRelatedSetAsync(packageUri, dependencyPackageUris, options, targetVolume, optionalPackageFamilyNames, packageUrisToInstall, relatedPackageUris)
    }

    /**
     * Requests a SmartScreen check and user verification before installing the app [Package(s)](/uwp/api/windows.applicationmodel.package). This method provides a **packageUrisToInstall** overload to specify external packages to be staged and registered.
     * @param {Uri} packageUri The URI of the package to add. The URI must follow the file URI scheme (file://) since the only supported URI schemes are local file paths and local network paths.
     * @param {IIterable<Uri>} dependencyPackageUris The URIs of the dependency packages to add. If there are no dependency packages or if the dependency packages are already registered, this parameter can be null.
     * @param {Integer} deploymentOptions_ A valid enumeration value from the [DeploymentOptions](deploymentoptions.md) enumeration.
     * @param {PackageVolume} targetVolume The volume that the package is installed to.
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames Strings that specify the optional package family names from the main bundle to be staged and registered.
     * @param {IIterable<Uri>} relatedPackageUris The URIs of additional packages in the main bundle that should be staged and registered.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.requestaddpackageasync
     */
    RequestAddPackageAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume, optionalPackageFamilyNames, relatedPackageUris) {
        if (!this.HasProp("__IPackageManager6")) {
            if ((queryResult := this.QueryInterface(IPackageManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager6 := IPackageManager6(outPtr)
        }

        return this.__IPackageManager6.RequestAddPackageAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume, optionalPackageFamilyNames, relatedPackageUris)
    }

    /**
     * Requests a SmartScreen check and user verification before installing the app [Package(s)](/uwp/api/windows.applicationmodel.package).
     * @param {Uri} packageUri The URI of the package to add. The URI must follow the file URI scheme (file://) since the only supported URI schemes are local file paths and local network paths.
     * @param {IIterable<Uri>} dependencyPackageUris The URIs of the dependency packages to add. If there are no dependency packages or if the dependency packages are already registered, this parameter can be null.
     * @param {Integer} deploymentOptions_ A valid enumeration value from the [DeploymentOptions](deploymentoptions.md) enumeration.
     * @param {PackageVolume} targetVolume The volume that the package is installed to.
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames Strings that specify the optional package family names from the main bundle to be staged and registered.
     * @param {IIterable<Uri>} relatedPackageUris The URIs of additional packages in the main bundle that should be staged and registered.
     * @param {IIterable<Uri>} packageUrisToInstall 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.requestaddpackageasync
     */
    RequestAddPackageAndRelatedSetAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume, optionalPackageFamilyNames, relatedPackageUris, packageUrisToInstall) {
        if (!this.HasProp("__IPackageManager7")) {
            if ((queryResult := this.QueryInterface(IPackageManager7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager7 := IPackageManager7(outPtr)
        }

        return this.__IPackageManager7.RequestAddPackageAndRelatedSetAsync(packageUri, dependencyPackageUris, deploymentOptions_, targetVolume, optionalPackageFamilyNames, relatedPackageUris, packageUrisToInstall)
    }

    /**
     * Deprovisions an app [Package](/uwp/api/windows.applicationmodel.package) so new users on the device will no longer have the app automatically installed.
     * @remarks
     * The caller of this method must have administrator privilege.
     * @param {HSTRING} packageFamilyName The package family name of the package to be deprovisioned.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.deprovisionpackageforallusersasync
     */
    DeprovisionPackageForAllUsersAsync(packageFamilyName) {
        if (!this.HasProp("__IPackageManager8")) {
            if ((queryResult := this.QueryInterface(IPackageManager8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager8 := IPackageManager8(outPtr)
        }

        return this.__IPackageManager8.DeprovisionPackageForAllUsersAsync(packageFamilyName)
    }

    /**
     * Gets the list of all installed [Packages](/uwp/api/windows.applicationmodel.package) on the device.
     * @remarks
     * The caller of this method must have administrator privilege.
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.findprovisionedpackages
     */
    FindProvisionedPackages() {
        if (!this.HasProp("__IPackageManager9")) {
            if ((queryResult := this.QueryInterface(IPackageManager9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager9 := IPackageManager9(outPtr)
        }

        return this.__IPackageManager9.FindProvisionedPackages()
    }

    /**
     * Adds a [Package](/uwp/api/windows.applicationmodel.package) (the main package) and any additional dependency packages, for the current user, using the specified deployment options.
     * @remarks
     * This method simplifies the existing [AddPackageAsync](/uwp/api/windows.management.deployment.packagemanager.addpackageasync) overloads by consolidating all of the deployment options into a single parameter. This method also supports the following features not available with the the [AddPackageAsync](/uwp/api/windows.management.deployment.packagemanager.addpackageasync) overloads:
     * 
     * * You can use the [ExternalLocationURI](addpackageoptions_externallocationuri.md) property of the *options* parameter to specify the URI of an external disk location outside of the MSIX package where the package manifest can reference application content. For more information about this scenario and a related code sample, see [Grant package identity by packaging with external location](/windows/apps/desktop/modernize/grant-identity-to-nonpackaged-apps).
     * 
     * * You can use the [AllowUnsigned](addpackageoptions_allowunsigned.md) property of the *options* parameter to allow activation information from an executable in an unsigned package. For more information about this scenario and a related code sample, see [Hosted apps](/windows/uwp/launch-resume/hosted-apps).
     * @param {Uri} packageUri The URI of the package to add. The URI can use the file URI scheme (file://) for local file paths and local network paths. HTTP and HTTPS protocols are also supported. Starting with Windows build 22556, The URI can point to a package or an App Installer file.
     * @param {AddPackageOptions} options The package deployment options for the operation.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.addpackagebyuriasync
     */
    AddPackageByUriAsync(packageUri, options) {
        if (!this.HasProp("__IPackageManager9")) {
            if ((queryResult := this.QueryInterface(IPackageManager9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager9 := IPackageManager9(outPtr)
        }

        return this.__IPackageManager9.AddPackageByUriAsync(packageUri, options)
    }

    /**
     * Stages a [Package](/uwp/api/windows.applicationmodel.package) to the system without registering it, using the specified deployment options.
     * @remarks
     * This method simplifies the existing [StagePackageAsync](/uwp/api/windows.management.deployment.packagemanager.stagepackageasync) overloads by consolidating all of the deployment options into a single parameter. This method also supports the following features not available with the the [StagePackageAsync](/uwp/api/windows.management.deployment.packagemanager.stagepackageasync) overloads:
     * 
     * * You can use the [ExternalLocationURI](stagepackageoptions_externallocationuri.md) property of the *options* parameter to specify the URI of an external disk location outside of the MSIX package where the package manifest can reference application content.
     * 
     * * You can use the [AllowUnsigned](stagepackageoptions_allowunsigned.md) property of the *options* parameter to allow activation information from an executable in an unsigned package.
     * @param {Uri} packageUri The source URI of the main package.
     * @param {StagePackageOptions} options The package deployment options for the operation.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.stagepackagebyuriasync
     */
    StagePackageByUriAsync(packageUri, options) {
        if (!this.HasProp("__IPackageManager9")) {
            if ((queryResult := this.QueryInterface(IPackageManager9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager9 := IPackageManager9(outPtr)
        }

        return this.__IPackageManager9.StagePackageByUriAsync(packageUri, options)
    }

    /**
     * Registers a [Package](/uwp/api/windows.applicationmodel.package) (the main package) and its dependency packages for the current user, using the specified deployment options.
     * @remarks
     * This method simplifies the existing [RegisterPackageAsync](/uwp/api/windows.management.deployment.packagemanager.registerpackageasync) overloads by consolidating all of the deployment options into a single parameter. This method also supports the following features not available with the the [RegisterPackageAsync](/uwp/api/windows.management.deployment.packagemanager.registerpackageasync) overloads:
     * 
     * * You can use the [ExternalLocationURI](registerpackageoptions_externallocationuri.md) property of the *options* parameter to specify the URI of an external disk location outside of the MSIX package where the package manifest can reference application content. For more information about this scenario and a related code sample, see [Grant package identity by packaging with external location](/windows/apps/desktop/modernize/grant-identity-to-nonpackaged-apps).
     * 
     * * You can use the [AllowUnsigned](registerpackageoptions_allowunsigned.md) property of the *options* parameter to allow activation information from an executable in an unsigned package. For more information about this scenario and a related code sample, see [Hosted apps](/windows/uwp/launch-resume/hosted-apps).
     * @param {Uri} manifestUri The URI of the manifest for the main package.
     * @param {RegisterPackageOptions} options The package registration options for the operation.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.registerpackagebyuriasync
     */
    RegisterPackageByUriAsync(manifestUri, options) {
        if (!this.HasProp("__IPackageManager9")) {
            if ((queryResult := this.QueryInterface(IPackageManager9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager9 := IPackageManager9(outPtr)
        }

        return this.__IPackageManager9.RegisterPackageByUriAsync(manifestUri, options)
    }

    /**
     * Registers the specified [Packages](/uwp/api/windows.applicationmodel.package) by their full name for the current user.
     * @param {IIterable<HSTRING>} packageFullNames The list of full names for the packages you want to register.
     * @param {RegisterPackageOptions} options The package registration options for the operation.
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.registerpackagesbyfullnameasync
     */
    RegisterPackagesByFullNameAsync(packageFullNames, options) {
        if (!this.HasProp("__IPackageManager9")) {
            if ((queryResult := this.QueryInterface(IPackageManager9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager9 := IPackageManager9(outPtr)
        }

        return this.__IPackageManager9.RegisterPackagesByFullNameAsync(packageFullNames, options)
    }

    /**
     * Sets a value that indicates whether the specified app [Package](/uwp/api/windows.applicationmodel.package) currently prefers to run as a full app or a stub app.
     * @remarks
     * > [!NOTE]
     * > The ability for an app to run as a stub is currently available only to certain apps that are built by Microsoft.
     * @param {HSTRING} packageFamilyName The family name of the app package to configure.
     * @param {Integer} useStub A value that indicates whether the specified app package currently prefers to run as a full app or a stub app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.setpackagestubpreference
     */
    SetPackageStubPreference(packageFamilyName, useStub) {
        if (!this.HasProp("__IPackageManager9")) {
            if ((queryResult := this.QueryInterface(IPackageManager9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager9 := IPackageManager9(outPtr)
        }

        return this.__IPackageManager9.SetPackageStubPreference(packageFamilyName, useStub)
    }

    /**
     * Gets a value that indicates whether the specified app [Package](/uwp/api/windows.applicationmodel.package) currently prefers to run as a full app or a stub app.
     * @remarks
     * > [!NOTE]
     * > The ability for an app to run as a stub is currently available only to certain apps that are built by Microsoft.
     * @param {HSTRING} packageFamilyName The family name of the app package to query.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.getpackagestubpreference
     */
    GetPackageStubPreference(packageFamilyName) {
        if (!this.HasProp("__IPackageManager9")) {
            if ((queryResult := this.QueryInterface(IPackageManager9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager9 := IPackageManager9(outPtr)
        }

        return this.__IPackageManager9.GetPackageStubPreference(packageFamilyName)
    }

    /**
     * Enables an app [Package](/uwp/api/windows.applicationmodel.package) to be installed for all users on a device.
     * @remarks
     * The caller of this method must have administrator privilege. The app package to be provisioned must be staged, and it must be on the system volume.
     * 
     * If the package is already provisioned, this performs a "clean" reprovision. A "clean" reprovision removes all previous installs of this package, so the package is re-offered to all users that might have previously removed it as if it were its first provision. This doesn't affect any users that currently have the package installed.
     * 
     * > [!NOTE]
     * > If you are provisioning optional packages, you must specify each optional package individually with its own method call. Starting with Windows Build 22000, you can use the overload of [ProvisionPackageForAllUsersAsync](packagemanager_provisionpackageforallusersasync_1152150951.md), to specify additional optional packages to install with a single call.
     * @param {HSTRING} mainPackageFamilyName 
     * @param {PackageAllUserProvisioningOptions} options 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.provisionpackageforallusersasync
     */
    ProvisionPackageForAllUsersWithOptionsAsync(mainPackageFamilyName, options) {
        if (!this.HasProp("__IPackageManager10")) {
            if ((queryResult := this.QueryInterface(IPackageManager10.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager10 := IPackageManager10(outPtr)
        }

        return this.__IPackageManager10.ProvisionPackageForAllUsersWithOptionsAsync(mainPackageFamilyName, options)
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @param {RemovePackageOptions} options 
     * @returns {IAsyncOperationWithProgress<DeploymentResult, DeploymentProgress>} 
     */
    RemovePackageByUriAsync(packageUri, options) {
        if (!this.HasProp("__IPackageManager11")) {
            if ((queryResult := this.QueryInterface(IPackageManager11.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager11 := IPackageManager11(outPtr)
        }

        return this.__IPackageManager11.RemovePackageByUriAsync(packageUri, options)
    }

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @returns {Boolean} 
     */
    IsPackageRemovalPending(packageFullName) {
        if (!this.HasProp("__IPackageManager12")) {
            if ((queryResult := this.QueryInterface(IPackageManager12.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager12 := IPackageManager12(outPtr)
        }

        return this.__IPackageManager12.IsPackageRemovalPending(packageFullName)
    }

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @param {HSTRING} userSecurityId 
     * @returns {Boolean} 
     */
    IsPackageRemovalPendingForUser(packageFullName, userSecurityId) {
        if (!this.HasProp("__IPackageManager12")) {
            if ((queryResult := this.QueryInterface(IPackageManager12.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager12 := IPackageManager12(outPtr)
        }

        return this.__IPackageManager12.IsPackageRemovalPendingForUser(packageFullName, userSecurityId)
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @returns {Boolean} 
     */
    IsPackageRemovalPendingByUri(packageUri) {
        if (!this.HasProp("__IPackageManager12")) {
            if ((queryResult := this.QueryInterface(IPackageManager12.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager12 := IPackageManager12(outPtr)
        }

        return this.__IPackageManager12.IsPackageRemovalPendingByUri(packageUri)
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @param {HSTRING} userSecurityId 
     * @returns {Boolean} 
     */
    IsPackageRemovalPendingByUriForUser(packageUri, userSecurityId) {
        if (!this.HasProp("__IPackageManager12")) {
            if ((queryResult := this.QueryInterface(IPackageManager12.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManager12 := IPackageManager12(outPtr)
        }

        return this.__IPackageManager12.IsPackageRemovalPendingByUriForUser(packageUri, userSecurityId)
    }

;@endregion Instance Methods
}
