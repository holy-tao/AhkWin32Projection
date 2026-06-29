#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NET_IF_RCV_ADDRESS_TYPE {
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
    static NET_IF_RCV_ADDRESS_TYPE_OTHER => 1

    /**
     * @type {Integer (Int32)}
     */
    static NET_IF_RCV_ADDRESS_TYPE_VOLATILE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NET_IF_RCV_ADDRESS_TYPE_NON_VOLATILE => 3
}
