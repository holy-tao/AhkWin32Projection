#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class PIDISM_OPTIONS extends Win32Enum {

    /**
     * Native name: PIDISM_GLOBAL
     * @type {Integer (Int32)}
     */
    static GLOBAL => 0

    /**
     * Native name: PIDISM_WATCH
     * @type {Integer (Int32)}
     */
    static WATCH => 1

    /**
     * Native name: PIDISM_DONTWATCH
     * @type {Integer (Int32)}
     */
    static DONTWATCH => 2
}
