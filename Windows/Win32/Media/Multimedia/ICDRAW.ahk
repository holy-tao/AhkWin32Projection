#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ICDRAW structure contains parameters for drawing video data to the screen. This structure is used with the ICM_DRAW message.
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-icdraw
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class ICDRAW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Flags from the AVI file index. The following values are defined:
     *           
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_HURRYUP"></a><a id="icdraw_hurryup"></a><dl>
     * <dt><b>ICDRAW_HURRYUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is buffered and not drawn to the screen. Use this flag for fastest decompression.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_NOTKEYFRAME"></a><a id="icdraw_notkeyframe"></a><dl>
     * <dt><b>ICDRAW_NOTKEYFRAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current frame is not a key frame.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_NULLFRAME"></a><a id="icdraw_nullframe"></a><dl>
     * <dt><b>ICDRAW_NULLFRAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current frame does not contain any data, and the previous frame should be redrawn.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_PREROLL"></a><a id="icdraw_preroll"></a><dl>
     * <dt><b>ICDRAW_PREROLL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current frame of video occurs before playback should start. For example, if playback will begin on frame 10, and frame 0 is the nearest previous key frame, frames 0 through 9 are sent to the driver with this flag set. The driver needs this data to display frame 10 properly.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDRAW_UPDATE"></a><a id="icdraw_update"></a><dl>
     * <dt><b>ICDRAW_UPDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Updates the screen based on data previously received. In this case, <b>lpData</b> should be ignored.
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
     * Pointer to a structure containing the data format. For video streams, this is a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure.
     * @type {Pointer<Void>}
     */
    lpFormat {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the data to render.
     * @type {Pointer<Void>}
     */
    lpData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Number of data bytes to render.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Time, in samples, when this data should be drawn. For video data this is normally a frame number.
     * @type {Integer}
     */
    lTime {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
