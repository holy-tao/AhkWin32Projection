#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct GPT_ATTRIBUTES {
    value : Int64

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_ATTRIBUTE_PLATFORM_REQUIRED => 1

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_BASIC_DATA_ATTRIBUTE_NO_DRIVE_LETTER => 9223372036854775808

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_BASIC_DATA_ATTRIBUTE_HIDDEN => 4611686018427387904

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_BASIC_DATA_ATTRIBUTE_SHADOW_COPY => 2305843009213693952

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_BASIC_DATA_ATTRIBUTE_READ_ONLY => 1152921504606846976
}
