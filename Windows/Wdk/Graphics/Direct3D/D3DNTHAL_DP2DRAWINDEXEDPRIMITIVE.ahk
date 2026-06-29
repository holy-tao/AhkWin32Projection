#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DPRIMITIVETYPE.ahk" { D3DPRIMITIVETYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DP2DRAWINDEXEDPRIMITIVE {
    #StructPack 4

    primType : D3DPRIMITIVETYPE

    BaseVertexIndex : Int32

    MinIndex : UInt32

    NumVertices : UInt32

    StartIndex : UInt32

    PrimitiveCount : UInt32

}
