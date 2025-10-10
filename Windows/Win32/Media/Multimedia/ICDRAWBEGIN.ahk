#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ICDRAWBEGIN structure contains decompression parameters used with the ICM_DRAW_BEGIN message.
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-icdrawbegin
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class ICDRAWBEGIN extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Handle to the palette used for drawing.
     * @type {Pointer<Void>}
     */
    hpal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Handle to the window used for drawing.
     * @type {Pointer<Void>}
     */
    hwnd {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Handle to the DC used for drawing. Specify <b>NULL</b> to use a DC associated with the specified window.
     * @type {Pointer<Void>}
     */
    hdc {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The x-coordinate of the destination rectangle.
     * @type {Integer}
     */
    xDst {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The y-coordinate of the destination rectangle.
     * @type {Integer}
     */
    yDst {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Width of the destination rectangle.
     * @type {Integer}
     */
    dxDst {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Height of the destination rectangle.
     * @type {Integer}
     */
    dyDst {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the input format.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpbi {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The x-coordinate of the source rectangle.
     * @type {Integer}
     */
    xSrc {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * The y-coordinate of the source rectangle.
     * @type {Integer}
     */
    ySrc {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * Width of the source rectangle.
     * @type {Integer}
     */
    dxSrc {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Height of the source rectangle.
     * @type {Integer}
     */
    dySrc {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * Decompression rate in an integer format. To obtain the rate in frames per second, divide this value by the value in <b>dwScale</b>.
     * @type {Integer}
     */
    dwRate {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Value used to scale <b>dwRate</b> to frames per second.
     * @type {Integer}
     */
    dwScale {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }
}
