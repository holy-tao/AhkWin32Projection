#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPFILEMODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPFM_OPEN_READONLY => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPFM_OPEN_READWRITE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPFM_CREATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPFM_CREATE_ALWAYS => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPFM_NUM_MODES => 4
}
