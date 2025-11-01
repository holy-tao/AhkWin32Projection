#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IMediaStream>} ppMediaStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-getmediastream
     */
    GetMediaStream(idPurpose, ppMediaStream) {
        result := ComCall(4, this, "ptr", idPurpose, "ptr*", ppMediaStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IMediaStream>} ppMediaStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-enummediastreams
     */
    EnumMediaStreams(Index, ppMediaStream) {
        result := ComCall(5, this, "int", Index, "ptr*", ppMediaStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCurrentState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-getstate
     */
    GetState(pCurrentState) {
        pCurrentStateMarshal := pCurrentState is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pCurrentStateMarshal, pCurrentState, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pCurrentTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-gettime
     */
    GetTime(pCurrentTime) {
        pCurrentTimeMarshal := pCurrentTime is VarRef ? "int64*" : "ptr"

        result := ComCall(8, this, pCurrentTimeMarshal, pCurrentTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-getduration
     */
    GetDuration(pDuration) {
        pDurationMarshal := pDuration is VarRef ? "int64*" : "ptr"

        result := ComCall(9, this, pDurationMarshal, pDuration, "HRESULT")
        return result
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
     * @param {Pointer<HANDLE>} phEOS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imultimediastream-getendofstreameventhandle
     */
    GetEndOfStreamEventHandle(phEOS) {
        result := ComCall(11, this, "ptr", phEOS, "HRESULT")
        return result
    }
}
