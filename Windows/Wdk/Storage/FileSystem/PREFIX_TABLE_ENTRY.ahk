#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Kernel\STRING.ahk" { STRING }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PREFIX_TABLE_ENTRY {
    #StructPack 8

    NodeTypeCode : Int16

    NameLength : Int16

    NextPrefixTree : PREFIX_TABLE_ENTRY.Ptr

    Links : IntPtr

    Prefix : STRING.Ptr

}
