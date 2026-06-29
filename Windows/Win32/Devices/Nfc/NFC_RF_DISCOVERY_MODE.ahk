#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_RF_DISCOVERY_MODE {
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
    static RfDiscoveryConfig => 0

    /**
     * @type {Integer (Int32)}
     */
    static RfDiscoveryStart => 1

    /**
     * @type {Integer (Int32)}
     */
    static RFDiscoveryResume => 2
}
