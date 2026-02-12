#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageUpdatingEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information about the package that is being updated.
 * @remarks
 * This object is passed to the app's package updating event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageupdatingeventargs
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageUpdatingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageUpdatingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageUpdatingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the id for the update operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageupdatingeventargs.activityid
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * Gets the package that is being updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageupdatingeventargs.sourcepackage
     * @type {Package} 
     */
    SourcePackage {
        get => this.get_SourcePackage()
    }

    /**
     * Gets the updated package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageupdatingeventargs.targetpackage
     * @type {Package} 
     */
    TargetPackage {
        get => this.get_TargetPackage()
    }

    /**
     * Gets an approximation of the package's update progress.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageupdatingeventargs.progress
     * @type {Float} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * Indicates whether the app package is done updating.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageupdatingeventargs.iscomplete
     * @type {Boolean} 
     */
    IsComplete {
        get => this.get_IsComplete()
    }

    /**
     * Gets the result of the package uninstall operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageupdatingeventargs.errorcode
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
        if (!this.HasProp("__IPackageUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUpdatingEventArgs := IPackageUpdatingEventArgs(outPtr)
        }

        return this.__IPackageUpdatingEventArgs.get_ActivityId()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_SourcePackage() {
        if (!this.HasProp("__IPackageUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUpdatingEventArgs := IPackageUpdatingEventArgs(outPtr)
        }

        return this.__IPackageUpdatingEventArgs.get_SourcePackage()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_TargetPackage() {
        if (!this.HasProp("__IPackageUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUpdatingEventArgs := IPackageUpdatingEventArgs(outPtr)
        }

        return this.__IPackageUpdatingEventArgs.get_TargetPackage()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Progress() {
        if (!this.HasProp("__IPackageUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUpdatingEventArgs := IPackageUpdatingEventArgs(outPtr)
        }

        return this.__IPackageUpdatingEventArgs.get_Progress()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComplete() {
        if (!this.HasProp("__IPackageUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUpdatingEventArgs := IPackageUpdatingEventArgs(outPtr)
        }

        return this.__IPackageUpdatingEventArgs.get_IsComplete()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IPackageUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUpdatingEventArgs := IPackageUpdatingEventArgs(outPtr)
        }

        return this.__IPackageUpdatingEventArgs.get_ErrorCode()
    }

;@endregion Instance Methods
}
