#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationCondition.ahk

/**
 * Represents a condition based on a property value that is used to find UI Automation elements.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationpropertycondition
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationPropertyCondition extends IUIAutomationCondition{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationPropertyCondition
     * @type {Guid}
     */
    static IID => Guid("{99ebf2cb-5578-4267-9ad4-afd6ea77e94b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PropertyId", "get_PropertyValue", "get_PropertyConditionFlags"]

    /**
     * 
     * @param {Pointer<Integer>} propertyId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationpropertycondition-get_propertyid
     */
    get_PropertyId(propertyId) {
        propertyIdMarshal := propertyId is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, propertyIdMarshal, propertyId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationpropertycondition-get_propertyvalue
     */
    get_PropertyValue(propertyValue) {
        result := ComCall(4, this, "ptr", propertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationpropertycondition-get_propertyconditionflags
     */
    get_PropertyConditionFlags(flags) {
        flagsMarshal := flags is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, flagsMarshal, flags, "HRESULT")
        return result
    }
}
