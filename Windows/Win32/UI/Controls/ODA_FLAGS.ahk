#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class ODA_FLAGS extends Win32Enum {

    /**
     * Native name: ODA_DRAWENTIRE
     * @type {Integer (UInt32)}
     */
    static DRAWENTIRE => 1

    /**
     * Native name: ODA_SELECT
     * @type {Integer (UInt32)}
     */
    static SELECT => 2

    /**
     * Native name: ODA_FOCUS
     * @type {Integer (UInt32)}
     */
    static FOCUS => 4
}
