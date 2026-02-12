#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnCustomPromptBooleanInput.ahk
#Include .\IVpnCustomPromptElement.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Boolean type of UI control prompt required from the user. This is typically a checkbox. This is used in the construction of custom prompts used in the [VpnChannel.RequestCustomPromptAsync](vpnchannel_requestcustompromptasync_598226399.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustompromptbooleaninput
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnCustomPromptBooleanInput extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnCustomPromptBooleanInput

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnCustomPromptBooleanInput.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether the initial Boolean value displayed to the user is true or false.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustompromptbooleaninput.initialvalue
     * @type {Boolean} 
     */
    InitialValue {
        get => this.get_InitialValue()
        set => this.put_InitialValue(value)
    }

    /**
     * Gets the value selected by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustompromptbooleaninput.value
     * @type {Boolean} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets or sets the text label of the input UI element.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustompromptbooleaninput.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets whether the user must provide some input in this element before the UI flow can continue (the next button is grayed out).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustompromptbooleaninput.compulsory
     * @type {Boolean} 
     */
    Compulsory {
        get => this.get_Compulsory()
        set => this.put_Compulsory(value)
    }

    /**
     * Gets or sets whether the Boolean input UI element is emphasized or not.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustompromptbooleaninput.emphasized
     * @type {Boolean} 
     */
    Emphasized {
        get => this.get_Emphasized()
        set => this.put_Emphasized(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Constructs an object representing the Boolean input UI element to be used in the [VpnChannel.RequestCustomPromptAsync](vpnchannel_requestcustompromptasync_598226399.md) method.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnCustomPromptBooleanInput")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_InitialValue(value) {
        if (!this.HasProp("__IVpnCustomPromptBooleanInput")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptBooleanInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptBooleanInput := IVpnCustomPromptBooleanInput(outPtr)
        }

        return this.__IVpnCustomPromptBooleanInput.put_InitialValue(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InitialValue() {
        if (!this.HasProp("__IVpnCustomPromptBooleanInput")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptBooleanInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptBooleanInput := IVpnCustomPromptBooleanInput(outPtr)
        }

        return this.__IVpnCustomPromptBooleanInput.get_InitialValue()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Value() {
        if (!this.HasProp("__IVpnCustomPromptBooleanInput")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptBooleanInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptBooleanInput := IVpnCustomPromptBooleanInput(outPtr)
        }

        return this.__IVpnCustomPromptBooleanInput.get_Value()
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
