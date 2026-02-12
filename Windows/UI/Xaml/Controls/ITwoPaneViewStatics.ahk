#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITwoPaneViewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITwoPaneViewStatics
     * @type {Guid}
     */
    static IID => Guid("{5a35c389-85c4-55f4-abb1-97451bc32d71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Pane1Property", "get_Pane2Property", "get_Pane1LengthProperty", "get_Pane2LengthProperty", "get_PanePriorityProperty", "get_ModeProperty", "get_WideModeConfigurationProperty", "get_TallModeConfigurationProperty", "get_MinWideModeWidthProperty", "get_MinTallModeHeightProperty"]

    /**
     * @type {DependencyProperty} 
     */
    Pane1Property {
        get => this.get_Pane1Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    Pane2Property {
        get => this.get_Pane2Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    Pane1LengthProperty {
        get => this.get_Pane1LengthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    Pane2LengthProperty {
        get => this.get_Pane2LengthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PanePriorityProperty {
        get => this.get_PanePriorityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ModeProperty {
        get => this.get_ModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    WideModeConfigurationProperty {
        get => this.get_WideModeConfigurationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TallModeConfigurationProperty {
        get => this.get_TallModeConfigurationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinWideModeWidthProperty {
        get => this.get_MinWideModeWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinTallModeHeightProperty {
        get => this.get_MinTallModeHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_Pane1Property() {
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
    get_Pane2Property() {
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
    get_Pane1LengthProperty() {
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
    get_Pane2LengthProperty() {
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
    get_PanePriorityProperty() {
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
    get_ModeProperty() {
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
    get_WideModeConfigurationProperty() {
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
    get_TallModeConfigurationProperty() {
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
    get_MinWideModeWidthProperty() {
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
    get_MinTallModeHeightProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
