#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationPropertiesStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPropertiesStatics5
     * @type {Guid}
     */
    static IID => Guid("{0be35b26-c8f9-41a2-b4db-e6a7a32b0c34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPeripheralProperty", "GetIsPeripheral", "SetIsPeripheral", "get_IsDataValidForFormProperty", "GetIsDataValidForForm", "SetIsDataValidForForm", "get_FullDescriptionProperty", "GetFullDescription", "SetFullDescription", "get_LocalizedControlTypeProperty", "GetLocalizedControlType", "SetLocalizedControlType", "get_DescribedByProperty", "GetDescribedBy", "get_FlowsToProperty", "GetFlowsTo", "get_FlowsFromProperty", "GetFlowsFrom"]

    /**
     * @type {DependencyProperty} 
     */
    IsPeripheralProperty {
        get => this.get_IsPeripheralProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsDataValidForFormProperty {
        get => this.get_IsDataValidForFormProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FullDescriptionProperty {
        get => this.get_FullDescriptionProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LocalizedControlTypeProperty {
        get => this.get_LocalizedControlTypeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DescribedByProperty {
        get => this.get_DescribedByProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FlowsToProperty {
        get => this.get_FlowsToProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FlowsFromProperty {
        get => this.get_FlowsFromProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsPeripheralProperty() {
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
    GetIsPeripheral(element) {
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
    SetIsPeripheral(element, value) {
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
    get_IsDataValidForFormProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
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
    GetIsDataValidForForm(element) {
        result := ComCall(10, this, "ptr", element, "int*", &result_ := 0, "int")
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
    SetIsDataValidForForm(element, value) {
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
    get_FullDescriptionProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {HSTRING} 
     */
    GetFullDescription(element) {
        result_ := HSTRING()
        result := ComCall(13, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetFullDescription(element, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LocalizedControlTypeProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {HSTRING} 
     */
    GetLocalizedControlType(element) {
        result_ := HSTRING()
        result := ComCall(16, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetLocalizedControlType(element, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(17, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DescribedByProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {IVector<DependencyObject>} 
     */
    GetDescribedBy(element) {
        result := ComCall(19, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(DependencyObject, result_)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FlowsToProperty() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {IVector<DependencyObject>} 
     */
    GetFlowsTo(element) {
        result := ComCall(21, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(DependencyObject, result_)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FlowsFromProperty() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {IVector<DependencyObject>} 
     */
    GetFlowsFrom(element) {
        result := ComCall(23, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(DependencyObject, result_)
    }
}
