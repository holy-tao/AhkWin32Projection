#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets properties on the color converter DSP.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmcolorconvprops
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMColorConvProps extends IUnknown{
    /**
     * The interface identifier for IWMColorConvProps
     * @type {Guid}
     */
    static IID => Guid("{e6a49e22-c099-421d-aad3-c061fb4ae85b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lMode 
     * @returns {HRESULT} 
     */
    SetMode(lMode) {
        result := ComCall(3, this, "int", lMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lSrcCropLeft 
     * @param {Integer} lSrcCropTop 
     * @param {Integer} lDstCropLeft 
     * @param {Integer} lDstCropTop 
     * @param {Integer} lCropWidth 
     * @param {Integer} lCropHeight 
     * @returns {HRESULT} 
     */
    SetFullCroppingParam(lSrcCropLeft, lSrcCropTop, lDstCropLeft, lDstCropTop, lCropWidth, lCropHeight) {
        result := ComCall(4, this, "int", lSrcCropLeft, "int", lSrcCropTop, "int", lDstCropLeft, "int", lDstCropTop, "int", lCropWidth, "int", lCropHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
