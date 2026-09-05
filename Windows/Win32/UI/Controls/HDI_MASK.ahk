#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class HDI_MASK extends Win32BitflagEnum {

    /**
     * Native name: HDI_WIDTH
     * @type {Integer (UInt32)}
     */
    static WIDTH => 1

    /**
     * Native name: HDI_HEIGHT
     * @type {Integer (UInt32)}
     */
    static HEIGHT => 1

    /**
     * Native name: HDI_TEXT
     * @type {Integer (UInt32)}
     */
    static TEXT => 2

    /**
     * Native name: HDI_FORMAT
     * @type {Integer (UInt32)}
     */
    static FORMAT => 4

    /**
     * Native name: HDI_LPARAM
     * @type {Integer (UInt32)}
     */
    static LPARAM => 8

    /**
     * Native name: HDI_BITMAP
     * @type {Integer (UInt32)}
     */
    static BITMAP => 16

    /**
     * Native name: HDI_IMAGE
     * @type {Integer (UInt32)}
     */
    static IMAGE => 32

    /**
     * Native name: HDI_DI_SETITEM
     * @type {Integer (UInt32)}
     */
    static DI_SETITEM => 64

    /**
     * Native name: HDI_ORDER
     * @type {Integer (UInt32)}
     */
    static ORDER => 128

    /**
     * Native name: HDI_FILTER
     * @type {Integer (UInt32)}
     */
    static FILTER => 256

    /**
     * Native name: HDI_STATE
     * @type {Integer (UInt32)}
     */
    static STATE => 512
}
