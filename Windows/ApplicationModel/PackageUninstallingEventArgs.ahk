#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageUninstallingEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information about the app package that is being uninstalled.
 * @remarks
 * This object is passed to the app's package uninstalling event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageuninstallingeventargs
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageUninstallingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageUninstallingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageUninstallingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the id for the uninstall operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageuninstallingeventargs.activityid
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * Gets the package that is uninstalling.
     * @remarks
     * Certain members of this package object may not be available (such as [Package.InstalledLocation](package_installedlocation.md)) while the package is being uninstalled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageuninstallingeventargs.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Gets an approximation of the package's uninstall progress.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageuninstallingeventargs.progress
     * @type {Float} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * Indicates whether the app package is done uninstalling.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageuninstallingeventargs.iscomplete
     * @type {Boolean} 
     */
    IsComplete {
        get => this.get_IsComplete()
    }

    /**
     * Gets the result of the package uninstall operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageuninstallingeventargs.errorcode
     * @type {HRESULT} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ActivityId() {
        if (!this.HasProp("__IPackageUninstallingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageUninstallingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUninstallingEventArgs := IPackageUninstallingEventArgs(outPtr)
        }

        return this.__IPackageUninstallingEventArgs.get_ActivityId()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageUninstallingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageUninstallingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUninstallingEventArgs := IPackageUninstallingEventArgs(outPtr)
        }

        return this.__IPackageUninstallingEventArgs.get_Package()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Progress() {
        if (!this.HasProp("__IPackageUninstallingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageUninstallingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUninstallingEventArgs := IPackageUninstallingEventArgs(outPtr)
        }

        return this.__IPackageUninstallingEventArgs.get_Progress()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComplete() {
        if (!this.HasProp("__IPackageUninstallingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageUninstallingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUninstallingEventArgs := IPackageUninstallingEventArgs(outPtr)
        }

        return this.__IPackageUninstallingEventArgs.get_IsComplete()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IPackageUninstallingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageUninstallingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUninstallingEventArgs := IPackageUninstallingEventArgs(outPtr)
        }

        return this.__IPackageUninstallingEventArgs.get_ErrorCode()
    }

;@endregion Instance Methods
}
