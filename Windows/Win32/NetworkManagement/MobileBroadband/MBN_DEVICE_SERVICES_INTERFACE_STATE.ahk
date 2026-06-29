#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * . (MBN_DEVICE_SERVICES_INTERFACE_STATE)
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_device_services_interface_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_DEVICE_SERVICES_INTERFACE_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A Mobile Broadband device capable of supporting device service functionality has arrived.
     * @type {Integer (Int32)}
     */
    static MBN_DEVICE_SERVICES_CAPABLE_INTERFACE_ARRIVAL => 0

    /**
     * A Mobile Broadband device capable of supporting device services functionality has been removed.
     * @type {Integer (Int32)}
     */
    static MBN_DEVICE_SERVICES_CAPABLE_INTERFACE_REMOVAL => 1
}
