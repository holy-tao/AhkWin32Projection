#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_DRIVER_REQUEST.ahk" { GNSS_DRIVER_REQUEST }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_DRIVER_REQUEST_DATA {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    Request : GNSS_DRIVER_REQUEST

    RequestFlag : UInt32

}
