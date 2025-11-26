#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaEvent.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves events from any Media Foundation object that generates events.
 * @remarks
 * 
 * An object that supports this interface maintains a queue of events. The client of the object can retrieve the events either synchronously or asynchronously. The synchronous method is <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-getevent">GetEvent</a>. The asynchronous methods are <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-begingetevent">BeginGetEvent</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-endgetevent">EndGetEvent</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfmediaeventgenerator
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEventGenerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEventGenerator
     * @type {Guid}
     */
    static IID => Guid("{2cd0bd52-bcd5-4b89-b62c-eadc0c031e7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEvent", "BeginGetEvent", "EndGetEvent", "QueueEvent"]

    /**
     * Retrieves the next event in the queue. This method is synchronous.
     * @param {Integer} dwFlags 
     * @returns {IMFMediaEvent} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediaeventgenerator-getevent
     */
    GetEvent(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "ptr*", &ppEvent := 0, "HRESULT")
        return IMFMediaEvent(ppEvent)
    }

    /**
     * Begins an asynchronous request for the next event in the queue.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediaeventgenerator-begingetevent
     */
    BeginGetEvent(pCallback, punkState) {
        result := ComCall(4, this, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request for the next event in the queue.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">Invoke</a> method.
     * @returns {IMFMediaEvent} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediaeventgenerator-endgetevent
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
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediaeventgenerator-queueevent
     */
    QueueEvent(met, guidExtendedType, hrStatus, pvValue) {
        result := ComCall(6, this, "uint", met, "ptr", guidExtendedType, "int", hrStatus, "ptr", pvValue, "HRESULT")
        return result
    }
}
