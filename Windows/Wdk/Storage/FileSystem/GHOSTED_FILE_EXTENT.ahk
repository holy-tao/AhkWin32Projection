#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct GHOSTED_FILE_EXTENT {
    #StructPack 8

    FileOffset : Int64

    ByteCount : Int64

    RecallOwnerGuid : Guid

    NextEntryOffset : UInt32

    RecallMetadataBufferSize : UInt32

    RecallMetadataBuffer : Int8[1]

}
