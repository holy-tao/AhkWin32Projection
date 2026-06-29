#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_ADVERTISEMENT_ID {
    #StructPack 4

    AdvertisementID : UInt32

    ServiceAddress : Int8[6]

}
