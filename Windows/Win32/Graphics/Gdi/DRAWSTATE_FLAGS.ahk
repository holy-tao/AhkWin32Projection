#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class DRAWSTATE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DST_COMPLEX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DST_TEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DST_PREFIXTEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DST_ICON => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DST_BITMAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_UNION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_DISABLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_MONO => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_HIDEPREFIX => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_PREFIXONLY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DSS_RIGHT => 32768
}
