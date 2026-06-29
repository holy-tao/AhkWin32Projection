#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\StructureChangeType.ahk" { StructureChangeType }
#Import ".\UIA_EVENT_ID.ahk" { UIA_EVENT_ID }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UIA_PROPERTY_ID.ahk" { UIA_PROPERTY_ID }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes methods used by proxy providers to raise events.
 * @remarks
 * The <b>IProxyProviderWinEventSink</b> interface is provided by UIAutomationCore.dll when the framework calls the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iproxyproviderwineventhandler-respondtowinevent">IProxyProviderWinEventHandler::RespondToWinEvent</a> method. The framework stores the events added to the <b>IProxyProviderWinEventSink</b> object. When <b>IProxyProviderWinEventHandler::RespondToWinEvent</b> returns, the framework passes the events back to the client side, where the UI Automation events are actually fired.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iproxyproviderwineventsink
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IProxyProviderWinEventSink extends IUnknown {
    /**
     * The interface identifier for IProxyProviderWinEventSink
     * @type {Guid}
     */
    static IID := Guid("{4fd82b78-a43e-46ac-9803-0a6969c7c183}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProxyProviderWinEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddAutomationPropertyChangedEvent : IntPtr
        AddAutomationEvent                : IntPtr
        AddStructureChangedEvent          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProxyProviderWinEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Raises a property-changed event.
     * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * A pointer to the provider for the element that will raise the event.
     * @param {UIA_PROPERTY_ID} id Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property that is to be changed. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {VARIANT} newValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * The new value for the changed property.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iproxyproviderwineventsink-addautomationpropertychangedevent
     */
    AddAutomationPropertyChangedEvent(pProvider, id, newValue) {
        result := ComCall(3, this, "ptr", pProvider, UIA_PROPERTY_ID, id, VARIANT, newValue, "HRESULT")
        return result
    }

    /**
     * Raises a Microsoft UI Automation event.
     * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * A pointer to the provider for the element that will raise the event.
     * @param {UIA_EVENT_ID} id Type: <b>EVENTID</b>
     * 
     * The identifier of the event that will be raised. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iproxyproviderwineventsink-addautomationevent
     */
    AddAutomationEvent(pProvider, id) {
        result := ComCall(4, this, "ptr", pProvider, UIA_EVENT_ID, id, "HRESULT")
        return result
    }

    /**
     * Raises an event to notify clients that the structure of the UI Automation tree has changed.
     * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * A pointer to the provider of the element that is raising the event.
     * @param {StructureChangeType} _structureChangeType 
     * @param {Pointer<SAFEARRAY>} runtimeId Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * A pointer to the runtime identifiers of the elements that are affected. These IDs enable applications to identify elements that have been removed and are no longer represented by <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> interfaces.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iproxyproviderwineventsink-addstructurechangedevent
     */
    AddStructureChangedEvent(pProvider, _structureChangeType, runtimeId) {
        result := ComCall(5, this, "ptr", pProvider, StructureChangeType, _structureChangeType, SAFEARRAY.Ptr, runtimeId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProxyProviderWinEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddAutomationPropertyChangedEvent := CallbackCreate(GetMethod(implObj, "AddAutomationPropertyChangedEvent"), flags, 4)
        this.vtbl.AddAutomationEvent := CallbackCreate(GetMethod(implObj, "AddAutomationEvent"), flags, 3)
        this.vtbl.AddStructureChangedEvent := CallbackCreate(GetMethod(implObj, "AddStructureChangedEvent"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddAutomationPropertyChangedEvent)
        CallbackFree(this.vtbl.AddAutomationEvent)
        CallbackFree(this.vtbl.AddStructureChangedEvent)
    }
}
