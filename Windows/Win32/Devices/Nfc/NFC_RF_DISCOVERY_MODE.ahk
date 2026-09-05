#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class NFC_RF_DISCOVERY_MODE extends Win32Enum {

    /**
     * Native name: RfDiscoveryConfig
     * @type {Integer (Int32)}
     */
    static Config => 0

    /**
     * Native name: RfDiscoveryStart
     * @type {Integer (Int32)}
     */
    static Start => 1

    /**
     * Native name: RFDiscoveryResume
     * @type {Integer (Int32)}
     */
    static Resume => 2
}
