#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IGridStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridStatics
     * @type {Guid}
     */
    static IID => Guid("{64fe2e9f-f951-42b6-a9ce-bb179af11595}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RowProperty", "GetRow", "SetRow", "get_ColumnProperty", "GetColumn", "SetColumn", "get_RowSpanProperty", "GetRowSpan", "SetRowSpan", "get_ColumnSpanProperty", "GetColumnSpan", "SetColumnSpan"]

    /**
     * @type {DependencyProperty} 
     */
    RowProperty {
        get => this.get_RowProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ColumnProperty {
        get => this.get_ColumnProperty()
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
    get_RowProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * GetRows Method Example (VC++)
     * @param {FrameworkElement} element 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/getrows-method-example-vc
     */
    GetRow(element) {
        result := ComCall(7, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {FrameworkElement} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetRow(element, value) {
        result := ComCall(8, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ColumnProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {FrameworkElement} element 
     * @returns {Integer} 
     */
    GetColumn(element) {
        result := ComCall(10, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Learn more about: SetColumnDefaultValueGrbit enumeration
     * @param {FrameworkElement} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/setcolumndefaultvaluegrbit-enumeration
     */
    SetColumn(element, value) {
        result := ComCall(11, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
     * @param {FrameworkElement} element 
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
     * @param {FrameworkElement} element 
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
     * @param {FrameworkElement} element 
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
     * @param {FrameworkElement} element 
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
