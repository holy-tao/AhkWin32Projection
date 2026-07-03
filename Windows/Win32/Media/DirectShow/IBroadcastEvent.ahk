#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IBroadcastEvent interface enables an object to receive events from another object without setting up a direct connection point. Applications typically do not need to use this interface.
 * @remarks
 * Broadcast events enable communication among DirectShow filters, Video Control features, and Video Control device objects. To send a broadcast event, an object calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ibroadcastevent-fire">IBroadcastEvent::Fire</a> on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/broadcast-service">Broadcast Event Service</a> object. Other objects can listen for events by setting up a connection point with the Broadcast Event Service object. The listener implements <b>IBroadcastEvent</b> and the Broadcast Event Service object calls the listener's <b>Fire</b> method whenever there is a new broadcast event.
 * 
 * Broadcast events are useful for several reasons:
 * 
 * <ul>
 * <li>The DirectShow event mechanism, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediaeventsink">IMediaEventSink</a>, does not support multiple listeners. DirectShow events go onto a queue, and retrieving an event removes it from the queue.</li>
 * <li>COM connection points require the sink object to locate the source object. With broadcast events, the Broadcast Event Service acts as a relay between the source object and the sink object.</li>
 * <li>In a connection point, the source must fire events on the same thread that the sink used to establish the connection, or else marshal the event interface pointer. Filter graphs are multithreaded, so the Broadcast Event Service object implements the necessary marshaling. It uses a background thread to distribute events to all the registered listeners.</li>
 * </ul>
 * The <b>IBroadcastEvent</b> interface is a service, which can be obtained through the Filter Graph Manager's <b>IServiceProvider</b> interface. To do so, call <b>IServiceProvider::QueryService</b> and specify the following values:
 * 
 * <ul>
 * <li>Service identifier: SID_SBroadcastEventService</li>
 * <li>Interface identifier: IID_IBroadcastEvent</li>
 * </ul>
 * A failure code from <b>QueryService</b> indicates that no object has yet registered the Broadcast Event Service object with the Filter Graph Manager. In that case, do the following:
 * 
 * <ol>
 * <li>Create a new Broadcast Event Service object, using <b>CoCreateInstance</b>.</li>
 * <li>Query the Filter Graph Manager for <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iregisterserviceprovider">IRegisterServiceProvider</a>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iregisterserviceprovider-registerservice">IRegisterServiceProvider::RegisterService</a> with the service identifier.</li>
 * </ol>
 * Once you have a pointer to the <b>IBroadcastEvent</b> interface, you can use it either to send events or to sink events. To send events, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ibroadcastevent-fire">Fire</a> method. To sink events, implement <b>IBroadcastEvent</b> on the sink object, query the Broadcast Event Service for <b>IConnectionPoint</b>, and call <b>IConnectionPoint::Advise</b> to establish the connection. For a list of defined broadcast events, see <b>IBroadcastEvent::Fire</b>.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBroadcastEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ibroadcastevent
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBroadcastEvent extends IUnknown {
    /**
     * The interface identifier for IBroadcastEvent
     * @type {Guid}
     */
    static IID := Guid("{3b21263f-26e8-489d-aac4-924f7efd9511}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBroadcastEvent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Fire : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBroadcastEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Fire method fires a broadcast event.
     * @remarks
     * For television tuning, the following event is defined.
     * 
     * <table>
     * <tr>
     * <th>Tuner Event
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>EVENTID_TuningChanged</td>
     * <td>Fired when the tuner changes stations or channels. Defined in Bdamedia.h.</td>
     * </tr>
     * </table>
     *  
     * 
     * For a list of events fired by the TV ratings components, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/tv-ratings-broadcast-events">TV Ratings Broadcast Events</a>.
     * @param {Guid} EventID GUID that specifies the event.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibroadcastevent-fire
     */
    Fire(EventID) {
        result := ComCall(3, this, Guid, EventID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBroadcastEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Fire := CallbackCreate(GetMethod(implObj, "Fire"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Fire)
    }
}
