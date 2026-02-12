#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyEventArgs.ahk
#Include .\ICoreWindowEventArgs.ahk
#Include .\IKeyEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the arguments returned by a virtual key event.
 * @remarks
 * > **Windows 10**
 * > Apps do not receive this event when an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input and sets [Handled](keyeventargs_handled.md) to **true**.
 * 
 * > **Windows Phone**
 * > This API is supported in native apps only.
 * 
 * This object is returned by a delegate registered for one of the following events:
 * + [CoreWindow.KeyDown](corewindow_keydown.md)
 * + [CoreWindow.KeyUp](corewindow_keyup.md)
 * 
 * ```cppwinrt
 * void SetWindow(CoreWindow const & window)
 * {
 *     ...
 *     window.KeyDown({ this, &App::OnKeyDown });
 *     window.KeyUp({ this, &App::OnKeyUp });
 * }
 * 
 * // Keypress data is in KeyEventArgs.
 * void OnKeyDown(Windows::UI::Core::CoreWindow const& // sender ,
 *     Windows::UI::Core::KeyEventArgs const& // args ) {}
 * 
 * void OnKeyUp(Windows::UI::Core::CoreWindow const& // sender ,
 *     Windows::UI::Core::KeyEventArgs const& // args ) {}
 * ```
 * 
 * ```cppcx
 * // returning keypress events data through KeyEventArgs
 * void MyCoreWindowEvents::SetWindow( // implementation called by CoreApplication::Run(), provided for context
 *     _In_ CoreWindow^ window
 *     )
 * {
 *     // ...
 *     window->KeyDown +=
 *         ref new TypedEventHandler<CoreWindow^, KeyEventArgs^>(this, &CoreWindowEvents::OnKeyDown);
 *     window->KeyUp +=
 *         ref new TypedEventHandler<CoreWindow^, KeyEventArgs^>(this, &CoreWindowEvents::OnKeyUp);
 * 
 *     // ...
 * }
 * ```
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.keyeventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class KeyEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the virtual key that maps to the key that was pressed.
     * @remarks
     * > **Windows 10**
     * > Apps do not receive this event when an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input and sets [Handled](keyeventargs_handled.md) to **true**.
     * 
     * > **Windows Phone**
     * > This API is supported in native apps only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.keyeventargs.virtualkey
     * @type {Integer} 
     */
    VirtualKey {
        get => this.get_VirtualKey()
    }

    /**
     * Gets the status of a key at the time the event is fired.
     * @remarks
     * > **Windows 10**
     * > Apps do not receive this event when an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input and sets [Handled](keyeventargs_handled.md) to **true**.
     * 
     * > **Windows Phone**
     * > This API is supported in native apps only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.keyeventargs.keystatus
     * @type {CorePhysicalKeyStatus} 
     */
    KeyStatus {
        get => this.get_KeyStatus()
    }

    /**
     * Gets or sets whether the key press event was handled.
     * @remarks
     * > **Windows 10**
     * > Apps do not receive this event when an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input and sets Handled to **true**.
     * 
     * > **Windows Phone**
     * > This API is supported in native apps only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.keyeventargs.handled
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.keyeventargs.deviceid
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
    get_VirtualKey() {
        if (!this.HasProp("__IKeyEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyEventArgs := IKeyEventArgs(outPtr)
        }

        return this.__IKeyEventArgs.get_VirtualKey()
    }

    /**
     * 
     * @returns {CorePhysicalKeyStatus} 
     */
    get_KeyStatus() {
        if (!this.HasProp("__IKeyEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyEventArgs := IKeyEventArgs(outPtr)
        }

        return this.__IKeyEventArgs.get_KeyStatus()
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
        if (!this.HasProp("__IKeyEventArgs2")) {
            if ((queryResult := this.QueryInterface(IKeyEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyEventArgs2 := IKeyEventArgs2(outPtr)
        }

        return this.__IKeyEventArgs2.get_DeviceId()
    }

;@endregion Instance Methods
}
