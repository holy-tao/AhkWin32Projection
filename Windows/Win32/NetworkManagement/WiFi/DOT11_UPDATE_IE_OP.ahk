#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_UPDATE_IE_OP {
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
    static dot11_update_ie_op_create_replace => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_update_ie_op_delete => 2
}
