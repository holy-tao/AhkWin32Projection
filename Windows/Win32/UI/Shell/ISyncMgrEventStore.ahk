#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncMgrEvent.ahk" { ISyncMgrEvent }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumSyncMgrEvents.ahk" { IEnumSyncMgrEvents }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that allow a handler to provide its own event store and manage its own sync events, instead of using the default Sync Center event store. These events are displayed in the Sync Results folder.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Sync Center provides a default event store that handlers can use to report events, which are then displayed in the Sync Results folder. If a component already logs events, it might be more convenient for it to provide its own event store that enumerates events for that handler. The event store in that case would simply translate the event as logged by the component into a form that can be used by Sync Center.
 * 
 * Sync Center requests an event store from a handler by first examining the mask returned by <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities">ISyncMgrHandler::GetCapabilities</a> for the SYNCMGR_HCM_EVENT_STORE flag. If that value is present, Sync Center calls <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> with the SYNCMGR_OBJECTID_EventStore value. The handler can also provide an event store filtered by item by setting the SYNCMGR_ICM_EVENT_STORE flag in the mask returned from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getcapabilities">ISyncMgrSyncItem::GetCapabilities</a>.
 * 
 * If events are added to the event store, the handler (or a related component) should call <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updateevents">ISyncMgrControl::UpdateEvents</a> so that the Sync Results folder and the error counts can be updated.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgreventstore
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrEventStore extends IUnknown {
    /**
     * The interface identifier for ISyncMgrEventStore
     * @type {Guid}
     */
    static IID := Guid("{37e412f9-016e-44c2-81ff-db3add774266}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrEventStore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEventEnumerator : IntPtr
        GetEventCount      : IntPtr
        GetEvent           : IntPtr
        RemoveEvent        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrEventStore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an enumerator for a handler's events.
     * @remarks
     * This method is called by Sync Center when the user navigates to the Sync Results folder or clicks the <b>Errors</b> link for a handler.
     * @returns {IEnumSyncMgrEvents} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-ienumsyncmgrevents">IEnumSyncMgrEvents</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-ienumsyncmgrevents">IEnumSyncMgrEvents</a> instance that can be used to access the handler's events.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgreventstore-geteventenumerator
     */
    GetEventEnumerator() {
        result := ComCall(3, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSyncMgrEvents(ppenum)
    }

    /**
     * Gets the event count.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * A pointer to event count value.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgreventstore-geteventcount
     */
    GetEventCount() {
        result := ComCall(4, this, "uint*", &pcEvents := 0, "HRESULT")
        return pcEvents
    }

    /**
     * Gets a specified event object.
     * @param {Pointer<Guid>} rguidEventID Type: <b>REFGUID</b>
     * 
     * A reference to event <b>GUID</b>.
     * @returns {ISyncMgrEvent} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrevent">ISyncMgrEvent</a>**</b>
     * 
     * The address of <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrevent">ISyncMgrEvent</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgreventstore-getevent
     */
    GetEvent(rguidEventID) {
        result := ComCall(5, this, Guid.Ptr, rguidEventID, "ptr*", &ppEvent := 0, "HRESULT")
        return ISyncMgrEvent(ppEvent)
    }

    /**
     * Removes events, as specified.
     * @param {Pointer<Guid>} pguidEventIDs Type: <b>GUID*</b>
     * 
     * A pointer to event <b>GUID</b>.
     * @param {Integer} cEvents Type: <b>ULONG</b>
     * 
     * The count of events to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgreventstore-removeevent
     */
    RemoveEvent(pguidEventIDs, cEvents) {
        result := ComCall(6, this, Guid.Ptr, pguidEventIDs, "uint", cEvents, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncMgrEventStore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEventEnumerator := CallbackCreate(GetMethod(implObj, "GetEventEnumerator"), flags, 2)
        this.vtbl.GetEventCount := CallbackCreate(GetMethod(implObj, "GetEventCount"), flags, 2)
        this.vtbl.GetEvent := CallbackCreate(GetMethod(implObj, "GetEvent"), flags, 3)
        this.vtbl.RemoveEvent := CallbackCreate(GetMethod(implObj, "RemoveEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEventEnumerator)
        CallbackFree(this.vtbl.GetEventCount)
        CallbackFree(this.vtbl.GetEvent)
        CallbackFree(this.vtbl.RemoveEvent)
    }
}
