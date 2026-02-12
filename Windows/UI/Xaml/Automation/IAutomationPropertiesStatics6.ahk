#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationPropertiesStatics6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPropertiesStatics6
     * @type {Guid}
     */
    static IID => Guid("{c61e030f-eb49-4e5d-b012-4c1c96c3901b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CultureProperty", "GetCulture", "SetCulture"]

    /**
     * @type {DependencyProperty} 
     */
    CultureProperty {
        get => this.get_CultureProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CultureProperty() {
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
    GetCulture(element) {
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
    SetCulture(element, value) {
        result := ComCall(8, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
