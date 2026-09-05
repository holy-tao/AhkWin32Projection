#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class ASSOCCLASS extends Win32Enum {

    /**
     * Native name: ASSOCCLASS_SHELL_KEY
     * @type {Integer (Int32)}
     */
    static SHELL_KEY => 0

    /**
     * Native name: ASSOCCLASS_PROGID_KEY
     * @type {Integer (Int32)}
     */
    static PROGID_KEY => 1

    /**
     * Native name: ASSOCCLASS_PROGID_STR
     * @type {Integer (Int32)}
     */
    static PROGID_STR => 2

    /**
     * Native name: ASSOCCLASS_CLSID_KEY
     * @type {Integer (Int32)}
     */
    static CLSID_KEY => 3

    /**
     * Native name: ASSOCCLASS_CLSID_STR
     * @type {Integer (Int32)}
     */
    static CLSID_STR => 4

    /**
     * Native name: ASSOCCLASS_APP_KEY
     * @type {Integer (Int32)}
     */
    static APP_KEY => 5

    /**
     * Native name: ASSOCCLASS_APP_STR
     * @type {Integer (Int32)}
     */
    static APP_STR => 6

    /**
     * Native name: ASSOCCLASS_SYSTEM_STR
     * @type {Integer (Int32)}
     */
    static SYSTEM_STR => 7

    /**
     * Native name: ASSOCCLASS_FOLDER
     * @type {Integer (Int32)}
     */
    static FOLDER => 8

    /**
     * Native name: ASSOCCLASS_STAR
     * @type {Integer (Int32)}
     */
    static STAR => 9

    /**
     * Native name: ASSOCCLASS_FIXED_PROGID_STR
     * @type {Integer (Int32)}
     */
    static FIXED_PROGID_STR => 10

    /**
     * Native name: ASSOCCLASS_PROTOCOL_STR
     * @type {Integer (Int32)}
     */
    static PROTOCOL_STR => 11
}
