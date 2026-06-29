#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct PFFRAMETYPE {
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
    static PFFT_FILTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PFFT_FRAG => 2

    /**
     * @type {Integer (Int32)}
     */
    static PFFT_SPOOF => 3
}
