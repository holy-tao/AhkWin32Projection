#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DPRIMITIVETYPE.ahk" { D3DPRIMITIVETYPE }
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DVERTEXTYPE.ahk" { D3DVERTEXTYPE }
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_DRAWONEPRIMITIVEDATA {
    #StructPack 8

    dwhContext : IntPtr

    dwFlags : UInt32

    PrimitiveType : D3DPRIMITIVETYPE

    VertexType : D3DVERTEXTYPE

    lpvVertices : IntPtr

    dwNumVertices : UInt32

    dwReserved : UInt32

    ddrval : HRESULT

    static __New() {
        DefineProp(this.Prototype, 'dwFVFControl', { type: UInt32, offset: 16 })
        this.DeleteProp("__New")
    }
}
