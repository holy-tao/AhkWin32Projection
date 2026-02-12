#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateActionProgress.ahk
#Include ..\..\..\Guid.ahk

/**
 * Returned by the **ActionProgress** properties of [WindowsUpdate](./windowsupdate.md) and [WindowsUpdateProgressChangedEventArgs](./windowsupdateprogresschangedeventargs.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactionprogress
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateActionProgress extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateActionProgress

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateActionProgress.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the action that the [WindowsUpdate](./windowsupdate.md) object currently has in progress.
     * @remarks
     * This will most commonly be "Download" or "Install". Other possible actions include "Uninstall", "Commit", and "PostReboot".
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactionprogress.action
     * @type {HSTRING} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * Gets the current progress of an action for the [WindowsUpdate](./windowsupdate.md) object.
     * @remarks
     * This value is reported as a double in the range [0.0, 1.0], where 0.0 maps to 0%, and 1.0 maps to 100%.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateactionprogress.progress
     * @type {Float} 
     */
    Progress {
        get => this.get_Progress()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Action() {
        if (!this.HasProp("__IWindowsUpdateActionProgress")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateActionProgress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateActionProgress := IWindowsUpdateActionProgress(outPtr)
        }

        return this.__IWindowsUpdateActionProgress.get_Action()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Progress() {
        if (!this.HasProp("__IWindowsUpdateActionProgress")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateActionProgress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateActionProgress := IWindowsUpdateActionProgress(outPtr)
        }

        return this.__IWindowsUpdateActionProgress.get_Progress()
    }

;@endregion Instance Methods
}
