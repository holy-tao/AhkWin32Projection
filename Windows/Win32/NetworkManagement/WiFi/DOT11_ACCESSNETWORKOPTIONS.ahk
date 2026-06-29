#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_ACCESSNETWORKOPTIONS {
    #StructPack 1

    AccessNetworkType : Int8

    Internet : Int8

    ASRA : Int8

    ESR : Int8

    UESA : Int8

}
