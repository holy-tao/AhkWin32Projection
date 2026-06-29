#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Sets properties on the color converter DSP.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-iwmcolorconvprops
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IWMColorConvProps extends IUnknown {
    /**
     * The interface identifier for IWMColorConvProps
     * @type {Guid}
     */
    static IID := Guid("{e6a49e22-c099-421d-aad3-c061fb4ae85b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMColorConvProps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetMode              : IntPtr
        SetFullCroppingParam : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMColorConvProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies whether the input video stream is interlaced.
     * @remarks
     * By default, the color converter uses the input media type to determine whether the video is interlaced. You can call this method to override the media type setting. 
     * 
     * This method is equivalent to setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-colorconv-mode">MFPKEY_COLORCONV_MODE</a> property.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcolorconvprops-setmode
     */
    SetMode(lMode) {
        result := ComCall(3, this, "int", lMode, "HRESULT")
        return result
    }

    /**
     * Sets the source and destination rectangles. (IWMColorConvProps.SetFullCroppingParam)
     * @remarks
     * By default, the color converter copies the entire video frame. When you call this method, the color converter crops the video to the source rectangle and copies that portion to the destination rectangle. 
     * 
     * This method is equivalent to setting the following properties:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-colorconv-srcleft">MFPKEY_COLORCONV_SRCLEFT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-colorconv-srctop">MFPKEY_COLORCONV_SRCTOP</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-colorconv-dstleft">MFPKEY_COLORCONV_DSTLEFT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-colorconv-dsttop">MFPKEY_COLORCONV_DSTTOP</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-colorconv-width">MFPKEY_COLORCONV_WIDTH</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-colorconv-height">MFPKEY_COLORCONV_HEIGHT</a>
     * </li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcolorconvprops-setfullcroppingparam
     */
    SetFullCroppingParam(lSrcCropLeft, lSrcCropTop, lDstCropLeft, lDstCropTop, lCropWidth, lCropHeight) {
        result := ComCall(4, this, "int", lSrcCropLeft, "int", lSrcCropTop, "int", lDstCropLeft, "int", lDstCropTop, "int", lCropWidth, "int", lCropHeight, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMColorConvProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMode := CallbackCreate(GetMethod(implObj, "SetMode"), flags, 2)
        this.vtbl.SetFullCroppingParam := CallbackCreate(GetMethod(implObj, "SetFullCroppingParam"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMode)
        CallbackFree(this.vtbl.SetFullCroppingParam)
    }
}
