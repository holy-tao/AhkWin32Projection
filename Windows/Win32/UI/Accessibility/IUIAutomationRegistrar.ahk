#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\UIAutomationEventInfo.ahk" { UIAutomationEventInfo }
#Import ".\UIAutomationPatternInfo.ahk" { UIAutomationPatternInfo }
#Import ".\UIAutomationPropertyInfo.ahk" { UIAutomationPropertyInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods for registering new control patterns, properties, and events.
 * @remarks
 * The **IUIAutomationRegistrar** interface is exposed by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff384837(v=vs.85)">CUIAutomationRegistrar</a> object. To obtain an instance of this object, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> function with a class ID of <b>CLSID_CUIAutomationRegistrar</b>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iuiautomationregistrar
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationRegistrar extends IUnknown {
    /**
     * The interface identifier for IUIAutomationRegistrar
     * @type {Guid}
     */
    static IID := Guid("{8609c4ec-4a1a-4d88-a357-5a66e060e1cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationRegistrar interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterProperty : IntPtr
        RegisterEvent    : IntPtr
        RegisterPattern  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationRegistrar.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers a third-party property.
     * @remarks
     * The property ID can be used in various property methods, including <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalue">GetCurrentPropertyValue</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createpropertycondition">CreatePropertyCondition</a>. The same value can be used as a WinEvent value for property change events in <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iaccessibleex">IAccessibleEx</a> implementations.
     * @param {Pointer<UIAutomationPropertyInfo>} _property Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationpropertyinfo">UIAutomationPropertyInfo</a>*</b>
     * 
     * A pointer to a structure that contains information about the property to register.
     * @returns {Integer} Type: <b>PropertyID*</b>
     * 
     * Receives the property ID of the newly registered property.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iuiautomationregistrar-registerproperty
     */
    RegisterProperty(_property) {
        result := ComCall(3, this, UIAutomationPropertyInfo.Ptr, _property, "int*", &propertyId := 0, "HRESULT")
        return propertyId
    }

    /**
     * Registers a third-party Microsoft UI Automation event.
     * @remarks
     * The event ID can be used in various event methods, and as a WinEvent value for events in <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iaccessibleex">IAccessibleEx</a> implementations.
     * @param {Pointer<UIAutomationEventInfo>} event Type: **<a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationeventinfo">UIAutomationEventInfo</a>***
     * 
     * A pointer to a  structure that contains information about the event to register.
     * @returns {Integer} Type: **EVENTID***
     * 
     * Receives the event identifier. For a list of event IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iuiautomationregistrar-registerevent
     */
    RegisterEvent(event) {
        result := ComCall(4, this, UIAutomationEventInfo.Ptr, event, "int*", &eventId := 0, "HRESULT")
        return eventId
    }

    /**
     * Registers a third-party control pattern.
     * @remarks
     * The pattern, property, and event IDs retrieved by this method can be used in <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iaccessibleex">IAccessibleEx</a> implementations.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iuiautomationregistrar-registerpattern
     */
    RegisterPattern(pattern, pPatternId, pPatternAvailablePropertyId, propertyIdCount, pPropertyIds, eventIdCount, pEventIds) {
        pPatternIdMarshal := pPatternId is VarRef ? "int*" : "ptr"
        pPatternAvailablePropertyIdMarshal := pPatternAvailablePropertyId is VarRef ? "int*" : "ptr"
        pPropertyIdsMarshal := pPropertyIds is VarRef ? "int*" : "ptr"
        pEventIdsMarshal := pEventIds is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, UIAutomationPatternInfo.Ptr, pattern, pPatternIdMarshal, pPatternId, pPatternAvailablePropertyIdMarshal, pPatternAvailablePropertyId, "uint", propertyIdCount, pPropertyIdsMarshal, pPropertyIds, "uint", eventIdCount, pEventIdsMarshal, pEventIds, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationRegistrar.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterProperty := CallbackCreate(GetMethod(implObj, "RegisterProperty"), flags, 3)
        this.vtbl.RegisterEvent := CallbackCreate(GetMethod(implObj, "RegisterEvent"), flags, 3)
        this.vtbl.RegisterPattern := CallbackCreate(GetMethod(implObj, "RegisterPattern"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterProperty)
        CallbackFree(this.vtbl.RegisterEvent)
        CallbackFree(this.vtbl.RegisterPattern)
    }
}
