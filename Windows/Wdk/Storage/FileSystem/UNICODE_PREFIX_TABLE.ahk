#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UNICODE_PREFIX_TABLE_ENTRY.ahk" { UNICODE_PREFIX_TABLE_ENTRY }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct UNICODE_PREFIX_TABLE {
    #StructPack 8

    NodeTypeCode : Int16

    NameLength : Int16

    NextPrefixTree : UNICODE_PREFIX_TABLE_ENTRY.Ptr

    LastNextEntry : UNICODE_PREFIX_TABLE_ENTRY.Ptr

}
