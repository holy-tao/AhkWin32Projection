#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct DUPLICATE_CLUSTER_DATA {
    #StructPack 8

    SourceLcn : Int64

    TargetFileOffset : Int64

    DuplicationLimit : UInt32

    Reserved : UInt32

}
