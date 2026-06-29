#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PMKID_ENTRY {
    #StructPack 4

    BSSID : Int8[6]

    PMKID : Int8[16]

    uFlags : UInt32

}
