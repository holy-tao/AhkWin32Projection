#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_INTERFACE_CAPS_CONSTANTS enumerated type defines the maximum length of string values used by assorted elements of the MBN_INTERFACE_CAPS structure.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_interface_caps_constants
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_INTERFACE_CAPS_CONSTANTS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This constant defines the maximum string size of the <b>deviceID</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a> structure.
     * @type {Integer (Int32)}
     */
    static MBN_DEVICEID_LEN => 18

    /**
     * This constant defines the maximum string size of the <b>manufacturer</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a> structure.
     * @type {Integer (Int32)}
     */
    static MBN_MANUFACTURER_LEN => 32

    /**
     * This constant defines the maximum string size of the <b>model</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a> structure.
     * @type {Integer (Int32)}
     */
    static MBN_MODEL_LEN => 32

    /**
     * This constant defines the maximum string size of the <b>firmwareInfo</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a> structure.
     * @type {Integer (Int32)}
     */
    static MBN_FIRMWARE_LEN => 32
}
