#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_WFD_DEVICE_TYPE.ahk" { DOT11_WFD_DEVICE_TYPE }
#Import ".\DOT11_WPS_DEVICE_NAME.ahk" { DOT11_WPS_DEVICE_NAME }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_DEVICE_INFO {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    DeviceAddress : Int8[6]

    ConfigMethods : UInt16

    PrimaryDeviceType : DOT11_WFD_DEVICE_TYPE

    DeviceName : DOT11_WPS_DEVICE_NAME

}
