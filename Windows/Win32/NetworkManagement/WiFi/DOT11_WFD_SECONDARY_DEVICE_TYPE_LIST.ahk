#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_WFD_DEVICE_TYPE.ahk" { DOT11_WFD_DEVICE_TYPE }
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_SECONDARY_DEVICE_TYPE_LIST {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    SecondaryDeviceTypes : DOT11_WFD_DEVICE_TYPE[1]

}
