#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnCustomPromptText.ahk
#Include .\IVpnCustomPromptElement.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a text UI element used in the [VpnChannel.RequestCustomPromptAsync](vpnchannel_requestcustompromptasync_598226399.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomprompttext
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnCustomPromptText extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnCustomPromptText

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnCustomPromptText.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the text typed into the text input UI element.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomprompttext.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the text label of the text input UI element.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomprompttext.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomprompttext.compulsory
     * @type {Boolean} 
     */
    Compulsory {
        get => this.get_Compulsory()
        set => this.put_Compulsory(value)
    }

    /**
     * Gets or sets whether the text UI element is emphasized.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomprompttext.emphasized
     * @type {Boolean} 
     */
    Emphasized {
        get => this.get_Emphasized()
        set => this.put_Emphasized(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Allows VPN plug-ins to specify a text UI element to be used in the [RequestCustomPromptAsync](vpnchannel_requestcustompromptasync_598226399.md) method.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnCustomPromptText")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__IVpnCustomPromptText")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptText := IVpnCustomPromptText(outPtr)
        }

        return this.__IVpnCustomPromptText.put_Text(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IVpnCustomPromptText")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptText.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptText := IVpnCustomPromptText(outPtr)
        }

        return this.__IVpnCustomPromptText.get_Text()
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
