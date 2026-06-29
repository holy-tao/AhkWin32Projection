#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_STREAM_EXTENT {
    #StructPack 8

    Vcn : Int64

    Lcn : Int64

    Length : Int64

    Properties : UInt16

}
