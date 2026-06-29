#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_QUERY_PREFER_LOCAL_REPAIR_OUTPUT {
    #StructPack 4

    Version : UInt32

    PreferLocalRepair : BOOLEAN

}
