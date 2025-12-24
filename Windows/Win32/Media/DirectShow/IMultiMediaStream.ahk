#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaStream.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//mmstream/nn-mmstream-imultimediastream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMultiMediaStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultiMediaStream
     * @type {Guid}
     */
    static IID => Guid("{b502d1bc-9a57-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInformation", "GetMediaStream", "EnumMediaStreams", "GetState", "SetState", "GetTime", "GetDuration", "Seek", "GetEndOfStreamEventHandle"]

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetInformation method retrieves the capabilities of the multimedia stream object.
     * @param {Pointer<Integer>} pdwFlags Pointer to a variable that receives a bitwise combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>MMSSF_ASYNCHRONOUS</td>
     * <td>The object supports asynchronous sample updates. This flag is always returned.</td>
     * </tr>
     * <tr>
     * <td>MMSSF_HASCLOCK</td>
     * <td>The object has a clock.</td>
     * </tr>
     * <tr>
     * <td>MMSSF_SUPPORTSEEK</td>
     * <td>The object supports seeking.</td>
     * </tr>
     * </table>
     *  
     * 
     * This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pStreamType Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mmstream/ne-mmstream-stream_type">STREAM_TYPE</a> enumeration. This value indicates whether the multimedia stream is read-only, write-only, or read/write. This parameter can be <b>NULL</b>.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error.
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
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imultimediastream-getinformation
     */
    GetInformation(pdwFlags, pStreamType) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"
        pStreamTypeMarshal := pStreamType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pdwFlagsMarshal, pdwFlags, pStreamTypeMarshal, pStreamType, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetMediaStream method retrieves a media stream, specified by purpose ID.
     * @param {Pointer<Guid>} idPurpose Reference to an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mspid">MSPID</a> that identifies the media stream to retrieve.
     * @returns {IMediaStream} Address of variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-imediastream">IMediaStream</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imultimediastream-getmediastream
     */
    GetMediaStream(idPurpose) {
        result := ComCall(4, this, "ptr", idPurpose, "ptr*", &ppMediaStream := 0, "HRESULT")
        return IMediaStream(ppMediaStream)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The EnumMediaStreams method retrieves a media stream object, specified by index.
     * @param {Integer} Index Zero-based index of the media stream to retrieve.
     * @returns {IMediaStream} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-imediastream">IMediaStream</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imultimediastream-enummediastreams
     */
    EnumMediaStreams(Index) {
        result := ComCall(5, this, "int", Index, "ptr*", &ppMediaStream := 0, "HRESULT")
        return IMediaStream(ppMediaStream)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetState method retrieves the current state of the multimedia stream object.
     * @returns {Integer} Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mmstream/ne-mmstream-stream_state">STREAM_STATE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imultimediastream-getstate
     */
    GetState() {
        result := ComCall(6, this, "int*", &pCurrentState := 0, "HRESULT")
        return pCurrentState
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetState method runs or stops the multimedia stream object.
     * @param {Integer} NewState A member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mmstream/ne-mmstream-stream_state">STREAM_STATE</a> enumeration, specifying the new state (running or stopped).
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
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
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imultimediastream-setstate
     */
    SetState(NewState) {
        result := ComCall(7, this, "int", NewState, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetTime method retrieves the current stream time.
     * @returns {Integer} Pointer to a variable that receives the stream time, in 100-nanosecond units.
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imultimediastream-gettime
     */
    GetTime() {
        result := ComCall(8, this, "int64*", &pCurrentTime := 0, "HRESULT")
        return pCurrentTime
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetDuration method retrieves the duration of the multimedia stream.
     * @returns {Integer} Pointer to a variable that receives of the multimedia stream, in 100-nanosecond units.
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imultimediastream-getduration
     */
    GetDuration() {
        result := ComCall(9, this, "int64*", &pDuration := 0, "HRESULT")
        return pDuration
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The Seek method seeks all of the media streams to a new position.
     * @param {Integer} SeekTime <a href="https://docs.microsoft.com/windows/desktop/DirectShow/stream-time">STREAM_TIME</a> value that specifies the new position.
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
     * The media streams do not support seeking.
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
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imultimediastream-seek
     */
    Seek(SeekTime) {
        result := ComCall(10, this, "int64", SeekTime, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetEndOfStreamEventHandle method retrieves an event that is signaled when the multimedia stream completes playback.
     * @returns {HANDLE} Pointer to a variable that receives a handle to the event. The event is signaled when all of the streams in the multimedia stream object complete playback.
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imultimediastream-getendofstreameventhandle
     */
    GetEndOfStreamEventHandle() {
        phEOS := HANDLE()
        result := ComCall(11, this, "ptr", phEOS, "HRESULT")
        return phEOS
    }
}
