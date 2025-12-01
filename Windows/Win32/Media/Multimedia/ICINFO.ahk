#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ICINFO structure contains compression parameters supplied by a video compression driver. The driver fills or updates the structure when it receives the ICM_GETINFO message.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-icinfo
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class ICINFO extends Win32Struct
{
    static sizeof => 568

    static packingSize => 4

    /**
     * Size, in bytes, of the <b>ICINFO</b> structure.
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
     * A four-character code identifying a specific compressor.
     * @type {Integer}
     */
    fccHandler {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Applicable flags. Zero or more of the following flags can be set:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VIDCF_COMPRESSFRAMES"></a><a id="vidcf_compressframes"></a><dl>
     * <dt><b>VIDCF_COMPRESSFRAMES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver is requesting to compress all frames. For information about compressing all frames, see the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/icm-compress-frames-info">ICM_COMPRESS_FRAMES_INFO</a> message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VIDCF_CRUNCH"></a><a id="vidcf_crunch"></a><dl>
     * <dt><b>VIDCF_CRUNCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver supports compressing to a frame size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VIDCF_DRAW"></a><a id="vidcf_draw"></a><dl>
     * <dt><b>VIDCF_DRAW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver supports drawing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VIDCF_FASTTEMPORALC"></a><a id="vidcf_fasttemporalc"></a><dl>
     * <dt><b>VIDCF_FASTTEMPORALC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver can perform temporal compression and maintains its own copy of the current frame. When compressing a stream of frame data, the driver doesn't need image data from the previous frame.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VIDCF_FASTTEMPORALD"></a><a id="vidcf_fasttemporald"></a><dl>
     * <dt><b>VIDCF_FASTTEMPORALD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver can perform temporal decompression and maintains its own copy of the current frame. When decompressing a stream of frame data, the driver doesn't need image data from the previous frame.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VIDCF_QUALITY"></a><a id="vidcf_quality"></a><dl>
     * <dt><b>VIDCF_QUALITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver supports quality values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VIDCF_TEMPORAL"></a><a id="vidcf_temporal"></a><dl>
     * <dt><b>VIDCF_TEMPORAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver supports inter-frame compression.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Version number of the driver.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Version of VCM supported by the driver. This member should be set to ICVERSION.
     * @type {Integer}
     */
    dwVersionICM {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Short version of the compressor name. The name in the null-terminated string should be suitable for use in list boxes.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 24, 15, "UTF-16")
        set => StrPut(value, this.ptr + 24, 15, "UTF-16")
    }

    /**
     * Long version of the compressor name.
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 56, 127, "UTF-16")
        set => StrPut(value, this.ptr + 56, 127, "UTF-16")
    }

    /**
     * Name of the module containing VCM compression driver. Normally, a driver does not need to fill this out.
     * @type {String}
     */
    szDriver {
        get => StrGet(this.ptr + 312, 127, "UTF-16")
        set => StrPut(value, this.ptr + 312, 127, "UTF-16")
    }
}
