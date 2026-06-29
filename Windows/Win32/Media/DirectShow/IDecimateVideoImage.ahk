#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDecimateVideoImage interface specifies decimation on a decoder filter.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-idecimatevideoimage
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDecimateVideoImage extends IUnknown {
    /**
     * The interface identifier for IDecimateVideoImage
     * @type {Guid}
     */
    static IID := Guid("{2e5ea3e0-e924-11d2-b6da-00a0c995e8df}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDecimateVideoImage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDecimationImageSize   : IntPtr
        ResetDecimationImageSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDecimateVideoImage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetDecimationImageSize method specifies the dimensions to which the decoder should decimate its output image.
     * @param {Integer} lWidth Specifies the width of the video image, in pixels.
     * @param {Integer} lHeight Specifies the height of the video image, in pixels.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder cannot perform any decimation, or needs to halt decimation it is currently performing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder can decimate the video to the requested size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idecimatevideoimage-setdecimationimagesize
     */
    SetDecimationImageSize(lWidth, lHeight) {
        result := ComCall(3, this, "int", lWidth, "int", lHeight, "HRESULT")
        return result
    }

    /**
     * The ResetDecimationImageSize method specifies that the decoder should no longer decimate its output image.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value indicating the success or failure of the call.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idecimatevideoimage-resetdecimationimagesize
     */
    ResetDecimationImageSize() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDecimateVideoImage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDecimationImageSize := CallbackCreate(GetMethod(implObj, "SetDecimationImageSize"), flags, 3)
        this.vtbl.ResetDecimationImageSize := CallbackCreate(GetMethod(implObj, "ResetDecimationImageSize"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDecimationImageSize)
        CallbackFree(this.vtbl.ResetDecimationImageSize)
    }
}
