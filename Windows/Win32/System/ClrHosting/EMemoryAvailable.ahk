#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class EMemoryAvailable extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eMemoryAvailableLow => 1

    /**
     * @type {Integer (Int32)}
     */
    static eMemoryAvailableNeutral => 2

    /**
     * @type {Integer (Int32)}
     */
    static eMemoryAvailableHigh => 3
}
