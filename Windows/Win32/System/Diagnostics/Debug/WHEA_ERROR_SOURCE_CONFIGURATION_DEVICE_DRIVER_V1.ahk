#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_ERROR_SOURCE_INITIALIZE_DEVICE_DRIVER.ahk" { WHEA_ERROR_SOURCE_INITIALIZE_DEVICE_DRIVER }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\WHEA_ERROR_SOURCE_UNINITIALIZE_DEVICE_DRIVER.ahk" { WHEA_ERROR_SOURCE_UNINITIALIZE_DEVICE_DRIVER }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER_V1 {
    #StructPack 8

    Version : UInt32

    SourceGuid : Guid

    LogTag : UInt16

    Reserved : Int8[6]

    Initialize : WHEA_ERROR_SOURCE_INITIALIZE_DEVICE_DRIVER

    Uninitialize : WHEA_ERROR_SOURCE_UNINITIALIZE_DEVICE_DRIVER

}
