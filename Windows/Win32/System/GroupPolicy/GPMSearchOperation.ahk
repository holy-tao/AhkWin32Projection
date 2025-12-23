#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMSearchOperation extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static opEquals => 0

    /**
     * @type {Integer (Int32)}
     */
    static opContains => 1

    /**
     * @type {Integer (Int32)}
     */
    static opNotContains => 2

    /**
     * @type {Integer (Int32)}
     */
    static opNotEquals => 3
}
