#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AM_SAMPLE2_PROPERTIES structure describes the properties of a media sample. The IMediaSample2 interface uses this structure.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-am_sample2_properties
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_SAMPLE2_PROPERTIES extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Length of property data, in bytes. This structure member is for extensibility.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type-specific flags. Flags are defined separately for each media type. The default value is AM_VIDEO_FLAG_INTERLEAVED_FRAME (zero). The following flags are used for video streams. They are defined in the header file dvdmedia.h.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AM_VIDEO_FLAG_FIELD_MASK"></a><a id="am_video_flag_field_mask"></a><dl>
     * <dt><b>AM_VIDEO_FLAG_FIELD_MASK</b></dt>
     * <dt>0x0003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use this mask to check whether the sample is a field or a frame.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AM_VIDEO_FLAG_INTERLEAVED_FRAME"></a><a id="am_video_flag_interleaved_frame"></a><dl>
     * <dt><b>AM_VIDEO_FLAG_INTERLEAVED_FRAME</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample is a frame. (Use the AM_VIDEO_FLAG_FIELD_MASK bitmask to test for this value.)  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AM_VIDEO_FLAG_FIELD1"></a><a id="am_video_flag_field1"></a><dl>
     * <dt><b>AM_VIDEO_FLAG_FIELD1</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample is field 1. (Use the AM_VIDEO_FLAG_FIELD_MASK bitmask to test for this value.) 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AM_VIDEO_FLAG_FIELD2"></a><a id="am_video_flag_field2"></a><dl>
     * <dt><b>AM_VIDEO_FLAG_FIELD2</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample is the field 2. (Use the AM_VIDEO_FLAG_FIELD_MASK bitmask to test for this value.)  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AM_VIDEO_FLAG_FIELD1FIRST"></a><a id="am_video_flag_field1first"></a><dl>
     * <dt><b>AM_VIDEO_FLAG_FIELD1FIRST</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, display field 1 first. Otherwise, display field 2 first. (Applies only when there are two fields per sample.) 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AM_VIDEO_FLAG_WEAVE"></a><a id="am_video_flag_weave"></a><dl>
     * <dt><b>AM_VIDEO_FLAG_WEAVE</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, use weave mode (that is, do not deinterlace the sample). Otherwise, use bob mode. This flag applies only when there are two fields per sample. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AM_VIDEO_FLAG_REPEAT_FIELD"></a><a id="am_video_flag_repeat_field"></a><dl>
     * <dt><b>AM_VIDEO_FLAG_REPEAT_FIELD</b></dt>
     * <dt>0x0040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, display the first field again after displaying the second field. (Applies only when there are two fields per sample.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AM_ReverseBlockStart"></a><a id="am_reverseblockstart"></a><a id="AM_REVERSEBLOCKSTART"></a><dl>
     * <dt><b>AM_ReverseBlockStart</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Signals the start of a VOBU during reverse playback of DVD video.  For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-playback-enhancements-in-windows-vista">DVD Playback Enhancements in Windows Vista</a>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AM_ReverseBlockEnd"></a><a id="am_reverseblockend"></a><a id="AM_REVERSEBLOCKEND"></a><dl>
     * <dt><b>AM_ReverseBlockEnd</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Signals the end of a VOBU during reverse playback of DVD video. The DVD Navigator sets this flag on an empty sample to signal the end of a VOBU. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-playback-enhancements-in-windows-vista">DVD Playback Enhancements in Windows Vista</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AM_UseNewCSSKey"></a><a id="am_usenewcsskey"></a><a id="AM_USENEWCSSKEY"></a><dl>
     * <dt><b>AM_UseNewCSSKey</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For DVD playback, indicates the point in the stream when the decoder should apply a new Content Scramble System (CSS) key.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> sets this flag on an empty media sample just before it renegotiate a CSS title key.
     * 
     * Previously, the DVD Navigator incorrectly sent this key before negotiating the disc key. Starting in Windows 7, if the decoder's <b>AM_PROPERTY_DVDCOPY_SUPPORTS_NEW_KEYCOUNT</b> property returns <b>TRUE</b>, the DVD Navigator does not send this flag before negotiating the disc key. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-copy-protection-property-set">DVD Copy Protection Property Set</a>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Other flags are defined but not currently used. See dvdmedia.h.
     * @type {Integer}
     */
    dwTypeSpecificFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Bitwise combination of flags the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-tagam_sample_property_flags">AM_SAMPLE_PROPERTY_FLAGS</a> enumerated data type. Undefined bits are reserved and must be zero.
     * @type {Integer}
     */
    dwSampleFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Length of the valid data in the buffer.
     * @type {Integer}
     */
    lActual {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Start time, if valid. The <b>dwSampleFlags</b> member specifies whether this member is valid.
     * @type {Integer}
     */
    tStart {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Stop time, if valid. The <b>dwSampleFlags</b> member specifies whether this member is valid.
     * @type {Integer}
     */
    tStop {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Stream identifier. If the value is AM_STREAM_MEDIA, the stream contains media data. If the value is AM_STREAM_CONTROL, the stream contains control information. Applications can define values of 0x80000000 or greater for their own use. (See <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-tagam_sample_property_flags">AM_SAMPLE_PROPERTY_FLAGS</a>.)
     * @type {Integer}
     */
    dwStreamId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the media type if the format has changed. If this format has not changed, this member is <b>NULL</b>.
     * @type {Pointer<AM_MEDIA_TYPE>}
     */
    pMediaType {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to the sample buffer.
     * @type {Pointer<Byte>}
     */
    pbBuffer {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Size of the sample buffer, in bytes.
     * @type {Integer}
     */
    cbBuffer {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
