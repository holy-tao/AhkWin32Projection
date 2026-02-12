#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageVolume.ahk
#Include .\IPackageVolume2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a [Package](/uwp/api/windows.applicationmodel.package) storage volume.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class PackageVolume extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageVolume

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageVolume.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Describes whether a volume is in an offline state.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.isoffline
     * @type {Boolean} 
     */
    IsOffline {
        get => this.get_IsOffline()
    }

    /**
     * Describes whether a volume is an internal system volume mapped to the %SYSTEMDRIVER% environment variable.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.issystemvolume
     * @type {Boolean} 
     */
    IsSystemVolume {
        get => this.get_IsSystemVolume()
    }

    /**
     * Gets the path of the last known volume mount point.
     * @remarks
     * This is a cached value. It may not represent the current state of the device or the volume.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.mountpoint
     * @type {HSTRING} 
     */
    MountPoint {
        get => this.get_MountPoint()
    }

    /**
     * Gets the media ID of the volume.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the absolute path for the [Package](/uwp/api/windows.applicationmodel.package) store on the volume.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.packagestorepath
     * @type {HSTRING} 
     */
    PackageStorePath {
        get => this.get_PackageStorePath()
    }

    /**
     * Gets a value that specifies whether the volume supports the creation of hard links in its file system.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.supportshardlinks
     * @type {Boolean} 
     */
    SupportsHardLinks {
        get => this.get_SupportsHardLinks()
    }

    /**
     * Gets a boolean that indicates if full-trust [Packages](/uwp/api/windows.applicationmodel.package) are supported.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.isfulltrustpackagesupported
     * @type {Boolean} 
     */
    IsFullTrustPackageSupported {
        get => this.get_IsFullTrustPackageSupported()
    }

    /**
     * Gets a boolean that indicates if APPX installing is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.isappxinstallsupported
     * @type {Boolean} 
     */
    IsAppxInstallSupported {
        get => this.get_IsAppxInstallSupported()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOffline() {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.get_IsOffline()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSystemVolume() {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.get_IsSystemVolume()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MountPoint() {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.get_MountPoint()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageStorePath() {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.get_PackageStorePath()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsHardLinks() {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.get_SupportsHardLinks()
    }

    /**
     * Gets a collection of info about all installed instances of the specified [Package](/uwp/api/windows.applicationmodel.package) for all registered users.
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackages
     */
    FindPackages() {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackages()
    }

    /**
     * Gets a collection of info about all installed instances of all [Packages](/uwp/api/windows.applicationmodel.package) for all registered users.
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackages
     */
    FindPackagesByNamePublisher(packageName, packagePublisher) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackagesByNamePublisher(packageName, packagePublisher)
    }

    /**
     * Gets a collection of info about all installed instances of the specified [Package](/uwp/api/windows.applicationmodel.package) from the specified publisher for all registered users.
     * @param {HSTRING} packageFamilyName 
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackages
     */
    FindPackagesByPackageFamilyName(packageFamilyName) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackagesByPackageFamilyName(packageFamilyName)
    }

    /**
     * Gets a collection of info about all installed instances of the specified [Package](/uwp/api/windows.applicationmodel.package) with the specified package types for all registered users.
     * @param {Integer} packageTypes_ A bitwise combination of the enumeration values that specifies the types of packages to return.
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackageswithpackagetypes
     */
    FindPackagesWithPackageTypes(packageTypes_) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackagesWithPackageTypes(packageTypes_)
    }

    /**
     * Gets a collection of info about all installed instances of all [Packages](/uwp/api/windows.applicationmodel.package) with the specified package types for all registered users.
     * @param {Integer} packageTypes_ A bitwise combination of the enumeration values that specifies the types of packages to return.
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackageswithpackagetypes
     */
    FindPackagesByNamePublisherWithPackagesTypes(packageTypes_, packageName, packagePublisher) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackagesByNamePublisherWithPackagesTypes(packageTypes_, packageName, packagePublisher)
    }

    /**
     * Gets a collection of info about all installed instances of the specified [Packages](/uwp/api/windows.applicationmodel.package) from the specified publisher with the specified package types for all registered users.
     * @param {Integer} packageTypes_ A bitwise combination of the enumeration values that specifies the types of packages to return.
     * @param {HSTRING} packageFamilyName 
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackageswithpackagetypes
     */
    FindPackagesByPackageFamilyNameWithPackageTypes(packageTypes_, packageFamilyName) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackagesByPackageFamilyNameWithPackageTypes(packageTypes_, packageFamilyName)
    }

    /**
     * Gets a collection of info about all installed instances of the specified [Package](/uwp/api/windows.applicationmodel.package) for all registered users.
     * @param {HSTRING} packageFullName The full name of the package.
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackage
     */
    FindPackageByPackageFullName(packageFullName) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackageByPackageFullName(packageFullName)
    }

    /**
     * Gets a collection of info about all installed instances of the specified [Package](/uwp/api/windows.applicationmodel.package) for the specified user or users.
     * @param {HSTRING} userSecurityId The security identifier (SID) of the user or users. An empty string denotes the current user. The Everyone SID (S-1-1-0) denotes all users. Any SID other than that of the current user requires administrative privileges.
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackagesforuser
     */
    FindPackagesByUserSecurityId(userSecurityId) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackagesByUserSecurityId(userSecurityId)
    }

    /**
     * Gets a collection of info about all installed instances of all [Package](/uwp/api/windows.applicationmodel.package) for the specified user or users.
     * @param {HSTRING} userSecurityId The security identifier (SID) of the user or users. An empty string denotes the current user. The Everyone SID (S-1-1-0) denotes all users. Any SID other than that of the current user requires administrative privileges.
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackagesforuser
     */
    FindPackagesByUserSecurityIdNamePublisher(userSecurityId, packageName, packagePublisher) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackagesByUserSecurityIdNamePublisher(userSecurityId, packageName, packagePublisher)
    }

    /**
     * Gets a collection of info about all installed instances of the specified [Package](/uwp/api/windows.applicationmodel.package) from the specified publisher for the specified user or users.
     * @param {HSTRING} userSecurityId The security identifier (SID) of the user or users. An empty string denotes the current user. The Everyone SID (S-1-1-0) denotes all users. Any SID other than that of the current user requires administrative privileges.
     * @param {HSTRING} packageFamilyName 
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackagesforuser
     */
    FindPackagesByUserSecurityIdPackageFamilyName(userSecurityId, packageFamilyName) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackagesByUserSecurityIdPackageFamilyName(userSecurityId, packageFamilyName)
    }

    /**
     * Gets a collection of info about all installed instances of the specified [Package](/uwp/api/windows.applicationmodel.package) for the specified user or users and with the specified package types.
     * @param {HSTRING} userSecurityId The security identifier (SID) of the user or users. An empty string denotes the current user. The Everyone SID (S-1-1-0) denotes all users. Any SID other than that of the current user requires administrative privileges.
     * @param {Integer} packageTypes_ A bitwise combination of the enumeration values that specifies the types of packages to return.
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackagesforuserwithpackagetypes
     */
    FindPackagesByUserSecurityIdWithPackageTypes(userSecurityId, packageTypes_) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackagesByUserSecurityIdWithPackageTypes(userSecurityId, packageTypes_)
    }

    /**
     * Gets a collection of info about all installed instances of all [Packages](/uwp/api/windows.applicationmodel.package) for the specified user or users and with the specified package types.
     * @param {HSTRING} userSecurityId The security identifier (SID) of the user or users. An empty string denotes the current user. The Everyone SID (S-1-1-0) denotes all users. Any SID other than that of the current user requires administrative privileges.
     * @param {Integer} packageTypes_ A bitwise combination of the enumeration values that specifies the types of packages to return.
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackagesforuserwithpackagetypes
     */
    FindPackagesByUserSecurityIdNamePublisherWithPackageTypes(userSecurityId, packageTypes_, packageName, packagePublisher) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackagesByUserSecurityIdNamePublisherWithPackageTypes(userSecurityId, packageTypes_, packageName, packagePublisher)
    }

    /**
     * Gets a collection of info about all installed instances of the specified [Package](/uwp/api/windows.applicationmodel.package) for the specified user or users and with the specified package types.
     * @param {HSTRING} userSecurityId The security identifier (SID) of the user or users. An empty string denotes the current user. The Everyone SID (S-1-1-0) denotes all users. Any SID other than that of the current user requires administrative privileges.
     * @param {Integer} packageTypes_ A bitwise combination of the enumeration values that specifies the types of packages to return.
     * @param {HSTRING} packageFamilyName 
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackagesforuserwithpackagetypes
     */
    FindPackagesByUserSecurityIdPackageFamilyNameWithPackagesTypes(userSecurityId, packageTypes_, packageFamilyName) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackagesByUserSecurityIdPackageFamilyNameWithPackagesTypes(userSecurityId, packageTypes_, packageFamilyName)
    }

    /**
     * Gets a collection of info about the installed instances of the specified [Package](/uwp/api/windows.applicationmodel.package) for the specified user or users.
     * @param {HSTRING} userSecurityId The security identifier (SID) of the user or users. An empty string denotes the current user. The Everyone SID (S-1-1-0) denotes all users. Any SID other than that of the current user requires administrative privileges.
     * @param {HSTRING} packageFullName The full name of the package.
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.findpackageforuser
     */
    FindPackageByUserSecurityIdPackageFullName(userSecurityId, packageFullName) {
        if (!this.HasProp("__IPackageVolume")) {
            if ((queryResult := this.QueryInterface(IPackageVolume.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume := IPackageVolume(outPtr)
        }

        return this.__IPackageVolume.FindPackageByUserSecurityIdPackageFullName(userSecurityId, packageFullName)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullTrustPackageSupported() {
        if (!this.HasProp("__IPackageVolume2")) {
            if ((queryResult := this.QueryInterface(IPackageVolume2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume2 := IPackageVolume2(outPtr)
        }

        return this.__IPackageVolume2.get_IsFullTrustPackageSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAppxInstallSupported() {
        if (!this.HasProp("__IPackageVolume2")) {
            if ((queryResult := this.QueryInterface(IPackageVolume2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume2 := IPackageVolume2(outPtr)
        }

        return this.__IPackageVolume2.get_IsAppxInstallSupported()
    }

    /**
     * Gets the available space.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagevolume.getavailablespaceasync
     */
    GetAvailableSpaceAsync() {
        if (!this.HasProp("__IPackageVolume2")) {
            if ((queryResult := this.QueryInterface(IPackageVolume2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageVolume2 := IPackageVolume2(outPtr)
        }

        return this.__IPackageVolume2.GetAvailableSpaceAsync()
    }

;@endregion Instance Methods
}
