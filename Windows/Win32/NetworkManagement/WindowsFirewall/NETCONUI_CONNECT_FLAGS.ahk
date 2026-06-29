#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct NETCONUI_CONNECT_FLAGS {
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
    static NCUC_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static NCUC_NO_UI => 1

    /**
     * @type {Integer (Int32)}
     */
    static NCUC_ENABLE_DISABLE => 2
}
