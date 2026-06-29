#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct FORMAT_MESSAGE_OPTIONS {
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
    static FORMAT_MESSAGE_ALLOCATE_BUFFER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FORMAT_MESSAGE_ARGUMENT_ARRAY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FORMAT_MESSAGE_FROM_HMODULE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FORMAT_MESSAGE_FROM_STRING => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FORMAT_MESSAGE_FROM_SYSTEM => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FORMAT_MESSAGE_IGNORE_INSERTS => 512
}
