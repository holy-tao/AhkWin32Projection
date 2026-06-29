#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_NODEMETADATA {
    #StructPack 8

    NodeOrdinalAndAdapterIndex : UInt32

    NodeData : IntPtr

}
