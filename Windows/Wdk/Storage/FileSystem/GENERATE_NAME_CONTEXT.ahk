#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct GENERATE_NAME_CONTEXT {
    #StructPack 4

    Checksum : UInt16

    ChecksumInserted : BOOLEAN

    NameLength : Int8

    NameBuffer : WCHAR[8]

    ExtensionLength : UInt32

    ExtensionBuffer : WCHAR[4]

    LastIndexValue : UInt32

}
