#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_DEVICE_LISTEN_CHANNEL {
    #StructPack 2

    Header : NDIS_OBJECT_HEADER

    ChannelNumber : Int8

}
