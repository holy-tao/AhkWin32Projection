#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SUBSCRIPTIONTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SUBSTYPE_URL => 0

    /**
     * @type {Integer (Int32)}
     */
    static SUBSTYPE_CHANNEL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SUBSTYPE_DESKTOPURL => 2

    /**
     * @type {Integer (Int32)}
     */
    static SUBSTYPE_EXTERNAL => 3

    /**
     * @type {Integer (Int32)}
     */
    static SUBSTYPE_DESKTOPCHANNEL => 4
}
