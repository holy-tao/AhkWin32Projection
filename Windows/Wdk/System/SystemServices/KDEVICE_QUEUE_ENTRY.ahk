#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KDEVICE_QUEUE_ENTRY {
    #StructPack 8

    DeviceListEntry : IntPtr

    SortKey : UInt32

    Inserted : BOOLEAN

}
