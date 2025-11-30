#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class HIT_TEST_BACKGROUND_OPTIONS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_BACKGROUNDSEG => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_FIXEDBORDER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_CAPTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_RESIZINGBORDER_LEFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_RESIZINGBORDER_TOP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_RESIZINGBORDER_RIGHT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_RESIZINGBORDER_BOTTOM => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_RESIZINGBORDER => 240

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_SIZINGTEMPLATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HTTB_SYSTEMSIZINGMARGINS => 512
}
