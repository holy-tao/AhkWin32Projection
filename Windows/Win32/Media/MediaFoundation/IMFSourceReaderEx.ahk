#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSourceReader.ahk

/**
 * Extends the IMFSourceReader interface.
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsourcereaderex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSourceReaderEx extends IMFSourceReader{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSourceReaderEx
     * @type {Guid}
     */
    static IID => Guid("{7b981cf0-560e-4116-9875-b099895f23d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNativeMediaType", "AddTransformForStream", "RemoveAllTransformsForStream", "GetTransformForStream"]

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {IMFMediaType} pMediaType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereaderex-setnativemediatype
     */
    SetNativeMediaType(dwStreamIndex, pMediaType) {
        result := ComCall(13, this, "uint", dwStreamIndex, "ptr", pMediaType, "uint*", &pdwStreamFlags := 0, "HRESULT")
        return pdwStreamFlags
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {IUnknown} pTransformOrActivate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereaderex-addtransformforstream
     */
    AddTransformForStream(dwStreamIndex, pTransformOrActivate) {
        result := ComCall(14, this, "uint", dwStreamIndex, "ptr", pTransformOrActivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereaderex-removealltransformsforstream
     */
    RemoveAllTransformsForStream(dwStreamIndex) {
        result := ComCall(15, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwTransformIndex 
     * @param {Pointer<Guid>} pGuidCategory 
     * @param {Pointer<IMFTransform>} ppTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereaderex-gettransformforstream
     */
    GetTransformForStream(dwStreamIndex, dwTransformIndex, pGuidCategory, ppTransform) {
        result := ComCall(16, this, "uint", dwStreamIndex, "uint", dwTransformIndex, "ptr", pGuidCategory, "ptr*", ppTransform, "HRESULT")
        return result
    }
}
