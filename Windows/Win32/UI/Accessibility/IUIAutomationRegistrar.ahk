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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterProperty", "RegisterEvent", "RegisterPattern"]

    /**
     * 
     * @param {Pointer<UIAutomationPropertyInfo>} property 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iuiautomationregistrar-registerproperty
     */
    RegisterProperty(property) {
        result := ComCall(3, this, "ptr", property, "int*", &propertyId := 0, "HRESULT")
        return propertyId
    }

    /**
     * 
     * @param {Pointer<UIAutomationEventInfo>} event 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iuiautomationregistrar-registerevent
     */
    RegisterEvent(event) {
        result := ComCall(4, this, "ptr", event, "int*", &eventId := 0, "HRESULT")
        return eventId
    }

    /**
     * 
     * @param {Pointer<UIAutomationPatternInfo>} pattern 
     * @param {Pointer<Integer>} pPatternId 
     * @param {Pointer<Integer>} pPatternAvailablePropertyId 
     * @param {Integer} propertyIdCount 
     * @param {Pointer<Integer>} pPropertyIds 
     * @param {Integer} eventIdCount 
     * @param {Pointer<Integer>} pEventIds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iuiautomationregistrar-registerpattern
     */
    RegisterPattern(pattern, pPatternId, pPatternAvailablePropertyId, propertyIdCount, pPropertyIds, eventIdCount, pEventIds) {
        pPatternIdMarshal := pPatternId is VarRef ? "int*" : "ptr"
        pPatternAvailablePropertyIdMarshal := pPatternAvailablePropertyId is VarRef ? "int*" : "ptr"
        pPropertyIdsMarshal := pPropertyIds is VarRef ? "int*" : "ptr"
        pEventIdsMarshal := pEventIds is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pattern, pPatternIdMarshal, pPatternId, pPatternAvailablePropertyIdMarshal, pPatternAvailablePropertyId, "uint", propertyIdCount, pPropertyIdsMarshal, pPropertyIds, "uint", eventIdCount, pEventIdsMarshal, pEventIds, "HRESULT")
        return result
    }
}
