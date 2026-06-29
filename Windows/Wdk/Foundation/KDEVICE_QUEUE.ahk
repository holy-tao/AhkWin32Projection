#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct KDEVICE_QUEUE {
    #StructPack 8

    Type : Int16

    Size : Int16

    DeviceListHead : IntPtr

    Lock : IntPtr

    Busy : BOOLEAN

}
