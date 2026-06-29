#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct BDA_LockType {
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
    static Bda_LockType_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static Bda_LockType_PLL => 1

    /**
     * @type {Integer (Int32)}
     */
    static Bda_LockType_DecoderDemod => 2

    /**
     * @type {Integer (Int32)}
     */
    static Bda_LockType_Complete => 128
}
