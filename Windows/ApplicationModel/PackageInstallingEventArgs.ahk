#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageInstallingEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information about the app package that is being installed.
 * @remarks
 * This object is passed to [PackageCatalog.PackageInstalling event](packagecatalog_packageinstalling.md)
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageinstallingeventargs
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageInstallingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageInstallingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageInstallingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the id for the install operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageinstallingeventargs.activityid
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * Gets the package that is installing.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageinstallingeventargs.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Gets an approximation of the package's installation progress.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageinstallingeventargs.progress
     * @type {Float} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * Indicates whether the app package is done installing.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageinstallingeventargs.iscomplete
     * @type {Boolean} 
     */
    IsComplete {
        get => this.get_IsComplete()
    }

    /**
     * Gets the result of the package installation operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageinstallingeventargs.errorcode
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
        if (!this.HasProp("__IPackageInstallingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageInstallingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageInstallingEventArgs := IPackageInstallingEventArgs(outPtr)
        }

        return this.__IPackageInstallingEventArgs.get_ActivityId()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageInstallingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageInstallingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageInstallingEventArgs := IPackageInstallingEventArgs(outPtr)
        }

        return this.__IPackageInstallingEventArgs.get_Package()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Progress() {
        if (!this.HasProp("__IPackageInstallingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageInstallingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageInstallingEventArgs := IPackageInstallingEventArgs(outPtr)
        }

        return this.__IPackageInstallingEventArgs.get_Progress()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComplete() {
        if (!this.HasProp("__IPackageInstallingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageInstallingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageInstallingEventArgs := IPackageInstallingEventArgs(outPtr)
        }

        return this.__IPackageInstallingEventArgs.get_IsComplete()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IPackageInstallingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageInstallingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageInstallingEventArgs := IPackageInstallingEventArgs(outPtr)
        }

        return this.__IPackageInstallingEventArgs.get_ErrorCode()
    }

;@endregion Instance Methods
}
