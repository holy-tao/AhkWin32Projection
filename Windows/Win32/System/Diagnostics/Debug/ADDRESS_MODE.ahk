#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class ADDRESS_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AddrMode1616 => 0

    /**
     * @type {Integer (Int32)}
     */
    static AddrMode1632 => 1

    /**
     * @type {Integer (Int32)}
     */
    static AddrModeReal => 2

    /**
     * @type {Integer (Int32)}
     */
    static AddrModeFlat => 3
}
