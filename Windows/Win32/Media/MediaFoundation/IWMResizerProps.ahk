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
     * Specifies whether to use an algorithm that produces higher-quality video, or a faster algorithm.
     * @param {Integer} lquality Boolean value. If <b>TRUE</b>, the video resizer uses an algorithm that produces higher-quality video. If <b>FALSE</b>, the video resizer uses a faster algorithm.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-setresizerquality
     */
    SetResizerQuality(lquality) {
        result := ComCall(3, this, "int", lquality, "HRESULT")
        return result
    }

    /**
     * The SetInterlaceMode method specifies whether the input video stream is interlaced.
     * @param {Integer} lmode Boolean value. If <b>TRUE</b>, the video is interlaced. If <b>FALSE</b>, the video is progressive.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-setinterlacemode
     */
    SetInterlaceMode(lmode) {
        result := ComCall(4, this, "int", lmode, "HRESULT")
        return result
    }

    /**
     * Sets the source rectangle.
     * @param {Integer} lClipOriXSrc Specifies the left edge of the source rectangle, in pixels.
     * @param {Integer} lClipOriYSrc Specifies the top edge of the source rectangle, in pixels.
     * @param {Integer} lClipWidthSrc Specifies the width of the source rectangle, in pixels.
     * @param {Integer} lClipHeightSrc Specifies the height of the source rectangle, in pixels.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-setclipregion
     */
    SetClipRegion(lClipOriXSrc, lClipOriYSrc, lClipWidthSrc, lClipHeightSrc) {
        result := ComCall(5, this, "int", lClipOriXSrc, "int", lClipOriYSrc, "int", lClipWidthSrc, "int", lClipHeightSrc, "HRESULT")
        return result
    }

    /**
     * Sets the source and destination rectangles.
     * @param {Integer} lClipOriXSrc Specifies the left edge of the source rectangle, in pixels.
     * @param {Integer} lClipOriYSrc Specifies the top edge of the source rectangle, in pixels.
     * @param {Integer} lClipWidthSrc Specifies the width of the source rectangle, in pixels.
     * @param {Integer} lClipHeightSrc Specifies the height of the source rectangle, in pixels.
     * @param {Integer} lClipOriXDst Specifies the left edge of the destination rectangle, in pixels.
     * @param {Integer} lClipOriYDst Specifies the top edge of the destination rectangle, in pixels.
     * @param {Integer} lClipWidthDst Specifies the width of the destination rectangle, in pixels.
     * @param {Integer} lClipHeightDst Specifies the height of the destination rectangle, in pixels.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-setfullcropregion
     */
    SetFullCropRegion(lClipOriXSrc, lClipOriYSrc, lClipWidthSrc, lClipHeightSrc, lClipOriXDst, lClipOriYDst, lClipWidthDst, lClipHeightDst) {
        result := ComCall(6, this, "int", lClipOriXSrc, "int", lClipOriYSrc, "int", lClipWidthSrc, "int", lClipHeightSrc, "int", lClipOriXDst, "int", lClipOriYDst, "int", lClipWidthDst, "int", lClipHeightDst, "HRESULT")
        return result
    }

    /**
     * Retrieves the source and destination rectangles.
     * @param {Pointer<Integer>} lClipOriXSrc Receives the left edge of the source rectangle, in pixels.
     * @param {Pointer<Integer>} lClipOriYSrc Receives the top edge of the source rectangle, in pixels.
     * @param {Pointer<Integer>} lClipWidthSrc Receives the width of the source rectangle, in pixels.
     * @param {Pointer<Integer>} lClipHeightSrc Receives the height of the source rectangle, in pixels.
     * @param {Pointer<Integer>} lClipOriXDst Receives the left edge of the destination rectangle, in pixels.
     * @param {Pointer<Integer>} lClipOriYDst Receives the top edge of the destination rectangle, in pixels.
     * @param {Pointer<Integer>} lClipWidthDst Receives the width of the destination rectangle, in pixels.
     * @param {Pointer<Integer>} lClipHeightDst Receives the height of the destination rectangle, in pixels.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-getfullcropregion
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
