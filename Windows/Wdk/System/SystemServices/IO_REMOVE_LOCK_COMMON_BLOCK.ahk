#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_REMOVE_LOCK_COMMON_BLOCK {
    #StructPack 8

    Removed : BOOLEAN

    Reserved : BOOLEAN[3]

    IoCount : Int32

    RemoveEvent : IntPtr

}
