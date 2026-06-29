#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct NodeSriovInfo {
    #StructPack 4

    VFTotal : UInt32

    VFUsed : UInt32

    QPTotal : UInt32

    QPUsed : UInt32

}
