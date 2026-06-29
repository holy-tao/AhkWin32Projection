#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TCP_ICW_LEVEL {
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
    static TCP_ICW_LEVEL_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_HIGH => 1

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_VERY_HIGH => 2

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_AGGRESSIVE => 3

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_EXPERIMENTAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_COMPAT => 254

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_MAX => 255
}
