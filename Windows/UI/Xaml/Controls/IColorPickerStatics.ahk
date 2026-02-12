#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IColorPickerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorPickerStatics
     * @type {Guid}
     */
    static IID => Guid("{67ca9be7-1574-451a-b6df-fe57d9d07b46}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ColorProperty", "get_PreviousColorProperty", "get_IsAlphaEnabledProperty", "get_IsColorSpectrumVisibleProperty", "get_IsColorPreviewVisibleProperty", "get_IsColorSliderVisibleProperty", "get_IsAlphaSliderVisibleProperty", "get_IsMoreButtonVisibleProperty", "get_IsColorChannelTextInputVisibleProperty", "get_IsAlphaTextInputVisibleProperty", "get_IsHexInputVisibleProperty", "get_MinHueProperty", "get_MaxHueProperty", "get_MinSaturationProperty", "get_MaxSaturationProperty", "get_MinValueProperty", "get_MaxValueProperty", "get_ColorSpectrumShapeProperty", "get_ColorSpectrumComponentsProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ColorProperty {
        get => this.get_ColorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PreviousColorProperty {
        get => this.get_PreviousColorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsAlphaEnabledProperty {
        get => this.get_IsAlphaEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsColorSpectrumVisibleProperty {
        get => this.get_IsColorSpectrumVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsColorPreviewVisibleProperty {
        get => this.get_IsColorPreviewVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsColorSliderVisibleProperty {
        get => this.get_IsColorSliderVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsAlphaSliderVisibleProperty {
        get => this.get_IsAlphaSliderVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsMoreButtonVisibleProperty {
        get => this.get_IsMoreButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsColorChannelTextInputVisibleProperty {
        get => this.get_IsColorChannelTextInputVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsAlphaTextInputVisibleProperty {
        get => this.get_IsAlphaTextInputVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsHexInputVisibleProperty {
        get => this.get_IsHexInputVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinHueProperty {
        get => this.get_MinHueProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxHueProperty {
        get => this.get_MaxHueProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinSaturationProperty {
        get => this.get_MinSaturationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxSaturationProperty {
        get => this.get_MaxSaturationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinValueProperty {
        get => this.get_MinValueProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxValueProperty {
        get => this.get_MaxValueProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ColorSpectrumShapeProperty {
        get => this.get_ColorSpectrumShapeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ColorSpectrumComponentsProperty {
        get => this.get_ColorSpectrumComponentsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ColorProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PreviousColorProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsAlphaEnabledProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsColorSpectrumVisibleProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsColorPreviewVisibleProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsColorSliderVisibleProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsAlphaSliderVisibleProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsMoreButtonVisibleProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsColorChannelTextInputVisibleProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsAlphaTextInputVisibleProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsHexInputVisibleProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MinHueProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MaxHueProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MinSaturationProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MaxSaturationProperty() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MinValueProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MaxValueProperty() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ColorSpectrumShapeProperty() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ColorSpectrumComponentsProperty() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
