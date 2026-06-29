#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct LCN_WEAK_REFERENCE_BUFFER {
    #StructPack 8

    Lcn : Int64

    LengthInClusters : Int64

    ReferenceCount : UInt32

    State : UInt16

}
