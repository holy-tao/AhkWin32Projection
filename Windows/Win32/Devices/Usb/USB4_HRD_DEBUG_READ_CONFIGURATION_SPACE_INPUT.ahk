#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB4_HRD_DEBUG_ROUTE_STRING.ahk" { USB4_HRD_DEBUG_ROUTE_STRING }
#Import ".\USB4_CONFIG_SPACE_TYPE.ahk" { USB4_CONFIG_SPACE_TYPE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB4_HRD_DEBUG_READ_CONFIGURATION_SPACE_INPUT {
    #StructPack 4

    Route : USB4_HRD_DEBUG_ROUTE_STRING

    AdapterNumber : Int8

    ConfigurationSpaceType : USB4_CONFIG_SPACE_TYPE

    DwOffset : UInt32

    DwLength : UInt32

}
