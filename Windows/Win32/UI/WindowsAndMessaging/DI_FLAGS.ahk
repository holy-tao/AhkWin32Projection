#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DI_FLAGS {
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
    static DI_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI_NORMAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI_COMPAT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI_DEFAULTSIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DI_NOMIRROR => 16
}
