#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFAsyncCallback.ahk" { IMFAsyncCallback }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import ".\IMFAsyncResult.ahk" { IMFAsyncResult }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMediaEvent.ahk" { IMFMediaEvent }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MEDIA_EVENT_GENERATOR_GET_EVENT_FLAGS.ahk" { MEDIA_EVENT_GENERATOR_GET_EVENT_FLAGS }

/**
 * Retrieves events from any Media Foundation object that generates events.
 * @remarks
 * An object that supports this interface maintains a queue of events. The client of the object can retrieve the events either synchronously or asynchronously. The synchronous method is <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-getevent">GetEvent</a>. The asynchronous methods are <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-begingetevent">BeginGetEvent</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-endgetevent">EndGetEvent</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfmediaeventgenerator
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEventGenerator extends IUnknown {
    /**
     * The interface identifier for IMFMediaEventGenerator
     * @type {Guid}
     */
    static IID := Guid("{2cd0bd52-bcd5-4b89-b62c-eadc0c031e7d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEventGenerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEvent      : IntPtr
        BeginGetEvent : IntPtr
        EndGetEvent   : IntPtr
        QueueEvent    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEventGenerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the next event in the queue. This method is synchronous.
     * @remarks
     * This method executes synchronously.
     * 
     * If the queue already contains an event, the method returns S_OK immediately. If the queue does not contain an event, the behavior depends on the value of <i>dwFlags</i>:
     * 
     * <ul>
     * <li>
     * If <i>dwFlags</i> is 0, the method blocks indefinitely until a new event is queued, or until the event generator is shut down.
     * 
     * </li>
     * <li>
     * If <i>dwFlags</i> is MF_EVENT_FLAG_NO_WAIT, the method fails immediately with the return code MF_E_NO_EVENTS_AVAILABLE.
     * 
     * </li>
     * </ul>
     * This method returns MF_E_MULTIPLE_SUBSCRIBERS if you previously called <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-begingetevent">IMFMediaEventGenerator::BeginGetEvent</a> and have not yet called <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-endgetevent">IMFMediaEventGenerator::EndGetEvent</a>.
     * @param {MEDIA_EVENT_GENERATOR_GET_EVENT_FLAGS} dwFlags 
     * @returns {IMFMediaEvent} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-getevent
     */
    GetEvent(dwFlags) {
        result := ComCall(3, this, MEDIA_EVENT_GENERATOR_GET_EVENT_FLAGS, dwFlags, "ptr*", &ppEvent := 0, "HRESULT")
        return IMFMediaEvent(ppEvent)
    }

    /**
     * Begins an asynchronous request for the next event in the queue.
     * @remarks
     * When a new event is available, the event generator calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method. The <b>Invoke</b> method should call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-endgetevent">IMFMediaEventGenerator::EndGetEvent</a> to get a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface, and use that interface to examine the event.
     * 
     * Do not call <b>BeginGetEvent</b> a second time before calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-endgetevent">EndGetEvent</a>. While the first call is still pending, additional calls to the same object will fail. Also, the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-getevent">IMFMediaEventGenerator::GetEvent</a> method fails if an asynchronous request is still pending.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The client must implement this interface.
     * @param {IUnknown} punkState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_MULTIPLE_BEGIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a pending request with the same callback pointer and a different state object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_MULTIPLE_SUBSCRIBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a pending request with a different callback pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object was shut down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_S_MULTIPLE_BEGIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a pending request with the same callback pointer and state object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-begingetevent
     */
    BeginGetEvent(pCallback, punkState) {
        result := ComCall(4, this, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request for the next event in the queue.
     * @remarks
     * Call this method from inside your application's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method. For example code, see <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-begingetevent">IMFMediaEventGenerator::BeginGetEvent</a>.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">Invoke</a> method.
     * @returns {IMFMediaEvent} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-endgetevent
     */
    EndGetEvent(pResult) {
        result := ComCall(5, this, "ptr", pResult, "ptr*", &ppEvent := 0, "HRESULT")
        return IMFMediaEvent(ppEvent)
    }

    /**
     * Puts a new event in the object's queue.
     * @param {Integer} met Specifies the event type. The event type is returned by the event's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-gettype">IMFMediaEvent::GetType</a> method. For a list of event types, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-events">Media Foundation Events</a>.
     * @param {Pointer<Guid>} guidExtendedType The extended type. If the event does not have an extended type, use the value GUID_NULL. The extended type is returned by the event's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getextendedtype">IMFMediaEvent::GetExtendedType</a> method.
     * @param {HRESULT} hrStatus A success or failure code indicating the status of the event. This value is returned by the event's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getstatus">IMFMediaEvent::GetStatus</a> method.
     * @param {Pointer<PROPVARIANT>} pvValue Pointer to a <b>PROPVARIANT</b> that contains the event value. This parameter can be <b>NULL</b>. This value is returned by the event's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getvalue">IMFMediaEvent::GetValue</a> method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object was shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-queueevent
     */
    QueueEvent(met, guidExtendedType, hrStatus, pvValue) {
        result := ComCall(6, this, "uint", met, Guid.Ptr, guidExtendedType, "int", hrStatus, PROPVARIANT.Ptr, pvValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaEventGenerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEvent := CallbackCreate(GetMethod(implObj, "GetEvent"), flags, 3)
        this.vtbl.BeginGetEvent := CallbackCreate(GetMethod(implObj, "BeginGetEvent"), flags, 3)
        this.vtbl.EndGetEvent := CallbackCreate(GetMethod(implObj, "EndGetEvent"), flags, 3)
        this.vtbl.QueueEvent := CallbackCreate(GetMethod(implObj, "QueueEvent"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEvent)
        CallbackFree(this.vtbl.BeginGetEvent)
        CallbackFree(this.vtbl.EndGetEvent)
        CallbackFree(this.vtbl.QueueEvent)
    }
}
