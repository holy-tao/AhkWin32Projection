#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the object type for the IMFPluginControl interface.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ne-mfobjects-mf_plugin_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_Plugin_Type extends Win32Enum{

    /**
     * Media Foundation transform (MFT).
     * @type {Integer (Int32)}
     */
    static MF_Plugin_Type_MFT => 0

    /**
     * Media source.
     * @type {Integer (Int32)}
     */
    static MF_Plugin_Type_MediaSource => 1

    /**
     * Match output type.
     * @type {Integer (Int32)}
     */
    static MF_Plugin_Type_MFT_MatchOutputType => 2

    /**
     * Other.
     * @type {Integer (Int32)}
     */
    static MF_Plugin_Type_Other => -1
}
