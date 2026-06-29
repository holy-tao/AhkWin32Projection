#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE {
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
    static PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION => 2
}
