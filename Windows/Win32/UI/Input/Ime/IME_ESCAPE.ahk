#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
class IME_ESCAPE extends Win32Enum {

    /**
     * Native name: IME_ESC_QUERY_SUPPORT
     * @type {Integer (UInt32)}
     */
    static ESC_QUERY_SUPPORT => 3

    /**
     * Native name: IME_ESC_RESERVED_FIRST
     * @type {Integer (UInt32)}
     */
    static ESC_RESERVED_FIRST => 4

    /**
     * Native name: IME_ESC_RESERVED_LAST
     * @type {Integer (UInt32)}
     */
    static ESC_RESERVED_LAST => 2047

    /**
     * Native name: IME_ESC_PRIVATE_FIRST
     * @type {Integer (UInt32)}
     */
    static ESC_PRIVATE_FIRST => 2048

    /**
     * Native name: IME_ESC_PRIVATE_LAST
     * @type {Integer (UInt32)}
     */
    static ESC_PRIVATE_LAST => 4095

    /**
     * Native name: IME_ESC_SEQUENCE_TO_INTERNAL
     * @type {Integer (UInt32)}
     */
    static ESC_SEQUENCE_TO_INTERNAL => 4097

    /**
     * Native name: IME_ESC_GET_EUDC_DICTIONARY
     * @type {Integer (UInt32)}
     */
    static ESC_GET_EUDC_DICTIONARY => 4099

    /**
     * Native name: IME_ESC_SET_EUDC_DICTIONARY
     * @type {Integer (UInt32)}
     */
    static ESC_SET_EUDC_DICTIONARY => 4100

    /**
     * Native name: IME_ESC_MAX_KEY
     * @type {Integer (UInt32)}
     */
    static ESC_MAX_KEY => 4101

    /**
     * Native name: IME_ESC_IME_NAME
     * @type {Integer (UInt32)}
     */
    static ESC_IME_NAME => 4102

    /**
     * Native name: IME_ESC_SYNC_HOTKEY
     * @type {Integer (UInt32)}
     */
    static ESC_SYNC_HOTKEY => 4103

    /**
     * Native name: IME_ESC_HANJA_MODE
     * @type {Integer (UInt32)}
     */
    static ESC_HANJA_MODE => 4104

    /**
     * Native name: IME_ESC_AUTOMATA
     * @type {Integer (UInt32)}
     */
    static ESC_AUTOMATA => 4105

    /**
     * Native name: IME_ESC_PRIVATE_HOTKEY
     * @type {Integer (UInt32)}
     */
    static ESC_PRIVATE_HOTKEY => 4106

    /**
     * Native name: IME_ESC_GETHELPFILENAME
     * @type {Integer (UInt32)}
     */
    static ESC_GETHELPFILENAME => 4107
}
