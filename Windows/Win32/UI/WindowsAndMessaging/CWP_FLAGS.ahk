#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class CWP_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CWP_ALL
     * @type {Integer (UInt32)}
     */
    static ALL => 0

    /**
     * Native name: CWP_SKIPINVISIBLE
     * @type {Integer (UInt32)}
     */
    static SKIPINVISIBLE => 1

    /**
     * Native name: CWP_SKIPDISABLED
     * @type {Integer (UInt32)}
     */
    static SKIPDISABLED => 2

    /**
     * Native name: CWP_SKIPTRANSPARENT
     * @type {Integer (UInt32)}
     */
    static SKIPTRANSPARENT => 4
}
