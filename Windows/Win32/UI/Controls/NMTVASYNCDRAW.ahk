#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMAGELISTDRAWPARAMS.ahk" { IMAGELISTDRAWPARAMS }
#Import ".\HTREEITEM.ahk" { HTREEITEM }

/**
 * Contains an explanation of why the draw of an icon or overlay tree item failed.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtvasyncdraw
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMTVASYNCDRAW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imagelistdrawparams">IMAGELISTDRAWPARAMS</a>*</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imagelistdrawparams">IMAGELISTDRAWPARAMS</a> structure describing the image that failed to draw.
     */
    pimldp : IMAGELISTDRAWPARAMS.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Result code indicating why the draw failed, either ILDRF_IMAGELOWQUALITY, ILDRF_OVERLAYLOWQUALITY, E_PENDING, or S_OK. A code of S_OK indicates that the image is present but not at the required image quality.
     */
    hr : HRESULT

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Handle of the tree item that failed to draw.
     */
    hItem : HTREEITEM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Data for <b>hItem</b>. This is the same data for the item that is retrieved with the message <a href="https://docs.microsoft.com/windows/desktop/Controls/tvm-getitem">TVM_GETITEM</a> using the appropriate <b>mask</b> in structure <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tvitema">TVITEM</a>. This data is parent specific; the parent can store information that helps it identify the tree item or other information. Data is provided in <b>lParam</b> for convenience, so that the parent does not need to send message <b>TVM_GETITEM</b>.
     */
    lParam : LPARAM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Action that the sender (the tree-view control) should execute on return. Value must be one of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADRF_DRAWIMAGE"></a><a id="adrf_drawimage"></a><dl>
     * <dt><b>ADRF_DRAWIMAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draw the image specified by <b>iRetImageIndex</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADRF_DRAWSYNC"></a><a id="adrf_drawsync"></a><dl>
     * <dt><b>ADRF_DRAWSYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Proceed to draw the image anyway, that is, synchronously extract the image and paint. Assuming the control is on the UI thread, use of this flag implies low priority UI performance, since extraction times may vary and the UI could be unresponsive for an extended period of time during extraction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADRF_DRAWNOTHING"></a><a id="adrf_drawnothing"></a><dl>
     * <dt><b>ADRF_DRAWNOTHING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not draw an image.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwRetFlags : UInt32

    /**
     * Type: <b>int</b>
     * 
     * Index of the image to draw in the image list. Used if ADRF_DRAWIMAGE is returned in <b>dwRetFlags</b>.
     */
    iRetImageIndex : Int32

}
