#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface is deprecated.
 * @see https://learn.microsoft.com/windows/win32/api/mmstream/nn-mmstream-istreamsample
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IStreamSample extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamSample
     * @type {Guid}
     */
    static IID => Guid("{b502d1be-9a57-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMediaStream", "GetSampleTimes", "SetSampleTimes", "Update", "CompletionStatus"]

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves a pointer to the media stream object that created the current sample.
     * @remarks
     * If successful, this method increments the reference count of the media stream specified by <i>ppMediaStream</i>.
     * @param {Pointer<IMediaStream>} ppMediaStream Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-imediastream">IMediaStream</a> interface that will point to the media stream that created the current sample.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if <i>ppMediaStream</i> is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-istreamsample-getmediastream
     */
    GetMediaStream(ppMediaStream) {
        result := ComCall(3, this, "ptr*", ppMediaStream, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves the current sample's start and end times. If the sample is updating, this method returns the times after the update completes.
     * @remarks
     * For streams that have a clock, the start and end times will be relative to the stream's current time. If the stream doesn't have a clock, the times are media-relative and the current time will be zero.
     * 
     * The <i>pCurrentTime</i> parameter enables you to conveniently track the media stream's current time, so you don't have to call <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nf-mmstream-imultimediastream-gettime">IMultiMediaStream::GetTime</a>. Unlike <b>GetTime</b>, however, this method returns S_OK if the stream doesn't have a clock; <b>GetTime</b> returns S_FALSE. The value assigned to <i>pCurrentTime</i> is the same as the value produced by the following code fragment.
     * 
     * 
     * ```cpp
     * 
     * IMediaStream *pMediaStream = 0;
     * hr = pSample->GetMediaStream(&pMediaStream);
     * if (SUCCEEDED(hr))
     * {
     *   IMultiMediaStream *pMultiMediaStream = 0;
     *   hr = pMediaStream->GetMultiMediaStream(&pMultiMediaStream);
     *   pMediaStream->Release();
     *   if (SUCCEEDED(hr))
     *   {
     *     STREAM_TIME CurrentTime = 0;
     *     hr = pMultiMediaStream->GetTime(&CurrentTime);
     *     pMultiMediaStream->Release();
     *   }
     * }
     * 
     * ```
     * @param {Pointer<Integer>} pStartTime Pointer to a STREAM_TIME value that will contain the sample's start time.
     * @param {Pointer<Integer>} pEndTime Pointer to a STREAM_TIME value that will contain the sample's end time.
     * @param {Pointer<Integer>} pCurrentTime Pointer to a STREAM_TIMEvalue that will contain the media stream's current media time.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if one of the parameters is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-istreamsample-getsampletimes
     */
    GetSampleTimes(pStartTime, pEndTime, pCurrentTime) {
        pStartTimeMarshal := pStartTime is VarRef ? "int64*" : "ptr"
        pEndTimeMarshal := pEndTime is VarRef ? "int64*" : "ptr"
        pCurrentTimeMarshal := pCurrentTime is VarRef ? "int64*" : "ptr"

        result := ComCall(4, this, pStartTimeMarshal, pStartTime, pEndTimeMarshal, pEndTime, pCurrentTimeMarshal, pCurrentTime, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Sets the current sample's start and end times. You can call this method prior to updating the sample.
     * @remarks
     * For streams that have a clock, the times must be relative to the stream's current time. If the stream doesn't have a clock, the times should be relative to the media.
     * 
     * This method applies only to writable streams.
     * @param {Pointer<Integer>} pStartTime Pointer to a STREAM_TIME value that contains the sample's new start time.
     * @param {Pointer<Integer>} pEndTime Pointer to a STREAM_TIME value that contains the sample's new end time.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if one of the parameters is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-istreamsample-setsampletimes
     */
    SetSampleTimes(pStartTime, pEndTime) {
        pStartTimeMarshal := pStartTime is VarRef ? "int64*" : "ptr"
        pEndTimeMarshal := pEndTime is VarRef ? "int64*" : "ptr"

        result := ComCall(5, this, pStartTimeMarshal, pStartTime, pEndTimeMarshal, pEndTime, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Performs a synchronous or an asynchronous update on the current sample.
     * @remarks
     * This method can be used to perform a synchronous or asynchronous update of a sample. If both <i>hEvent</i> and <i>pfnAPC</i> are <b>NULL</b> then the update will be synchronous unless either of the SSUPDATE_ASYNC or SSUPDATE_CONTINUOUS flags is specified. When a synchronous update returns, the result of the function contains the I/O completion status.
     * 
     * You can't specify values for both <i>hEvent</i> and <i>pfnAPC</i>; the method will fail.
     * 
     * Asynchronous updates might complete before the update returns; in that case, the return value is S_OK. If you specify an event and the update returns S_OK, this method sets the event on return. If you specify an APC function and the update returns S_OK, the APC will not be queued and the function will not be called.
     * 
     * Asynchronous updates that don't complete prior to returning will return a value of MS_S_PENDING.
     * 
     * If an application creates multiple streams, it must perform an asynchronous update on each stream. Call <b>WaitForMultipleObjects</b> to wait for each stream update to complete, before making the next update. Otherwise, the application might block.
     * @param {Integer} dwFlags Flag that specifies whether the update is synchronous or asynchronous. The SSUPDATE_ASYNC flag specifies an asynchronous update, which you can set if both <i>hEvent</i> and <i>pfnAPC</i> are <b>NULL</b>. Use SSUPDATE_CONTINUOUS to continuously update the sample until you call the <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nf-mmstream-istreamsample-completionstatus">IStreamSample::CompletionStatus</a> method.
     * @param {HANDLE} hEvent Handle to an event that this method will trigger when the update is complete.
     * @param {Pointer<PAPCFUNC>} pfnAPC Pointer to a Win32 asynchronous procedure call (APC) function that this method will call after it completes the sample update.
     * @param {Pointer} dwAPCData Value that this method passes to the function specified by the <i>pfnAPC</i> parameter.
     * @returns {HRESULT} Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The update aborted.
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
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MS_E_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This sample already has a pending update.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MS_S_ENDOFSTREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reached the end of the stream; the sample wasn't updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MS_S_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous update is pending.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_COMMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot allocate a sample because the allocator is not committed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-istreamsample-update
     */
    Update(dwFlags, hEvent, pfnAPC, dwAPCData) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(6, this, "uint", dwFlags, "ptr", hEvent, "ptr", pfnAPC, "ptr", dwAPCData, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves the status of the current sample's latest asynchronous update. If the update isn't complete, you can force it to complete.
     * @param {Integer} dwFlags Value that specifies whether to forcibly complete the update. This value is a combination of one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>COMPSTAT_NOUPDATEOK (0x01)</td>
     * <td>Force the update to complete as soon as possible, even if the sample update isn't yet complete. If the sample is updating and you didn't set the COMPSTAT_WAIT flag, the method returns MS_S_PENDING. If the sample is waiting to be updated, this method removes it from the queue and returns MS_S_NOTUPDATED.</td>
     * </tr>
     * <tr>
     * <td>COMPSTAT_WAIT (0x02)</td>
     * <td>Wait until the sample finishes updating before returning from this method.</td>
     * </tr>
     * <tr>
     * <td>COMPSTAT_ABORT (0x04)</td>
     * <td>Forces the update to complete, even if it's currently updating. This leaves the sample data in an undefined state. Combine this value with the COMPSTAT_WAITFORCOMPLETION flag to ensure that the update canceled.</td>
     * </tr>
     * </table>
     * @param {Integer} dwMilliseconds If the <i>dwFlags</i> parameter is COMPSTAT_WAIT, this value is the number of milliseconds to wait for the update to complete. Specify INFINITE to indicate that you want to wait until the sample updates before this call returns.
     * @returns {HRESULT} Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The update aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MS_S_ENDOFSTREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample wasn't updated because it reached the end of the stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MS_S_NOUPDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The update was forcibly completed; the sample was not updated by the stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MS_S_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An asynchronous update is pending.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-istreamsample-completionstatus
     */
    CompletionStatus(dwFlags, dwMilliseconds) {
        result := ComCall(7, this, "uint", dwFlags, "uint", dwMilliseconds, "HRESULT")
        return result
    }
}
