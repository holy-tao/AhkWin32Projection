#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnCustomComboBox.ahk
#Include .\IVpnCustomPrompt.ahk
#Include ..\..\..\Guid.ahk

/**
 * **VpnCustomComboBox** is not supported and may be altered or unavailable in the future. Instead, use [VpnCustomPromptOptionSelector](vpncustompromptoptionselector.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomcombobox
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnCustomComboBox extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnCustomComboBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnCustomComboBox.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomcombobox.optionstext
     * @type {IVectorView<HSTRING>} 
     */
    OptionsText {
        get => this.get_OptionsText()
        set => this.put_OptionsText(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomcombobox.selected
     * @type {Integer} 
     */
    Selected {
        get => this.get_Selected()
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomcombobox.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomcombobox.compulsory
     * @type {Boolean} 
     */
    Compulsory {
        get => this.get_Compulsory()
        set => this.put_Compulsory(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomcombobox.bordered
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
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnCustomComboBox")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {IVectorView<HSTRING>} value 
     * @returns {HRESULT} 
     */
    put_OptionsText(value) {
        if (!this.HasProp("__IVpnCustomComboBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomComboBox := IVpnCustomComboBox(outPtr)
        }

        return this.__IVpnCustomComboBox.put_OptionsText(value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_OptionsText() {
        if (!this.HasProp("__IVpnCustomComboBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomComboBox := IVpnCustomComboBox(outPtr)
        }

        return this.__IVpnCustomComboBox.get_OptionsText()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Selected() {
        if (!this.HasProp("__IVpnCustomComboBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomComboBox := IVpnCustomComboBox(outPtr)
        }

        return this.__IVpnCustomComboBox.get_Selected()
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
