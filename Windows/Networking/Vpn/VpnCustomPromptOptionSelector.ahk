#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnCustomPromptOptionSelector.ahk
#Include .\IVpnCustomPromptElement.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a multiple choice UI control prompt required from the user. This is typically a combo box. This is used in the construction of custom prompts used in the [VpnChannel.RequestCustomPromptAsync](vpnchannel_requestcustompromptasync_598226399.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustompromptoptionselector
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnCustomPromptOptionSelector extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnCustomPromptOptionSelector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnCustomPromptOptionSelector.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of strings that are presented as choices for the multiple choice UI element. The plug-in is expected to retrieve the list, and fill it with the strings needed (in the order that they are to be presented).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustompromptoptionselector.options
     * @type {IVector<HSTRING>} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * Gets the index into the options string vector of the option selected by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustompromptoptionselector.selectedindex
     * @type {Integer} 
     */
    SelectedIndex {
        get => this.get_SelectedIndex()
    }

    /**
     * Gets or sets the text label of the text input UI element.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustompromptoptionselector.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets whether the user must provide some text input in this element before the UI flow of the can continue (the next button is grayed out).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustompromptoptionselector.compulsory
     * @type {Boolean} 
     */
    Compulsory {
        get => this.get_Compulsory()
        set => this.put_Compulsory(value)
    }

    /**
     * Gets or sets whether the input UI element is emphasized or not
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustompromptoptionselector.emphasized
     * @type {Boolean} 
     */
    Emphasized {
        get => this.get_Emphasized()
        set => this.put_Emphasized(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Constructs an object representing a multiple choice UI element to be used in the [VpnChannel.RequestCustomPrompt](vpnchannel_requestcustomprompt_1927878854.md) method.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnCustomPromptOptionSelector")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Options() {
        if (!this.HasProp("__IVpnCustomPromptOptionSelector")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptOptionSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptOptionSelector := IVpnCustomPromptOptionSelector(outPtr)
        }

        return this.__IVpnCustomPromptOptionSelector.get_Options()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedIndex() {
        if (!this.HasProp("__IVpnCustomPromptOptionSelector")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPromptOptionSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPromptOptionSelector := IVpnCustomPromptOptionSelector(outPtr)
        }

        return this.__IVpnCustomPromptOptionSelector.get_SelectedIndex()
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
