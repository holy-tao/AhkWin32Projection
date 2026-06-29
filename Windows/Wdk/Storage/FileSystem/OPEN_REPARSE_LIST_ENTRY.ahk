#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct OPEN_REPARSE_LIST_ENTRY {
    #StructPack 8

    OpenReparseListEntry : IntPtr

    ReparseTag : UInt32

    Flags : UInt32

    ReparseGuid : Guid

    Size : UInt16

    RemainingLength : UInt16

}
