#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_MEDIA_TYPE structure is the primary structure used to describe media formats for the objects of the Windows Media Format SDK. For more information about media formats and what they are used for, see Formats.
 * @remarks
 * This is the same as the DirectShow structure <b>AM_MEDIA_TYPE</b> but is redefined in this SDK to avoid conflict with DirectShow names.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_media_type
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_MEDIA_TYPE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Major type of the media sample. For example, WMMEDIATYPE_Video specifies a video stream. For a list of possible major media types, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/media-types">Media Types</a>.
     * @type {Pointer<Guid>}
     */
    majortype {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Subtype of the media sample. The subtype defines a specific format (usually an encoding scheme) within a major media type. For example, WMMEDIASUBTYPE_WMV3 specifies a video stream encoded with the Windows Media Video 9 codec. Subtypes can be uncompressed or compressed. For lists of possible media subtypes, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/uncompressed-media-subtypes">Uncompressed Media Subtypes</a> and <a href="https://docs.microsoft.com/windows/desktop/wmformat/compressed-media-subtypes">Compressed Media Subtypes</a>.
     * @type {Pointer<Guid>}
     */
    subtype {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Set to true if the samples are of a fixed size. Compressed audio samples are of a fixed size while video samples are not.
     * @type {Integer}
     */
    bFixedSizeSamples {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Set to true if the samples are temporally compressed. Temporal compression is compression where some samples describe the changes in content from the previous sample, instead of describing the sample in its entirety. Only compressed video can be temporally compressed. By definition, no media type can use both fixed sized samples and temporal compression.
     * @type {Integer}
     */
    bTemporalCompression {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Long integer containing the size of the sample, in bytes. This member is used only if <b>bFixedSizeSamples</b> is true.
     * @type {Integer}
     */
    lSampleSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * GUID of the format type. The format type specifies the additional structure used to identify the media format. This structure is pointed to by <b>pbFormat</b>.
     * @type {Pointer<Guid>}
     */
    formattype {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Not used. Should be <b>NULL</b>.
     * @type {Pointer<IUnknown>}
     */
    pUnk {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Size, in bytes, of the structure pointed to by pbFormat.
     * @type {Integer}
     */
    cbFormat {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Pointer to the format structure of the media type. The structure referenced is determined by the format type <b>GUID</b>. Format types include:<table>
     * <tr>
     * <th>Media Type</th>
     * <th>Structure</th>
     * </tr>
     * <tr>
     * <td>WMFORMAT_VideoInfo</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmvideoinfoheader">WMVIDEOINFOHEADER</a>
     * </td>
     * </tr>
     * <tr>
     * <td>WMFORMAT_WaveFormatEx</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd757720(v=vs.85)">WAVEFORMATEX</a>
     * </td>
     * </tr>
     * <tr>
     * <td>WMFORMAT_MPEG2Video</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmmpeg2videoinfo">WMMPEG2VIDEOINFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>WMFORMAT_WebStream</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_webstream_format">WMT_WEBSTREAM_FORMAT</a>
     * </td>
     * </tr>
     * <tr>
     * <td>WMFORMAT_Script</td>
     * <td>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmscriptformat">WMSCRIPTFORMAT</a>
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Byte>}
     */
    pbFormat {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
