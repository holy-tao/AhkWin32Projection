#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnCustomCheckBox.ahk
#Include .\IVpnCustomPrompt.ahk
#Include ..\..\..\Guid.ahk

/**
 * **VpnCustomCheckBox** is not supported and may be altered or unavailable in the future. Instead, use [VpnCustomPromptBooleanInput](vpncustompromptbooleaninput.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomcheckbox
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnCustomCheckBox extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnCustomCheckBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnCustomCheckBox.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomcheckbox.initialcheckstate
     * @type {Boolean} 
     */
    InitialCheckState {
        get => this.get_InitialCheckState()
        set => this.put_InitialCheckState(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomcheckbox.checked
     * @type {Boolean} 
     */
    Checked {
        get => this.get_Checked()
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomcheckbox.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomcheckbox.compulsory
     * @type {Boolean} 
     */
    Compulsory {
        get => this.get_Compulsory()
        set => this.put_Compulsory(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncustomcheckbox.bordered
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
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnCustomCheckBox")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_InitialCheckState(value) {
        if (!this.HasProp("__IVpnCustomCheckBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomCheckBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomCheckBox := IVpnCustomCheckBox(outPtr)
        }

        return this.__IVpnCustomCheckBox.put_InitialCheckState(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InitialCheckState() {
        if (!this.HasProp("__IVpnCustomCheckBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomCheckBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomCheckBox := IVpnCustomCheckBox(outPtr)
        }

        return this.__IVpnCustomCheckBox.get_InitialCheckState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Checked() {
        if (!this.HasProp("__IVpnCustomCheckBox")) {
            if ((queryResult := this.QueryInterface(IVpnCustomCheckBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCustomCheckBox := IVpnCustomCheckBox(outPtr)
        }

        return this.__IVpnCustomCheckBox.get_Checked()
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
