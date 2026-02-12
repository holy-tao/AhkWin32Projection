#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateProgressChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event data for the corresponding [WindowsUpdateManager.ProgressChanged](./windowsupdatemanager_progresschanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateprogresschangedeventargs
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateProgressChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateProgressChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateProgressChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [WindowsUpdate](./windowsupdate.md) associated with the progress change event.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateprogresschangedeventargs.update
     * @type {WindowsUpdate} 
     */
    Update {
        get => this.get_Update()
    }

    /**
     * Gets the [WindowsUpdateActionProgress](./windowsupdateactionprogress.md) associated with the progress change event.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateprogresschangedeventargs.actionprogress
     * @type {WindowsUpdateActionProgress} 
     */
    ActionProgress {
        get => this.get_ActionProgress()
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
        if (!this.HasProp("__IWindowsUpdateProgressChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateProgressChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateProgressChangedEventArgs := IWindowsUpdateProgressChangedEventArgs(outPtr)
        }

        return this.__IWindowsUpdateProgressChangedEventArgs.get_Update()
    }

    /**
     * 
     * @returns {WindowsUpdateActionProgress} 
     */
    get_ActionProgress() {
        if (!this.HasProp("__IWindowsUpdateProgressChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateProgressChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateProgressChangedEventArgs := IWindowsUpdateProgressChangedEventArgs(outPtr)
        }

        return this.__IWindowsUpdateProgressChangedEventArgs.get_ActionProgress()
    }

;@endregion Instance Methods
}
