#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ICDECOMPRESSEX structure contains decompression parameters used with the ICM_DECOMPRESSEX message.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-icdecompressex
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class ICDECOMPRESSEX extends Win32Struct
{
    static sizeof => 72

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
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions//ms532290(v=vs.85)">BITMAPINFOHEADER</a> structure containing the input format.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpbiSrc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a buffer containing the input data.
     * @type {Pointer<Void>}
     */
    lpSrc {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions//ms532290(v=vs.85)">BITMAPINFOHEADER</a> structure containing the output format.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpbiDst {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a buffer where the driver should write the decompressed image.
     * @type {Pointer<Void>}
     */
    lpDst {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The x-coordinate of the destination rectangle within the DIB specified by <b>lpbiDst</b>.
     * @type {Integer}
     */
    xDst {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * The y-coordinate of the destination rectangle within the DIB specified by <b>lpbiDst</b>.
     * @type {Integer}
     */
    yDst {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Width of the destination rectangle.
     * @type {Integer}
     */
    dxDst {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Height of the destination rectangle.
     * @type {Integer}
     */
    dyDst {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * The x-coordinate of the source rectangle within the DIB specified by <b>lpbiSrc</b>.
     * @type {Integer}
     */
    xSrc {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * The y-coordinate of the source rectangle within the DIB specified by <b>lpbiSrc</b>.
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
}
