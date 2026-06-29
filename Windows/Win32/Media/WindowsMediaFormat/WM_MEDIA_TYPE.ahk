#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The WM_MEDIA_TYPE structure is the primary structure used to describe media formats for the objects of the Windows Media Format SDK. For more information about media formats and what they are used for, see Formats.
 * @remarks
 * This is the same as the DirectShow structure <b>AM_MEDIA_TYPE</b> but is redefined in this SDK to avoid conflict with DirectShow names.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_media_type
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_MEDIA_TYPE {
    #StructPack 8

    /**
     * Major type of the media sample. For example, WMMEDIATYPE_Video specifies a video stream. For a list of possible major media types, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/media-types">Media Types</a>.
     */
    majortype : Guid

    /**
     * Subtype of the media sample. The subtype defines a specific format (usually an encoding scheme) within a major media type. For example, WMMEDIASUBTYPE_WMV3 specifies a video stream encoded with the Windows Media Video 9 codec. Subtypes can be uncompressed or compressed. For lists of possible media subtypes, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/uncompressed-media-subtypes">Uncompressed Media Subtypes</a> and <a href="https://docs.microsoft.com/windows/desktop/wmformat/compressed-media-subtypes">Compressed Media Subtypes</a>.
     */
    subtype : Guid

    /**
     * Set to true if the samples are of a fixed size. Compressed audio samples are of a fixed size while video samples are not.
     */
    bFixedSizeSamples : BOOL

    /**
     * Set to true if the samples are temporally compressed. Temporal compression is compression where some samples describe the changes in content from the previous sample, instead of describing the sample in its entirety. Only compressed video can be temporally compressed. By definition, no media type can use both fixed sized samples and temporal compression.
     */
    bTemporalCompression : BOOL

    /**
     * Long integer containing the size of the sample, in bytes. This member is used only if <b>bFixedSizeSamples</b> is true.
     */
    lSampleSize : UInt32

    /**
     * GUID of the format type. The format type specifies the additional structure used to identify the media format. This structure is pointed to by <b>pbFormat</b>.
     */
    formattype : Guid

    /**
     * Not used. Should be <b>NULL</b>.
     */
    pUnk : IUnknown

    /**
     * Size, in bytes, of the structure pointed to by pbFormat.
     */
    cbFormat : UInt32

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
     */
    pbFormat : IntPtr

}
