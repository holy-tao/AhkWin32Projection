#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct NodeUtilizationInfoElement {
    #StructPack 8

    Id : Int64

    AvailableMemory : Int64

    AvailableMemoryAfterReclamation : Int64

}
