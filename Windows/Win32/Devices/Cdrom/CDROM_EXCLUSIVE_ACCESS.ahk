#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXCLUSIVE_ACCESS_REQUEST_TYPE.ahk" { EXCLUSIVE_ACCESS_REQUEST_TYPE }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_EXCLUSIVE_ACCESS {
    #StructPack 4

    RequestType : EXCLUSIVE_ACCESS_REQUEST_TYPE

    Flags : UInt32

}
