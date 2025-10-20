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
     * 
     * @param {Pointer<Int32>} pdwFlags 
     * @param {Pointer<Int32>} pStreamType 
     * @returns {HRESULT} 
     */
    GetInformation(pdwFlags, pStreamType) {
        result := ComCall(3, this, "int*", pdwFlags, "int*", pStreamType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} idPurpose 
     * @param {Pointer<IMediaStream>} ppMediaStream 
     * @returns {HRESULT} 
     */
    GetMediaStream(idPurpose, ppMediaStream) {
        result := ComCall(4, this, "ptr", idPurpose, "ptr", ppMediaStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IMediaStream>} ppMediaStream 
     * @returns {HRESULT} 
     */
    EnumMediaStreams(Index, ppMediaStream) {
        result := ComCall(5, this, "int", Index, "ptr", ppMediaStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCurrentState 
     * @returns {HRESULT} 
     */
    GetState(pCurrentState) {
        result := ComCall(6, this, "int*", pCurrentState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewState 
     * @returns {HRESULT} 
     */
    SetState(NewState) {
        result := ComCall(7, this, "int", NewState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pCurrentTime 
     * @returns {HRESULT} 
     */
    GetTime(pCurrentTime) {
        result := ComCall(8, this, "int64*", pCurrentTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pDuration 
     * @returns {HRESULT} 
     */
    GetDuration(pDuration) {
        result := ComCall(9, this, "int64*", pDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SeekTime 
     * @returns {HRESULT} 
     */
    Seek(SeekTime) {
        result := ComCall(10, this, "int64", SeekTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phEOS 
     * @returns {HRESULT} 
     */
    GetEndOfStreamEventHandle(phEOS) {
        result := ComCall(11, this, "ptr", phEOS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
