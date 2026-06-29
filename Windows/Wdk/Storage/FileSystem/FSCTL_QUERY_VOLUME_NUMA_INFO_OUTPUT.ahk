#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FSCTL_QUERY_VOLUME_NUMA_INFO_OUTPUT {
    #StructPack 4

    NumaNode : UInt32

}
