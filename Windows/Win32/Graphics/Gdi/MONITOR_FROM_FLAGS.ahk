#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class MONITOR_FROM_FLAGS extends Win32Enum {

    /**
     * Native name: MONITOR_DEFAULTTONEAREST
     * @type {Integer (UInt32)}
     */
    static DEFAULTTONEAREST => 2

    /**
     * Native name: MONITOR_DEFAULTTONULL
     * @type {Integer (UInt32)}
     */
    static DEFAULTTONULL => 0

    /**
     * Native name: MONITOR_DEFAULTTOPRIMARY
     * @type {Integer (UInt32)}
     */
    static DEFAULTTOPRIMARY => 1
}
