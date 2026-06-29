#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VOLUME_ALLOCATION_HINT_INPUT {
    #StructPack 8

    ClusterSize : UInt32

    NumberOfClusters : UInt32

    StartingClusterNumber : Int64

}
