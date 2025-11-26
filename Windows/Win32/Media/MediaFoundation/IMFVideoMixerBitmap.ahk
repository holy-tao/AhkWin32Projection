#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MFVideoAlphaBitmapParams.ahk
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
     * Sets a bitmap image for the enhanced video renderer (EVR) to alpha-blend with the video.
     * @param {Pointer<MFVideoAlphaBitmap>} pBmpParms Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr9/ns-evr9-mfvideoalphabitmap">MFVideoAlphaBitmap</a> structure that contains information about the bitmap, the source and destination rectangles, the color key, and other information.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The blending parameters defined in the <i>pBmpParms</i> structure are not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideomixerbitmap-setalphabitmap
     */
    SetAlphaBitmap(pBmpParms) {
        result := ComCall(3, this, "ptr", pBmpParms, "HRESULT")
        return result
    }

    /**
     * Removes the current bitmap and releases any resources associated with it.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No bitmap is currently set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideomixerbitmap-clearalphabitmap
     */
    ClearAlphaBitmap() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Updates the current alpha-blending settings, including the source and destination rectangles, the color key, and other information. You can update some or all of the blending parameters.
     * @param {Pointer<MFVideoAlphaBitmapParams>} pBmpParms Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr9/ns-evr9-mfvideoalphabitmapparams">MFVideoAlphaBitmapParams</a> structure that contains the blending parameters.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The blending parameters defined in the <i>pBmpParms</i> structure are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No bitmap is currently set. You must call <a href="/windows/desktop/api/evr9/nf-evr9-imfvideomixerbitmap-setalphabitmap">IMFVideoMixerBitmap::SetAlphaBitmap</a> to set a bitmap.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideomixerbitmap-updatealphabitmapparameters
     */
    UpdateAlphaBitmapParameters(pBmpParms) {
        result := ComCall(5, this, "ptr", pBmpParms, "HRESULT")
        return result
    }

    /**
     * Retrieves the current settings that the enhanced video renderer (EVR) uses to alpha-blend the bitmap with the video.
     * @returns {MFVideoAlphaBitmapParams} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr9/ns-evr9-mfvideoalphabitmapparams">MFVideoAlphaBitmapParams</a> structure that receives the current blending parameters.
     * @see https://docs.microsoft.com/windows/win32/api//evr9/nf-evr9-imfvideomixerbitmap-getalphabitmapparameters
     */
    GetAlphaBitmapParameters() {
        pBmpParms := MFVideoAlphaBitmapParams()
        result := ComCall(6, this, "ptr", pBmpParms, "HRESULT")
        return pBmpParms
    }
}
