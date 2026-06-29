#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\UIA_EVENT_ID.ahk" { UIA_EVENT_ID }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes methods that are called to notify the root element of a fragment when a Microsoft UI Automation client application begins or ends listening for events on that fragment.
 * @remarks
 * Implementation of this interface is optional. It can be used to improve performance by raising events only when they are being listened for.
 * 	
 * 
 * Similar to implementing reference counting in Component Object Model (COM) programming, it is important for UI Automation providers to treat the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementprovideradviseevents-adviseeventadded">AdviseEventAdded</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementprovideradviseevents-adviseeventremoved">AdviseEventRemoved</a> methods like the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> and <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> methods of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
 * As long as <b>AdviseEventAdded</b> has been called more times than <b>AdviseEventRemoved</b> for a specific event or property, the provider should continue to raise corresponding events, because some clients are still listening. Alternatively, UI Automation providers can use the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaclientsarelistening">UiaClientsAreListening</a> function to determine if at least one client is listening and, if so, raise all appropriate events.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementprovideradviseevents
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IRawElementProviderAdviseEvents extends IUnknown {
    /**
     * The interface identifier for IRawElementProviderAdviseEvents
     * @type {Guid}
     */
    static IID := Guid("{a407b27b-0f6d-4427-9292-473c7bf93258}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRawElementProviderAdviseEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AdviseEventAdded   : IntPtr
        AdviseEventRemoved : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRawElementProviderAdviseEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the Microsoft UI Automation provider when a UI Automation client begins listening for a specific event, including a property-changed event.
     * @remarks
     * This method enables the provider to reduce overhead by raising only events 
     * 			that are being listened for.
     * 
     * It is important for UI Automation providers to treat the <b>IRawElementProviderAdviseEvents::AdviseEventAdded</b> like the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. As long as <b>AdviseEventAdded</b> has been called more times than <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementprovideradviseevents-adviseeventremoved">AdviseEventRemoved</a> for a specific event or property, the provider should continue to raise corresponding events, because some clients are still listening. Alternatively, UI Automation providers can use the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaclientsarelistening">UiaClientsAreListening</a> function to determine if at least one client is listening and, if so, raise all appropriate events.
     * @param {UIA_EVENT_ID} eventId Type: <b>EVENTID</b>
     * 
     * The identifier of the event being added. For a list of event IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @param {Pointer<SAFEARRAY>} propertyIDs Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * A pointer to the identifiers of properties being added, or <b>NULL</b> if the event listener 
     * 				being added is not listening for property events.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementprovideradviseevents-adviseeventadded
     */
    AdviseEventAdded(eventId, propertyIDs) {
        result := ComCall(3, this, UIA_EVENT_ID, eventId, SAFEARRAY.Ptr, propertyIDs, "HRESULT")
        return result
    }

    /**
     * Notifies the Microsoft UI Automation provider when a UI Automation client stops listening for a specific event, including a property-changed event.
     * @remarks
     * This method enables the provider to reduce overhead by raising only events that are being listened for.
     * 
     * It is important for UI Automation providers to treat the <b>IRawElementProviderAdviseEvents::AdviseEventRemoved</b> like the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. As long as <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementprovideradviseevents-adviseeventadded">AdviseEventAdded</a> has been called more times than <b>AdviseEventRemoved</b> for a specific event or property, the provider should continue to raise corresponding events, because some clients are still listening. Alternatively, UI Automation providers can use the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaclientsarelistening">UiaClientsAreListening</a> function to determine if at least one client is listening and, if so, raise all appropriate events.
     * @param {UIA_EVENT_ID} eventId Type: <b>EVENTID</b>
     * 
     * The identifier of the event being removed. For a list of event IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @param {Pointer<SAFEARRAY>} propertyIDs Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * A pointer to the identifiers of the properties being removed, or <b>NULL</b> if the event listener being removed is not listening for property events.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementprovideradviseevents-adviseeventremoved
     */
    AdviseEventRemoved(eventId, propertyIDs) {
        result := ComCall(4, this, UIA_EVENT_ID, eventId, SAFEARRAY.Ptr, propertyIDs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRawElementProviderAdviseEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AdviseEventAdded := CallbackCreate(GetMethod(implObj, "AdviseEventAdded"), flags, 3)
        this.vtbl.AdviseEventRemoved := CallbackCreate(GetMethod(implObj, "AdviseEventRemoved"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AdviseEventAdded)
        CallbackFree(this.vtbl.AdviseEventRemoved)
    }
}
