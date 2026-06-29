#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NCRP_FLAGS {
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
    static NCRP_QUERY_PROPERTY_UI => 1

    /**
     * @type {Integer (Int32)}
     */
    static NCRP_SHOW_PROPERTY_UI => 2
}
