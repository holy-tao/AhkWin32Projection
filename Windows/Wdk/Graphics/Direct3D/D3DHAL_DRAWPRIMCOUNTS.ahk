#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_DRAWPRIMCOUNTS {
    #StructPack 2

    wNumStateChanges : UInt16

    wPrimitiveType : UInt16

    wVertexType : UInt16

    wNumVertices : UInt16

}
