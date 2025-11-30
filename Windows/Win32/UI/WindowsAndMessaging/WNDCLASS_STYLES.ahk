#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class WNDCLASS_STYLES extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CS_VREDRAW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CS_HREDRAW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CS_DBLCLKS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CS_OWNDC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CS_CLASSDC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CS_PARENTDC => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CS_NOCLOSE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CS_SAVEBITS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CS_BYTEALIGNCLIENT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CS_BYTEALIGNWINDOW => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CS_GLOBALCLASS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CS_IME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CS_DROPSHADOW => 131072
}
