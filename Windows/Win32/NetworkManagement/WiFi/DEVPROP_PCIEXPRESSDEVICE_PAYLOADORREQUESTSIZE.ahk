#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DEVPROP_PCIEXPRESSDEVICE_PAYLOADORREQUESTSIZE {
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
    static DevProp_PciExpressDevice_PayloadOrRequestSize_128Bytes => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciExpressDevice_PayloadOrRequestSize_256Bytes => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciExpressDevice_PayloadOrRequestSize_512Bytes => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciExpressDevice_PayloadOrRequestSize_1024Bytes => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciExpressDevice_PayloadOrRequestSize_2048Bytes => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DevProp_PciExpressDevice_PayloadOrRequestSize_4096Bytes => 5
}
