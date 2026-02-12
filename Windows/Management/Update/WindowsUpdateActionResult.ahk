#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateActionResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Returned by the [WindowsUpdate.ActionResult](./windowsupdate_actionresult.md) property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactionresult
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateActionResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateActionResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateActionResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the timestamp at which an action was completed.
     * @remarks
     * The time is reported in the local time of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactionresult.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets a value indicating whether the completed action succeeded.
     * @remarks
     * This property affords quick reference as to whether an action was successful. If the action failed, then you can obtain more information by checking the [ExtendedError](./windowsupdateactioncompletedeventargs_extendederror.md) code.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactionresult.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * Gets detailed information about an error associated with a completed action event.
     * @remarks
     * If the action completed successfully, then the value is **S_OK** (0). Otherwise, the value is an error code explaining why the action failed.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactionresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets the result of an action for the [WindowsUpdate](./windowsupdate.md) object.
     * @remarks
     * This will most commonly be "Download" or "Install". Other possible actions include "Uninstall", "Commit", and "PostReboot".
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactionresult.action
     * @type {HSTRING} 
     */
    Action {
        get => this.get_Action()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IWindowsUpdateActionResult")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateActionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateActionResult := IWindowsUpdateActionResult(outPtr)
        }

        return this.__IWindowsUpdateActionResult.get_Timestamp()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IWindowsUpdateActionResult")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateActionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateActionResult := IWindowsUpdateActionResult(outPtr)
        }

        return this.__IWindowsUpdateActionResult.get_Succeeded()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IWindowsUpdateActionResult")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateActionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateActionResult := IWindowsUpdateActionResult(outPtr)
        }

        return this.__IWindowsUpdateActionResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Action() {
        if (!this.HasProp("__IWindowsUpdateActionResult")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateActionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateActionResult := IWindowsUpdateActionResult(outPtr)
        }

        return this.__IWindowsUpdateActionResult.get_Action()
    }

;@endregion Instance Methods
}
