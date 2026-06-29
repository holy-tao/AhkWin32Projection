#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STREAMING_CONTROL_REQUEST_TYPE.ahk" { STREAMING_CONTROL_REQUEST_TYPE }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_STREAMING_CONTROL {
    #StructPack 4

    RequestType : STREAMING_CONTROL_REQUEST_TYPE

}
