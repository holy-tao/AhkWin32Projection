#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IColorSpectrumStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorSpectrumStatics
     * @type {Guid}
     */
    static IID => Guid("{906bee7c-2cee-4e90-968b-f0a5bd691b4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ColorProperty", "get_HsvColorProperty", "get_MinHueProperty", "get_MaxHueProperty", "get_MinSaturationProperty", "get_MaxSaturationProperty", "get_MinValueProperty", "get_MaxValueProperty", "get_ShapeProperty", "get_ComponentsProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ColorProperty {
        get => this.get_ColorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HsvColorProperty {
        get => this.get_HsvColorProperty()
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
    ShapeProperty {
        get => this.get_ShapeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ComponentsProperty {
        get => this.get_ComponentsProperty()
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
    get_HsvColorProperty() {
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
    get_MinHueProperty() {
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
    get_MaxHueProperty() {
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
    get_MinSaturationProperty() {
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
    get_MaxSaturationProperty() {
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
    get_MinValueProperty() {
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
    get_MaxValueProperty() {
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
    get_ShapeProperty() {
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
    get_ComponentsProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
