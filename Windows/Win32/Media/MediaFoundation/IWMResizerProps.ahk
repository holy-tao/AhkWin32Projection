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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetResizerQuality", "SetInterlaceMode", "SetClipRegion", "SetFullCropRegion", "GetFullCropRegion"]

    /**
     * 
     * @param {Integer} lquality 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-setresizerquality
     */
    SetResizerQuality(lquality) {
        result := ComCall(3, this, "int", lquality, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lmode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-setinterlacemode
     */
    SetInterlaceMode(lmode) {
        result := ComCall(4, this, "int", lmode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lClipOriXSrc 
     * @param {Integer} lClipOriYSrc 
     * @param {Integer} lClipWidthSrc 
     * @param {Integer} lClipHeightSrc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-setclipregion
     */
    SetClipRegion(lClipOriXSrc, lClipOriYSrc, lClipWidthSrc, lClipHeightSrc) {
        result := ComCall(5, this, "int", lClipOriXSrc, "int", lClipOriYSrc, "int", lClipWidthSrc, "int", lClipHeightSrc, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-setfullcropregion
     */
    SetFullCropRegion(lClipOriXSrc, lClipOriYSrc, lClipWidthSrc, lClipHeightSrc, lClipOriXDst, lClipOriYDst, lClipWidthDst, lClipHeightDst) {
        result := ComCall(6, this, "int", lClipOriXSrc, "int", lClipOriYSrc, "int", lClipWidthSrc, "int", lClipHeightSrc, "int", lClipOriXDst, "int", lClipOriYDst, "int", lClipWidthDst, "int", lClipHeightDst, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lClipOriXSrc 
     * @param {Pointer<Integer>} lClipOriYSrc 
     * @param {Pointer<Integer>} lClipWidthSrc 
     * @param {Pointer<Integer>} lClipHeightSrc 
     * @param {Pointer<Integer>} lClipOriXDst 
     * @param {Pointer<Integer>} lClipOriYDst 
     * @param {Pointer<Integer>} lClipWidthDst 
     * @param {Pointer<Integer>} lClipHeightDst 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-getfullcropregion
     */
    GetFullCropRegion(lClipOriXSrc, lClipOriYSrc, lClipWidthSrc, lClipHeightSrc, lClipOriXDst, lClipOriYDst, lClipWidthDst, lClipHeightDst) {
        lClipOriXSrcMarshal := lClipOriXSrc is VarRef ? "int*" : "ptr"
        lClipOriYSrcMarshal := lClipOriYSrc is VarRef ? "int*" : "ptr"
        lClipWidthSrcMarshal := lClipWidthSrc is VarRef ? "int*" : "ptr"
        lClipHeightSrcMarshal := lClipHeightSrc is VarRef ? "int*" : "ptr"
        lClipOriXDstMarshal := lClipOriXDst is VarRef ? "int*" : "ptr"
        lClipOriYDstMarshal := lClipOriYDst is VarRef ? "int*" : "ptr"
        lClipWidthDstMarshal := lClipWidthDst is VarRef ? "int*" : "ptr"
        lClipHeightDstMarshal := lClipHeightDst is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, lClipOriXSrcMarshal, lClipOriXSrc, lClipOriYSrcMarshal, lClipOriYSrc, lClipWidthSrcMarshal, lClipWidthSrc, lClipHeightSrcMarshal, lClipHeightSrc, lClipOriXDstMarshal, lClipOriXDst, lClipOriYDstMarshal, lClipOriYDst, lClipWidthDstMarshal, lClipWidthDst, lClipHeightDstMarshal, lClipHeightDst, "HRESULT")
        return result
    }
}
