#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateActionCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event data for the corresponding [WindowsUpdateManager.ActionCompleted](./windowsupdatemanager_actioncompleted.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactioncompletedeventargs
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateActionCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateActionCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateActionCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [WindowsUpdate](./windowsupdate.md) associated with the completed action.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactioncompletedeventargs.update
     * @type {WindowsUpdate} 
     */
    Update {
        get => this.get_Update()
    }

    /**
     * Gets the current action that the associated [WindowsUpdate](./windowsupdate.md) has completed.
     * @remarks
     * This will most commonly be "Download" or "Install". Other possible actions include "Uninstall", "Commit", and "PostReboot".
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactioncompletedeventargs.action
     * @type {HSTRING} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * Gets a value indicating whether the completed action succeeded.
     * @remarks
     * This property affords quick reference as to whether an action was successful. If the action failed, then you can obtain more information by checking the [ExtendedError](./windowsupdateactioncompletedeventargs_extendederror.md) code.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactioncompletedeventargs.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * Gets detailed information about an error associated with a completed action event.
     * @remarks
     * If the action completed successfully, then the value is **S_OK** (0). Otherwise, the value is an error code explaining why the action failed.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactioncompletedeventargs.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WindowsUpdate} 
     */
    get_Update() {
        if (!this.HasProp("__IWindowsUpdateActionCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateActionCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateActionCompletedEventArgs := IWindowsUpdateActionCompletedEventArgs(outPtr)
        }

        return this.__IWindowsUpdateActionCompletedEventArgs.get_Update()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Action() {
        if (!this.HasProp("__IWindowsUpdateActionCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateActionCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateActionCompletedEventArgs := IWindowsUpdateActionCompletedEventArgs(outPtr)
        }

        return this.__IWindowsUpdateActionCompletedEventArgs.get_Action()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IWindowsUpdateActionCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateActionCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateActionCompletedEventArgs := IWindowsUpdateActionCompletedEventArgs(outPtr)
        }

        return this.__IWindowsUpdateActionCompletedEventArgs.get_Succeeded()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IWindowsUpdateActionCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateActionCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateActionCompletedEventArgs := IWindowsUpdateActionCompletedEventArgs(outPtr)
        }

        return this.__IWindowsUpdateActionCompletedEventArgs.get_ExtendedError()
    }

;@endregion Instance Methods
}
