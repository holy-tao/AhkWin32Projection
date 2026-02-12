#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageStagingEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information about the app package that is being staged.
 * @remarks
 * An app package is staged when it is added to the device but is not yet registered.
 * 
 * Apps only receive package events for itself or its related packages such as optional packages.
 * 
 * This object is passed to the [PackageCatalog.PackageStaging event](packagecatalog_packagestaging.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestagingeventargs
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageStagingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageStagingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageStagingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the id for the staging operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestagingeventargs.activityid
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * Gets the package that is staging.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestagingeventargs.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Gets an approximation of the package's staging progress.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestagingeventargs.progress
     * @type {Float} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * Indicates whether the app package is done staging.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestagingeventargs.iscomplete
     * @type {Boolean} 
     */
    IsComplete {
        get => this.get_IsComplete()
    }

    /**
     * Gets the result of the package staging operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestagingeventargs.errorcode
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
        if (!this.HasProp("__IPackageStagingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageStagingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStagingEventArgs := IPackageStagingEventArgs(outPtr)
        }

        return this.__IPackageStagingEventArgs.get_ActivityId()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageStagingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageStagingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStagingEventArgs := IPackageStagingEventArgs(outPtr)
        }

        return this.__IPackageStagingEventArgs.get_Package()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Progress() {
        if (!this.HasProp("__IPackageStagingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageStagingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStagingEventArgs := IPackageStagingEventArgs(outPtr)
        }

        return this.__IPackageStagingEventArgs.get_Progress()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComplete() {
        if (!this.HasProp("__IPackageStagingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageStagingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStagingEventArgs := IPackageStagingEventArgs(outPtr)
        }

        return this.__IPackageStagingEventArgs.get_IsComplete()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IPackageStagingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageStagingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStagingEventArgs := IPackageStagingEventArgs(outPtr)
        }

        return this.__IPackageStagingEventArgs.get_ErrorCode()
    }

;@endregion Instance Methods
}
