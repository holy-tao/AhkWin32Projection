#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMEntryType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static typeUser => 0

    /**
     * @type {Integer (Int32)}
     */
    static typeComputer => 1

    /**
     * @type {Integer (Int32)}
     */
    static typeLocalGroup => 2

    /**
     * @type {Integer (Int32)}
     */
    static typeGlobalGroup => 3

    /**
     * @type {Integer (Int32)}
     */
    static typeUniversalGroup => 4

    /**
     * @type {Integer (Int32)}
     */
    static typeUNCPath => 5

    /**
     * @type {Integer (Int32)}
     */
    static typeUnknown => 6
}
