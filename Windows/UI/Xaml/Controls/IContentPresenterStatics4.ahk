#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentPresenterStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPresenterStatics4
     * @type {Guid}
     */
    static IID => Guid("{ff8be292-af28-47eb-a5c3-dc44ced40fd2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextWrappingProperty", "get_MaxLinesProperty", "get_LineStackingStrategyProperty", "get_LineHeightProperty", "get_BorderBrushProperty", "get_BorderThicknessProperty", "get_CornerRadiusProperty", "get_PaddingProperty", "get_BackgroundProperty", "get_HorizontalContentAlignmentProperty", "get_VerticalContentAlignmentProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TextWrappingProperty {
        get => this.get_TextWrappingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxLinesProperty {
        get => this.get_MaxLinesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LineStackingStrategyProperty {
        get => this.get_LineStackingStrategyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LineHeightProperty {
        get => this.get_LineHeightProperty()
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
    BorderThicknessProperty {
        get => this.get_BorderThicknessProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CornerRadiusProperty {
        get => this.get_CornerRadiusProperty()
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
    BackgroundProperty {
        get => this.get_BackgroundProperty()
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
     * 
     * @returns {DependencyProperty} 
     */
    get_TextWrappingProperty() {
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
    get_MaxLinesProperty() {
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
    get_LineStackingStrategyProperty() {
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
    get_LineHeightProperty() {
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
    get_BorderBrushProperty() {
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
    get_BorderThicknessProperty() {
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
    get_CornerRadiusProperty() {
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
    get_PaddingProperty() {
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
    get_BackgroundProperty() {
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
    get_HorizontalContentAlignmentProperty() {
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
    get_VerticalContentAlignmentProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
