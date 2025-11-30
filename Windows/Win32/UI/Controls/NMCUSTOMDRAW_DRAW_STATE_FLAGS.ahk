#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMCUSTOMDRAW_DRAW_STATE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_SELECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_GRAYED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_DISABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_CHECKED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_FOCUS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_DEFAULT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_HOT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_MARKED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_INDETERMINATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_SHOWKEYBOARDCUES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_NEARHOT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_OTHERSIDEHOT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CDIS_DROPHILITED => 4096
}
