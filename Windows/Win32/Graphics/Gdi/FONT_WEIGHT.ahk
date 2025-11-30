#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class FONT_WEIGHT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static FW_DONTCARE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FW_THIN => 100

    /**
     * @type {Integer (UInt32)}
     */
    static FW_EXTRALIGHT => 200

    /**
     * @type {Integer (UInt32)}
     */
    static FW_LIGHT => 300

    /**
     * @type {Integer (UInt32)}
     */
    static FW_NORMAL => 400

    /**
     * @type {Integer (UInt32)}
     */
    static FW_MEDIUM => 500

    /**
     * @type {Integer (UInt32)}
     */
    static FW_SEMIBOLD => 600

    /**
     * @type {Integer (UInt32)}
     */
    static FW_BOLD => 700

    /**
     * @type {Integer (UInt32)}
     */
    static FW_EXTRABOLD => 800

    /**
     * @type {Integer (UInt32)}
     */
    static FW_HEAVY => 900

    /**
     * @type {Integer (UInt32)}
     */
    static FW_ULTRALIGHT => 200

    /**
     * @type {Integer (UInt32)}
     */
    static FW_REGULAR => 400

    /**
     * @type {Integer (UInt32)}
     */
    static FW_DEMIBOLD => 600

    /**
     * @type {Integer (UInt32)}
     */
    static FW_ULTRABOLD => 800

    /**
     * @type {Integer (UInt32)}
     */
    static FW_BLACK => 900
}
