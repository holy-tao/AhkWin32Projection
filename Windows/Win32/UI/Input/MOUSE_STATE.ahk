#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input
 */
class MOUSE_STATE extends Win32Enum {

    /**
     * Native name: MOUSE_MOVE_RELATIVE
     * @type {Integer (UInt16)}
     */
    static MOVE_RELATIVE => 0

    /**
     * Native name: MOUSE_MOVE_ABSOLUTE
     * @type {Integer (UInt16)}
     */
    static MOVE_ABSOLUTE => 1

    /**
     * Native name: MOUSE_VIRTUAL_DESKTOP
     * @type {Integer (UInt16)}
     */
    static VIRTUAL_DESKTOP => 2

    /**
     * Native name: MOUSE_ATTRIBUTES_CHANGED
     * @type {Integer (UInt16)}
     */
    static ATTRIBUTES_CHANGED => 4

    /**
     * Native name: MOUSE_MOVE_NOCOALESCE
     * @type {Integer (UInt16)}
     */
    static MOVE_NOCOALESCE => 8
}
