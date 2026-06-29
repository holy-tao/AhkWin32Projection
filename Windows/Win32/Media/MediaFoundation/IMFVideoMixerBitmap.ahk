#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MFVideoAlphaBitmapParams.ahk" { MFVideoAlphaBitmapParams }
#Import ".\MFVideoAlphaBitmap.ahk" { MFVideoAlphaBitmap }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Alpha-blends a static bitmap image with the video displayed by the Enhanced Video Renderer (EVR).
 * @see https://learn.microsoft.com/windows/win32/api/evr9/nn-evr9-imfvideomixerbitmap
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoMixerBitmap extends IUnknown {
    /**
     * The interface identifier for IMFVideoMixerBitmap
     * @type {Guid}
     */
    static IID := Guid("{814c7b20-0fdb-4eec-af8f-f957c8f69edc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoMixerBitmap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAlphaBitmap              : IntPtr
        ClearAlphaBitmap            : IntPtr
        UpdateAlphaBitmapParameters : IntPtr
        GetAlphaBitmapParameters    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoMixerBitmap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a bitmap image for the enhanced video renderer (EVR) to alpha-blend with the video.
     * @remarks
     * The application can provide the image either as a GDI bitmap or as a Direct3D surface. The EVR mixer blends the image with the next video frame and all subsequent frames, until the image is changed or removed. The image can contain embedded per-pixel alpha information so that transparent regions can be defined. Transparent areas can also be identified using a color key value.
     * 
     * If you use a Direct3D surface, the surface format must be 32-bit RGB, either D3DFMT_X8R8G8B8 or D3DFMT_A8R8G8B8, and the surface must be allocated from the D3DPOOL_SYSTEMMEM memory pool.
     * 
     * There is no defined limit to how frequently you can pass images to the video renderer. However, changing the image several times per second can impact the performance and smoothness of the video.
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
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideomixerbitmap-setalphabitmap
     */
    SetAlphaBitmap(pBmpParms) {
        result := ComCall(3, this, MFVideoAlphaBitmap.Ptr, pBmpParms, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideomixerbitmap-clearalphabitmap
     */
    ClearAlphaBitmap() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Updates the current alpha-blending settings, including the source and destination rectangles, the color key, and other information. You can update some or all of the blending parameters.
     * @remarks
     * The video must be playing for the changes to take effect.
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
     * No bitmap is currently set. You must call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideomixerbitmap-setalphabitmap">IMFVideoMixerBitmap::SetAlphaBitmap</a> to set a bitmap.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideomixerbitmap-updatealphabitmapparameters
     */
    UpdateAlphaBitmapParameters(pBmpParms) {
        result := ComCall(5, this, MFVideoAlphaBitmapParams.Ptr, pBmpParms, "HRESULT")
        return result
    }

    /**
     * Retrieves the current settings that the enhanced video renderer (EVR) uses to alpha-blend the bitmap with the video.
     * @remarks
     * This method returns the current values of all the blending parameters, not just those that the application specified. Ignore the <b>dwFlags</b> member of the structure.
     * @returns {MFVideoAlphaBitmapParams} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr9/ns-evr9-mfvideoalphabitmapparams">MFVideoAlphaBitmapParams</a> structure that receives the current blending parameters.
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-imfvideomixerbitmap-getalphabitmapparameters
     */
    GetAlphaBitmapParameters() {
        pBmpParms := MFVideoAlphaBitmapParams()
        result := ComCall(6, this, MFVideoAlphaBitmapParams.Ptr, pBmpParms, "HRESULT")
        return pBmpParms
    }

    Query(iid) {
        if (IMFVideoMixerBitmap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAlphaBitmap := CallbackCreate(GetMethod(implObj, "SetAlphaBitmap"), flags, 2)
        this.vtbl.ClearAlphaBitmap := CallbackCreate(GetMethod(implObj, "ClearAlphaBitmap"), flags, 1)
        this.vtbl.UpdateAlphaBitmapParameters := CallbackCreate(GetMethod(implObj, "UpdateAlphaBitmapParameters"), flags, 2)
        this.vtbl.GetAlphaBitmapParameters := CallbackCreate(GetMethod(implObj, "GetAlphaBitmapParameters"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAlphaBitmap)
        CallbackFree(this.vtbl.ClearAlphaBitmap)
        CallbackFree(this.vtbl.UpdateAlphaBitmapParameters)
        CallbackFree(this.vtbl.GetAlphaBitmapParameters)
    }
}
