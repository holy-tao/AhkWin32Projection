#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KEY_CACHED_INFORMATION {
    #StructPack 8

    LastWriteTime : Int64

    TitleIndex : UInt32

    SubKeys : UInt32

    MaxNameLen : UInt32

    Values : UInt32

    MaxValueNameLen : UInt32

    MaxValueDataLen : UInt32

    NameLength : UInt32

}
