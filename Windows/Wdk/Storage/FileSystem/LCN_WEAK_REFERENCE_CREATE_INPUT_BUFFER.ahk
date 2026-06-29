#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct LCN_WEAK_REFERENCE_CREATE_INPUT_BUFFER {
    #StructPack 8

    Offset : Int64

    Length : Int64

    Flags : UInt32

    Reserved : UInt32

}
