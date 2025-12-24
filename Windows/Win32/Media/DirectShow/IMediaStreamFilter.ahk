#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaStream.ahk
#Include .\IBaseFilter.ahk

/**
 * Note  This interface is deprecated. New applications should not use it. The IMediaStreamFilter interface is supported by the Media Stream filter, which is used internally by the multimedia stream object. Applications should not use this interface.
 * @see https://docs.microsoft.com/windows/win32/api//amstream/nn-amstream-imediastreamfilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaStreamFilter extends IBaseFilter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamFilter
     * @type {Guid}
     */
    static IID => Guid("{bebe595e-9a6f-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddMediaStream", "GetMediaStream", "EnumMediaStreams", "SupportSeeking", "ReferenceTimeToStreamTime", "GetCurrentStreamTime", "WaitUntil", "Flush", "EndOfStream"]

    /**
     * Note  This interface is deprecated. New applications should not use it. The AddMediaStream method connects a media stream object to the underlying filter graph.
     * @param {IAMMediaStream} pAMMediaStream Pointer to the media stream object's <a href="https://docs.microsoft.com/windows/desktop/api/amstream/nn-amstream-iammediastream">IAMMediaStream</a> interface.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MS_E_PURPOSEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Duplicate purpose ID
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
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-imediastreamfilter-addmediastream
     */
    AddMediaStream(pAMMediaStream) {
        result := ComCall(15, this, "ptr", pAMMediaStream, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetMediaStream method retrieves a media stream, specified by purpose ID.
     * @param {Pointer<Guid>} idPurpose Reference to an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mspid">MSPID</a> value that specifies which stream to retrieve.
     * @returns {IMediaStream} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-imediastream">IMediaStream</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-imediastreamfilter-getmediastream
     */
    GetMediaStream(idPurpose) {
        result := ComCall(16, this, "ptr", idPurpose, "ptr*", &ppMediaStream := 0, "HRESULT")
        return IMediaStream(ppMediaStream)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The EnumMediaStreams method retrieves a media stream, specified by index.
     * @param {Integer} Index Index of the media stream to retrieve.
     * @returns {IMediaStream} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-imediastream">IMediaStream</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-imediastreamfilter-enummediastreams
     */
    EnumMediaStreams(Index) {
        result := ComCall(17, this, "int", Index, "ptr*", &ppMediaStream := 0, "HRESULT")
        return IMediaStream(ppMediaStream)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SupportSeeking method initializes the filter to support seeking. The multimedia stream object calls this method.
     * @param {BOOL} bRenderer Boolean value that specifies whether the streams are being rendered. Use the value <b>TRUE</b> if the stream type is STREAMTYPE_READ, or <b>FALSE</b> otherwise.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph does not contain any seekable streams.
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
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-imediastreamfilter-supportseeking
     */
    SupportSeeking(bRenderer) {
        result := ComCall(18, this, "int", bRenderer, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The ReferenceTimeToStreamTime method converts a reference time to stream time.
     * @param {Pointer<Integer>} pTime On input, specifies the reference time to convert. On output, contains the equivalent stream time.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph does not have a reference clock.
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
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-imediastreamfilter-referencetimetostreamtime
     */
    ReferenceTimeToStreamTime(pTime) {
        pTimeMarshal := pTime is VarRef ? "int64*" : "ptr"

        result := ComCall(19, this, pTimeMarshal, pTime, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetCurrentStreamTime method retrieves the current stream time.
     * @returns {Integer} Pointer to a variable that receives the stream time, in 100-nanosecond units.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-imediastreamfilter-getcurrentstreamtime
     */
    GetCurrentStreamTime() {
        result := ComCall(20, this, "int64*", &pCurrentStreamTime := 0, "HRESULT")
        return pCurrentStreamTime
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The WaitUntil method causes the filter to block until a specified stream time. The filter's pins call this method. They can interrupt the wait by flushing the filter.
     * @param {Integer} WaitStreamTime Specifies the stream time, in 100-nanosecond units.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait was interrupted.
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
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-imediastreamfilter-waituntil
     */
    WaitUntil(WaitStreamTime) {
        result := ComCall(21, this, "int64", WaitStreamTime, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The Flush method notifies the filter that one of its pins has flushed data. The filter's input pins call this method.
     * @param {BOOL} bCancelEOS Boolean value that indicates whether to cancel the pin's previous end-of-stream notification. If <b>TRUE</b>, the filter decrements the internal end-of-stream count.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-imediastreamfilter-flush
     */
    Flush(bCancelEOS) {
        result := ComCall(22, this, "int", bCancelEOS, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The EndOfStream method signals the end of a stream. The Media Stream filter's input pins call this method on the filter.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-imediastreamfilter-endofstream
     */
    EndOfStream() {
        result := ComCall(23, this, "HRESULT")
        return result
    }
}
