#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPRECOSTATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPRST_INACTIVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPRST_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPRST_ACTIVE_ALWAYS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPRST_INACTIVE_WITH_PURGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPRST_NUM_STATES => 4
}
