#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IVariableSizedWrapGridStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVariableSizedWrapGridStatics
     * @type {Guid}
     */
    static IID => Guid("{fe9db859-8127-4aef-b7a2-949847486e96}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemHeightProperty", "get_ItemWidthProperty", "get_OrientationProperty", "get_HorizontalChildrenAlignmentProperty", "get_VerticalChildrenAlignmentProperty", "get_MaximumRowsOrColumnsProperty", "get_RowSpanProperty", "GetRowSpan", "SetRowSpan", "get_ColumnSpanProperty", "GetColumnSpan", "SetColumnSpan"]

    /**
     * @type {DependencyProperty} 
     */
    ItemHeightProperty {
        get => this.get_ItemHeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemWidthProperty {
        get => this.get_ItemWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OrientationProperty {
        get => this.get_OrientationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalChildrenAlignmentProperty {
        get => this.get_HorizontalChildrenAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalChildrenAlignmentProperty {
        get => this.get_VerticalChildrenAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaximumRowsOrColumnsProperty {
        get => this.get_MaximumRowsOrColumnsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RowSpanProperty {
        get => this.get_RowSpanProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ColumnSpanProperty {
        get => this.get_ColumnSpanProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ItemHeightProperty() {
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
    get_ItemWidthProperty() {
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
    get_OrientationProperty() {
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
    get_HorizontalChildrenAlignmentProperty() {
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
    get_VerticalChildrenAlignmentProperty() {
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
    get_MaximumRowsOrColumnsProperty() {
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
    get_RowSpanProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {Integer} 
     */
    GetRowSpan(element) {
        result := ComCall(13, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetRowSpan(element, value) {
        result := ComCall(14, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ColumnSpanProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {Integer} 
     */
    GetColumnSpan(element) {
        result := ComCall(16, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetColumnSpan(element, value) {
        result := ComCall(17, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
