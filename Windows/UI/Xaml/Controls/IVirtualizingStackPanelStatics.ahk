#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IVirtualizingStackPanelStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualizingStackPanelStatics
     * @type {Guid}
     */
    static IID => Guid("{8314e778-91d3-4d56-ac09-223adcd2bd3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AreScrollSnapPointsRegularProperty", "get_OrientationProperty", "get_VirtualizationModeProperty", "GetVirtualizationMode", "SetVirtualizationMode", "get_IsVirtualizingProperty", "GetIsVirtualizing"]

    /**
     * @type {DependencyProperty} 
     */
    AreScrollSnapPointsRegularProperty {
        get => this.get_AreScrollSnapPointsRegularProperty()
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
    VirtualizationModeProperty {
        get => this.get_VirtualizationModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsVirtualizingProperty {
        get => this.get_IsVirtualizingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AreScrollSnapPointsRegularProperty() {
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
    get_OrientationProperty() {
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
    get_VirtualizationModeProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
    GetVirtualizationMode(element) {
        result := ComCall(9, this, "ptr", element, "int*", &result_ := 0, "int")
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
    SetVirtualizationMode(element, value) {
        result := ComCall(10, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsVirtualizingProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} o 
     * @returns {Boolean} 
     */
    GetIsVirtualizing(o) {
        result := ComCall(12, this, "ptr", o, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
