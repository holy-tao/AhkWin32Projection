#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_QUERY_NODE2 {
    #StructPack 2

    PhysicalAdapterIndex : UInt16

    NodeOrdinal : UInt16

}
