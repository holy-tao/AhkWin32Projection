#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_EXCLUSIVE_LOCK_STATE {
    #StructPack 1

    LockState : BOOLEAN

    CallerName : Int8[64]

}
