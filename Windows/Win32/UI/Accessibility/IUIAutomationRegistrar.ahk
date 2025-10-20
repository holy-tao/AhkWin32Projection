#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for registering new control patterns, properties, and events.
 * @remarks
 * 
  * The <b>IUIAutomationRegistrar</b> interface is exposed by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff384837(v=vs.85)">CUIAutomationRegistrar</a> object. To obtain an instance of this object, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> function with a class ID of <b>CLSID_CUIAutomationRegistrar</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iuiautomationregistrar
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationRegistrar extends IUnknown{
    /**
     * The interface identifier for IUIAutomationRegistrar
     * @type {Guid}
     */
    static IID => Guid("{8609c4ec-4a1a-4d88-a357-5a66e060e1cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UIAutomationPropertyInfo>} property 
     * @param {Pointer<Int32>} propertyId 
     * @returns {HRESULT} 
     */
    RegisterProperty(property, propertyId) {
        result := ComCall(3, this, "ptr", property, "int*", propertyId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UIAutomationEventInfo>} event 
     * @param {Pointer<Int32>} eventId 
     * @returns {HRESULT} 
     */
    RegisterEvent(event, eventId) {
        result := ComCall(4, this, "ptr", event, "int*", eventId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UIAutomationPatternInfo>} pattern 
     * @param {Pointer<Int32>} pPatternId 
     * @param {Pointer<Int32>} pPatternAvailablePropertyId 
     * @param {Integer} propertyIdCount 
     * @param {Pointer<Int32>} pPropertyIds 
     * @param {Integer} eventIdCount 
     * @param {Pointer<Int32>} pEventIds 
     * @returns {HRESULT} 
     */
    RegisterPattern(pattern, pPatternId, pPatternAvailablePropertyId, propertyIdCount, pPropertyIds, eventIdCount, pEventIds) {
        result := ComCall(5, this, "ptr", pattern, "int*", pPatternId, "int*", pPatternAvailablePropertyId, "uint", propertyIdCount, "int*", pPropertyIds, "uint", eventIdCount, "int*", pEventIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
