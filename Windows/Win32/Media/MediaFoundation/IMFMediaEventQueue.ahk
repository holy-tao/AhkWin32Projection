#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFAsyncCallback.ahk" { IMFAsyncCallback }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import ".\IMFAsyncResult.ahk" { IMFAsyncResult }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMediaEvent.ahk" { IMFMediaEvent }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides an event queue for applications that need to implement the IMFMediaEventGenerator interface.
 * @remarks
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfmediaeventqueue
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEventQueue extends IUnknown {
    /**
     * The interface identifier for IMFMediaEventQueue
     * @type {Guid}
     */
    static IID := Guid("{36f846fc-2256-48b6-b58e-e2b638316581}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEventQueue interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEvent           : IntPtr
        BeginGetEvent      : IntPtr
        EndGetEvent        : IntPtr
        QueueEvent         : IntPtr
        QueueEventParamVar : IntPtr
        QueueEventParamUnk : IntPtr
        Shutdown           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEventQueue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the next event in the queue. This method is synchronous.Call this method inside your implementation of IMFMediaEventGenerator::GetEvent. Pass the parameters from that method directly to this method.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} dwFlags Specifies whether the method blocks until an event is queued. For a list of valid flags, see <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-getevent">IMFMediaEventGenerator::GetEvent</a>.
     * @returns {IMFMediaEvent} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-getevent
     */
    GetEvent(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "ptr*", &ppEvent := 0, "HRESULT")
        return IMFMediaEvent(ppEvent)
    }

    /**
     * Begins an asynchronous request for the next event in the queue.Call this method inside your implementation of IMFMediaEventGenerator::BeginGetEvent. Pass the parameters from that method directly to this method.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object.
     * @param {IUnknown} punkState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. The object is returned to the caller when the callback is invoked.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventqueue-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-begingetevent
     */
    BeginGetEvent(pCallback, punkState) {
        result := ComCall(4, this, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request for the next event in the queue.Call this method inside your implementation of IMFMediaEventGenerator::EndGetEvent. Pass the parameters from that method directly to this method.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface.
     * @returns {IMFMediaEvent} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface of the event object. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-endgetevent
     */
    EndGetEvent(pResult) {
        result := ComCall(5, this, "ptr", pResult, "ptr*", &ppEvent := 0, "HRESULT")
        return IMFMediaEvent(ppEvent)
    }

    /**
     * Puts an event in the queue.
     * @remarks
     * Call this method when your component needs to raise an event that contains attributes. To create the event object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediaevent">MFCreateMediaEvent</a>. Add attributes to the event by using methods from the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. (The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface inherits <b>IMFAttributes</b>.)
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {IMFMediaEvent} pEvent Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface of the event to be put in the queue.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventqueue-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-queueevent
     */
    QueueEvent(pEvent) {
        result := ComCall(6, this, "ptr", pEvent, "HRESULT")
        return result
    }

    /**
     * Creates an event, sets a PROPVARIANT as the event data, and puts the event in the queue.Call this method inside your implementation of IMFMediaEventGenerator::QueueEvent.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} met Specifies the type of the event to be added to the queue. The event type is returned by the event's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-gettype">IMFMediaEvent::GetType</a> method. For a list of event types, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-events">Media Foundation Events</a>.
     * @param {Pointer<Guid>} guidExtendedType The extended type of the event. If the event does not have an extended type, use the value GUID_NULL. The extended type is returned by the event's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getextendedtype">IMFMediaEvent::GetExtendedType</a> method.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventqueue-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-queueeventparamvar
     */
    QueueEventParamVar(met, guidExtendedType, hrStatus, pvValue) {
        result := ComCall(7, this, "uint", met, Guid.Ptr, guidExtendedType, "int", hrStatus, PROPVARIANT.Ptr, pvValue, "HRESULT")
        return result
    }

    /**
     * Creates an event, sets an IUnknown pointer as the event data, and puts the event in the queue.
     * @remarks
     * Call this method when your component needs to raise an event that contains an <b>IUnknown</b> pointer value and no attributes. If the event contains attributes, use <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventqueue-queueevent">IMFMediaEventQueue::QueueEvent</a> instead.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} met Specifies the event type of the event to be added to the queue. The event type is returned by the event's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-gettype">IMFMediaEvent::GetType</a> method. For a list of event types, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-events">Media Foundation Events</a>.
     * @param {Pointer<Guid>} guidExtendedType The extended type of the event. If the event does not have an extended type, use the value GUID_NULL. The extended type is returned by the event's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getextendedtype">IMFMediaEvent::GetExtendedType</a> method.
     * @param {HRESULT} hrStatus A success or failure code indicating the status of the event. This value is returned by the event's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getstatus">IMFMediaEvent::GetStatus</a> method.
     * @param {IUnknown} pUnk Pointer to the <b>IUnknown</b> interface. The method sets this pointer as the event value. The pointer is returned by the event's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getvalue">IMFMediaEvent::GetValue</a> method.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventqueue-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-queueeventparamunk
     */
    QueueEventParamUnk(met, guidExtendedType, hrStatus, pUnk) {
        result := ComCall(8, this, "uint", met, Guid.Ptr, guidExtendedType, "int", hrStatus, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * Shuts down the event queue.
     * @remarks
     * Call this method when your component shuts down. After this method is called, all <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaeventqueue">IMFMediaEventQueue</a> methods return <b>MF_E_SHUTDOWN</b>.
     * 
     * This method removes all of the events from the queue.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-shutdown
     */
    Shutdown() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaEventQueue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEvent := CallbackCreate(GetMethod(implObj, "GetEvent"), flags, 3)
        this.vtbl.BeginGetEvent := CallbackCreate(GetMethod(implObj, "BeginGetEvent"), flags, 3)
        this.vtbl.EndGetEvent := CallbackCreate(GetMethod(implObj, "EndGetEvent"), flags, 3)
        this.vtbl.QueueEvent := CallbackCreate(GetMethod(implObj, "QueueEvent"), flags, 2)
        this.vtbl.QueueEventParamVar := CallbackCreate(GetMethod(implObj, "QueueEventParamVar"), flags, 5)
        this.vtbl.QueueEventParamUnk := CallbackCreate(GetMethod(implObj, "QueueEventParamUnk"), flags, 5)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
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
        CallbackFree(this.vtbl.QueueEventParamVar)
        CallbackFree(this.vtbl.QueueEventParamUnk)
        CallbackFree(this.vtbl.Shutdown)
    }
}
