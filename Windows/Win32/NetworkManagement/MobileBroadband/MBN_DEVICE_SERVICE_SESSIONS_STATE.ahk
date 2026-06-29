#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_DEVICE_SERVICE_SESSIONS_STATE {
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
    static MBN_DEVICE_SERVICE_SESSIONS_RESTORED => 0
}
