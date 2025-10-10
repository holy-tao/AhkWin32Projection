#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMT_CODEC_INFO_TYPE enumeration type defines the broad categories of codecs supported by this SDK.
 * @remarks
 * 
  * This type is used when adding or retrieving the codecs used in a file using <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo2-getcodecinfo">IWMHeaderInfo2::GetCodecInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-addcodecinfo">IWMHeaderInfo3::AddCodecInfo</a>. When enumerating codecs with the methods of <b>IWMCodecInfo</b>, <b>IWMCodecInfo2</b>, and <b>IWMCodecInfo3</b>, you do not use this type. Those methods use the major media type GUIDs instead.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ne-wmsdkidl-wmt_codec_info_type
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_CODEC_INFO_TYPE{

    /**
     * Audio codec.
     * @type {Integer (Int32)}
     */
    static WMT_CODECINFO_AUDIO => 0

    /**
     * Video codec.
     * @type {Integer (Int32)}
     */
    static WMT_CODECINFO_VIDEO => 1

    /**
     * Codec of an unknown type.
     * @type {Integer (Int32)}
     */
    static WMT_CODECINFO_UNKNOWN => -1
}
