#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBaseFilter.ahk

/**
 * Note  This interface is deprecated. New applications should not use it. The IMediaStreamFilter interface is supported by the Media Stream filter, which is used internally by the multimedia stream object. Applications should not use this interface.
 * @see https://docs.microsoft.com/windows/win32/api//amstream/nn-amstream-imediastreamfilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaStreamFilter extends IBaseFilter{
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
     * 
     * @param {Pointer<IAMMediaStream>} pAMMediaStream 
     * @returns {HRESULT} 
     */
    AddMediaStream(pAMMediaStream) {
        result := ComCall(15, this, "ptr", pAMMediaStream, "int")
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
        result := ComCall(16, this, "ptr", idPurpose, "ptr", ppMediaStream, "int")
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
        result := ComCall(17, this, "int", Index, "ptr", ppMediaStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bRenderer 
     * @returns {HRESULT} 
     */
    SupportSeeking(bRenderer) {
        result := ComCall(18, this, "int", bRenderer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pTime 
     * @returns {HRESULT} 
     */
    ReferenceTimeToStreamTime(pTime) {
        result := ComCall(19, this, "int64*", pTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pCurrentStreamTime 
     * @returns {HRESULT} 
     */
    GetCurrentStreamTime(pCurrentStreamTime) {
        result := ComCall(20, this, "int64*", pCurrentStreamTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} WaitStreamTime 
     * @returns {HRESULT} 
     */
    WaitUntil(WaitStreamTime) {
        result := ComCall(21, this, "int64", WaitStreamTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bCancelEOS 
     * @returns {HRESULT} 
     */
    Flush(bCancelEOS) {
        result := ComCall(22, this, "int", bCancelEOS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndOfStream() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
