#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFP_CREATION_OPTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MFP_OPTION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFP_OPTION_FREE_THREADED_CALLBACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static MFP_OPTION_NO_MMCSS => 2

    /**
     * @type {Integer (Int32)}
     */
    static MFP_OPTION_NO_REMOTE_DESKTOP_OPTIMIZATION => 4
}
