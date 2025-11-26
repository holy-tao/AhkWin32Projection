#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\WindowsAndMessaging\HICON.ahk
#Include .\IMAGEINFO.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that manipulate and interact with image lists.
 * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nn-commoncontrols-iimagelist
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class IImageList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageList
     * @type {Guid}
     */
    static IID => Guid("{46eb5926-582e-4017-9fdf-e8998daa0950}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add", "ReplaceIcon", "SetOverlayImage", "Replace", "AddMasked", "Draw", "Remove", "GetIcon", "GetImageInfo", "Copy", "Merge", "Clone", "GetImageRect", "GetIconSize", "SetIconSize", "GetImageCount", "SetImageCount", "SetBkColor", "GetBkColor", "BeginDrag", "EndDrag", "DragEnter", "DragLeave", "DragMove", "SetDragCursorImage", "DragShowNolock", "GetDragImage", "GetItemFlags", "GetOverlayImage"]

    /**
     * Adds an image or images to an image list.
     * @param {HBITMAP} hbmImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains the image or images. The number of images is inferred from the width of the bitmap.
     * @param {HBITMAP} hbmMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains the mask. If no mask is used with the image list, this parameter is ignored.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * When this method returns, contains a pointer to the index of the first new image. If the method fails to successfully add the new image, this value is -1.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-add
     */
    Add(hbmImage, hbmMask) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage
        hbmMask := hbmMask is Win32Handle ? NumGet(hbmMask, "ptr") : hbmMask

        result := ComCall(3, this, "ptr", hbmImage, "ptr", hbmMask, "int*", &pi := 0, "HRESULT")
        return pi
    }

    /**
     * Replaces an image with an icon or cursor.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the image to replace. If i is -1, the function adds the image to the end of the list.
     * @param {HICON} hicon Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HICON</a></b>
     * 
     * A handle to the icon or cursor that contains the bitmap and mask for the new image.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that will contain the index of the image on return if 	successful, or -1 otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-replaceicon
     */
    ReplaceIcon(i, hicon) {
        hicon := hicon is Win32Handle ? NumGet(hicon, "ptr") : hicon

        result := ComCall(4, this, "int", i, "ptr", hicon, "int*", &pi := 0, "HRESULT")
        return pi
    }

    /**
     * Adds a specified image to the list of images used as overlay masks.
     * @param {Integer} iImage Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the zero-based index of an image in the image list. This index identifies the image to use as an overlay mask.
     * @param {Integer} iOverlay Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the one-based index of the overlay mask.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-setoverlayimage
     */
    SetOverlayImage(iImage, iOverlay) {
        result := ComCall(5, this, "int", iImage, "int", iOverlay, "HRESULT")
        return result
    }

    /**
     * Replaces an image in an image list with a new image.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the image to replace.
     * @param {HBITMAP} hbmImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains the image.
     * @param {HBITMAP} hbmMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains the mask. If no mask is used with the image list, this parameter is ignored.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-replace
     */
    Replace(i, hbmImage, hbmMask) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage
        hbmMask := hbmMask is Win32Handle ? NumGet(hbmMask, "ptr") : hbmMask

        result := ComCall(6, this, "int", i, "ptr", hbmImage, "ptr", hbmMask, "HRESULT")
        return result
    }

    /**
     * Adds an image or images to an image list, generating a mask from the specified bitmap.
     * @param {HBITMAP} hbmImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains one or more images. The number of images is inferred from the width of the bitmap.
     * @param {COLORREF} crMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * The color used to generate the mask. Each pixel of this color in the specified bitmap is changed to black, and the corresponding bit in the mask is set to 1. If this parameter is CLR_DEFAULT, then the color of the pixel at (0,0) is used as the mask.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that contains the index of the first new image when it returns, if successful, or -1 otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-addmasked
     */
    AddMasked(hbmImage, crMask) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage

        result := ComCall(7, this, "ptr", hbmImage, "uint", crMask, "int*", &pi := 0, "HRESULT")
        return pi
    }

    /**
     * Draws an image list item in the specified device context.
     * @param {Pointer<IMAGELISTDRAWPARAMS>} pimldp Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imagelistdrawparams">IMAGELISTDRAWPARAMS</a>*</b>
     * 
     * A pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imagelistdrawparams">IMAGELISTDRAWPARAMS</a> structure that contains the  drawing parameters.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-draw
     */
    Draw(pimldp) {
        result := ComCall(8, this, "ptr", pimldp, "HRESULT")
        return result
    }

    /**
     * Removes an image from an image list.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b>  that contains the index of the image to remove. If this parameter is -1, the method removes all images.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-remove
     */
    Remove(i) {
        result := ComCall(9, this, "int", i, "HRESULT")
        return result
    }

    /**
     * Creates an icon from an image and a mask in an image list.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the image.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of flags that specify the drawing style. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-draw">IImageList::Draw</a>.
     * @returns {HICON} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HICON</a>*</b>
     * 
     * A pointer to an <b>int</b> that contains the handle to the icon if successful, or <b>NULL</b> if otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-geticon
     */
    GetIcon(i, flags) {
        picon := HICON()
        result := ComCall(10, this, "int", i, "uint", flags, "ptr", picon, "HRESULT")
        return picon
    }

    /**
     * Gets information about an image.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the image.
     * @returns {IMAGEINFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imageinfo">IMAGEINFO</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imageinfo">IMAGEINFO</a> structure that receives information about the image. The information in this structure can directly manipulate the bitmaps of the image.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-getimageinfo
     */
    GetImageInfo(i) {
        pImageInfo := IMAGEINFO()
        result := ComCall(11, this, "int", i, "ptr", pImageInfo, "HRESULT")
        return pImageInfo
    }

    /**
     * Copies images from a given image list.
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
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-copy
     */
    Copy(iDst, punkSrc, iSrc, uFlags) {
        result := ComCall(12, this, "int", iDst, "ptr", punkSrc, "int", iSrc, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * Creates a new image by combining two existing images. This method also creates a new image list in which to store the image.
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
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-merge
     */
    Merge(i1, punk2, i2, dx, dy, riid) {
        result := ComCall(13, this, "int", i1, "ptr", punk2, "int", i2, "int", dx, "int", dy, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Clones an existing image list.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * An IID for the new image list.
     * @returns {Pointer<Void>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PVOID</a>*</b>
     * 
     * The address of a  pointer to the interface for the new image list.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-clone
     */
    Clone(riid) {
        result := ComCall(14, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets an image's bounding rectangle.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the image.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <b> RECT</b> that contains the bounding rectangle when the method returns.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-getimagerect
     */
    GetImageRect(i) {
        prc := RECT()
        result := ComCall(15, this, "int", i, "ptr", prc, "HRESULT")
        return prc
    }

    /**
     * Gets the dimensions of images in an image list. All images in an image list have the same dimensions.
     * @param {Pointer<Integer>} cx Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that receives the width, in pixels, of each image.
     * @param {Pointer<Integer>} cy Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that receives the height, in pixels, of each image.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-geticonsize
     */
    GetIconSize(cx, cy) {
        cxMarshal := cx is VarRef ? "int*" : "ptr"
        cyMarshal := cy is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, cxMarshal, cx, cyMarshal, cy, "HRESULT")
        return result
    }

    /**
     * Sets the dimensions of images in an image list and removes all images from the list.
     * @param {Integer} cx Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the width, in pixels, of the images in the image list. All images in an image list have the same dimensions.
     * @param {Integer} cy Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the height, in pixels, of the images in the image list. All images in an image list have the same dimensions.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-seticonsize
     */
    SetIconSize(cx, cy) {
        result := ComCall(17, this, "int", cx, "int", cy, "HRESULT")
        return result
    }

    /**
     * Gets the number of images in an image list.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that contains the number of images when the method returns.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-getimagecount
     */
    GetImageCount() {
        result := ComCall(18, this, "int*", &pi := 0, "HRESULT")
        return pi
    }

    /**
     * Resizes an existing image list.
     * @param {Integer} uNewCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value that specifies the new size of the image list.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-setimagecount
     */
    SetImageCount(uNewCount) {
        result := ComCall(19, this, "uint", uNewCount, "HRESULT")
        return result
    }

    /**
     * Sets the background color for an image list.
     * @param {COLORREF} clrBk Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * The background color to set. If this parameter is set to CLR_NONE, then images draw transparently using the <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-addmasked">mask</a>.
     * @returns {COLORREF} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a>*</b>
     * 
     * A pointer to a <b>COLORREF</b> that contains the previous background color on return if successful, or CLR_NONE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-setbkcolor
     */
    SetBkColor(clrBk) {
        result := ComCall(20, this, "uint", clrBk, "uint*", &pclr := 0, "HRESULT")
        return pclr
    }

    /**
     * Gets the current background color for an image list.
     * @returns {COLORREF} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> that contains the background color when the method returns.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-getbkcolor
     */
    GetBkColor() {
        result := ComCall(21, this, "uint*", &pclr := 0, "HRESULT")
        return pclr
    }

    /**
     * Begins dragging an image.
     * @param {Integer} iTrack Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the image to drag.
     * @param {Integer} dxHotspot Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the x-component of the drag position relative to the upper-left corner of the image.
     * @param {Integer} dyHotspot Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the y-component of the drag position relative to the upper-left corner of the image.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-begindrag
     */
    BeginDrag(iTrack, dxHotspot, dyHotspot) {
        result := ComCall(22, this, "int", iTrack, "int", dxHotspot, "int", dyHotspot, "HRESULT")
        return result
    }

    /**
     * Ends a drag operation.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-enddrag
     */
    EndDrag() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * Locks updates to the specified window during a drag operation and displays the drag image at the specified position within the window.
     * @param {HWND} hwndLock Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the window that owns the drag image.
     * @param {Integer} x Type: <b>int</b>
     * 
     * The x-coordinate at which to display the drag image. The coordinate is relative to the upper-left corner of the window, not the client area.
     * @param {Integer} y Type: <b>int</b>
     * 
     * The y-coordinate at which to display the drag image. The coordinate is relative to the upper-left corner of the window, not the client area.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-dragenter
     */
    DragEnter(hwndLock, x, y) {
        hwndLock := hwndLock is Win32Handle ? NumGet(hwndLock, "ptr") : hwndLock

        result := ComCall(24, this, "ptr", hwndLock, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * Unlocks the specified window and hides the drag image, which enables the window to update.
     * @param {HWND} hwndLock Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the window that contains the drag image.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-dragleave
     */
    DragLeave(hwndLock) {
        hwndLock := hwndLock is Win32Handle ? NumGet(hwndLock, "ptr") : hwndLock

        result := ComCall(25, this, "ptr", hwndLock, "HRESULT")
        return result
    }

    /**
     * Moves the image that is being dragged during a drag-and-drop operation. This function is typically called in response to a WM_MOUSEMOVE message.
     * @param {Integer} x Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the x-coordinate where the drag image appears. The coordinate is relative to the upper-left corner of the window, not the client area.
     * @param {Integer} y Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the y-coordinate where the drag image appears. The coordinate is relative to the upper-left corner of the window, not the client area.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-dragmove
     */
    DragMove(x, y) {
        result := ComCall(26, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * Creates a new drag image by combining the specified image, which is typically a mouse cursor image, with the current drag image.
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
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-setdragcursorimage
     */
    SetDragCursorImage(punk, iDrag, dxHotspot, dyHotspot) {
        result := ComCall(27, this, "ptr", punk, "int", iDrag, "int", dxHotspot, "int", dyHotspot, "HRESULT")
        return result
    }

    /**
     * Shows or hides the image being dragged.
     * @param {BOOL} fShow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A value that specifies whether to show or hide the image being dragged. Specify <b>TRUE</b> to show the image or <b>FALSE</b> to hide the image.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-dragshownolock
     */
    DragShowNolock(fShow) {
        result := ComCall(28, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * Gets the temporary image list that is used for the drag image. The function also retrieves the current drag position and the offset of the drag image relative to the drag position.
     * @param {Pointer<POINT>} ppt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that receives the current drag position. Can be <b>NULL</b>.
     * @param {Pointer<POINT>} pptHotspot Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that receives the offset of the drag image relative to the drag position. Can be <b>NULL</b>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * An IID for the image list.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PVOID</a>*</b>
     * 
     * The address of a pointer to the interface for the image list if successful, <b>NULL</b> otherwise.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-getdragimage
     */
    GetDragImage(ppt, pptHotspot, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(29, this, "ptr", ppt, "ptr", pptHotspot, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * Gets the flags of an image.
     * @param {Integer} i Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the index of the images whose flags need to be retrieved.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-getitemflags
     */
    GetItemFlags(i) {
        result := ComCall(30, this, "int", i, "uint*", &dwFlags := 0, "HRESULT")
        return dwFlags
    }

    /**
     * Retrieves a specified image from the list of images used as overlay masks.
     * @param {Integer} iOverlay Type: <b>int</b>
     * 
     * A value of type <b>int</b> that contains the one-based index of the overlay mask.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that receives the zero-based index of  
     * 				an image in the image list. This index identifies the image that is used as an overlay mask.
     * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nf-commoncontrols-iimagelist-getoverlayimage
     */
    GetOverlayImage(iOverlay) {
        result := ComCall(31, this, "int", iOverlay, "int*", &piIndex := 0, "HRESULT")
        return piIndex
    }
}
