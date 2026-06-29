#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HIMAGELIST.ahk" { HIMAGELIST }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * Contains information about an image list draw operation and is used with the IImageList::Draw function. (IMAGELISTDRAWPARAMS)
 * @remarks
 * An overlay image is an image that is drawn on top of the primary image specified in the <b>i</b> member of this structure. To specify an overlay image, use the bitwise <b>OR</b> operator to combine <b>fStyle</b> with the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-indextooverlaymask">INDEXTOOVERLAYMASK</a> macro, passing the one-based index of the overlay image in the macro. This image must have been previously specified as an overlay image using the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_setoverlayimage">ImageList_SetOverlayImage</a> API. 
 * 
 * To extract the overlay image from the <b>fStyle</b>, use the bitwise <b>AND</b> operator to mask <b>fStyle</b> with the <a href="https://docs.microsoft.com/windows/desktop/Controls/imagelistdrawflags">ILD_OVERLAYMASK</a> value. 
 * 
 * Comctl32.dll version 6 is not redistributable.. To use Comctl32.dll version 6, you must specify it in a manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-imagelistdrawparams
 * @namespace Windows.Win32.UI.Controls
 */
export default struct IMAGELISTDRAWPARAMS {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>HIMAGELIST</b>
     * 
     * A handle to the image list that contains the image to be drawn.
     */
    himl : HIMAGELIST

    /**
     * Type: <b>int</b>
     * 
     * The zero-based index of the image to be drawn.
     */
    i : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * A handle to the destination device context.
     */
    hdcDst : HDC

    /**
     * Type: <b>int</b>
     * 
     * The x-coordinate that specifies where the image is drawn.
     */
    x : Int32

    /**
     * Type: <b>int</b>
     * 
     * The y-coordinate that specifies where the image is drawn.
     */
    y : Int32

    /**
     * Type: <b>int</b>
     * 
     * A value that specifies the number of pixels to draw, relative to the upper-left corner of the drawing operation as specified by <b>xBitmap</b> and <b>yBitmap</b>. If <b>cx</b> and <b>cy</b> are zero, then <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-draw">Draw</a> draws the entire valid section. The method does not ensure that the parameters are valid.
     */
    cx : Int32

    /**
     * Type: <b>int</b>
     * 
     * A value that specifies the number of pixels to draw, relative to the upper-left corner of the drawing operation as specified by <b>xBitmap</b> and <b>yBitmap</b>. If <b>cx</b> and <b>cy</b> are zero, then <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist-draw">Draw</a> draws the entire valid section. The method does not ensure that the parameters are valid.
     */
    cy : Int32

    /**
     * Type: <b>int</b>
     * 
     * The x-coordinate that specifies the upper-left corner of the drawing operation in reference to the image itself. Pixels of the image that are to the left of <b>xBitmap</b> and above <b>yBitmap</b> do not appear.
     */
    xBitmap : Int32

    /**
     * Type: <b>int</b>
     * 
     * The y-coordinate that specifies the upper-left corner of the drawing operation in reference to the image itself. Pixels of the image that are to the left of <b>xBitmap</b> and above <b>yBitmap</b> do not appear.
     */
    yBitmap : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     */
    rgbBk : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     */
    rgbFg : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A flag specifying the drawing style and, optionally, the overlay image. See the comments section at the end of this topic for information on the overlay image. This member can contain one or more <a href="https://docs.microsoft.com/windows/desktop/Controls/imagelistdrawflags">image list drawing flags</a>.
     */
    fStyle : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A value specifying a raster operation code. These codes define how the color data for the source rectangle will be combined with the color data for the destination rectangle to achieve the final color. This member is ignored if	<b>fStyle</b> does not include the <a href="https://docs.microsoft.com/windows/desktop/Controls/imagelistdrawflags">ILD_ROP</a> flag. Some common raster operation codes include: 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BLACKNESS"></a><a id="blackness"></a><dl>
     * <dt><b>BLACKNESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Fills the destination rectangle using the color associated with index zero in the physical palette. (This color is black for the default physical palette.) 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSTINVERT"></a><a id="dstinvert"></a><dl>
     * <dt><b>DSTINVERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Inverts the destination rectangle. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MERGECOPY"></a><a id="mergecopy"></a><dl>
     * <dt><b>MERGECOPY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Merges the source rectangle colors with the specified pattern by using the Boolean <b>AND</b> operator. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MERGEPAINT"></a><a id="mergepaint"></a><dl>
     * <dt><b>MERGEPAINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Merges the inverted source rectangle colors with the destination rectangle colors by using the Boolean <b>OR</b> operator. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NOTSRCCOPY"></a><a id="notsrccopy"></a><dl>
     * <dt><b>NOTSRCCOPY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copies the inverted source rectangle to the destination. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NOTSRCERASE"></a><a id="notsrcerase"></a><dl>
     * <dt><b>NOTSRCERASE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the source and destination rectangle colors by using the Boolean <b>OR</b> operator. Inverts the resultant color. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PATCOPY"></a><a id="patcopy"></a><dl>
     * <dt><b>PATCOPY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copies the specified pattern into the destination bitmap. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PATINVERT"></a><a id="patinvert"></a><dl>
     * <dt><b>PATINVERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the specified pattern colors with the destination rectangle colors by using the Boolean <b>XOR</b> operator. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PATPAINT"></a><a id="patpaint"></a><dl>
     * <dt><b>PATPAINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the pattern colors with the inverted source rectangle colors and combines the result with the destination rectangle colors by using the Boolean <b>OR</b> operator. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SRCAND"></a><a id="srcand"></a><dl>
     * <dt><b>SRCAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the source and destination rectangle colors by using the Boolean <b>AND</b> operator. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SRCCOPY"></a><a id="srccopy"></a><dl>
     * <dt><b>SRCCOPY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copies the source rectangle directly to the destination rectangle. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SRCERASE"></a><a id="srcerase"></a><dl>
     * <dt><b>SRCERASE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the destination rectangle's inverted colors with the source rectangle colors by using the Boolean <b>AND</b> operator. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SRCINVERT"></a><a id="srcinvert"></a><dl>
     * <dt><b>SRCINVERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the source and destination rectangle colors by using the Boolean <b>XOR</b> operator. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SRCPAINT"></a><a id="srcpaint"></a><dl>
     * <dt><b>SRCPAINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combines the source and destination rectangle colors by using the Boolean <b>OR</b> operator. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WHITENESS"></a><a id="whiteness"></a><dl>
     * <dt><b>WHITENESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Fills the destination rectangle using the color associated with index one in the physical palette. This color is white for the default physical palette. 
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwRop : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A flag that specifies the drawing state. This member can contain one or more <a href="https://docs.microsoft.com/windows/desktop/Controls/imageliststateflags">image list state flags</a>. You must use comctl32.dll version 6 to use this member. See the Remarks.
     */
    fState : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Used with the <b>alpha blending</b> effect.
     * 
     * When used with <a href="https://docs.microsoft.com/windows/desktop/Controls/imageliststateflags">ILS_ALPHA</a>, this member holds the value for the alpha channel. This value can be from 0 to 255, with 0 being completely transparent, and 255 being completely opaque. 
     * 
     * You must use comctl32.dll version 6 to use this member. See the Remarks.
     */
    Frame : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A color used for the <b>glow</b> and <b>shadow</b> effects. You must use comctl32.dll version 6 to use this member. See the Remarks.
     */
    crEffect : COLORREF

}
