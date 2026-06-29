#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Sets properties on the video resizer DSP.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-iwmresizerprops
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IWMResizerProps extends IUnknown {
    /**
     * The interface identifier for IWMResizerProps
     * @type {Guid}
     */
    static IID := Guid("{57665d4c-0414-4faa-905b-10e546f81c33}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMResizerProps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetResizerQuality : IntPtr
        SetInterlaceMode  : IntPtr
        SetClipRegion     : IntPtr
        SetFullCropRegion : IntPtr
        GetFullCropRegion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMResizerProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies whether to use an algorithm that produces higher-quality video, or a faster algorithm.
     * @remarks
     * This method is equivalent to setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-quality">MFPKEY_RESIZE_QUALITY</a> property.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-setresizerquality
     */
    SetResizerQuality(lquality) {
        result := ComCall(3, this, "int", lquality, "HRESULT")
        return result
    }

    /**
     * The SetInterlaceMode method specifies whether the input video stream is interlaced.
     * @remarks
     * This method is equivalent to setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-interlace">MFPKEY_RESIZE_INTERLACE</a> property.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-setinterlacemode
     */
    SetInterlaceMode(lmode) {
        result := ComCall(4, this, "int", lmode, "HRESULT")
        return result
    }

    /**
     * Sets the source rectangle. (IWMResizerProps.SetClipRegion)
     * @remarks
     * By default, the video resizer copies the entire video frame. When you call this method, the video resizer crops the video to the source rectangle and copies that portion to the output buffer.
     * 
     * This method is equivalent to setting the following properties:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-src-left">MFPKEY_RESIZE_SRC_LEFT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-src-top">MFPKEY_RESIZE_SRC_TOP</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-src-width">MFPKEY_RESIZE_SRC_WIDTH</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-src-height">MFPKEY_RESIZE_SRC_HEIGHT</a>
     * </li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-setclipregion
     */
    SetClipRegion(lClipOriXSrc, lClipOriYSrc, lClipWidthSrc, lClipHeightSrc) {
        result := ComCall(5, this, "int", lClipOriXSrc, "int", lClipOriYSrc, "int", lClipWidthSrc, "int", lClipHeightSrc, "HRESULT")
        return result
    }

    /**
     * Sets the source and destination rectangles. (IWMResizerProps.SetFullCropRegion)
     * @remarks
     * By default, the video resizer copies the entire video frame. When you call this method, the video resizer crops the video to the source rectangle and copies that portion to the destination rectangle.
     * 
     * This method is equivalent to setting the following properties:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-src-left">MFPKEY_RESIZE_SRC_LEFT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-src-top">MFPKEY_RESIZE_SRC_TOP</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-src-width">MFPKEY_RESIZE_SRC_WIDTH</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-src-height">MFPKEY_RESIZE_SRC_HEIGHT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-dst-left">MFPKEY_RESIZE_DST_LEFT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-dst-top">MFPKEY_RESIZE_DST_TOP</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-dst-width">MFPKEY_RESIZE_DST_WIDTH</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-resize-dst-height">MFPKEY_RESIZE_DST_HEIGHT</a>
     * </li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresizerprops-setfullcropregion
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

    Query(iid) {
        if (IWMResizerProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetResizerQuality := CallbackCreate(GetMethod(implObj, "SetResizerQuality"), flags, 2)
        this.vtbl.SetInterlaceMode := CallbackCreate(GetMethod(implObj, "SetInterlaceMode"), flags, 2)
        this.vtbl.SetClipRegion := CallbackCreate(GetMethod(implObj, "SetClipRegion"), flags, 5)
        this.vtbl.SetFullCropRegion := CallbackCreate(GetMethod(implObj, "SetFullCropRegion"), flags, 9)
        this.vtbl.GetFullCropRegion := CallbackCreate(GetMethod(implObj, "GetFullCropRegion"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetResizerQuality)
        CallbackFree(this.vtbl.SetInterlaceMode)
        CallbackFree(this.vtbl.SetClipRegion)
        CallbackFree(this.vtbl.SetFullCropRegion)
        CallbackFree(this.vtbl.GetFullCropRegion)
    }
}
