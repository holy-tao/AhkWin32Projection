#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class IURL_SETURL_FLAGS extends Win32Enum {

    /**
     * Native name: IURL_SETURL_FL_GUESS_PROTOCOL
     * @type {Integer (Int32)}
     */
    static FL_GUESS_PROTOCOL => 1

    /**
     * Native name: IURL_SETURL_FL_USE_DEFAULT_PROTOCOL
     * @type {Integer (Int32)}
     */
    static FL_USE_DEFAULT_PROTOCOL => 2
}
