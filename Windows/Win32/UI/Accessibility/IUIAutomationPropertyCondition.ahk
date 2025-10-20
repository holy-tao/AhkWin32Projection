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
     * 
     * @param {Pointer<Int32>} propertyId 
     * @returns {HRESULT} 
     */
    get_PropertyId(propertyId) {
        result := ComCall(3, this, "int*", propertyId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     */
    get_PropertyValue(propertyValue) {
        result := ComCall(4, this, "ptr", propertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    get_PropertyConditionFlags(flags) {
        result := ComCall(5, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
