#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ICOPEN structure contains information about the data stream being compressed or decompressed, the version number of the driver, and how the driver is used.
 * @remarks
 * 
 * This structure is passed to video capture drivers when they are opened. This allows a single installable driver to function as either an installable compressor or a video capture device. By examining the <b>fccType</b> member of the <b>ICOPEN</b> structure, the driver can determine its function. For example, a <b>fccType</b> value of "VIDC" indicates that it is opened as an installable video compressor.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-icopen
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class ICOPEN extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Size, in bytes, of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Four-character code indicating the type of stream being compressed or decompressed. Specify "VIDC" for video streams.
     * @type {Integer}
     */
    fccType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Four-character code identifying a specific compressor.
     * @type {Integer}
     */
    fccHandler {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Version of the installable driver interface used to open the driver.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Applicable flags indicating why the driver is opened. The following values are defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_COMPRESS"></a><a id="icmode_compress"></a><dl>
     * <dt><b>ICMODE_COMPRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver is opened to compress data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_DECOMPRESS"></a><a id="icmode_decompress"></a><dl>
     * <dt><b>ICMODE_DECOMPRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver is opened to decompress data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_DRAW"></a><a id="icmode_draw"></a><dl>
     * <dt><b>ICMODE_DRAW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device driver is opened to decompress data directly to hardware.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICMODE_QUERY"></a><a id="icmode_query"></a><dl>
     * <dt><b>ICMODE_QUERY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver is opened for informational purposes, rather than for compression.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {LRESULT}
     */
    dwError {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Reserved; do not use.
     * @type {Pointer<Void>}
     */
    pV1Reserved {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reserved; do not use.
     * @type {Pointer<Void>}
     */
    pV2Reserved {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Device node for plug and play devices.
     * @type {Integer}
     */
    dnDevNode {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
