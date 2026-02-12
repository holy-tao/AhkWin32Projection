#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICanvasStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICanvasStatics
     * @type {Guid}
     */
    static IID => Guid("{40ce5c46-2962-446f-aafb-4cdc486939c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LeftProperty", "GetLeft", "SetLeft", "get_TopProperty", "GetTop", "SetTop", "get_ZIndexProperty", "GetZIndex", "SetZIndex"]

    /**
     * @type {DependencyProperty} 
     */
    LeftProperty {
        get => this.get_LeftProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TopProperty {
        get => this.get_TopProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ZIndexProperty {
        get => this.get_ZIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LeftProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * Gets the left separator for the recognizer context.
     * @param {UIElement} element 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/recapis/nf-recapis-getleftseparator
     */
    GetLeft(element) {
        result := ComCall(7, this, "ptr", element, "double*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Float} length 
     * @returns {HRESULT} 
     */
    SetLeft(element, length) {
        result := ComCall(8, this, "ptr", element, "double", length, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TopProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * Examines the Z order of the child windows associated with the specified parent window and retrieves a handle to the child window at the top of the Z order.
     * @param {UIElement} element 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-gettopwindow
     */
    GetTop(element) {
        result := ComCall(10, this, "ptr", element, "double*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Float} length 
     * @returns {HRESULT} 
     */
    SetTop(element, length) {
        result := ComCall(11, this, "ptr", element, "double", length, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ZIndexProperty() {
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
    GetZIndex(element) {
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
    SetZIndex(element, value) {
        result := ComCall(14, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
