#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\IPropertySetStorage.ahk
#Include .\IShellImageDataAbort.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods and properties that display, manipulate, and describe image data.
 * @remarks
 * 
 * This interface was not included in a public header file prior to Windows Vista.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nn-shimgdata-ishellimagedata
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellImageData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellImageData
     * @type {Guid}
     */
    static IID => Guid("{bfdeec12-8040-4403-a5ea-9e07dafcf530}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "Draw", "NextFrame", "NextPage", "PrevPage", "IsTransparent", "IsAnimated", "IsVector", "IsMultipage", "IsEditable", "IsPrintable", "IsDecoded", "GetCurrentPage", "GetPageCount", "SelectPage", "GetSize", "GetRawDataFormat", "GetPixelFormat", "GetDelay", "GetProperties", "Rotate", "Scale", "DiscardEdit", "SetEncoderParams", "DisplayName", "GetResolution", "GetEncoderParams", "RegisterAbort", "CloneFrame", "ReplaceFrame"]

    /**
     * Decodes the image file, setting state.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * One of the following flags.
     * @param {Integer} cxDesired Type: <b>ULONG</b>
     * 
     * The desired horizontal size of the decoded image. This parameter is only used if the <b>SHIMGDEC_THUMBNAIL</b> flag is set. If the <b>SHIMGDEC_DEFAULT</b> flag is set instead, this value is ignored.
     * @param {Integer} cyDesired Type: <b>ULONG</b>
     * 
     * The desired vertical size of the decoded image. This parameter is only used if the <b>SHIMGDEC_THUMBNAIL</b> flag is set. If the <b>SHIMGDEC_DEFAULT</b> flag is set instead, this value is ignored.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise, including the following:
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
     * The file could not be loaded or the calling application stopped the decode process through a call to a registered <a href="/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedataabort">IShellImageDataAbort</a> (see <a href="/windows/desktop/api/shimgdata/nf-shimgdata-ishellimagedata-registerabort">IShellImageData::RegisterAbort</a> for more information).
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
     * The internal object cannot be instantiated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The path used to create this instance of <a href="/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a> was a URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image has already been decoded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-decode
     */
    Decode(dwFlags, cxDesired, cyDesired) {
        result := ComCall(3, this, "uint", dwFlags, "uint", cxDesired, "uint", cyDesired, "HRESULT")
        return result
    }

    /**
     * Draws a decoded image.
     * @param {HDC} hdc Type: <b>HDC</b>
     * 
     * The handle of the image.
     * @param {Pointer<RECT>} prcDest Type: <b>LPRECT</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>, measured in pixels, that specifies the bounds of the rendered image. The portion of the image specified by <i>prcSrc</i> is scaled to fill the rectangle specified by <i>prcDest</i>.
     * @param {Pointer<RECT>} prcSrc Type: <b>LPRECT</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> that specifies the portion of the image to be drawn.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The image was not previously decoded, the call to <a href="/windows/desktop/api/shimgdata/nf-shimgdata-ishellimagedata-decode">IShellImageData::Decode</a> failed, or <i>hdc</i> is <b>NULL</b>. Other internal calls also can cause this error to be returned.
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
     * The <i>prcDest</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process was terminated by the calling application through a registered instance of <a href="/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedataabort">IShellImageDataAbort</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-draw
     */
    Draw(hdc, prcDest, prcSrc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(4, this, "ptr", hdc, "ptr", prcDest, "ptr", prcSrc, "HRESULT")
        return result
    }

    /**
     * Switches to the next frame of an animated image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The current frame cannot be retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is not animated, the image has not yet been decoded, or a limit on the number of times to loop the animation has been reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The next frame is not yet available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOMOREDATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No further data is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-nextframe
     */
    NextFrame() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Switches to the next page of a multipage image. Any associated animations are reset.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The current page cannot be retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_ENUM_NOMORE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No further pages are available, the image was not previously decoded, or the decode process failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-nextpage
     */
    NextPage() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Switches to the previous page of a multipage image. Any associated animations are reset.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The current frame cannot be retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_ENUM_NOMORE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No previous pages are available, the image was not previously decoded, or the decode process failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-prevpage
     */
    PrevPage() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Determines whether the image is transparent.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following:
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
     * The image has transparency.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image does not have transparency.
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
     * The image has not been decoded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-istransparent
     */
    IsTransparent() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Determines whether the image is animated.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following:
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
     * The image is animated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is not animated, has not been decoded, or the decoding process failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-isanimated
     */
    IsAnimated() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Determines whether the image is a vector image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following:
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
     * The image is a vector image, supporting the GDI+ flag <a href="/windows/desktop/api/gdiplusimaging/ne-gdiplusimaging-imageflags">ImageFlagsScalable</a>.
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
     * The image has not been decoded, the image is empty, or the file is not an image.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All other cases.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-isvector
     */
    IsVector() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Determines whether the image is a multipage Tagged Image File Format (TIFF) image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following:
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
     * The image contains more than one page.
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
     * The image has only one page, the image has not been decoded, or the decoding process failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-ismultipage
     */
    IsMultipage() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Determines whether the image can be edited.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following:
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
     * The image can be edited.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image cannot be edited, the image has not been decoded, or the decoding process failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-iseditable
     */
    IsEditable() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Determines whether the image can be printed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The image has not been decoded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-isprintable
     */
    IsPrintable() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Determines whether the image has been decoded by calling IShellImageData::Decode. Many operations return a failure code if the image is not first decoded.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following:
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
     * 
     * <a href="/windows/desktop/api/shimgdata/nf-shimgdata-ishellimagedata-decode">IShellImageData::Decode</a> was called on the image and was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All other cases.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-isdecoded
     */
    IsDecoded() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Gets the current page of a multipage image.
     * @param {Pointer<Integer>} pnPage Type: <b>ULONG*</b>
     * 
     * A pointer to the page number.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK. If the image is not a multipage image, such as a .jpg file, the method returns S_OK with a page number of 0.
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-getcurrentpage
     */
    GetCurrentPage(pnPage) {
        pnPageMarshal := pnPage is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, pnPageMarshal, pnPage, "HRESULT")
        return result
    }

    /**
     * Gets the number of pages in a multipage image.
     * @param {Pointer<Integer>} pcPages Type: <b>ULONG*</b>
     * 
     * A pointer to the page count. This value is valid only when the method returns S_OK.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The image has not been decoded or the decoding process failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-getpagecount
     */
    GetPageCount(pcPages) {
        pcPagesMarshal := pcPages is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pcPagesMarshal, pcPages, "HRESULT")
        return result
    }

    /**
     * Selects a specified page in a multipage image.
     * @param {Integer} iPage Type: <b>ULONG</b>
     * 
     * The page number of the page to select.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The current page cannot be retrieved, the image has not been decoded, or the decoding process failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_ENUM_NOMORE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified page number does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-selectpage
     */
    SelectPage(iPage) {
        result := ComCall(17, this, "uint", iPage, "HRESULT")
        return result
    }

    /**
     * Gets the dimensions of the image file.
     * @param {Pointer<SIZE>} pSize Type: <b><a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure containing the size of the image. This value is valid only when the method returns <b>S_OK</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful or an error value otherwise, including the following:
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
     * The image has not been decoded or the decoding process failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-getsize
     */
    GetSize(pSize) {
        result := ComCall(18, this, "ptr", pSize, "HRESULT")
        return result
    }

    /**
     * Retrieves a GUID that identifies the format of the image.
     * @param {Pointer<Guid>} pDataFormat Type: <b>GUID*</b>
     * 
     * A pointer to a value indicating the format. This value is valid only when the method returns S_OK.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The image has not been decoded or the decoding process failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-getrawdataformat
     */
    GetRawDataFormat(pDataFormat) {
        result := ComCall(19, this, "ptr", pDataFormat, "HRESULT")
        return result
    }

    /**
     * Gets the pixel format of the image.
     * @param {Pointer<Integer>} pFormat Type: <b>PixelFormat*</b>
     * 
     * A pointer to a value of type <a href="https://docs.microsoft.com/windows/desktop/gdiplus/-gdiplus-constant-image-pixel-format-constants">PixelFormat</a> indicating the pixel format.  This value is valid only when the method returns <b>S_OK</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful or an error value otherwise, including the following:
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
     * The image has not been decoded or the decoding process failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-getpixelformat
     */
    GetPixelFormat(pFormat) {
        pFormatMarshal := pFormat is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pFormatMarshal, pFormat, "HRESULT")
        return result
    }

    /**
     * Gets the delay value for the current frame of an animation.
     * @param {Pointer<Integer>} pdwDelay Type: <b>DWORD*</b>
     * 
     * A pointer to the delay value, in milliseconds. This value is valid only when the method returns S_OK.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The image has not been decoded or the decoding process failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-getdelay
     */
    GetDelay(pdwDelay) {
        pdwDelayMarshal := pdwDelay is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, pdwDelayMarshal, pdwDelay, "HRESULT")
        return result
    }

    /**
     * Gets an IPropertySetStorage through which the properties of the image can be accessed.
     * @param {Integer} dwMode Type: <b>DWORD</b>
     * 
     * Not used, set to 0.
     * @returns {IPropertySetStorage} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>**</b>
     * 
     * The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-getproperties
     */
    GetProperties(dwMode) {
        result := ComCall(22, this, "uint", dwMode, "ptr*", &ppPropSet := 0, "HRESULT")
        return IPropertySetStorage(ppPropSet)
    }

    /**
     * Rotates an image in increments of 90 degrees.
     * @param {Integer} dwAngle Type: <b>DWORD</b>
     * 
     * The angle of rotation. Only angles of 0, 90, 180, and 270 are recognized.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The image has not been decoded or the decoding process failed. This value is also returned when certain internal calls to GDI+ methods fail.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTVALIDFORANIMATEDIMAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is an animated image and cannot be rotated.
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
     * The <i>dwAngle</i> parameter is a value other than 0, 90, 180, or 270.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwAngle</i> parameter is 0.
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
     * Not enough resources are available for the method to create an internal working copy of the image.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-rotate
     */
    Rotate(dwAngle) {
        result := ComCall(23, this, "uint", dwAngle, "HRESULT")
        return result
    }

    /**
     * Adjusts the size of an image.
     * @param {Integer} cx Type: <b>ULONG</b>
     * 
     * The horizontal (x) dimension. If this value is 0, the x dimension is set to a scaled value based on the point specified in <i>cy</i>.
     * @param {Integer} cy Type: <b>ULONG</b>
     * 
     * The vertical (y) dimension. If this value is 0, the y dimension is set to a scaled value based on the point specified in <i>cx</i>.
     * @param {Integer} hints Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/gdiplusenums/ne-gdiplusenums-interpolationmode">InterpolationMode</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusenums/ne-gdiplusenums-interpolationmode">InterpolationMode</a> enumeration, specifying the algorithm that is used when the image is scaled.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful or an error value otherwise, including the following:
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
     * The image was not previously decoded or the call to <a href="/windows/desktop/api/shimgdata/nf-shimgdata-ishellimagedata-decode">IShellImageData::Decode</a> failed. Other internal calls also can cause this error to be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTVALIDFORANIMATEDIMAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The image is an animated image and cannot be scaled using this method.
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
     * The internal object cannot be instantiated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process was stopped by the calling application through a registered instance of <a href="/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedataabort">IShellImageDataAbort</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-scale
     */
    Scale(cx, cy, hints) {
        result := ComCall(24, this, "uint", cx, "uint", cy, "int", hints, "HRESULT")
        return result
    }

    /**
     * Discards edits made to an image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-discardedit
     */
    DiscardEdit() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * Sets encoder parameters.
     * @param {IPropertyBag} pbagEnc Type: <b><a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a>*</b>
     * 
     * A pointer to an <a href="../oaidl/nn-oaidl-ipropertybag.md">IPropertyBag</a> containing the encoder properties.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns<b> S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-setencoderparams
     */
    SetEncoderParams(pbagEnc) {
        result := ComCall(26, this, "ptr", pbagEnc, "HRESULT")
        return result
    }

    /**
     * Gets the name of the file if IShellImageData was initialized on a file path. Otherwise, gets the name of the data stream.
     * @param {PWSTR} wszName Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer containing the display name as a Unicode string. On exit, the contents of the buffer are only valid when the method returns S_OK.
     * @param {Integer} cch Type: <b>UINT</b>
     * 
     * The size, in characters, of the buffer pointed to by <i>wszName</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The file name or stream name cannot be retrieved.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-displayname
     */
    DisplayName(wszName, cch) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(27, this, "ptr", wszName, "uint", cch, "HRESULT")
        return result
    }

    /**
     * Gets the resolution, in dots per inch (dpi), of the image.
     * @param {Pointer<Integer>} puResolutionX Type: <b>ULONG*</b>
     * 
     * A pointer to the horizontal resolution.
     * @param {Pointer<Integer>} puResolutionY Type: <b>ULONG*</b>
     * 
     * A pointer to the vertical resolution.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The image has not been decoded, the decode process failed, or the resolution cannot be retrieved. In the latter case, both <i>puResolutionX</i> and <i>puResolutionY</i> are set to 0.
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
     * Both <i>puResolutionX</i> and <i>puResolutionY</i> are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-getresolution
     */
    GetResolution(puResolutionX, puResolutionY) {
        puResolutionXMarshal := puResolutionX is VarRef ? "uint*" : "ptr"
        puResolutionYMarshal := puResolutionY is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, puResolutionXMarshal, puResolutionX, puResolutionYMarshal, puResolutionY, "HRESULT")
        return result
    }

    /**
     * Gets the current set of encoder parameters.
     * @param {Pointer<Guid>} pguidFmt Type: <b>GUID*</b>
     * 
     * A pointer to a GUID that specifies the encoder. This must be an encoder supported by GDI+. If this parameter is <b>NULL</b>, an unhandled exception results.
     * @param {Pointer<Pointer<Integer>>} ppEncParams Type: <b>EncoderParameters**</b>
     * 
     * The address of a pointer to an array of <a href="https://docs.microsoft.com/previous-versions/ms534434(v=vs.85)">EncoderParameter</a> objects.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful or an error value otherwise, including the following:
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
     * Several circumstances can generate this return value.
     *                         
     * 
     * <ul>
     * <li>The image was not decoded or the decoding process failed.</li>
     * <li><i>pguidFmt</i> refers to a format not supported by GDI+.</li>
     * <li>An internal call failed.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-getencoderparams
     */
    GetEncoderParams(pguidFmt, ppEncParams) {
        ppEncParamsMarshal := ppEncParams is VarRef ? "ptr*" : "ptr"

        result := ComCall(29, this, "ptr", pguidFmt, ppEncParamsMarshal, ppEncParams, "HRESULT")
        return result
    }

    /**
     * Sets a callback abort object, optionally returning a pointer to the previous object.
     * @param {IShellImageDataAbort} pAbort Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedataabort">IShellImageDataAbort</a>*</b>
     * 
     * A pointer to an abort object. If this parameter is <b>NULL</b>, an unhandled exception results.
     * @returns {IShellImageDataAbort} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedataabort">IShellImageDataAbort</a>**</b>
     * 
     * The address of a pointer to the previous abort object. This parameter can be <b>NULL</b> if the previous object is not of interest.
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-registerabort
     */
    RegisterAbort(pAbort) {
        result := ComCall(30, this, "ptr", pAbort, "ptr*", &ppAbortPrev := 0, "HRESULT")
        return IShellImageDataAbort(ppAbortPrev)
    }

    /**
     * Retrieves a clone of the current image or frame.
     * @param {Pointer<Pointer<Integer>>} ppImg Type: <b>Image**</b>
     * 
     * The address that receives a pointer to the clone image. If this parameter is <b>NULL</b> on entry, an unhandled exception results.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful or an error value otherwise, including the following:
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
     * The <i>ppImg</i> parameter is <b>NULL</b> on entry or the image cannot be cloned. In the latter case, <i>ppImg</i> is set to <b>NULL</b>.
     *           
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-cloneframe
     */
    CloneFrame(ppImg) {
        ppImgMarshal := ppImg is VarRef ? "ptr*" : "ptr"

        result := ComCall(31, this, ppImgMarshal, ppImg, "HRESULT")
        return result
    }

    /**
     * Replaces the current frame with a new image.
     * @param {Pointer<Integer>} pImg Type: <b>Image*</b>
     * 
     * The address of the new image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedata-replaceframe
     */
    ReplaceFrame(pImg) {
        pImgMarshal := pImg is VarRef ? "char*" : "ptr"

        result := ComCall(32, this, pImgMarshal, pImg, "HRESULT")
        return result
    }
}
