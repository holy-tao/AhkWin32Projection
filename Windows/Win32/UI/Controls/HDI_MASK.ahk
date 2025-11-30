#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class HDI_MASK extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_WIDTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_HEIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_TEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_FORMAT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_LPARAM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_BITMAP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_IMAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_DI_SETITEM => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_ORDER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_FILTER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_STATE => 512
}
