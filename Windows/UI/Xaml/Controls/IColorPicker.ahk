#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Color.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IColorPicker extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorPicker
     * @type {Guid}
     */
    static IID => Guid("{6232e371-5c64-43cb-8b35-7f82dde36740}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Color", "put_Color", "get_PreviousColor", "put_PreviousColor", "get_IsAlphaEnabled", "put_IsAlphaEnabled", "get_IsColorSpectrumVisible", "put_IsColorSpectrumVisible", "get_IsColorPreviewVisible", "put_IsColorPreviewVisible", "get_IsColorSliderVisible", "put_IsColorSliderVisible", "get_IsAlphaSliderVisible", "put_IsAlphaSliderVisible", "get_IsMoreButtonVisible", "put_IsMoreButtonVisible", "get_IsColorChannelTextInputVisible", "put_IsColorChannelTextInputVisible", "get_IsAlphaTextInputVisible", "put_IsAlphaTextInputVisible", "get_IsHexInputVisible", "put_IsHexInputVisible", "get_MinHue", "put_MinHue", "get_MaxHue", "put_MaxHue", "get_MinSaturation", "put_MinSaturation", "get_MaxSaturation", "put_MaxSaturation", "get_MinValue", "put_MinValue", "get_MaxValue", "put_MaxValue", "get_ColorSpectrumShape", "put_ColorSpectrumShape", "get_ColorSpectrumComponents", "put_ColorSpectrumComponents", "add_ColorChanged", "remove_ColorChanged"]

    /**
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    PreviousColor {
        get => this.get_PreviousColor()
        set => this.put_PreviousColor(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAlphaEnabled {
        get => this.get_IsAlphaEnabled()
        set => this.put_IsAlphaEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsColorSpectrumVisible {
        get => this.get_IsColorSpectrumVisible()
        set => this.put_IsColorSpectrumVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsColorPreviewVisible {
        get => this.get_IsColorPreviewVisible()
        set => this.put_IsColorPreviewVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsColorSliderVisible {
        get => this.get_IsColorSliderVisible()
        set => this.put_IsColorSliderVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAlphaSliderVisible {
        get => this.get_IsAlphaSliderVisible()
        set => this.put_IsAlphaSliderVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsMoreButtonVisible {
        get => this.get_IsMoreButtonVisible()
        set => this.put_IsMoreButtonVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsColorChannelTextInputVisible {
        get => this.get_IsColorChannelTextInputVisible()
        set => this.put_IsColorChannelTextInputVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAlphaTextInputVisible {
        get => this.get_IsAlphaTextInputVisible()
        set => this.put_IsAlphaTextInputVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsHexInputVisible {
        get => this.get_IsHexInputVisible()
        set => this.put_IsHexInputVisible(value)
    }

    /**
     * @type {Integer} 
     */
    MinHue {
        get => this.get_MinHue()
        set => this.put_MinHue(value)
    }

    /**
     * @type {Integer} 
     */
    MaxHue {
        get => this.get_MaxHue()
        set => this.put_MaxHue(value)
    }

    /**
     * @type {Integer} 
     */
    MinSaturation {
        get => this.get_MinSaturation()
        set => this.put_MinSaturation(value)
    }

    /**
     * @type {Integer} 
     */
    MaxSaturation {
        get => this.get_MaxSaturation()
        set => this.put_MaxSaturation(value)
    }

    /**
     * @type {Integer} 
     */
    MinValue {
        get => this.get_MinValue()
        set => this.put_MinValue(value)
    }

    /**
     * @type {Integer} 
     */
    MaxValue {
        get => this.get_MaxValue()
        set => this.put_MaxValue(value)
    }

    /**
     * @type {Integer} 
     */
    ColorSpectrumShape {
        get => this.get_ColorSpectrumShape()
        set => this.put_ColorSpectrumShape(value)
    }

    /**
     * @type {Integer} 
     */
    ColorSpectrumComponents {
        get => this.get_ColorSpectrumComponents()
        set => this.put_ColorSpectrumComponents(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        value := Color()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_PreviousColor() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_PreviousColor(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAlphaEnabled() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAlphaEnabled(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorSpectrumVisible() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorSpectrumVisible(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorPreviewVisible() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorPreviewVisible(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorSliderVisible() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorSliderVisible(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAlphaSliderVisible() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAlphaSliderVisible(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMoreButtonVisible() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMoreButtonVisible(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorChannelTextInputVisible() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorChannelTextInputVisible(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAlphaTextInputVisible() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAlphaTextInputVisible(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHexInputVisible() {
        result := ComCall(26, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHexInputVisible(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinHue() {
        result := ComCall(28, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinHue(value) {
        result := ComCall(29, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxHue() {
        result := ComCall(30, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxHue(value) {
        result := ComCall(31, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinSaturation() {
        result := ComCall(32, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinSaturation(value) {
        result := ComCall(33, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxSaturation() {
        result := ComCall(34, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxSaturation(value) {
        result := ComCall(35, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinValue() {
        result := ComCall(36, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinValue(value) {
        result := ComCall(37, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxValue() {
        result := ComCall(38, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxValue(value) {
        result := ComCall(39, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorSpectrumShape() {
        result := ComCall(40, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorSpectrumShape(value) {
        result := ComCall(41, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorSpectrumComponents() {
        result := ComCall(42, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorSpectrumComponents(value) {
        result := ComCall(43, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ColorPicker, ColorChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ColorChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(44, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ColorChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(45, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
