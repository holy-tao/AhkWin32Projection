#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IME_ESCAPE{

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_QUERY_SUPPORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_RESERVED_FIRST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_RESERVED_LAST => 2047

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_PRIVATE_FIRST => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_PRIVATE_LAST => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_SEQUENCE_TO_INTERNAL => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_GET_EUDC_DICTIONARY => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_SET_EUDC_DICTIONARY => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_MAX_KEY => 4101

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_IME_NAME => 4102

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_SYNC_HOTKEY => 4103

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_HANJA_MODE => 4104

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_AUTOMATA => 4105

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_PRIVATE_HOTKEY => 4106

    /**
     * @type {Integer (UInt32)}
     */
    static IME_ESC_GETHELPFILENAME => 4107
}
