#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KAPC {
    #StructPack 8

    Type : Int8

    AllFlags : Int8

    Size : Int8

    SpareByte1 : Int8

    SpareLong0 : UInt32

    Thread : IntPtr

    ApcListEntry : IntPtr

    Reserved : IntPtr[3]

    NormalContext : IntPtr

    SystemArgument1 : IntPtr

    SystemArgument2 : IntPtr

    ApcStateIndex : Int8

    ApcMode : Int8

    Inserted : BOOLEAN

}
