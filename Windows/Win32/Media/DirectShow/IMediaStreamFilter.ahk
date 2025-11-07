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
     * 
     * @param {IAMMediaStream} pAMMediaStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-imediastreamfilter-addmediastream
     */
    AddMediaStream(pAMMediaStream) {
        result := ComCall(15, this, "ptr", pAMMediaStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} idPurpose 
     * @returns {IMediaStream} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-imediastreamfilter-getmediastream
     */
    GetMediaStream(idPurpose) {
        result := ComCall(16, this, "ptr", idPurpose, "ptr*", &ppMediaStream := 0, "HRESULT")
        return IMediaStream(ppMediaStream)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {IMediaStream} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-imediastreamfilter-enummediastreams
     */
    EnumMediaStreams(Index) {
        result := ComCall(17, this, "int", Index, "ptr*", &ppMediaStream := 0, "HRESULT")
        return IMediaStream(ppMediaStream)
    }

    /**
     * 
     * @param {BOOL} bRenderer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-imediastreamfilter-supportseeking
     */
    SupportSeeking(bRenderer) {
        result := ComCall(18, this, "int", bRenderer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-imediastreamfilter-referencetimetostreamtime
     */
    ReferenceTimeToStreamTime(pTime) {
        pTimeMarshal := pTime is VarRef ? "int64*" : "ptr"

        result := ComCall(19, this, pTimeMarshal, pTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-imediastreamfilter-getcurrentstreamtime
     */
    GetCurrentStreamTime() {
        result := ComCall(20, this, "int64*", &pCurrentStreamTime := 0, "HRESULT")
        return pCurrentStreamTime
    }

    /**
     * 
     * @param {Integer} WaitStreamTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-imediastreamfilter-waituntil
     */
    WaitUntil(WaitStreamTime) {
        result := ComCall(21, this, "int64", WaitStreamTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bCancelEOS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-imediastreamfilter-flush
     */
    Flush(bCancelEOS) {
        result := ComCall(22, this, "int", bCancelEOS, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-imediastreamfilter-endofstream
     */
    EndOfStream() {
        result := ComCall(23, this, "HRESULT")
        return result
    }
}
