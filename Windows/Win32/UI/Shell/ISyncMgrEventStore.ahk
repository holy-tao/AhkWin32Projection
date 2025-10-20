#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow a handler to provide its own event store and manage its own sync events, instead of using the default Sync Center event store. These events are displayed in the Sync Results folder.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Sync Center provides a default event store that handlers can use to report events, which are then displayed in the Sync Results folder. If a component already logs events, it might be more convenient for it to provide its own event store that enumerates events for that handler. The event store in that case would simply translate the event as logged by the component into a form that can be used by Sync Center.
  * 
  * Sync Center requests an event store from a handler by first examining the mask returned by <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities">ISyncMgrHandler::GetCapabilities</a> for the SYNCMGR_HCM_EVENT_STORE flag. If that value is present, Sync Center calls <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> with the SYNCMGR_OBJECTID_EventStore value. The handler can also provide an event store filtered by item by setting the SYNCMGR_ICM_EVENT_STORE flag in the mask returned from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getcapabilities">ISyncMgrSyncItem::GetCapabilities</a>.
  * 
  * If events are added to the event store, the handler (or a related component) should call <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updateevents">ISyncMgrControl::UpdateEvents</a> so that the Sync Results folder and the error counts can be updated.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgreventstore
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrEventStore extends IUnknown{
    /**
     * The interface identifier for ISyncMgrEventStore
     * @type {Guid}
     */
    static IID => Guid("{37e412f9-016e-44c2-81ff-db3add774266}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumSyncMgrEvents>} ppenum 
     * @returns {HRESULT} 
     */
    GetEventEnumerator(ppenum) {
        result := ComCall(3, this, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcEvents 
     * @returns {HRESULT} 
     */
    GetEventCount(pcEvents) {
        result := ComCall(4, this, "uint*", pcEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidEventID 
     * @param {Pointer<ISyncMgrEvent>} ppEvent 
     * @returns {HRESULT} 
     */
    GetEvent(rguidEventID, ppEvent) {
        result := ComCall(5, this, "ptr", rguidEventID, "ptr", ppEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidEventIDs 
     * @param {Integer} cEvents 
     * @returns {HRESULT} 
     */
    RemoveEvent(pguidEventIDs, cEvents) {
        result := ComCall(6, this, "ptr", pguidEventIDs, "uint", cEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
