#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMAGELISTSTATS.ahk" { IMAGELISTSTATS }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import ".\IMAGELIST_CREATION_FLAGS.ahk" { IMAGELIST_CREATION_FLAGS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMAGELISTDRAWPARAMS.ahk" { IMAGELISTDRAWPARAMS }
#Import ".\IImageList.ahk" { IImageList }

/**
 * Extends IImageList by providing additional methods for manipulating and interacting with image lists.
 * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nn-commoncontrols-iimagelist2
 * @namespace Windows.Win32.UI.Controls
 */
export default struct IImageList2 extends IImageList {
    /**
     * The interface identifier for IImageList2
     * @type {Guid}
     */
    static IID := Guid("{192b9d83-50fc-457b-90a0-2b82a8b5dae1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IImageList2 interfaces
    */
    struct Vtbl extends IImageList.Vtbl {
        Resize               : IntPtr
        GetOriginalSize      : IntPtr
        SetOriginalSize      : IntPtr
        SetCallback          : IntPtr
        GetCallback          : IntPtr
        ForceImagePresent    : IntPtr
        DiscardImages        : IntPtr
        PreloadImages        : IntPtr
        GetStatistics        : IntPtr
        Initialize           : IntPtr
        Replace2             : IntPtr
        ReplaceFromImageList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IImageList2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Resizes the current image.
     * @param {Integer} cxNewIconSize Type: <b>int</b>
     * 
     * The x-axis count, in pixels, for the new size.
     * @param {Integer} cyNewIconSize Type: <b>int</b>
     * 
     * The y-axis count, in pixels, for the new size.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-resize
     */
    Resize(cxNewIconSize, cyNewIconSize) {
        result := ComCall(32, this, "int", cxNewIconSize, "int", cyNewIconSize, "HRESULT")
        return result
    }

    /**
     * Gets the original size of a specified image.
     * @param {Integer} iImage Type: <b>int</b>
     * 
     * The index of desired image.
     * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Flags for getting original size. One of the following is valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILGOS_ALWAYS"></a><a id="ilgos_always"></a><dl>
     * <dt><b>ILGOS_ALWAYS</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Always get the original size (can be slow). 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILGOS_FROMSTANDBY"></a><a id="ilgos_fromstandby"></a><dl>
     * <dt><b>ILGOS_FROMSTANDBY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only get if present or on standby. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pcx Type: <b>int*</b>
     * 
     * A pointer to the x-axis count.
     * @param {Pointer<Integer>} pcy Type: <b>int*</b>
     * 
     * A pointer to the y-axis count.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-getoriginalsize
     */
    GetOriginalSize(iImage, dwFlags, pcx, pcy) {
        pcxMarshal := pcx is VarRef ? "int*" : "ptr"
        pcyMarshal := pcy is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, "int", iImage, "uint", dwFlags, pcxMarshal, pcx, pcyMarshal, pcy, "HRESULT")
        return result
    }

    /**
     * Sets the original size of a specified image.
     * @param {Integer} iImage Type: <b>int</b>
     * 
     * An index of desired image.
     * @param {Integer} cx Type: <b>int</b>
     * 
     * The x-axis count.
     * @param {Integer} _cy Type: <b>int</b>
     * 
     * The y-axis count.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-setoriginalsize
     */
    SetOriginalSize(iImage, cx, _cy) {
        result := ComCall(34, this, "int", iImage, "int", cx, "int", _cy, "HRESULT")
        return result
    }

    /**
     * Sets an image list callback.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the callback interface.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-setcallback
     */
    SetCallback(punk) {
        result := ComCall(35, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Gets an image list callback object.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to a desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Contains the address of a pointer to a callback object.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-getcallback
     */
    GetCallback(riid) {
        result := ComCall(36, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Forces an image present, as specified.
     * @param {Integer} iImage Type: <b>int</b>
     * 
     * An index of image to force present.
     * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Force image flags. One of the following is valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILFIP_ALWAYS"></a><a id="ilfip_always"></a><dl>
     * <dt><b>ILFIP_ALWAYS</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Always get the image (can be slow). 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILFIP_FROMSTANDBY"></a><a id="ilfip_fromstandby"></a><dl>
     * <dt><b>ILFIP_FROMSTANDBY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only get if on standby. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-forceimagepresent
     */
    ForceImagePresent(iImage, dwFlags) {
        result := ComCall(37, this, "int", iImage, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Discards images from list, as specified.
     * @param {Integer} iFirstImage Type: <b>int</b>
     * 
     * An index of first image to discard.
     * @param {Integer} iLastImage Type: <b>int</b>
     * 
     * An index of last image to discard.
     * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Discard images flags. <b>ILDI_STANDBY</b> and <b>ILDI_PURGE</b> are mutually exclusive. <b>ILDI_RESETACCESS</b> can be combined with either. One or more of the following are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILDI_PURGE"></a><a id="ildi_purge"></a><dl>
     * <dt><b>ILDI_PURGE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Discard and purge. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILDI_STANDBY"></a><a id="ildi_standby"></a><dl>
     * <dt><b>ILDI_STANDBY</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Discard to standby list. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILDI_RESETACCESS"></a><a id="ildi_resetaccess"></a><dl>
     * <dt><b>ILDI_RESETACCESS</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reset the "has been accessed" flag. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILDI_QUERYACCESS"></a><a id="ildi_queryaccess"></a><dl>
     * <dt><b>ILDI_QUERYACCESS</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ask whether access flag is set (but do not reset). 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-discardimages
     */
    DiscardImages(iFirstImage, iLastImage, dwFlags) {
        result := ComCall(38, this, "int", iFirstImage, "int", iLastImage, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Preloads images, as specified.
     * @param {Pointer<IMAGELISTDRAWPARAMS>} pimldp Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imagelistdrawparams">IMAGELISTDRAWPARAMS</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imagelistdrawparams">IMAGELISTDRAWPARAMS</a> structure containing information about an image list draw operation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-preloadimages
     */
    PreloadImages(pimldp) {
        result := ComCall(39, this, IMAGELISTDRAWPARAMS.Ptr, pimldp, "HRESULT")
        return result
    }

    /**
     * Gets an image list statistics structure.
     * @param {Pointer<IMAGELISTSTATS>} pils Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imageliststats">IMAGELISTSTATS</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imageliststats">IMAGELISTSTATS</a> structure.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-getstatistics
     */
    GetStatistics(pils) {
        result := ComCall(40, this, IMAGELISTSTATS.Ptr, pils, "HRESULT")
        return result
    }

    /**
     * Initializes an image list.
     * @param {Integer} cx Type: <b>int</b>
     * 
     * Width, in pixels, of each image.
     * @param {Integer} _cy Type: <b>int</b>
     * 
     * Height, in pixels, of each image.
     * @param {IMAGELIST_CREATION_FLAGS} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/Controls/ilc-constants">Image List Creation Flags</a>.
     * @param {Integer} cInitial Type: <b>int</b>
     * 
     * Number of images that the image list initially contains.
     * @param {Integer} cGrow Type: <b>int</b>
     * 
     * Number of new images that the image list can contain.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-initialize
     */
    Initialize(cx, _cy, flags, cInitial, cGrow) {
        result := ComCall(41, this, "int", cx, "int", _cy, IMAGELIST_CREATION_FLAGS, flags, "int", cInitial, "int", cGrow, "HRESULT")
        return result
    }

    /**
     * Replaces an image in an image list.
     * @param {Integer} i Type: <b>int</b>
     * 
     * The index of the image to replace.
     * @param {HBITMAP} hbmImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains the image.
     * @param {HBITMAP} hbmMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains the mask. If no mask is used with the image list, this parameter is ignored.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies how the mask is applied to the image as one or a bitwise combination of the following decoration flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILR_DEFAULT"></a><a id="ilr_default"></a><dl>
     * <dt><b>ILR_DEFAULT</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILR_HORIZONTAL_LEFT"></a><a id="ilr_horizontal_left"></a><dl>
     * <dt><b>ILR_HORIZONTAL_LEFT</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Horizontally align to left.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILR_HORIZONTAL_CENTER"></a><a id="ilr_horizontal_center"></a><dl>
     * <dt><b>ILR_HORIZONTAL_CENTER</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Horizontally center.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILR_HORIZONTAL_RIGHT"></a><a id="ilr_horizontal_right"></a><dl>
     * <dt><b>ILR_HORIZONTAL_RIGHT</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Horizontally align to right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILR_VERTICAL_TOP"></a><a id="ilr_vertical_top"></a><dl>
     * <dt><b>ILR_VERTICAL_TOP</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Vertically align to top.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILR_VERTICAL_CENTER"></a><a id="ilr_vertical_center"></a><dl>
     * <dt><b>ILR_VERTICAL_CENTER</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Vertically align to center.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILR_VERTICAL_BOTTOM"></a><a id="ilr_vertical_bottom"></a><dl>
     * <dt><b>ILR_VERTICAL_BOTTOM</b></dt>
     * <dt>0x0020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Vertically align to bottom.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILR_SCALE_CLIP"></a><a id="ilr_scale_clip"></a><dl>
     * <dt><b>ILR_SCALE_CLIP</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do nothing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ILR_SCALE_ASPECTRATIO"></a><a id="ilr_scale_aspectratio"></a><dl>
     * <dt><b>ILR_SCALE_ASPECTRATIO</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Scale.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-replace2
     */
    Replace2(i, hbmImage, hbmMask, punk, dwFlags) {
        result := ComCall(42, this, "int", i, HBITMAP, hbmImage, HBITMAP, hbmMask, "ptr", punk, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Replaces an image in one image list with an image from another image list.
     * @param {Integer} i Type: <b>int</b>
     * 
     * The index of the destination image in the image list. This is the image that is overwritten by the new image.
     * @param {IImageList} pil Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nn-commoncontrols-iimagelist">IImageList</a>*</b>
     * 
     * A pointer to the source image list.
     * @param {Integer} iSrc Type: <b>int</b>
     * 
     * The index of the source image in the image list pointed to by <i>pil</i>.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Not used; must be 0.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist2-replacefromimagelist
     */
    ReplaceFromImageList(i, pil, iSrc, punk, dwFlags) {
        result := ComCall(43, this, "int", i, "ptr", pil, "int", iSrc, "ptr", punk, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IImageList2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Resize := CallbackCreate(GetMethod(implObj, "Resize"), flags, 3)
        this.vtbl.GetOriginalSize := CallbackCreate(GetMethod(implObj, "GetOriginalSize"), flags, 5)
        this.vtbl.SetOriginalSize := CallbackCreate(GetMethod(implObj, "SetOriginalSize"), flags, 4)
        this.vtbl.SetCallback := CallbackCreate(GetMethod(implObj, "SetCallback"), flags, 2)
        this.vtbl.GetCallback := CallbackCreate(GetMethod(implObj, "GetCallback"), flags, 3)
        this.vtbl.ForceImagePresent := CallbackCreate(GetMethod(implObj, "ForceImagePresent"), flags, 3)
        this.vtbl.DiscardImages := CallbackCreate(GetMethod(implObj, "DiscardImages"), flags, 4)
        this.vtbl.PreloadImages := CallbackCreate(GetMethod(implObj, "PreloadImages"), flags, 2)
        this.vtbl.GetStatistics := CallbackCreate(GetMethod(implObj, "GetStatistics"), flags, 2)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 6)
        this.vtbl.Replace2 := CallbackCreate(GetMethod(implObj, "Replace2"), flags, 6)
        this.vtbl.ReplaceFromImageList := CallbackCreate(GetMethod(implObj, "ReplaceFromImageList"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Resize)
        CallbackFree(this.vtbl.GetOriginalSize)
        CallbackFree(this.vtbl.SetOriginalSize)
        CallbackFree(this.vtbl.SetCallback)
        CallbackFree(this.vtbl.GetCallback)
        CallbackFree(this.vtbl.ForceImagePresent)
        CallbackFree(this.vtbl.DiscardImages)
        CallbackFree(this.vtbl.PreloadImages)
        CallbackFree(this.vtbl.GetStatistics)
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Replace2)
        CallbackFree(this.vtbl.ReplaceFromImageList)
    }
}
