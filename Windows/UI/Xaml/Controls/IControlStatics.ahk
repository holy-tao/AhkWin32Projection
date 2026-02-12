#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IControlStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlStatics
     * @type {Guid}
     */
    static IID => Guid("{473b305b-877d-4c35-8fca-46a05f96607a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FontSizeProperty", "get_FontFamilyProperty", "get_FontWeightProperty", "get_FontStyleProperty", "get_FontStretchProperty", "get_CharacterSpacingProperty", "get_ForegroundProperty", "get_IsTabStopProperty", "get_IsEnabledProperty", "get_TabIndexProperty", "get_TabNavigationProperty", "get_TemplateProperty", "get_PaddingProperty", "get_HorizontalContentAlignmentProperty", "get_VerticalContentAlignmentProperty", "get_BackgroundProperty", "get_BorderThicknessProperty", "get_BorderBrushProperty", "get_DefaultStyleKeyProperty", "get_FocusStateProperty"]

    /**
     * @type {DependencyProperty} 
     */
    FontSizeProperty {
        get => this.get_FontSizeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontFamilyProperty {
        get => this.get_FontFamilyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontWeightProperty {
        get => this.get_FontWeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontStyleProperty {
        get => this.get_FontStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontStretchProperty {
        get => this.get_FontStretchProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CharacterSpacingProperty {
        get => this.get_CharacterSpacingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ForegroundProperty {
        get => this.get_ForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsTabStopProperty {
        get => this.get_IsTabStopProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsEnabledProperty {
        get => this.get_IsEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TabIndexProperty {
        get => this.get_TabIndexProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TabNavigationProperty {
        get => this.get_TabNavigationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TemplateProperty {
        get => this.get_TemplateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PaddingProperty {
        get => this.get_PaddingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalContentAlignmentProperty {
        get => this.get_HorizontalContentAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalContentAlignmentProperty {
        get => this.get_VerticalContentAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BackgroundProperty {
        get => this.get_BackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BorderThicknessProperty {
        get => this.get_BorderThicknessProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BorderBrushProperty {
        get => this.get_BorderBrushProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DefaultStyleKeyProperty {
        get => this.get_DefaultStyleKeyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FocusStateProperty {
        get => this.get_FocusStateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FontSizeProperty() {
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
    get_FontFamilyProperty() {
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
    get_FontWeightProperty() {
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
    get_FontStyleProperty() {
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
    get_FontStretchProperty() {
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
    get_CharacterSpacingProperty() {
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
    get_ForegroundProperty() {
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
    get_IsTabStopProperty() {
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
    get_IsEnabledProperty() {
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
    get_TabIndexProperty() {
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
    get_TabNavigationProperty() {
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
    get_TemplateProperty() {
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
    get_PaddingProperty() {
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
    get_HorizontalContentAlignmentProperty() {
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
    get_VerticalContentAlignmentProperty() {
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
    get_BackgroundProperty() {
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
    get_BorderThicknessProperty() {
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
    get_BorderBrushProperty() {
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
    get_DefaultStyleKeyProperty() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FocusStateProperty() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
