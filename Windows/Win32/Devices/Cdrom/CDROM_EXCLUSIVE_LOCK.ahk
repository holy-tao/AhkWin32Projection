#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXCLUSIVE_ACCESS_REQUEST_TYPE.ahk" { EXCLUSIVE_ACCESS_REQUEST_TYPE }
#Import ".\CDROM_EXCLUSIVE_ACCESS.ahk" { CDROM_EXCLUSIVE_ACCESS }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_EXCLUSIVE_LOCK {
    #StructPack 4

    Access : CDROM_EXCLUSIVE_ACCESS

    CallerName : Int8[64]

}
