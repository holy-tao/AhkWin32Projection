#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the object type for the IMFPluginControl interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_plugin_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_Plugin_Type extends Win32Enum {

    /**
     * Media Foundation transform (MFT).
     * Native name: MF_Plugin_Type_MFT
     * @type {Integer (Int32)}
     */
    static MFT => 0

    /**
     * Media source.
     * Native name: MF_Plugin_Type_MediaSource
     * @type {Integer (Int32)}
     */
    static MediaSource => 1

    /**
     * Match output type.
     * Native name: MF_Plugin_Type_MFT_MatchOutputType
     * @type {Integer (Int32)}
     */
    static MFT_MatchOutputType => 2

    /**
     * Other.
     * Native name: MF_Plugin_Type_Other
     * @type {Integer (Int32)}
     */
    static Other => -1
}
