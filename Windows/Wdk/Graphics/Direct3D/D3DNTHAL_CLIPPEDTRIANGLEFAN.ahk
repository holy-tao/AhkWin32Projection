#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_CLIPPEDTRIANGLEFAN {
    #StructPack 4

    FirstVertexOffset : UInt32

    dwEdgeFlags : UInt32

    PrimitiveCount : UInt32

}
