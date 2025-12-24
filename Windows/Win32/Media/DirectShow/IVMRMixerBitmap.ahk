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
     * The SetAlphaBitmap method specifies a new bitmap image and the source location of the bitmap and how and where it should be rendered on the destination rectangle.
     * @param {Pointer<VMRALPHABITMAP>} pBmpParms A oointer to a [VMRALPHABITMAP](/windows/desktop/api/strmif/ns-strmif-vmralphabitmap) structure that contains information about the bitmap.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pBmpParms</i> is <b>NULL</b>.
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
     * Invalid argument. See Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not create a destination DC or DIBSection for the bitmap.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BitBlt to bitmap surface failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixerbitmap-setalphabitmap
     */
    SetAlphaBitmap(pBmpParms) {
        result := ComCall(3, this, "ptr", pBmpParms, "HRESULT")
        return result
    }

    /**
     * The UpdateAlphaBitmapParameters method changes the bitmap location, size and blending value.
     * @param {Pointer<VMRALPHABITMAP>} pBmpParms A pointer to a [VMRALPHABITMAP](/windows/desktop/api/strmif/ns-strmif-vmralphabitmap) structure.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixerbitmap-updatealphabitmapparameters
     */
    UpdateAlphaBitmapParameters(pBmpParms) {
        result := ComCall(4, this, "ptr", pBmpParms, "HRESULT")
        return result
    }

    /**
     * The GetAlphaBitmapParameters method retrieves a copy of the current image and related blending parameters.
     * @returns {VMRALPHABITMAP} A pointer to a [VMRALPHABITMAP](/windows/desktop/api/strmif/ns-strmif-vmralphabitmap) structure that receives the bitmap, information about the blending values, and the location to blend it.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixerbitmap-getalphabitmapparameters
     */
    GetAlphaBitmapParameters() {
        pBmpParms := VMRALPHABITMAP()
        result := ComCall(5, this, "ptr", pBmpParms, "HRESULT")
        return pBmpParms
    }
}
