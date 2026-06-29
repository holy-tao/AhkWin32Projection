#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct OBO_TOKEN_TYPE {
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
    static OBO_USER => 1

    /**
     * @type {Integer (Int32)}
     */
    static OBO_COMPONENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static OBO_SOFTWARE => 3
}
