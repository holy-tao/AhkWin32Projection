#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMT_MUSICSPEECH_CLASS_MODE enumeration type defines the types of compression supported by the Windows Media Audio 9 Voice codec.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ne-wmsdkidl-wmt_musicspeech_class_mode
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_MUSICSPEECH_CLASS_MODE{

    /**
     * Not currently supported. Do not use.
     * @type {Integer (Int32)}
     */
    static WMT_MS_CLASS_MUSIC => 0

    /**
     * Compression optimized for speech.
     * @type {Integer (Int32)}
     */
    static WMT_MS_CLASS_SPEECH => 1

    /**
     * Compression optimized for a mixture of music and speech.
     * @type {Integer (Int32)}
     */
    static WMT_MS_CLASS_MIXED => 2
}
