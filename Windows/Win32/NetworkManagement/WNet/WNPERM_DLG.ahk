#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct WNPERM_DLG {
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
    static WNPERM_DLG_PERM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WNPERM_DLG_AUDIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNPERM_DLG_OWNER => 2
}
