#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_WFD_ADVERTISED_SERVICE_DESCRIPTOR.ahk" { DOT11_WFD_ADVERTISED_SERVICE_DESCRIPTOR }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_ADVERTISED_SERVICE_LIST {
    #StructPack 4

    ServiceCount : UInt16

    AdvertisedService : DOT11_WFD_ADVERTISED_SERVICE_DESCRIPTOR[1]

}
