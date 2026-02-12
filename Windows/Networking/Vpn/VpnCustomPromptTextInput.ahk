#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnCustomPromptTextInput.ahk
#Include .\IVpnCustomPromptElement.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a text input UI element used in the [RequestCustomPromptAsync](vpnchannel_requestcustompromptasync_598226399.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomprompttextinput
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnCustomPromptTextInput extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnCustomPromptTextInput

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnCustomPromptTextInput.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the text that is displayed as grayed out when the text input UI element does not contain any text typed by the user. This can be sample text.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomprompttextinput.placeholdertext
     * @type {HSTRING} 
     */
    PlaceholderText {
        get => this.get_PlaceholderText()
        set => this.put_PlaceholderText(value)
    }

    /**
     * Gets or sets whether the text typed into the text input UI element must be hidden by showing different characters. This is typically used when the input is expected to be a password, other text credential, or secret.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomprompttextinput.istexthidden
     * @type {Boolean} 
     */
    IsTextHidden {
        get => this.get_IsTextHidden()
        set => this.put_IsTextHidden(value)
    }

    /**
     * Gets the text typed into the text input UI element.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomprompttextinput.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * Gets or sets the text label of the text input UI element.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomprompttextinput.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets whether the user must provide some text input in this element before the UI flow of the can continue (the next button is grayed out).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomprompttextinput.compulsory
     * @type {Boolean} 
     */
    Compulsory {
        get => this.get_Compulsory()
        set => this.put_Compulsory(value)
    }

    /**
     * Gets or sets whether the text input UI element is emphasized.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomprompttextinput.emphasized
     * @type {Boolean} 
     */
    Emphasized {
        get => this.get_Emphasized()
        set => this.put_Emphasized(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Allows VPN plug-ins to create a text input UI element object to be used in the [RequestCustomPromptAsync](vpnchannel_requestcustompromptasync_598226399.md) method.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnCustomPromptTextInput")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderText(value) {
        if (!this.HasProp("__IVpnCustomPromptTextInput")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptTextInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptTextInput := IVpnCustomPromptTextInput(outPtr)
        }

        return this.__IVpnCustomPromptTextInput.put_PlaceholderText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlaceholderText() {
        if (!this.HasProp("__IVpnCustomPromptTextInput")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptTextInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptTextInput := IVpnCustomPromptTextInput(outPtr)
        }

        return this.__IVpnCustomPromptTextInput.get_PlaceholderText()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextHidden(value) {
        if (!this.HasProp("__IVpnCustomPromptTextInput")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptTextInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptTextInput := IVpnCustomPromptTextInput(outPtr)
        }

        return this.__IVpnCustomPromptTextInput.put_IsTextHidden(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextHidden() {
        if (!this.HasProp("__IVpnCustomPromptTextInput")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptTextInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptTextInput := IVpnCustomPromptTextInput(outPtr)
        }

        return this.__IVpnCustomPromptTextInput.get_IsTextHidden()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IVpnCustomPromptTextInput")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptTextInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptTextInput := IVpnCustomPromptTextInput(outPtr)
        }

        return this.__IVpnCustomPromptTextInput.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IVpnCustomPromptElement")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptElement := IVpnCustomPromptElement(outPtr)
        }

        return this.__IVpnCustomPromptElement.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IVpnCustomPromptElement")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptElement := IVpnCustomPromptElement(outPtr)
        }

        return this.__IVpnCustomPromptElement.get_DisplayName()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Compulsory(value) {
        if (!this.HasProp("__IVpnCustomPromptElement")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptElement := IVpnCustomPromptElement(outPtr)
        }

        return this.__IVpnCustomPromptElement.put_Compulsory(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Compulsory() {
        if (!this.HasProp("__IVpnCustomPromptElement")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptElement := IVpnCustomPromptElement(outPtr)
        }

        return this.__IVpnCustomPromptElement.get_Compulsory()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Emphasized(value) {
        if (!this.HasProp("__IVpnCustomPromptElement")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptElement := IVpnCustomPromptElement(outPtr)
        }

        return this.__IVpnCustomPromptElement.put_Emphasized(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Emphasized() {
        if (!this.HasProp("__IVpnCustomPromptElement")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptElement := IVpnCustomPromptElement(outPtr)
        }

        return this.__IVpnCustomPromptElement.get_Emphasized()
    }

;@endregion Instance Methods
}
