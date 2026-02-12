#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnCustomTextBox.ahk
#Include .\IVpnCustomPrompt.ahk
#Include ..\..\..\Guid.ahk

/**
 * **VpnCustomTextBox** is not supported and may be altered or unavailable in the future. Instead, use [VpnCustomPromptText](vpncustomprompttext.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomtextbox
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnCustomTextBox extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnCustomTextBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnCustomTextBox.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomtextbox.displaytext
     * @type {HSTRING} 
     */
    DisplayText {
        get => this.get_DisplayText()
        set => this.put_DisplayText(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomtextbox.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomtextbox.compulsory
     * @type {Boolean} 
     */
    Compulsory {
        get => this.get_Compulsory()
        set => this.put_Compulsory(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomtextbox.bordered
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
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnCustomTextBox")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayText(value) {
        if (!this.HasProp("__IVpnCustomTextBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomTextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomTextBox := IVpnCustomTextBox(outPtr)
        }

        return this.__IVpnCustomTextBox.put_DisplayText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayText() {
        if (!this.HasProp("__IVpnCustomTextBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomTextBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomTextBox := IVpnCustomTextBox(outPtr)
        }

        return this.__IVpnCustomTextBox.get_DisplayText()
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
