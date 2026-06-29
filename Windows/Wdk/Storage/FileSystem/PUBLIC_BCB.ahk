#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PUBLIC_BCB {
    #StructPack 8

    NodeTypeCode : Int16

    NodeByteSize : Int16

    MappedLength : UInt32

    MappedFileOffset : Int64

}
