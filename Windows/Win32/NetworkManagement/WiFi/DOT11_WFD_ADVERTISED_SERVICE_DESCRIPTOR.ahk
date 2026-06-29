#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_ADVERTISED_SERVICE_DESCRIPTOR {
    #StructPack 4

    AdvertisementID : UInt32

    ConfigMethods : UInt16

    ServiceNameLength : Int8

    ServiceName : Int8[255]

}
