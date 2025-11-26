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
     * Registers a third-party property.
     * @param {Pointer<UIAutomationPropertyInfo>} property Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationpropertyinfo">UIAutomationPropertyInfo</a>*</b>
     * 
     * A pointer to a structure that contains information about the property to register.
     * @returns {Integer} Type: <b>PropertyID*</b>
     * 
     * Receives the property ID of the newly registered property.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iuiautomationregistrar-registerproperty
     */
    RegisterProperty(property) {
        result := ComCall(3, this, "ptr", property, "int*", &propertyId := 0, "HRESULT")
        return propertyId
    }

    /**
     * Registers a third-party Microsoft UI Automation event.
     * @param {Pointer<UIAutomationEventInfo>} event Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationeventinfo">UIAutomationEventInfo</a>*</b>
     * 
     * A pointer to a  structure that contains information about the event to register.
     * @returns {Integer} Type: <b>EVENTID*</b>
     * 
     * Receives the event identifier. For a list of event IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iuiautomationregistrar-registerevent
     */
    RegisterEvent(event) {
        result := ComCall(4, this, "ptr", event, "int*", &eventId := 0, "HRESULT")
        return eventId
    }

    /**
     * Registers a third-party control pattern.
     * @param {Pointer<UIAutomationPatternInfo>} pattern Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationpatterninfo">UIAutomationPatternInfo</a>*</b>
     * 
     * A pointer to a structure that contains information about the control pattern to register.
     * @param {Pointer<Integer>} pPatternId Type: <b>PATTERNID*</b>
     * 
     * Receives the pattern identifier.
     * @param {Pointer<Integer>} pPatternAvailablePropertyId Type: <b>PROPERTYID*</b>
     * 
     * Receives the property identifier for the pattern.  This value can be used with UI Automation client methods to determine whether the element supports the new pattern. This is equivalent to values such as <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-control-pattern-availability-propids">UIA_IsInvokePatternAvailablePropertyId</a>.
     * @param {Integer} propertyIdCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of properties supported by the control pattern.
     * @param {Pointer<Integer>} pPropertyIds Type: <b>PROPERTYID*</b>
     * 
     * Receives an array of identifiers for properties supported by the pattern.
     * @param {Integer} eventIdCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of events supported by the control pattern.
     * @param {Pointer<Integer>} pEventIds Type: <b>EVENTID*</b>
     * 
     * Receives an array of identifiers for events that are raised by the pattern.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iuiautomationregistrar-registerpattern
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
