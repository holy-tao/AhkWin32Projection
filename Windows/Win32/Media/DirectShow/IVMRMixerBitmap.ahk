#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VMRALPHABITMAP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRMixerBitmap interface enables an application to blend a static image from a bitmap or DirectDraw surface onto the video stream, when using the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrmixerbitmap
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRMixerBitmap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRMixerBitmap
     * @type {Guid}
     */
    static IID => Guid("{1e673275-0257-40aa-af20-7c608d4a0428}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAlphaBitmap", "UpdateAlphaBitmapParameters", "GetAlphaBitmapParameters"]

    /**
     * 
     * @param {Pointer<VMRALPHABITMAP>} pBmpParms 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixerbitmap-setalphabitmap
     */
    SetAlphaBitmap(pBmpParms) {
        result := ComCall(3, this, "ptr", pBmpParms, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VMRALPHABITMAP>} pBmpParms 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixerbitmap-updatealphabitmapparameters
     */
    UpdateAlphaBitmapParameters(pBmpParms) {
        result := ComCall(4, this, "ptr", pBmpParms, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VMRALPHABITMAP} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixerbitmap-getalphabitmapparameters
     */
    GetAlphaBitmapParameters() {
        pBmpParms := VMRALPHABITMAP()
        result := ComCall(5, this, "ptr", pBmpParms, "HRESULT")
        return pBmpParms
    }
}
