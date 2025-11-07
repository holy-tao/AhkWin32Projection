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
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @param {Pointer<Integer>} pStreamType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-getinformation
     */
    GetInformation(pdwFlags, pStreamType) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"
        pStreamTypeMarshal := pStreamType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pdwFlagsMarshal, pdwFlags, pStreamTypeMarshal, pStreamType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} idPurpose 
     * @returns {IMediaStream} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-getmediastream
     */
    GetMediaStream(idPurpose) {
        result := ComCall(4, this, "ptr", idPurpose, "ptr*", &ppMediaStream := 0, "HRESULT")
        return IMediaStream(ppMediaStream)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {IMediaStream} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-enummediastreams
     */
    EnumMediaStreams(Index) {
        result := ComCall(5, this, "int", Index, "ptr*", &ppMediaStream := 0, "HRESULT")
        return IMediaStream(ppMediaStream)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-getstate
     */
    GetState() {
        result := ComCall(6, this, "int*", &pCurrentState := 0, "HRESULT")
        return pCurrentState
    }

    /**
     * 
     * @param {Integer} NewState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-setstate
     */
    SetState(NewState) {
        result := ComCall(7, this, "int", NewState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-gettime
     */
    GetTime() {
        result := ComCall(8, this, "int64*", &pCurrentTime := 0, "HRESULT")
        return pCurrentTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-getduration
     */
    GetDuration() {
        result := ComCall(9, this, "int64*", &pDuration := 0, "HRESULT")
        return pDuration
    }

    /**
     * 
     * @param {Integer} SeekTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-seek
     */
    Seek(SeekTime) {
        result := ComCall(10, this, "int64", SeekTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-getendofstreameventhandle
     */
    GetEndOfStreamEventHandle() {
        phEOS := HANDLE()
        result := ComCall(11, this, "ptr", phEOS, "HRESULT")
        return phEOS
    }
}
