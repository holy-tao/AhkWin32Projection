#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct UNC_INFO_LEVEL {
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
    static UNIVERSAL_NAME_INFO_LEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTE_NAME_INFO_LEVEL => 2
}
