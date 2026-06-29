#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PREFIX_TABLE_ENTRY.ahk" { PREFIX_TABLE_ENTRY }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PREFIX_TABLE {
    #StructPack 8

    NodeTypeCode : Int16

    NameLength : Int16

    NextPrefixTree : PREFIX_TABLE_ENTRY.Ptr

}
