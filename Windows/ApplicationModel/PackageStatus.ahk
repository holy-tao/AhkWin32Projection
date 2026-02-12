#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageStatus.ahk
#Include .\IPackageStatus2.ahk
#Include ..\..\Guid.ahk

/**
 * Provides the status of the package.
 * @remarks
 * Use the [Package.Status](package_status.md) property to get the PackageStatus. The [Package.Status](package_status.md) and all of the properties of the PackageStatus class are read-only, so you cannot change their values. To get updated information about the status of the package, access the [Package.Status](package_status.md) property again to get a new instance of the PackageStatus class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageStatus extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageStatus

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageStatus.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether the package is available.
     * @remarks
     * A package may be unavailable for multiple reasons. This property reflects a set of properties that you would otherwise have to query individually to determine if the package is unavailable. For example this property reflects whether one or more of [DataOffline](packagestatus_dataoffline.md), [Disabled](packagestatus_disabled.md), or [PackageOffline](packagestatus_packageoffline.md) is set.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.notavailable
     * @type {Boolean} 
     */
    NotAvailable {
        get => this.get_NotAvailable()
    }

    /**
     * Indicates whether the package is offline and cannot be used.
     * @remarks
     * A package is offline if any of the package's files are installed on a volume that is currently offline or cannot be accessed. For example, the package's files may have been installed on removable media that is no longer online.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.packageoffline
     * @type {Boolean} 
     */
    PackageOffline {
        get => this.get_PackageOffline()
    }

    /**
     * Indicates whether the data for the package is offline.
     * @remarks
     * One reason that the data could be offline is that it is stored on removable media that has been removed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.dataoffline
     * @type {Boolean} 
     */
    DataOffline {
        get => this.get_DataOffline()
    }

    /**
     * Indicates whether the package has been disabled.
     * @remarks
     * Disabled packages must be enabled before they can be used.
     * 
     * Packages are disabled by using [PackageManager.SetPackageStatus](../windows.management.deployment/packagemanager_setpackagestatus_823303881.md) and enabled by using [PackageManager.ClearPackageStatus](../windows.management.deployment/packagemanager_clearpackagestatus_2106290289.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.disabled
     * @type {Boolean} 
     */
    Disabled {
        get => this.get_Disabled()
    }

    /**
     * Indicates whether the package is unusable.
     * @remarks
     * This property reflects a set of properties that you would otherwise have to query individually to determine if the package is usable. For example this property reflects whether one or more of [NotAvailable](packagestatus_notavailable.md), [LicenseIssue](packagestatus_licenseissue.md), [Modified](packagestatus_modified.md), or [Tampered](packagestatus_tampered.md) are set.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.needsremediation
     * @type {Boolean} 
     */
    NeedsRemediation {
        get => this.get_NeedsRemediation()
    }

    /**
     * Indicates whether there is a problem with the license for this package.
     * @remarks
     * Examples of license problems include missing and expired licenses. License problems must be resolved before the package can be used.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.licenseissue
     * @type {Boolean} 
     */
    LicenseIssue {
        get => this.get_LicenseIssue()
    }

    /**
     * Indicates whether the package is missing files, system information, etc.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.modified
     * @type {Boolean} 
     */
    Modified {
        get => this.get_Modified()
    }

    /**
     * Indicates whether the package may have been tampered with.
     * @remarks
     * One reason a package may return **TRUE** for this property is if 3rd party anti-malware software flags the package as malware.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.tampered
     * @type {Boolean} 
     */
    Tampered {
        get => this.get_Tampered()
    }

    /**
     * Indicates whether this package depends on a package that can't be used.
     * @remarks
     * The issue with the package that this package depends on must be resolved before this package can be used.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.dependencyissue
     * @type {Boolean} 
     */
    DependencyIssue {
        get => this.get_DependencyIssue()
    }

    /**
     * Indicates whether the package is being serviced.
     * @remarks
     * This property reflects whether any of the reasons that a package may be serviced are currently true such as [DeploymentInProgress](packagestatus_deploymentinprogress.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.servicing
     * @type {Boolean} 
     */
    Servicing {
        get => this.get_Servicing()
    }

    /**
     * Indicates whether the package is being serviced.
     * @remarks
     * A package that is in the process of being updated is an example of a package being serviced.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.deploymentinprogress
     * @type {Boolean} 
     */
    DeploymentInProgress {
        get => this.get_DeploymentInProgress()
    }

    /**
     * Indicates whether the package is partially staged.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.ispartiallystaged
     * @type {Boolean} 
     */
    IsPartiallyStaged {
        get => this.get_IsPartiallyStaged()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates whether the package is in good condition and may be used.
     * @remarks
     * This property reflects a set of properties that you would otherwise have to query individually to determine if the package is in good condition and is usable. For example this property reflects whether [NotAvailable](packagestatus_notavailable.md), [LicenseIssue](packagestatus_licenseissue.md), [Modified](packagestatus_modified.md), [Tampered ](packagestatus_tampered.md) are not set.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatus.verifyisok
     */
    VerifyIsOK() {
        if (!this.HasProp("__IPackageStatus")) {
            if ((queryResult := this.QueryInterface(IPackageStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus := IPackageStatus(outPtr)
        }

        return this.__IPackageStatus.VerifyIsOK()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NotAvailable() {
        if (!this.HasProp("__IPackageStatus")) {
            if ((queryResult := this.QueryInterface(IPackageStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus := IPackageStatus(outPtr)
        }

        return this.__IPackageStatus.get_NotAvailable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PackageOffline() {
        if (!this.HasProp("__IPackageStatus")) {
            if ((queryResult := this.QueryInterface(IPackageStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus := IPackageStatus(outPtr)
        }

        return this.__IPackageStatus.get_PackageOffline()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DataOffline() {
        if (!this.HasProp("__IPackageStatus")) {
            if ((queryResult := this.QueryInterface(IPackageStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus := IPackageStatus(outPtr)
        }

        return this.__IPackageStatus.get_DataOffline()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Disabled() {
        if (!this.HasProp("__IPackageStatus")) {
            if ((queryResult := this.QueryInterface(IPackageStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus := IPackageStatus(outPtr)
        }

        return this.__IPackageStatus.get_Disabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NeedsRemediation() {
        if (!this.HasProp("__IPackageStatus")) {
            if ((queryResult := this.QueryInterface(IPackageStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus := IPackageStatus(outPtr)
        }

        return this.__IPackageStatus.get_NeedsRemediation()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LicenseIssue() {
        if (!this.HasProp("__IPackageStatus")) {
            if ((queryResult := this.QueryInterface(IPackageStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus := IPackageStatus(outPtr)
        }

        return this.__IPackageStatus.get_LicenseIssue()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Modified() {
        if (!this.HasProp("__IPackageStatus")) {
            if ((queryResult := this.QueryInterface(IPackageStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus := IPackageStatus(outPtr)
        }

        return this.__IPackageStatus.get_Modified()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Tampered() {
        if (!this.HasProp("__IPackageStatus")) {
            if ((queryResult := this.QueryInterface(IPackageStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus := IPackageStatus(outPtr)
        }

        return this.__IPackageStatus.get_Tampered()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DependencyIssue() {
        if (!this.HasProp("__IPackageStatus")) {
            if ((queryResult := this.QueryInterface(IPackageStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus := IPackageStatus(outPtr)
        }

        return this.__IPackageStatus.get_DependencyIssue()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Servicing() {
        if (!this.HasProp("__IPackageStatus")) {
            if ((queryResult := this.QueryInterface(IPackageStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus := IPackageStatus(outPtr)
        }

        return this.__IPackageStatus.get_Servicing()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeploymentInProgress() {
        if (!this.HasProp("__IPackageStatus")) {
            if ((queryResult := this.QueryInterface(IPackageStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus := IPackageStatus(outPtr)
        }

        return this.__IPackageStatus.get_DeploymentInProgress()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPartiallyStaged() {
        if (!this.HasProp("__IPackageStatus2")) {
            if ((queryResult := this.QueryInterface(IPackageStatus2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatus2 := IPackageStatus2(outPtr)
        }

        return this.__IPackageStatus2.get_IsPartiallyStaged()
    }

;@endregion Instance Methods
}
