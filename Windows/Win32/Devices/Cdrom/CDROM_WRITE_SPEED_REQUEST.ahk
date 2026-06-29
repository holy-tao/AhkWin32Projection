#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CDROM_PERFORMANCE_REQUEST_TYPE.ahk" { CDROM_PERFORMANCE_REQUEST_TYPE }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_WRITE_SPEED_REQUEST {
    #StructPack 4

    RequestType : CDROM_PERFORMANCE_REQUEST_TYPE

}
