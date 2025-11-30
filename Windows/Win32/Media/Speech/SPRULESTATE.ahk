#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPRULESTATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPRS_INACTIVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPRS_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPRS_ACTIVE_WITH_AUTO_PAUSE => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPRS_ACTIVE_USER_DELIMITED => 4
}
