#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFP_CREATION_OPTIONS extends Win32Enum {

    /**
     * Native name: MFP_OPTION_NONE
     * @type {Integer (Int32)}
     */
    static OPTION_NONE => 0

    /**
     * Native name: MFP_OPTION_FREE_THREADED_CALLBACK
     * @type {Integer (Int32)}
     */
    static OPTION_FREE_THREADED_CALLBACK => 1

    /**
     * Native name: MFP_OPTION_NO_MMCSS
     * @type {Integer (Int32)}
     */
    static OPTION_NO_MMCSS => 2

    /**
     * Native name: MFP_OPTION_NO_REMOTE_DESKTOP_OPTIMIZATION
     * @type {Integer (Int32)}
     */
    static OPTION_NO_REMOTE_DESKTOP_OPTIMIZATION => 4
}
