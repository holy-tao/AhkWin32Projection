#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMT_WATERMARK_ENTRY_TYPE enumeration type identifies the types of watermarking systems. Each watermarking system is a DirectX media object (DMO) that embeds some sort of digital watermark in digital media content.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_watermark_entry_type
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_WATERMARK_ENTRY_TYPE{

    /**
     * Identifies a watermarking DMO for audio.
     * @type {Integer (Int32)}
     */
    static WMT_WMETYPE_AUDIO => 1

    /**
     * Identifies a watermarking DMO for video.
     * @type {Integer (Int32)}
     */
    static WMT_WMETYPE_VIDEO => 2
}
