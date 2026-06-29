#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ND_OPT_PREF64_PREFIX_LENGTH_CODE {
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
    static ND_OPT_PREF64_PREFIX_LENGTH_96 => 0

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_PREF64_PREFIX_LENGTH_64 => 1

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_PREF64_PREFIX_LENGTH_56 => 2

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_PREF64_PREFIX_LENGTH_48 => 3

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_PREF64_PREFIX_LENGTH_40 => 4

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_PREF64_PREFIX_LENGTH_32 => 5
}
