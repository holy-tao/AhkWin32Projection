#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_GENERIC_ERR_MEM_MAP_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    MapReason : CHAR[32]

    PhysicalAddress : Int64

    Length : Int64

}
