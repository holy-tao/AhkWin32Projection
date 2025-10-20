#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets properties on the video resizer DSP.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmresizerprops
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMResizerProps extends IUnknown{
    /**
     * The interface identifier for IWMResizerProps
     * @type {Guid}
     */
    static IID => Guid("{57665d4c-0414-4faa-905b-10e546f81c33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lquality 
     * @returns {HRESULT} 
     */
    SetResizerQuality(lquality) {
        result := ComCall(3, this, "int", lquality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lmode 
     * @returns {HRESULT} 
     */
    SetInterlaceMode(lmode) {
        result := ComCall(4, this, "int", lmode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lClipOriXSrc 
     * @param {Integer} lClipOriYSrc 
     * @param {Integer} lClipWidthSrc 
     * @param {Integer} lClipHeightSrc 
     * @returns {HRESULT} 
     */
    SetClipRegion(lClipOriXSrc, lClipOriYSrc, lClipWidthSrc, lClipHeightSrc) {
        result := ComCall(5, this, "int", lClipOriXSrc, "int", lClipOriYSrc, "int", lClipWidthSrc, "int", lClipHeightSrc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lClipOriXSrc 
     * @param {Integer} lClipOriYSrc 
     * @param {Integer} lClipWidthSrc 
     * @param {Integer} lClipHeightSrc 
     * @param {Integer} lClipOriXDst 
     * @param {Integer} lClipOriYDst 
     * @param {Integer} lClipWidthDst 
     * @param {Integer} lClipHeightDst 
     * @returns {HRESULT} 
     */
    SetFullCropRegion(lClipOriXSrc, lClipOriYSrc, lClipWidthSrc, lClipHeightSrc, lClipOriXDst, lClipOriYDst, lClipWidthDst, lClipHeightDst) {
        result := ComCall(6, this, "int", lClipOriXSrc, "int", lClipOriYSrc, "int", lClipWidthSrc, "int", lClipHeightSrc, "int", lClipOriXDst, "int", lClipOriYDst, "int", lClipWidthDst, "int", lClipHeightDst, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lClipOriXSrc 
     * @param {Pointer<Int32>} lClipOriYSrc 
     * @param {Pointer<Int32>} lClipWidthSrc 
     * @param {Pointer<Int32>} lClipHeightSrc 
     * @param {Pointer<Int32>} lClipOriXDst 
     * @param {Pointer<Int32>} lClipOriYDst 
     * @param {Pointer<Int32>} lClipWidthDst 
     * @param {Pointer<Int32>} lClipHeightDst 
     * @returns {HRESULT} 
     */
    GetFullCropRegion(lClipOriXSrc, lClipOriYSrc, lClipWidthSrc, lClipHeightSrc, lClipOriXDst, lClipOriYDst, lClipWidthDst, lClipHeightDst) {
        result := ComCall(7, this, "int*", lClipOriXSrc, "int*", lClipOriYSrc, "int*", lClipWidthSrc, "int*", lClipHeightSrc, "int*", lClipOriXDst, "int*", lClipOriYDst, "int*", lClipWidthDst, "int*", lClipHeightDst, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
