#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VMRALPHABITMAP.ahk" { VMRALPHABITMAP }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRMixerBitmap interface enables an application to blend a static image from a bitmap or DirectDraw surface onto the video stream, when using the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrmixerbitmap
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRMixerBitmap extends IUnknown {
    /**
     * The interface identifier for IVMRMixerBitmap
     * @type {Guid}
     */
    static IID := Guid("{1e673275-0257-40aa-af20-7c608d4a0428}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRMixerBitmap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAlphaBitmap              : IntPtr
        UpdateAlphaBitmapParameters : IntPtr
        GetAlphaBitmapParameters    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRMixerBitmap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetAlphaBitmap method specifies a new bitmap image and the source location of the bitmap and how and where it should be rendered on the destination rectangle.
     * @remarks
     * To remove the bitmap, set the [VMRALPHABITMAP](/windows/desktop/api/strmif/ns-strmif-vmralphabitmap) structure and call <b>SetAlphaBitmap</b> again.
     * 
     * The method might return <b>E_INVALIDARG</b> for several reasons:
     * 
     * <ul>
     * [VMRALPHABITMAP](/windows/desktop/api/strmif/ns-strmif-vmralphabitmap) structure contains an invalid combination of flags.</li>
     * [VMRALPHABITMAP](/windows/desktop/api/strmif/ns-strmif-vmralphabitmap) structure does not specify a valid HDC or DirectDraw surface.</li>
     * <li>The value of <b>fAlpha</b> is invalid.</li>
     * </ul>
     * @param {Pointer<VMRALPHABITMAP>} pBmpParms A pointer to a [VMRALPHABITMAP](/windows/desktop/api/strmif/ns-strmif-vmralphabitmap) structure that contains information about the bitmap.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixerbitmap-setalphabitmap
     */
    SetAlphaBitmap(pBmpParms) {
        result := ComCall(3, this, VMRALPHABITMAP.Ptr, pBmpParms, "HRESULT")
        return result
    }

    /**
     * The UpdateAlphaBitmapParameters method changes the bitmap location, size and blending value.
     * @remarks
     * The filter graph must be running for the changes to take effect. This method does not change the bitmap image. If you specify a [VMRALPHABITMAP](/windows/desktop/api/strmif/ns-strmif-vmralphabitmap) structure with no destination or color key set, the bitmap disappears. This behavior is by design for backward compatibility and cannot be changed.
     * @param {Pointer<VMRALPHABITMAP>} pBmpParms A pointer to a [VMRALPHABITMAP](/windows/desktop/api/strmif/ns-strmif-vmralphabitmap) structure.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixerbitmap-updatealphabitmapparameters
     */
    UpdateAlphaBitmapParameters(pBmpParms) {
        result := ComCall(4, this, VMRALPHABITMAP.Ptr, pBmpParms, "HRESULT")
        return result
    }

    /**
     * The GetAlphaBitmapParameters method retrieves a copy of the current image and related blending parameters.
     * @returns {VMRALPHABITMAP} A pointer to a [VMRALPHABITMAP](/windows/desktop/api/strmif/ns-strmif-vmralphabitmap) structure that receives the bitmap, information about the blending values, and the location to blend it.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixerbitmap-getalphabitmapparameters
     */
    GetAlphaBitmapParameters() {
        pBmpParms := VMRALPHABITMAP()
        result := ComCall(5, this, VMRALPHABITMAP.Ptr, pBmpParms, "HRESULT")
        return pBmpParms
    }

    Query(iid) {
        if (IVMRMixerBitmap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAlphaBitmap := CallbackCreate(GetMethod(implObj, "SetAlphaBitmap"), flags, 2)
        this.vtbl.UpdateAlphaBitmapParameters := CallbackCreate(GetMethod(implObj, "UpdateAlphaBitmapParameters"), flags, 2)
        this.vtbl.GetAlphaBitmapParameters := CallbackCreate(GetMethod(implObj, "GetAlphaBitmapParameters"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAlphaBitmap)
        CallbackFree(this.vtbl.UpdateAlphaBitmapParameters)
        CallbackFree(this.vtbl.GetAlphaBitmapParameters)
    }
}
