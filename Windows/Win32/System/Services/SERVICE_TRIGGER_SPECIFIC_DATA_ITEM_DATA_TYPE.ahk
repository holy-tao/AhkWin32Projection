#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_TRIGGER_SPECIFIC_DATA_ITEM_DATA_TYPE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_DATA_TYPE_BINARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_DATA_TYPE_STRING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_DATA_TYPE_LEVEL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ANY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ALL => 5
}
