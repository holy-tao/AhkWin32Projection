#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAcceleratorKeyEventArgs.ahk
#Include .\ICoreWindowEventArgs.ahk
#Include .\IAcceleratorKeyEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the arguments returned by an accelerator key event callback.
 * @remarks
 * > **Windows 10**
 * > Apps do not receive this event when an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input and sets [Handled](acceleratorkeyeventargs_handled.md) to **true**.
 * 
 * > **Windows Phone**
 * > This API is supported in native apps only.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.acceleratorkeyeventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class AcceleratorKeyEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAcceleratorKeyEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAcceleratorKeyEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of the accelerator key event that invoked the callback.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.acceleratorkeyeventargs.eventtype
     * @type {Integer} 
     */
    EventType {
        get => this.get_EventType()
    }

    /**
     * Gets the virtual key code (or ASCII/unicode character code depending on the [EventType](acceleratorkeyeventargs_eventtype.md)) for the accelerator key event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.acceleratorkeyeventargs.virtualkey
     * @type {Integer} 
     */
    VirtualKey {
        get => this.get_VirtualKey()
    }

    /**
     * Gets the status of the accelerator key for which the event was raised.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.acceleratorkeyeventargs.keystatus
     * @type {CorePhysicalKeyStatus} 
     */
    KeyStatus {
        get => this.get_KeyStatus()
    }

    /**
     * Gets or sets whether the accelerator key event was handled or not.
     * @remarks
     * > **Windows 10**
     * > Apps do not receive this event when an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input and sets Handled to **true**.
     * 
     * > **Windows Phone**
     * > This API is supported in native apps only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.acceleratorkeyeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets a unique ID for the input device that generated this key event.
     * 
     * Use DeviceId to differentiate between devices that can generate key events, such as multiple game controllers.
     * 
     * > DeviceId is not supported for all input devices.
     * @remarks
     * This property is useful for retrieving info for a specific user account associated with the input device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.acceleratorkeyeventargs.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventType() {
        if (!this.HasProp("__IAcceleratorKeyEventArgs")) {
            if ((queryResult := this.QueryInterface(IAcceleratorKeyEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceleratorKeyEventArgs := IAcceleratorKeyEventArgs(outPtr)
        }

        return this.__IAcceleratorKeyEventArgs.get_EventType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VirtualKey() {
        if (!this.HasProp("__IAcceleratorKeyEventArgs")) {
            if ((queryResult := this.QueryInterface(IAcceleratorKeyEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceleratorKeyEventArgs := IAcceleratorKeyEventArgs(outPtr)
        }

        return this.__IAcceleratorKeyEventArgs.get_VirtualKey()
    }

    /**
     * 
     * @returns {CorePhysicalKeyStatus} 
     */
    get_KeyStatus() {
        if (!this.HasProp("__IAcceleratorKeyEventArgs")) {
            if ((queryResult := this.QueryInterface(IAcceleratorKeyEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceleratorKeyEventArgs := IAcceleratorKeyEventArgs(outPtr)
        }

        return this.__IAcceleratorKeyEventArgs.get_KeyStatus()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IAcceleratorKeyEventArgs2")) {
            if ((queryResult := this.QueryInterface(IAcceleratorKeyEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceleratorKeyEventArgs2 := IAcceleratorKeyEventArgs2(outPtr)
        }

        return this.__IAcceleratorKeyEventArgs2.get_DeviceId()
    }

;@endregion Instance Methods
}
