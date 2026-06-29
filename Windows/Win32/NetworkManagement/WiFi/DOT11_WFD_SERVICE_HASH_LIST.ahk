#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_SERVICE_HASH_LIST {
    #StructPack 2

    ServiceHashCount : UInt16

    ServiceHash : Int8[6]

}
