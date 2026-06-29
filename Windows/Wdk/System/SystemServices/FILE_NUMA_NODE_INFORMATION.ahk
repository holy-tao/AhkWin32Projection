#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_NUMA_NODE_INFORMATION {
    #StructPack 2

    NodeNumber : UInt16

}
