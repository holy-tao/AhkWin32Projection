#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ICDECOMPRESS structure contains decompression parameters used with the ICM_DECOMPRESS message.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-icdecompress
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class ICDECOMPRESS extends Win32Struct
{
    static sizeof => 48

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
     * <td width="40%"><a id="ICDECOMPRESS_HURRYUP"></a><a id="icdecompress_hurryup"></a><dl>
     * <dt><b>ICDECOMPRESS_HURRYUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tries to decompress at a faster rate. When an application uses this flag, the driver should buffer the decompressed data but not draw the image.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDECOMPRESS_NOTKEYFRAME"></a><a id="icdecompress_notkeyframe"></a><dl>
     * <dt><b>ICDECOMPRESS_NOTKEYFRAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current frame is not a key frame.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDECOMPRESS_NULLFRAME"></a><a id="icdecompress_nullframe"></a><dl>
     * <dt><b>ICDECOMPRESS_NULLFRAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current frame does not contain data and the decompressed image should be left the same.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDECOMPRESS_PREROLL"></a><a id="icdecompress_preroll"></a><dl>
     * <dt><b>ICDECOMPRESS_PREROLL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current frame precedes the point in the movie where playback starts and, therefore, will not be drawn.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICDECOMPRESS_UPDATE"></a><a id="icdecompress_update"></a><dl>
     * <dt><b>ICDECOMPRESS_UPDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Screen is being updated or refreshed.
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
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the input format.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpbiInput {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a buffer containing the input data.
     * @type {Pointer<Void>}
     */
    lpInput {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure containing the output format.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpbiOutput {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a buffer where the driver should write the decompressed image.
     * @type {Pointer<Void>}
     */
    lpOutput {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Chunk identifier from the AVI file.
     * @type {Integer}
     */
    ckid {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
