#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class PIDISF_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: PIDISF_RECENTLYCHANGED
     * @type {Integer (Int32)}
     */
    static RECENTLYCHANGED => 1

    /**
     * Native name: PIDISF_CACHEDSTICKY
     * @type {Integer (Int32)}
     */
    static CACHEDSTICKY => 2

    /**
     * Native name: PIDISF_CACHEIMAGES
     * @type {Integer (Int32)}
     */
    static CACHEIMAGES => 16

    /**
     * Native name: PIDISF_FOLLOWALLLINKS
     * @type {Integer (Int32)}
     */
    static FOLLOWALLLINKS => 32
}
