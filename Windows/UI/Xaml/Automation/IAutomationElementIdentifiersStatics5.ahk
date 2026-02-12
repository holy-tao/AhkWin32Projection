#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationElementIdentifiersStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationElementIdentifiersStatics5
     * @type {Guid}
     */
    static IID => Guid("{986a8206-de59-42f9-a1e7-62b8af9e756d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPeripheralProperty", "get_IsDataValidForFormProperty", "get_FullDescriptionProperty", "get_DescribedByProperty", "get_FlowsToProperty", "get_FlowsFromProperty"]

    /**
     * @type {AutomationProperty} 
     */
    IsPeripheralProperty {
        get => this.get_IsPeripheralProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    IsDataValidForFormProperty {
        get => this.get_IsDataValidForFormProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    FullDescriptionProperty {
        get => this.get_FullDescriptionProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    DescribedByProperty {
        get => this.get_DescribedByProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    FlowsToProperty {
        get => this.get_FlowsToProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    FlowsFromProperty {
        get => this.get_FlowsFromProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_IsPeripheralProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_IsDataValidForFormProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_FullDescriptionProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_DescribedByProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_FlowsToProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_FlowsFromProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
