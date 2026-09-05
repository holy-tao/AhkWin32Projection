#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPCFLAG_WEB_SETTING extends Win32Enum {

    /**
     * Native name: WPCFLAG_WEB_SETTING_NOTBLOCKED
     * @type {Integer (Int32)}
     */
    static NOTBLOCKED => 0

    /**
     * Native name: WPCFLAG_WEB_SETTING_DOWNLOADSBLOCKED
     * @type {Integer (Int32)}
     */
    static DOWNLOADSBLOCKED => 1
}
