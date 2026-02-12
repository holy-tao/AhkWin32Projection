#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlAcceleratorKeyPressedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class provides information for the [Windows.Web.UI.Interop.WebViewControl.AcceleratorKeyPressed](webviewcontrol_acceleratorkeypressed.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolacceleratorkeypressedeventargs
 * @namespace Windows.Web.UI.Interop
 * @version WindowsRuntime 1.4
 */
class WebViewControlAcceleratorKeyPressedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlAcceleratorKeyPressedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlAcceleratorKeyPressedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the event type.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolacceleratorkeypressedeventargs.eventtype
     * @type {Integer} 
     */
    EventType {
        get => this.get_EventType()
    }

    /**
     * Gets the virtual key.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolacceleratorkeypressedeventargs.virtualkey
     * @type {Integer} 
     */
    VirtualKey {
        get => this.get_VirtualKey()
    }

    /**
     * Gets the key status.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolacceleratorkeypressedeventargs.keystatus
     * @type {CorePhysicalKeyStatus} 
     */
    KeyStatus {
        get => this.get_KeyStatus()
    }

    /**
     * Gets the routing stage.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolacceleratorkeypressedeventargs.routingstage
     * @type {Integer} 
     */
    RoutingStage {
        get => this.get_RoutingStage()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A true value for Handled prevents other handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolacceleratorkeypressedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
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
        if (!this.HasProp("__IWebViewControlAcceleratorKeyPressedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlAcceleratorKeyPressedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlAcceleratorKeyPressedEventArgs := IWebViewControlAcceleratorKeyPressedEventArgs(outPtr)
        }

        return this.__IWebViewControlAcceleratorKeyPressedEventArgs.get_EventType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VirtualKey() {
        if (!this.HasProp("__IWebViewControlAcceleratorKeyPressedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlAcceleratorKeyPressedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlAcceleratorKeyPressedEventArgs := IWebViewControlAcceleratorKeyPressedEventArgs(outPtr)
        }

        return this.__IWebViewControlAcceleratorKeyPressedEventArgs.get_VirtualKey()
    }

    /**
     * 
     * @returns {CorePhysicalKeyStatus} 
     */
    get_KeyStatus() {
        if (!this.HasProp("__IWebViewControlAcceleratorKeyPressedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlAcceleratorKeyPressedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlAcceleratorKeyPressedEventArgs := IWebViewControlAcceleratorKeyPressedEventArgs(outPtr)
        }

        return this.__IWebViewControlAcceleratorKeyPressedEventArgs.get_KeyStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RoutingStage() {
        if (!this.HasProp("__IWebViewControlAcceleratorKeyPressedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlAcceleratorKeyPressedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlAcceleratorKeyPressedEventArgs := IWebViewControlAcceleratorKeyPressedEventArgs(outPtr)
        }

        return this.__IWebViewControlAcceleratorKeyPressedEventArgs.get_RoutingStage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IWebViewControlAcceleratorKeyPressedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlAcceleratorKeyPressedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlAcceleratorKeyPressedEventArgs := IWebViewControlAcceleratorKeyPressedEventArgs(outPtr)
        }

        return this.__IWebViewControlAcceleratorKeyPressedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IWebViewControlAcceleratorKeyPressedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlAcceleratorKeyPressedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlAcceleratorKeyPressedEventArgs := IWebViewControlAcceleratorKeyPressedEventArgs(outPtr)
        }

        return this.__IWebViewControlAcceleratorKeyPressedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
