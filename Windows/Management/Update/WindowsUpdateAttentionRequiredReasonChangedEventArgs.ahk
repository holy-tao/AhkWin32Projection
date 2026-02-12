#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateAttentionRequiredReasonChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event data for the corresponding [WindowsUpdateManager.AttentionRequiredReasonChanged](./windowsupdatemanager_attentionrequiredreasonchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateattentionrequiredreasonchangedeventargs
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateAttentionRequiredReasonChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateAttentionRequiredReasonChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateAttentionRequiredReasonChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [WindowsUpdate](./windowsupdate.md) associated with the attention-required-reason change event.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateattentionrequiredreasonchangedeventargs.update
     * @type {WindowsUpdate} 
     */
    Update {
        get => this.get_Update()
    }

    /**
     * Gets the [WindowsUpdateAttentionRequiredReason](./windowsupdateattentionrequiredreason.md) associated with the attention-required-reason change event.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateattentionrequiredreasonchangedeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
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
        if (!this.HasProp("__IWindowsUpdateAttentionRequiredReasonChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateAttentionRequiredReasonChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateAttentionRequiredReasonChangedEventArgs := IWindowsUpdateAttentionRequiredReasonChangedEventArgs(outPtr)
        }

        return this.__IWindowsUpdateAttentionRequiredReasonChangedEventArgs.get_Update()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__IWindowsUpdateAttentionRequiredReasonChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateAttentionRequiredReasonChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateAttentionRequiredReasonChangedEventArgs := IWindowsUpdateAttentionRequiredReasonChangedEventArgs(outPtr)
        }

        return this.__IWindowsUpdateAttentionRequiredReasonChangedEventArgs.get_Reason()
    }

;@endregion Instance Methods
}
