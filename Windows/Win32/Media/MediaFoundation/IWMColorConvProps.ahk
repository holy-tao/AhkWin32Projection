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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMode", "SetFullCroppingParam"]

    /**
     * Specifies whether the input video stream is interlaced.
     * @param {Integer} lMode 
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmcolorconvprops-setmode
     */
    SetMode(lMode) {
        result := ComCall(3, this, "int", lMode, "HRESULT")
        return result
    }

    /**
     * Sets the source and destination rectangles.
     * @param {Integer} lSrcCropLeft Specifies the left edge of the source rectangle, in pixels.
     * @param {Integer} lSrcCropTop Specifies the top edge of the source rectangle, in pixels.
     * @param {Integer} lDstCropLeft Specifies the left edge of the destination rectangle, in pixels.
     * @param {Integer} lDstCropTop Specifies the top edge of the destination rectangle, in pixels.
     * @param {Integer} lCropWidth Specifies the width of the source and destination rectangles, in pixels.
     * @param {Integer} lCropHeight Specifies the height of the source and destination rectangles, in pixels.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmcolorconvprops-setfullcroppingparam
     */
    SetFullCroppingParam(lSrcCropLeft, lSrcCropTop, lDstCropLeft, lDstCropTop, lCropWidth, lCropHeight) {
        result := ComCall(4, this, "int", lSrcCropLeft, "int", lSrcCropTop, "int", lDstCropLeft, "int", lDstCropTop, "int", lCropWidth, "int", lCropHeight, "HRESULT")
        return result
    }
}
