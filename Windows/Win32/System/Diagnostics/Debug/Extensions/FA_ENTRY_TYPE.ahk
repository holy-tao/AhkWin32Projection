#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct FA_ENTRY_TYPE {
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
    static DEBUG_FA_ENTRY_NO_TYPE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_ULONG => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_ULONG64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_INSTRUCTION_OFFSET => 3

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_POINTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_ANSI_STRING => 5

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_ANSI_STRINGs => 6

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_EXTENSION_CMD => 7

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_STRUCTURED_DATA => 8

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_UNICODE_STRING => 9

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FA_ENTRY_ARRAY => 32768
}
