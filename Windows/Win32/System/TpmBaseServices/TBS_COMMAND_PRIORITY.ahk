#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.TpmBaseServices
 */
export default struct TBS_COMMAND_PRIORITY {
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
    static TBS_COMMAND_PRIORITY_LOW => 100

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_PRIORITY_NORMAL => 200

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_PRIORITY_SYSTEM => 400

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_PRIORITY_HIGH => 300

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_PRIORITY_MAX => 2147483648
}
