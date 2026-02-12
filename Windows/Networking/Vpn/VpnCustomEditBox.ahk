#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnCustomEditBox.ahk
#Include .\IVpnCustomPrompt.ahk
#Include ..\..\..\Guid.ahk

/**
 * **VpnCustomEditBox** is not supported and may be altered or unavailable in the future. Instead, use [VpnCustomPromptTextInput](vpncustomprompttextinput.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomeditbox
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnCustomEditBox extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnCustomEditBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnCustomEditBox.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomeditbox.defaulttext
     * @type {HSTRING} 
     */
    DefaultText {
        get => this.get_DefaultText()
        set => this.put_DefaultText(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomeditbox.noecho
     * @type {Boolean} 
     */
    NoEcho {
        get => this.get_NoEcho()
        set => this.put_NoEcho(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomeditbox.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomeditbox.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomeditbox.compulsory
     * @type {Boolean} 
     */
    Compulsory {
        get => this.get_Compulsory()
        set => this.put_Compulsory(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomeditbox.bordered
     * @type {Boolean} 
     */
    Bordered {
        get => this.get_Bordered()
        set => this.put_Bordered(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Not supported.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnCustomEditBox")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DefaultText(value) {
        if (!this.HasProp("__IVpnCustomEditBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomEditBox := IVpnCustomEditBox(outPtr)
        }

        return this.__IVpnCustomEditBox.put_DefaultText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DefaultText() {
        if (!this.HasProp("__IVpnCustomEditBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomEditBox := IVpnCustomEditBox(outPtr)
        }

        return this.__IVpnCustomEditBox.get_DefaultText()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_NoEcho(value) {
        if (!this.HasProp("__IVpnCustomEditBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomEditBox := IVpnCustomEditBox(outPtr)
        }

        return this.__IVpnCustomEditBox.put_NoEcho(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NoEcho() {
        if (!this.HasProp("__IVpnCustomEditBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomEditBox := IVpnCustomEditBox(outPtr)
        }

        return this.__IVpnCustomEditBox.get_NoEcho()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IVpnCustomEditBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomEditBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomEditBox := IVpnCustomEditBox(outPtr)
        }

        return this.__IVpnCustomEditBox.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__IVpnCustomPrompt")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPrompt.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPrompt := IVpnCustomPrompt(outPtr)
        }

        return this.__IVpnCustomPrompt.put_Label(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        if (!this.HasProp("__IVpnCustomPrompt")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPrompt.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPrompt := IVpnCustomPrompt(outPtr)
        }

        return this.__IVpnCustomPrompt.get_Label()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Compulsory(value) {
        if (!this.HasProp("__IVpnCustomPrompt")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPrompt.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPrompt := IVpnCustomPrompt(outPtr)
        }

        return this.__IVpnCustomPrompt.put_Compulsory(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Compulsory() {
        if (!this.HasProp("__IVpnCustomPrompt")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPrompt.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPrompt := IVpnCustomPrompt(outPtr)
        }

        return this.__IVpnCustomPrompt.get_Compulsory()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Bordered(value) {
        if (!this.HasProp("__IVpnCustomPrompt")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPrompt.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPrompt := IVpnCustomPrompt(outPtr)
        }

        return this.__IVpnCustomPrompt.put_Bordered(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Bordered() {
        if (!this.HasProp("__IVpnCustomPrompt")) {
            if ((queryResult := this.QueryInterface(IVpnCustomPrompt.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomPrompt := IVpnCustomPrompt(outPtr)
        }

        return this.__IVpnCustomPrompt.get_Bordered()
    }

;@endregion Instance Methods
}
