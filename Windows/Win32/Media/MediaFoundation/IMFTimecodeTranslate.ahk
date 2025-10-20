#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Converts between Society of Motion Picture and Television Engineers (SMPTE) time codes and 100-nanosecond time units.
 * @remarks
 * 
  * If an object supports this interface, it must expose the interface as a service. To get a pointer to the interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> with the service identifier <b>MF_TIMECODE_SERVICE</b>.
  * 
  * The Advanced Streaming Format (ASF) media source exposes this interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftimecodetranslate
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimecodeTranslate extends IUnknown{
    /**
     * The interface identifier for IMFTimecodeTranslate
     * @type {Guid}
     */
    static IID => Guid("{ab9d8661-f7e8-4ef4-9861-89f334f94e74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PROPVARIANT>} pPropVarTimecode 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} punkState 
     * @returns {HRESULT} 
     */
    BeginConvertTimecodeToHNS(pPropVarTimecode, pCallback, punkState) {
        result := ComCall(3, this, "ptr", pPropVarTimecode, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @param {Pointer<Int64>} phnsTime 
     * @returns {HRESULT} 
     */
    EndConvertTimecodeToHNS(pResult, phnsTime) {
        result := ComCall(4, this, "ptr", pResult, "int64*", phnsTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hnsTime 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} punkState 
     * @returns {HRESULT} 
     */
    BeginConvertHNSToTimecode(hnsTime, pCallback, punkState) {
        result := ComCall(5, this, "int64", hnsTime, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @param {Pointer<PROPVARIANT>} pPropVarTimecode 
     * @returns {HRESULT} 
     */
    EndConvertHNSToTimecode(pResult, pPropVarTimecode) {
        result := ComCall(6, this, "ptr", pResult, "ptr", pPropVarTimecode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
