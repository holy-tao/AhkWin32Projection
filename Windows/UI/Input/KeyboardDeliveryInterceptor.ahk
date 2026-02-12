#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyboardDeliveryInterceptor.ahk
#Include .\IKeyboardDeliveryInterceptorStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\KeyboardDeliveryInterceptor.ahk
#Include ..\Core\KeyEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Enables an app to override the system processing of raw keyboard input, including key combinations such as shortcut keys, access keys (or hot keys), accelerator keys, and application keys.
  * 
  * The raw keyboard input is intercepted, suppressed, and routed to the app (when in the foreground) for processing.
  * 
  * > [!NOTE]
  * > Secure attention sequence (SAS) key combinations, including Ctrl-Alt-Del and Windows-L, continue to be processed by the system.
 * @remarks
 * The value of the [RepeatCount](../windows.ui.core/corephysicalkeystatus.md) property returned by [KeyEventArgs.KeyStatus](../windows.ui.core/keyeventargs_keystatus.md) is always 0.
 * 
 * The value of the [WasKeyDown](../windows.ui.core/corephysicalkeystatus.md) property returned by [KeyEventArgs.KeyStatus](../windows.ui.core/keyeventargs_keystatus.md) is always false.
 * 
 * If [Handled](../windows.ui.core/keyeventargs_handled.md) is set to false, an error occurs.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.keyboarddeliveryinterceptor
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class KeyboardDeliveryInterceptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyboardDeliveryInterceptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyboardDeliveryInterceptor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a [KeyboardDeliveryInterceptor](keyboarddeliveryinterceptor.md) object associated with the current app view.
     * @returns {KeyboardDeliveryInterceptor} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.keyboarddeliveryinterceptor.getforcurrentview
     */
    static GetForCurrentView() {
        if (!KeyboardDeliveryInterceptor.HasProp("__IKeyboardDeliveryInterceptorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.KeyboardDeliveryInterceptor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyboardDeliveryInterceptorStatics.IID)
            KeyboardDeliveryInterceptor.__IKeyboardDeliveryInterceptorStatics := IKeyboardDeliveryInterceptorStatics(factoryPtr)
        }

        return KeyboardDeliveryInterceptor.__IKeyboardDeliveryInterceptorStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets whether the app overrides the system processing of raw keyboard input, including key combinations such as shortcut keys, access keys (or hot keys), accelerator keys, and application keys.
     * 
     * The raw keyboard input is intercepted, suppressed, and routed to the app (when in the foreground) for processing.
     * 
     * > [!NOTE]
     * > Secure attention sequence (SAS) key combinations, including Ctrl-Alt-Del and Windows-L, continue to be processed by the system.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.keyboarddeliveryinterceptor.isinterceptionenabledwheninforeground
     * @type {Boolean} 
     */
    IsInterceptionEnabledWhenInForeground {
        get => this.get_IsInterceptionEnabledWhenInForeground()
        set => this.put_IsInterceptionEnabledWhenInForeground(value)
    }

    /**
     * Occurs when a keyboard key is pressed. State info and event data is routed through this event instead of [CoreWindow.KeyDown](../windows.ui.core/corewindow_keydown.md).
     * @type {TypedEventHandler<KeyboardDeliveryInterceptor, KeyEventArgs>}
    */
    OnKeyDown {
        get {
            if(!this.HasProp("__OnKeyDown")){
                this.__OnKeyDown := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2c1caf11-9d6f-5e0f-a9ea-4c7c734d73d6}"),
                    KeyboardDeliveryInterceptor,
                    KeyEventArgs
                )
                this.__OnKeyDownToken := this.add_KeyDown(this.__OnKeyDown.iface)
            }
            return this.__OnKeyDown
        }
    }

    /**
     * Occurs when a pressed keyboard key is released. State info and event data is routed through this event instead of [CoreWindow.KeyUp](../windows.ui.core/corewindow_keyup.md).
     * @type {TypedEventHandler<KeyboardDeliveryInterceptor, KeyEventArgs>}
    */
    OnKeyUp {
        get {
            if(!this.HasProp("__OnKeyUp")){
                this.__OnKeyUp := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2c1caf11-9d6f-5e0f-a9ea-4c7c734d73d6}"),
                    KeyboardDeliveryInterceptor,
                    KeyEventArgs
                )
                this.__OnKeyUpToken := this.add_KeyUp(this.__OnKeyUp.iface)
            }
            return this.__OnKeyUp
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnKeyDownToken")) {
            this.remove_KeyDown(this.__OnKeyDownToken)
            this.__OnKeyDown.iface.Dispose()
        }

        if(this.HasProp("__OnKeyUpToken")) {
            this.remove_KeyUp(this.__OnKeyUpToken)
            this.__OnKeyUp.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInterceptionEnabledWhenInForeground() {
        if (!this.HasProp("__IKeyboardDeliveryInterceptor")) {
            if ((queryResult := this.QueryInterface(IKeyboardDeliveryInterceptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardDeliveryInterceptor := IKeyboardDeliveryInterceptor(outPtr)
        }

        return this.__IKeyboardDeliveryInterceptor.get_IsInterceptionEnabledWhenInForeground()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsInterceptionEnabledWhenInForeground(value) {
        if (!this.HasProp("__IKeyboardDeliveryInterceptor")) {
            if ((queryResult := this.QueryInterface(IKeyboardDeliveryInterceptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardDeliveryInterceptor := IKeyboardDeliveryInterceptor(outPtr)
        }

        return this.__IKeyboardDeliveryInterceptor.put_IsInterceptionEnabledWhenInForeground(value)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardDeliveryInterceptor, KeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyDown(handler) {
        if (!this.HasProp("__IKeyboardDeliveryInterceptor")) {
            if ((queryResult := this.QueryInterface(IKeyboardDeliveryInterceptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardDeliveryInterceptor := IKeyboardDeliveryInterceptor(outPtr)
        }

        return this.__IKeyboardDeliveryInterceptor.add_KeyDown(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_KeyDown(token) {
        if (!this.HasProp("__IKeyboardDeliveryInterceptor")) {
            if ((queryResult := this.QueryInterface(IKeyboardDeliveryInterceptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardDeliveryInterceptor := IKeyboardDeliveryInterceptor(outPtr)
        }

        return this.__IKeyboardDeliveryInterceptor.remove_KeyDown(token)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardDeliveryInterceptor, KeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyUp(handler) {
        if (!this.HasProp("__IKeyboardDeliveryInterceptor")) {
            if ((queryResult := this.QueryInterface(IKeyboardDeliveryInterceptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardDeliveryInterceptor := IKeyboardDeliveryInterceptor(outPtr)
        }

        return this.__IKeyboardDeliveryInterceptor.add_KeyUp(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_KeyUp(token) {
        if (!this.HasProp("__IKeyboardDeliveryInterceptor")) {
            if ((queryResult := this.QueryInterface(IKeyboardDeliveryInterceptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardDeliveryInterceptor := IKeyboardDeliveryInterceptor(outPtr)
        }

        return this.__IKeyboardDeliveryInterceptor.remove_KeyUp(token)
    }

;@endregion Instance Methods
}
