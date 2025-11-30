#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class PIDISF_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static PIDISF_RECENTLYCHANGED => 1

    /**
     * @type {Integer (Int32)}
     */
    static PIDISF_CACHEDSTICKY => 2

    /**
     * @type {Integer (Int32)}
     */
    static PIDISF_CACHEIMAGES => 16

    /**
     * @type {Integer (Int32)}
     */
    static PIDISF_FOLLOWALLLINKS => 32
}
