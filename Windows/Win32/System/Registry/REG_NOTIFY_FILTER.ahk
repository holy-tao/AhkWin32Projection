#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Registry
 */
export default struct REG_NOTIFY_FILTER {
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
    static REG_NOTIFY_CHANGE_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_NOTIFY_CHANGE_ATTRIBUTES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REG_NOTIFY_CHANGE_LAST_SET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REG_NOTIFY_CHANGE_SECURITY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static REG_NOTIFY_THREAD_AGNOSTIC => 268435456
}
