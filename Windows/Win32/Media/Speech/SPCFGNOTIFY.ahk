#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPCFGNOTIFY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPCFGN_ADD => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPCFGN_REMOVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPCFGN_INVALIDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPCFGN_ACTIVATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPCFGN_DEACTIVATE => 4
}
