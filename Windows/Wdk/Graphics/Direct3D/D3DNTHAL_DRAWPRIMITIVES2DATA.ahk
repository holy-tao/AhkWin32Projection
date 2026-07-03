#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Win32\Graphics\DirectDraw\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DRAWPRIMITIVES2DATA {
    #StructPack 8

    dwhContext : IntPtr

    dwFlags : UInt32

    dwVertexType : UInt32

    lpDDCommands : DD_SURFACE_LOCAL.Ptr

    dwCommandOffset : UInt32

    dwCommandLength : UInt32

    lpDDVertex : DD_SURFACE_LOCAL.Ptr

    dwVertexOffset : UInt32

    dwVertexLength : UInt32

    dwReqVertexBufSize : UInt32

    dwReqCommandBufSize : UInt32

    lpdwRStates : IntPtr

    dwVertexSize : UInt32

    dwErrorOffset : UInt32

    static __New() {
        DefineProp(this.Prototype, 'lpVertices', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'ddrval', { type: HRESULT, offset: 64 })
        this.DeleteProp("__New")
    }
}
