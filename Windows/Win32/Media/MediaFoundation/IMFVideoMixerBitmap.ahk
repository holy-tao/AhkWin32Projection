#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Alpha-blends a static bitmap image with the video displayed by the Enhanced Video Renderer (EVR).
 * @see https://docs.microsoft.com/windows/win32/api//evr9/nn-evr9-imfvideomixerbitmap
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoMixerBitmap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoMixerBitmap
     * @type {Guid}
     */
    static IID => Guid("{814c7b20-0fdb-4eec-af8f-f957c8f69edc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAlphaBitmap", "ClearAlphaBitmap", "UpdateAlphaBitmapParameters", "GetAlphaBitmapParameters"]

    /**
     * 
     * @param {Pointer<MFVideoAlphaBitmap>} pBmpParms 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideomixerbitmap-setalphabitmap
     */
    SetAlphaBitmap(pBmpParms) {
        result := ComCall(3, this, "ptr", pBmpParms, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideomixerbitmap-clearalphabitmap
     */
    ClearAlphaBitmap() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoAlphaBitmapParams>} pBmpParms 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideomixerbitmap-updatealphabitmapparameters
     */
    UpdateAlphaBitmapParameters(pBmpParms) {
        result := ComCall(5, this, "ptr", pBmpParms, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoAlphaBitmapParams>} pBmpParms 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideomixerbitmap-getalphabitmapparameters
     */
    GetAlphaBitmapParameters(pBmpParms) {
        result := ComCall(6, this, "ptr", pBmpParms, "HRESULT")
        return result
    }
}
