#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\VisualStateGroup.ahk
#Include .\DependencyProperty.ahk
#Include .\VisualStateManager.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IVisualStateManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualStateManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{01d0e9e0-d713-414e-a74e-e63ec7ac8c3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVisualStateGroups", "get_CustomVisualStateManagerProperty", "GetCustomVisualStateManager", "SetCustomVisualStateManager", "GoToState"]

    /**
     * @type {DependencyProperty} 
     */
    CustomVisualStateManagerProperty {
        get => this.get_CustomVisualStateManagerProperty()
    }

    /**
     * 
     * @param {FrameworkElement} obj 
     * @returns {IVector<VisualStateGroup>} 
     */
    GetVisualStateGroups(obj) {
        result := ComCall(6, this, "ptr", obj, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VisualStateGroup, result_)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CustomVisualStateManagerProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {FrameworkElement} obj 
     * @returns {VisualStateManager} 
     */
    GetCustomVisualStateManager(obj) {
        result := ComCall(8, this, "ptr", obj, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VisualStateManager(result_)
    }

    /**
     * 
     * @param {FrameworkElement} obj 
     * @param {VisualStateManager} value 
     * @returns {HRESULT} 
     */
    SetCustomVisualStateManager(obj, value) {
        result := ComCall(9, this, "ptr", obj, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Control} control_ 
     * @param {HSTRING} stateName 
     * @param {Boolean} useTransitions 
     * @returns {Boolean} 
     */
    GoToState(control_, stateName, useTransitions) {
        if(stateName is String) {
            pin := HSTRING.Create(stateName)
            stateName := pin.Value
        }
        stateName := stateName is Win32Handle ? NumGet(stateName, "ptr") : stateName

        result := ComCall(10, this, "ptr", control_, "ptr", stateName, "int", useTransitions, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
