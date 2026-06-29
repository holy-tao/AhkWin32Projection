#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Graphics\Gdi\HPALETTE.ahk" { HPALETTE }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The ICDRAWBEGIN structure contains decompression parameters used with the ICM_DRAW_BEGIN message.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-icdrawbegin
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct ICDRAWBEGIN {
    #StructPack 8

    /**
     * Applicable flags. The following values are defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_ANIMATE"></a><a id="icdraw_animate"></a><dl>
     * <dt><b>ICDRAW_ANIMATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Application can animate the palette.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_BUFFER"></a><a id="icdraw_buffer"></a><dl>
     * <dt><b>ICDRAW_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffers this data off-screen; it will need to be updated.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_CONTINUE"></a><a id="icdraw_continue"></a><dl>
     * <dt><b>ICDRAW_CONTINUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Drawing is a continuation of the previous frame.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_FULLSCREEN"></a><a id="icdraw_fullscreen"></a><dl>
     * <dt><b>ICDRAW_FULLSCREEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draws the decompressed data on the full screen.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_HDC"></a><a id="icdraw_hdc"></a><dl>
     * <dt><b>ICDRAW_HDC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draws the decompressed data to a window or a DC.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_MEMORYDC"></a><a id="icdraw_memorydc"></a><dl>
     * <dt><b>ICDRAW_MEMORYDC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DC is off-screen.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_QUERY"></a><a id="icdraw_query"></a><dl>
     * <dt><b>ICDRAW_QUERY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Determines if the decompressor can handle the decompression. The driver does not actually decompress the data.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_RENDER"></a><a id="icdraw_render"></a><dl>
     * <dt><b>ICDRAW_RENDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Renders but does not draw the data.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_UPDATING"></a><a id="icdraw_updating"></a><dl>
     * <dt><b>ICDRAW_UPDATING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current frame is being updated rather than played.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Handle to the palette used for drawing.
     */
    hpal : HPALETTE

    /**
     * Handle to the window used for drawing.
     */
    hwnd : HWND

    /**
     * Handle to the DC used for drawing. Specify <b>NULL</b> to use a DC associated with the specified window.
     */
    hdc : HDC

    /**
     * The x-coordinate of the destination rectangle.
     */
    xDst : Int32

    /**
     * The y-coordinate of the destination rectangle.
     */
    yDst : Int32

    /**
     * Width of the destination rectangle.
     */
    dxDst : Int32

    /**
     * Height of the destination rectangle.
     */
    dyDst : Int32

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the input format.
     */
    lpbi : BITMAPINFOHEADER.Ptr

    /**
     * The x-coordinate of the source rectangle.
     */
    xSrc : Int32

    /**
     * The y-coordinate of the source rectangle.
     */
    ySrc : Int32

    /**
     * Width of the source rectangle.
     */
    dxSrc : Int32

    /**
     * Height of the source rectangle.
     */
    dySrc : Int32

    /**
     * Decompression rate in an integer format. To obtain the rate in frames per second, divide this value by the value in <b>dwScale</b>.
     */
    dwRate : UInt32

    /**
     * Value used to scale <b>dwRate</b> to frames per second.
     */
    dwScale : UInt32

}
