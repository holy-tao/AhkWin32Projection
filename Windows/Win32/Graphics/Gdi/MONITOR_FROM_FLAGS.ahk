#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class MONITOR_FROM_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MONITOR_DEFAULTTONEAREST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MONITOR_DEFAULTTONULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MONITOR_DEFAULTTOPRIMARY => 1
}
