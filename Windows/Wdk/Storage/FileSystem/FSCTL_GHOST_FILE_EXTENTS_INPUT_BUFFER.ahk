#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FSCTL_GHOST_FILE_EXTENTS_INPUT_BUFFER {
    #StructPack 8

    FileOffset : Int64

    ByteCount : Int64

    RecallOwnerGuid : Guid

    RecallMetadataBufferSize : UInt32

    RecallMetadataBuffer : Int8[1]

}
