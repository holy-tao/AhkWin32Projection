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
     * 
     * @param {Pointer<MFVideoAlphaBitmap>} pBmpParms 
     * @returns {HRESULT} 
     */
    SetAlphaBitmap(pBmpParms) {
        result := ComCall(3, this, "ptr", pBmpParms, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearAlphaBitmap() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoAlphaBitmapParams>} pBmpParms 
     * @returns {HRESULT} 
     */
    UpdateAlphaBitmapParameters(pBmpParms) {
        result := ComCall(5, this, "ptr", pBmpParms, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoAlphaBitmapParams>} pBmpParms 
     * @returns {HRESULT} 
     */
    GetAlphaBitmapParameters(pBmpParms) {
        result := ComCall(6, this, "ptr", pBmpParms, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
