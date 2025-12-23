#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENU_ITEM_TYPE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_BITMAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_MENUBARBREAK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_MENUBREAK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_OWNERDRAW => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_RADIOCHECK => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_RIGHTJUSTIFY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_RIGHTORDER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_SEPARATOR => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_STRING => 0
}
