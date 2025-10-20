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
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @param {Pointer<UInt32>} pdwStreamFlags 
     * @returns {HRESULT} 
     */
    SetNativeMediaType(dwStreamIndex, pMediaType, pdwStreamFlags) {
        result := ComCall(13, this, "uint", dwStreamIndex, "ptr", pMediaType, "uint*", pdwStreamFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<IUnknown>} pTransformOrActivate 
     * @returns {HRESULT} 
     */
    AddTransformForStream(dwStreamIndex, pTransformOrActivate) {
        result := ComCall(14, this, "uint", dwStreamIndex, "ptr", pTransformOrActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {HRESULT} 
     */
    RemoveAllTransformsForStream(dwStreamIndex) {
        result := ComCall(15, this, "uint", dwStreamIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwTransformIndex 
     * @param {Pointer<Guid>} pGuidCategory 
     * @param {Pointer<IMFTransform>} ppTransform 
     * @returns {HRESULT} 
     */
    GetTransformForStream(dwStreamIndex, dwTransformIndex, pGuidCategory, ppTransform) {
        result := ComCall(16, this, "uint", dwStreamIndex, "uint", dwTransformIndex, "ptr", pGuidCategory, "ptr", ppTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
