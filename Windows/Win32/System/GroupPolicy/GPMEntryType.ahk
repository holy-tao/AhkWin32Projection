#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
class GPMEntryType extends Win32Enum {

    /**
     * Native name: typeUser
     * @type {Integer (Int32)}
     */
    static User => 0

    /**
     * Native name: typeComputer
     * @type {Integer (Int32)}
     */
    static Computer => 1

    /**
     * Native name: typeLocalGroup
     * @type {Integer (Int32)}
     */
    static LocalGroup => 2

    /**
     * Native name: typeGlobalGroup
     * @type {Integer (Int32)}
     */
    static GlobalGroup => 3

    /**
     * Native name: typeUniversalGroup
     * @type {Integer (Int32)}
     */
    static UniversalGroup => 4

    /**
     * @type {Integer (Int32)}
     */
    static typeUNCPath => 5

    /**
     * Native name: typeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 6
}
