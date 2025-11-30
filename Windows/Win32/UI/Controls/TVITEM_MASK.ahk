#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TVITEM_MASK extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_CHILDREN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_DI_SETITEM => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_HANDLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_PARAM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_SELECTEDIMAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_STATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_TEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_EXPANDEDIMAGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_INTEGRAL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TVIF_STATEEX => 256
}
