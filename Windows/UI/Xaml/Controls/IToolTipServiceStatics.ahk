#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IToolTipServiceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToolTipServiceStatics
     * @type {Guid}
     */
    static IID => Guid("{86e649f8-e245-48aa-a8c8-d1073ed76319}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PlacementProperty", "GetPlacement", "SetPlacement", "get_PlacementTargetProperty", "GetPlacementTarget", "SetPlacementTarget", "get_ToolTipProperty", "GetToolTip", "SetToolTip"]

    /**
     * @type {DependencyProperty} 
     */
    PlacementProperty {
        get => this.get_PlacementProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlacementTargetProperty {
        get => this.get_PlacementTargetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ToolTipProperty {
        get => this.get_ToolTipProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PlacementProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetPlacement(element) {
        result := ComCall(7, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetPlacement(element, value) {
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
    get_PlacementTargetProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {UIElement} 
     */
    GetPlacementTarget(element) {
        result := ComCall(10, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(result_)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    SetPlacementTarget(element, value) {
        result := ComCall(11, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ToolTipProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {IInspectable} 
     */
    GetToolTip(element) {
        result := ComCall(13, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetToolTip(element, value) {
        result := ComCall(14, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
