#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct EXECUTION_STATE {
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
    static ES_AWAYMODE_REQUIRED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ES_CONTINUOUS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static ES_DISPLAY_REQUIRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ES_SYSTEM_REQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ES_USER_PRESENT => 4
}
