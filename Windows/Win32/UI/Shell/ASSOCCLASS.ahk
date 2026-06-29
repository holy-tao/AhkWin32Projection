#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ASSOCCLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS_SHELL_KEY => 0

    /**
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS_PROGID_KEY => 1

    /**
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS_PROGID_STR => 2

    /**
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS_CLSID_KEY => 3

    /**
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS_CLSID_STR => 4

    /**
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS_APP_KEY => 5

    /**
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS_APP_STR => 6

    /**
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS_SYSTEM_STR => 7

    /**
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS_FOLDER => 8

    /**
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS_STAR => 9

    /**
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS_FIXED_PROGID_STR => 10

    /**
     * @type {Integer (Int32)}
     */
    static ASSOCCLASS_PROTOCOL_STR => 11
}
