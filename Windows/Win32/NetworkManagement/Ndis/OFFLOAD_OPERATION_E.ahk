#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct OFFLOAD_OPERATION_E {
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
    static AUTHENTICATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static ENCRYPT => 2
}
