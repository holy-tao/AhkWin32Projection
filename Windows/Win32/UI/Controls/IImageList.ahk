#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMAGEINFO.ahk" { IMAGEINFO }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\IMAGE_LIST_ITEM_FLAGS.ahk" { IMAGE_LIST_ITEM_FLAGS }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import ".\IMAGELISTDRAWPARAMS.ahk" { IMAGELISTDRAWPARAMS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Exposes methods that manipulate and interact with image lists.
 * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nn-commoncontrols-iimagelist
 * @namespace Windows.Win32.UI.Controls
 */
export default struct IImageList extends IUnknown {
    /**
     * The interface identifier for IImageList
     * @type {Guid}
     */
    static IID := Guid("{46eb5926-582e-4017-9fdf-e8998daa0950}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IImageList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Add                : IntPtr
        ReplaceIcon        : IntPtr
        SetOverlayImage    : IntPtr
        Replace            : IntPtr
        AddMasked          : IntPtr
        Draw               : IntPtr
        Remove             : IntPtr
        GetIcon            : IntPtr
        GetImageInfo       : IntPtr
        Copy               : IntPtr
        Merge              : IntPtr
        Clone              : IntPtr
        GetImageRect       : IntPtr
        GetIconSize        : IntPtr
        SetIconSize        : IntPtr
        GetImageCount      : IntPtr
        SetImageCount      : IntPtr
        SetBkColor         : IntPtr
        GetBkColor         : IntPtr
        BeginDrag          : IntPtr
        EndDrag            : IntPtr
        DragEnter          : IntPtr
        DragLeave          : IntPtr
        DragMove           : IntPtr
        SetDragCursorImage : IntPtr
        DragShowNolock     : IntPtr
        GetDragImage       : IntPtr
        GetItemFlags       : IntPtr
        GetOverlayImage    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IImageList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds an image or images to an image list. (IImageList.Add)
     * @remarks
     * <b>IImageList::Add</b> copies the bitmap to an internal data structure. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> function to delete <i>hbmImage</i> and <i>hbmMask</i> after the method returns.
     * 
     * To use <b>IImageList::Add</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {HBITMAP} hbmImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains the image or images. The number of images is inferred from the width of the bitmap.
     * @param {HBITMAP} hbmMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains the mask. If no mask is used with the image list, this parameter is ignored.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * When this method returns, contains a pointer to the index of the first new image. If the method fails to successfully add the new image, this value is -1.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-add
     */
    Add(hbmImage, hbmMask) {
        result := ComCall(3, this, HBITMAP, hbmImage, HBITMAP, hbmMask, "int*", &pi := 0, "HRESULT")
        return pi
    }

    /**
     * Replaces an image with an icon or cursor. (IImageList.ReplaceIcon)
     * @remarks
     * Because the system does not save <i>hicon</i>, you can destroy it after the function returns if the icon or cursor was created by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createicon">CreateIcon</a>. You do not need to destroy <i>hicon</i> if it was loaded by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadicona">LoadIcon</a> function; the system automatically frees an icon resource when it is no longer needed. 		
     * 		
     * 
     * To use <b>IImageList::ReplaceIcon</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the image to replace. If i is -1, the function adds the image to the end of the list.
     * @param {HICON} _hicon Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HICON</a></b>
     * 
     * A handle to the icon or cursor that contains the bitmap and mask for the new image.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that will contain the index of the image on return if 	successful, or -1 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-replaceicon
     */
    ReplaceIcon(i, _hicon) {
        result := ComCall(4, this, "int", i, HICON, _hicon, "int*", &pi := 0, "HRESULT")
        return pi
    }

    /**
     * Adds a specified image to the list of images used as overlay masks.
     * @remarks
     * An overlay mask is an image drawn transparently over another image. To draw an overlay mask over an image, call <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-draw">IImageList::Draw</a>. The <b>fStyle</b> parameter of these functions can use the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-indextooverlaymask">INDEXTOOVERLAYMASK</a> macro to specify an overlay mask index. 
     * 		
     * 
     * A call to this method fails and returns E_INVALIDARG unless the image list is created using a mask.
     * 		
     * 
     * To use <b>IImageList::SetOverlayImage</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} iImage Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the zero-based index of an image in the image list. This index identifies the image to use as an overlay mask.
     * @param {Integer} _iOverlay Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the one-based index of the overlay mask.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-setoverlayimage
     */
    SetOverlayImage(iImage, _iOverlay) {
        result := ComCall(5, this, "int", iImage, "int", _iOverlay, "HRESULT")
        return result
    }

    /**
     * Replaces an image in an image list with a new image. (IImageList.Replace)
     * @remarks
     * <b>IImageList::Replace</b> copies the bitmap to an internal data structure. You must use <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> to delete <i>hbmImage</i> and <i>hbmMask</i> after the method returns.
     * 
     * To use <b>IImageList::Replace</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the image to replace.
     * @param {HBITMAP} hbmImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains the image.
     * @param {HBITMAP} hbmMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains the mask. If no mask is used with the image list, this parameter is ignored.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-replace
     */
    Replace(i, hbmImage, hbmMask) {
        result := ComCall(6, this, "int", i, HBITMAP, hbmImage, HBITMAP, hbmMask, "HRESULT")
        return result
    }

    /**
     * Adds an image or images to an image list, generating a mask from the specified bitmap. (IImageList.AddMasked)
     * @remarks
     * <div class="alert"><b>Note</b>  The bitmap passed in <i>hbmImage</i> will be modified.</div>
     * <div> </div>
     * <b>IImageList::AddMasked</b> copies the bitmap to an internal data structure. Bitmaps with color depth greater than 8bpp are not supported. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> function to delete <i>hbmImage</i> and <i>crMask</i> after the method returns. 
     *         
     * 
     * To use <b>IImageList::AddMasked</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {HBITMAP} hbmImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains one or more images. The number of images is inferred from the width of the bitmap.
     * @param {COLORREF} crMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * The color used to generate the mask. Each pixel of this color in the specified bitmap is changed to black, and the corresponding bit in the mask is set to 1. If this parameter is CLR_DEFAULT, then the color of the pixel at (0,0) is used as the mask.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that contains the index of the first new image when it returns, if successful, or -1 otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-addmasked
     */
    AddMasked(hbmImage, crMask) {
        result := ComCall(7, this, HBITMAP, hbmImage, COLORREF, crMask, "int*", &pi := 0, "HRESULT")
        return pi
    }

    /**
     * Draws an image list item in the specified device context. (IImageList.Draw)
     * @remarks
     * Overlay images draw transparently over the primary image specified in the <b>i</b> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imagelistdrawparams">IMAGELISTDRAWPARAMS</a>. You specify an overlay image in the <b>fStyle</b>, parameter of <b>IMAGELISTDRAWPARAMS</b> using the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-indextooverlaymask">INDEXTOOVERLAYMASK</a> macro to shift the one-based index of the overlay image. Use the OR operator to combine the macro's return value with the drawing style flags specified in <b>fStyle</b>. You must first specify this image as an overlay image by using <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-setoverlayimage">IImageList::SetOverlayImage</a>. 
     * 		
     * 
     * To use <b>IImageList::Draw</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Pointer<IMAGELISTDRAWPARAMS>} pimldp Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imagelistdrawparams">IMAGELISTDRAWPARAMS</a>*</b>
     * 
     * A pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imagelistdrawparams">IMAGELISTDRAWPARAMS</a> structure that contains the  drawing parameters.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-draw
     */
    Draw(pimldp) {
        result := ComCall(8, this, IMAGELISTDRAWPARAMS.Ptr, pimldp, "HRESULT")
        return result
    }

    /**
     * Removes an image from an image list. (IImageList.Remove)
     * @remarks
     * When an image is removed, the indexes of the remaining images adjust so that they  always range from zero to one less than the number of images in the image list. For example, if you remove the image at index 0, then image 1 becomes image 0, image 2 becomes image 1, and so on. 
     * 		
     * 
     * To use <b>IImageList::Remove</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b>  that contains the index of the image to remove. If this parameter is -1, the method removes all images.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-remove
     */
    Remove(i) {
        result := ComCall(9, this, "int", i, "HRESULT")
        return result
    }

    /**
     * Creates an icon from an image and a mask in an image list.
     * @remarks
     * The calling application must destroy the icon returned from this method using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroyicon">DestroyIcon</a>. 
     * 		
     * 
     * To use <b>IImageList::GetIcon</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the image.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of flags that specify the drawing style. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-draw">IImageList::Draw</a>.
     * @returns {HICON} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HICON</a>*</b>
     * 
     * A pointer to an <b>int</b> that contains the handle to the icon if successful, or <b>NULL</b> if otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-geticon
     */
    GetIcon(i, flags) {
        picon := HICON.Owned()
        result := ComCall(10, this, "int", i, "uint", flags, HICON.Ptr, picon, "HRESULT")
        return picon
    }

    /**
     * Gets information about an image.
     * @remarks
     * To use <b>IImageList::GetImageInfo</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the image.
     * @returns {IMAGEINFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imageinfo">IMAGEINFO</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imageinfo">IMAGEINFO</a> structure that receives information about the image. The information in this structure can directly manipulate the bitmaps of the image.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getimageinfo
     */
    GetImageInfo(i) {
        pImageInfo := IMAGEINFO()
        result := ComCall(11, this, "int", i, IMAGEINFO.Ptr, pImageInfo, "HRESULT")
        return pImageInfo
    }

    /**
     * Copies images from a given image list.
     * @remarks
     * The <i>uFlags</i> parameter can have the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>ILCF_MOVE</b></td>
     * <td>The source image is copied to the destination image's index. This operation results in multiple instances of a given image.
     * 				</td>
     * </tr>
     * <tr>
     * <td><b>ILCF_SWAP</b></td>
     * <td>The source and destination images exchange positions within the image list.
     * 				</td>
     * </tr>
     * </table>
     *  
     * 
     * To use <b>IImageList::Copy</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} iDst Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the zero-based index of the destination image for the copy operation.
     * @param {IUnknown} punkSrc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the source image list.
     * @param {Integer} iSrc Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the zero-based index of the source image for the copy operation.
     * @param {Integer} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that specifies the type of copy operation to be made.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-copy
     */
    Copy(iDst, punkSrc, iSrc, uFlags) {
        result := ComCall(12, this, "int", iDst, "ptr", punkSrc, "int", iSrc, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * Creates a new image by combining two existing images. This method also creates a new image list in which to store the image.
     * @remarks
     * The new image consists of the second image drawn transparently over the first. 	The mask for the new image is obtained by combining the masks of the two existing images with the bitwise OR operator.
     * 
     * To use <b>IImageList::Merge</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} i1 Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the first existing image.
     * @param {IUnknown} punk2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the image list that contains the second image.
     * @param {Integer} i2 Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the second existing image.
     * @param {Integer} dx Type: <b>int</b>
     * 
     * A value of type <b>int</b>  that contains the x-component of the offset of the second image relative to the first image.
     * @param {Integer} dy Type: <b>int</b>
     * 
     * A value of type <b>int</b>  that contains the y-component of the offset of the second image relative to the first image.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * An IID of the interface for the new image list.
     * @returns {Pointer<Void>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PVOID</a>*</b>
     * 
     * A raw pointer to the interface for the new image list.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-merge
     */
    Merge(i1, punk2, i2, dx, dy, riid) {
        result := ComCall(13, this, "int", i1, "ptr", punk2, "int", i2, "int", dx, "int", dy, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Clones an existing image list.
     * @remarks
     * To use <b>IImageList::Clone</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * An IID for the new image list.
     * @returns {Pointer<Void>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PVOID</a>*</b>
     * 
     * The address of a  pointer to the interface for the new image list.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-clone
     */
    Clone(riid) {
        result := ComCall(14, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets an image's bounding rectangle.
     * @remarks
     * To use <b>IImageList::GetImageRect</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the image.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <b> RECT</b> that contains the bounding rectangle when the method returns.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getimagerect
     */
    GetImageRect(i) {
        prc := RECT()
        result := ComCall(15, this, "int", i, RECT.Ptr, prc, "HRESULT")
        return prc
    }

    /**
     * Gets the dimensions of images in an image list. All images in an image list have the same dimensions.
     * @remarks
     * To use <b>IImageList::GetIconSize</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Pointer<Integer>} cx Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that receives the width, in pixels, of each image.
     * @param {Pointer<Integer>} _cy Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that receives the height, in pixels, of each image.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-geticonsize
     */
    GetIconSize(cx, _cy) {
        cxMarshal := cx is VarRef ? "int*" : "ptr"
        _cyMarshal := _cy is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, cxMarshal, cx, _cyMarshal, _cy, "HRESULT")
        return result
    }

    /**
     * Sets the dimensions of images in an image list and removes all images from the list. (IImageList.SetIconSize)
     * @remarks
     * To use <b>IImageList::SetIconSize</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} cx Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the width, in pixels, of the images in the image list. All images in an image list have the same dimensions.
     * @param {Integer} _cy Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the height, in pixels, of the images in the image list. All images in an image list have the same dimensions.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-seticonsize
     */
    SetIconSize(cx, _cy) {
        result := ComCall(17, this, "int", cx, "int", _cy, "HRESULT")
        return result
    }

    /**
     * Gets the number of images in an image list.
     * @remarks
     * To use <b>IImageList::GetImageCount</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that contains the number of images when the method returns.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getimagecount
     */
    GetImageCount() {
        result := ComCall(18, this, "int*", &pi := 0, "HRESULT")
        return pi
    }

    /**
     * Resizes an existing image list. (IImageList.SetImageCount)
     * @remarks
     * If an application expands an image list using this method, it must add new images by using <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-replace">IImageList::Replace</a>. If the application does not add valid images to the new indexes, draw operations that use the new indexes are unpredictable. 
     * 		
     * 
     * If you decrease the size of an image list using this method, images at the end of the list for which there is no longer room are truncated from the list.  Images truncated in this manner are automatically deallocated. 
     * 
     * To use <b>IImageList::SetImageCount</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} uNewCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that specifies the new size of the image list.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-setimagecount
     */
    SetImageCount(uNewCount) {
        result := ComCall(19, this, "uint", uNewCount, "HRESULT")
        return result
    }

    /**
     * Sets the background color for an image list.
     * @remarks
     * To use <b>IImageList::SetBkColor</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {COLORREF} clrBk Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * The background color to set. If this parameter is set to CLR_NONE, then images draw transparently using the <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-addmasked">mask</a>.
     * @returns {COLORREF} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a>*</b>
     * 
     * A pointer to a <b>COLORREF</b> that contains the previous background color on return if successful, or CLR_NONE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-setbkcolor
     */
    SetBkColor(clrBk) {
        result := ComCall(20, this, COLORREF, clrBk, COLORREF.Ptr, &pclr := 0, "HRESULT")
        return pclr
    }

    /**
     * Gets the current background color for an image list.
     * @remarks
     * To use <b>IImageList::GetBkColor</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @returns {COLORREF} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> that contains the background color when the method returns.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getbkcolor
     */
    GetBkColor() {
        result := ComCall(21, this, COLORREF.Ptr, &pclr := 0, "HRESULT")
        return pclr
    }

    /**
     * Begins dragging an image. (IImageList.BeginDrag)
     * @remarks
     * <b>IImageList::BeginDrag</b> creates a temporary image list that is used for dragging. In response to subsequent <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-mousemove">WM_MOUSEMOVE</a> messages, you can move the drag image by using <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-dragmove">IImageList::DragMove</a>. To end the drag operation, you can use <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-enddrag">IImageList::EndDrag</a>. 
     * 		
     * 
     * To use <b>IImageList::BeginDrag</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} iTrack Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the image to drag.
     * @param {Integer} dxHotspot Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the x-component of the drag position relative to the upper-left corner of the image.
     * @param {Integer} dyHotspot Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the y-component of the drag position relative to the upper-left corner of the image.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-begindrag
     */
    BeginDrag(iTrack, dxHotspot, dyHotspot) {
        result := ComCall(22, this, "int", iTrack, "int", dxHotspot, "int", dyHotspot, "HRESULT")
        return result
    }

    /**
     * Ends a drag operation. (IImageList.EndDrag)
     * @remarks
     * To use <b>IImageList::EndDrag</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-enddrag
     */
    EndDrag() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * Locks updates to the specified window during a drag operation and displays the drag image at the specified position within the window. (IImageList.DragEnter)
     * @remarks
     * To begin a drag operation, use <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-begindrag">IImageList::BeginDrag</a>. 
     * 		
     * 
     * To use <b>IImageList::DragEnter</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {HWND} hwndLock Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the window that owns the drag image.
     * @param {Integer} x Type: <b>int</b>
     * 
     * The x-coordinate at which to display the drag image. The coordinate is relative to the upper-left corner of the window, not the client area.
     * @param {Integer} y Type: <b>int</b>
     * 
     * The y-coordinate at which to display the drag image. The coordinate is relative to the upper-left corner of the window, not the client area.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-dragenter
     */
    DragEnter(hwndLock, x, y) {
        result := ComCall(24, this, HWND, hwndLock, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * Unlocks the specified window and hides the drag image, which enables the window to update.
     * @remarks
     * To use <b>IImageList::DragLeave</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {HWND} hwndLock Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the window that contains the drag image.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-dragleave
     */
    DragLeave(hwndLock) {
        result := ComCall(25, this, HWND, hwndLock, "HRESULT")
        return result
    }

    /**
     * Moves the image that is being dragged during a drag-and-drop operation. This function is typically called in response to a WM_MOUSEMOVE message. (IImageList.DragMove)
     * @remarks
     * To begin a drag operation, use the <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-begindrag">IImageList::BeginDrag</a> method. 
     * 		
     * 
     * To use <b>IImageList::DragMove</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} x Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the x-coordinate where the drag image appears. The coordinate is relative to the upper-left corner of the window, not the client area.
     * @param {Integer} y Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the y-coordinate where the drag image appears. The coordinate is relative to the upper-left corner of the window, not the client area.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-dragmove
     */
    DragMove(x, y) {
        result := ComCall(26, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * Creates a new drag image by combining the specified image, which is typically a mouse cursor image, with the current drag image.
     * @remarks
     * To use <b>IImageList::SetDragCursorImage</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface that accesses the image list interface, which contains the new image to combine with the drag image.
     * @param {Integer} iDrag Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the new image to combine with the drag image.
     * @param {Integer} dxHotspot Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the x-component of the hot spot within the new image.
     * @param {Integer} dyHotspot Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the x-component of the hot spot within the new image.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-setdragcursorimage
     */
    SetDragCursorImage(punk, iDrag, dxHotspot, dyHotspot) {
        result := ComCall(27, this, "ptr", punk, "int", iDrag, "int", dxHotspot, "int", dyHotspot, "HRESULT")
        return result
    }

    /**
     * Shows or hides the image being dragged. (IImageList.DragShowNolock)
     * @remarks
     * To use <b>IImageList::DragShowNolock</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {BOOL} fShow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A value that specifies whether to show or hide the image being dragged. Specify <b>TRUE</b> to show the image or <b>FALSE</b> to hide the image.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-dragshownolock
     */
    DragShowNolock(fShow) {
        result := ComCall(28, this, BOOL, fShow, "HRESULT")
        return result
    }

    /**
     * Gets the temporary image list that is used for the drag image. The function also retrieves the current drag position and the offset of the drag image relative to the drag position.
     * @remarks
     * The temporary image list is destroyed when <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-enddrag">IImageList::EndDrag</a> is called. To begin a drag operation, use <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-begindrag">IImageList::BeginDrag</a>. 		
     * 		
     * 
     * To use <b>IImageList::GetDragImage</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Pointer<POINT>} ppt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that receives the current drag position. Can be <b>NULL</b>.
     * @param {Pointer<POINT>} pptHotspot Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that receives the offset of the drag image relative to the drag position. Can be <b>NULL</b>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * An IID for the image list.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PVOID</a>*</b>
     * 
     * The address of a pointer to the interface for the image list if successful, <b>NULL</b> otherwise.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getdragimage
     */
    GetDragImage(ppt, pptHotspot, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(29, this, POINT.Ptr, ppt, POINT.Ptr, pptHotspot, Guid.Ptr, riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * Gets the flags of an image.
     * @remarks
     * To use <b>IImageList::GetItemFlags</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the images whose flags need to be retrieved.
     * @returns {IMAGE_LIST_ITEM_FLAGS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getitemflags
     */
    GetItemFlags(i) {
        result := ComCall(30, this, "int", i, "uint*", &dwFlags := 0, "HRESULT")
        return dwFlags
    }

    /**
     * Retrieves a specified image from the list of images used as overlay masks.
     * @remarks
     * To use <b>IImageList::GetOverlayImage</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     * @param {Integer} _iOverlay Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the one-based index of the overlay mask.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that receives the zero-based index of  
     * 				an image in the image list. This index identifies the image that is used as an overlay mask.
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getoverlayimage
     */
    GetOverlayImage(_iOverlay) {
        result := ComCall(31, this, "int", _iOverlay, "int*", &piIndex := 0, "HRESULT")
        return piIndex
    }

    Query(iid) {
        if (IImageList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 4)
        this.vtbl.ReplaceIcon := CallbackCreate(GetMethod(implObj, "ReplaceIcon"), flags, 4)
        this.vtbl.SetOverlayImage := CallbackCreate(GetMethod(implObj, "SetOverlayImage"), flags, 3)
        this.vtbl.Replace := CallbackCreate(GetMethod(implObj, "Replace"), flags, 4)
        this.vtbl.AddMasked := CallbackCreate(GetMethod(implObj, "AddMasked"), flags, 4)
        this.vtbl.Draw := CallbackCreate(GetMethod(implObj, "Draw"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.GetIcon := CallbackCreate(GetMethod(implObj, "GetIcon"), flags, 4)
        this.vtbl.GetImageInfo := CallbackCreate(GetMethod(implObj, "GetImageInfo"), flags, 3)
        this.vtbl.Copy := CallbackCreate(GetMethod(implObj, "Copy"), flags, 5)
        this.vtbl.Merge := CallbackCreate(GetMethod(implObj, "Merge"), flags, 8)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 3)
        this.vtbl.GetImageRect := CallbackCreate(GetMethod(implObj, "GetImageRect"), flags, 3)
        this.vtbl.GetIconSize := CallbackCreate(GetMethod(implObj, "GetIconSize"), flags, 3)
        this.vtbl.SetIconSize := CallbackCreate(GetMethod(implObj, "SetIconSize"), flags, 3)
        this.vtbl.GetImageCount := CallbackCreate(GetMethod(implObj, "GetImageCount"), flags, 2)
        this.vtbl.SetImageCount := CallbackCreate(GetMethod(implObj, "SetImageCount"), flags, 2)
        this.vtbl.SetBkColor := CallbackCreate(GetMethod(implObj, "SetBkColor"), flags, 3)
        this.vtbl.GetBkColor := CallbackCreate(GetMethod(implObj, "GetBkColor"), flags, 2)
        this.vtbl.BeginDrag := CallbackCreate(GetMethod(implObj, "BeginDrag"), flags, 4)
        this.vtbl.EndDrag := CallbackCreate(GetMethod(implObj, "EndDrag"), flags, 1)
        this.vtbl.DragEnter := CallbackCreate(GetMethod(implObj, "DragEnter"), flags, 4)
        this.vtbl.DragLeave := CallbackCreate(GetMethod(implObj, "DragLeave"), flags, 2)
        this.vtbl.DragMove := CallbackCreate(GetMethod(implObj, "DragMove"), flags, 3)
        this.vtbl.SetDragCursorImage := CallbackCreate(GetMethod(implObj, "SetDragCursorImage"), flags, 5)
        this.vtbl.DragShowNolock := CallbackCreate(GetMethod(implObj, "DragShowNolock"), flags, 2)
        this.vtbl.GetDragImage := CallbackCreate(GetMethod(implObj, "GetDragImage"), flags, 5)
        this.vtbl.GetItemFlags := CallbackCreate(GetMethod(implObj, "GetItemFlags"), flags, 3)
        this.vtbl.GetOverlayImage := CallbackCreate(GetMethod(implObj, "GetOverlayImage"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.ReplaceIcon)
        CallbackFree(this.vtbl.SetOverlayImage)
        CallbackFree(this.vtbl.Replace)
        CallbackFree(this.vtbl.AddMasked)
        CallbackFree(this.vtbl.Draw)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.GetIcon)
        CallbackFree(this.vtbl.GetImageInfo)
        CallbackFree(this.vtbl.Copy)
        CallbackFree(this.vtbl.Merge)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.GetImageRect)
        CallbackFree(this.vtbl.GetIconSize)
        CallbackFree(this.vtbl.SetIconSize)
        CallbackFree(this.vtbl.GetImageCount)
        CallbackFree(this.vtbl.SetImageCount)
        CallbackFree(this.vtbl.SetBkColor)
        CallbackFree(this.vtbl.GetBkColor)
        CallbackFree(this.vtbl.BeginDrag)
        CallbackFree(this.vtbl.EndDrag)
        CallbackFree(this.vtbl.DragEnter)
        CallbackFree(this.vtbl.DragLeave)
        CallbackFree(this.vtbl.DragMove)
        CallbackFree(this.vtbl.SetDragCursorImage)
        CallbackFree(this.vtbl.DragShowNolock)
        CallbackFree(this.vtbl.GetDragImage)
        CallbackFree(this.vtbl.GetItemFlags)
        CallbackFree(this.vtbl.GetOverlayImage)
    }
}
