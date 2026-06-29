#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMT_WATERMARK_ENTRY_TYPE enumeration type identifies the types of watermarking systems. Each watermarking system is a DirectX media object (DMO) that embeds some sort of digital watermark in digital media content.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_watermark_entry_type
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_WATERMARK_ENTRY_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
