#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct NETWORK_NAME_FORMAT_FLAGS {
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
    static WNFMT_MULTILINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNFMT_ABBREVIATED => 2
}
