#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LIST_VIEW_ITEM_STATE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_FOCUSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_SELECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_CUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_DROPHILITED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_GLOW => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_ACTIVATING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_OVERLAYMASK => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_STATEIMAGEMASK => 61440
}
