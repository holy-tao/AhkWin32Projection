#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationPropertiesStatics8 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPropertiesStatics8
     * @type {Guid}
     */
    static IID => Guid("{432eca20-171a-560d-8524-3e651d3ad6ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsDialogProperty", "GetIsDialog", "SetIsDialog"]

    /**
     * @type {DependencyProperty} 
     */
    IsDialogProperty {
        get => this.get_IsDialogProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsDialogProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetIsDialog(element) {
        result := ComCall(7, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetIsDialog(element, value) {
        result := ComCall(8, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
