#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationPropertiesStatics9 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPropertiesStatics9
     * @type {Guid}
     */
    static IID => Guid("{2f20b1d1-87b2-5562-8077-da593edafd2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AutomationControlTypeProperty", "GetAutomationControlType", "SetAutomationControlType"]

    /**
     * @type {DependencyProperty} 
     */
    AutomationControlTypeProperty {
        get => this.get_AutomationControlTypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AutomationControlTypeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
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
    GetAutomationControlType(element) {
        result := ComCall(7, this, "ptr", element, "int*", &result_ := 0, "int")
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
    SetAutomationControlType(element, value) {
        result := ComCall(8, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
