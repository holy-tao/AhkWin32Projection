#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_VS {
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
    static MPR_VS_Default => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_VS_PptpOnly => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_VS_PptpFirst => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_VS_L2tpOnly => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_VS_L2tpFirst => 4
}
