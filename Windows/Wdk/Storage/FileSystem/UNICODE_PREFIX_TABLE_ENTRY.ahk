#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct UNICODE_PREFIX_TABLE_ENTRY {
    #StructPack 8

    NodeTypeCode : Int16

    NameLength : Int16

    NextPrefixTree : UNICODE_PREFIX_TABLE_ENTRY.Ptr

    CaseMatch : UNICODE_PREFIX_TABLE_ENTRY.Ptr

    Links : IntPtr

    Prefix : UNICODE_STRING.Ptr

}
