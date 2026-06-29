#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A 4x4 row-major matrix.
 * @see https://learn.microsoft.com/windows/win32/direct3d10/d3d10-d3dmatrix
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3DMATRIX {
    #StructPack 4

    _11 : Float32

    _12 : Float32

    _13 : Float32

    _14 : Float32

    _21 : Float32

    _22 : Float32

    _23 : Float32

    _24 : Float32

    _31 : Float32

    _32 : Float32

    _33 : Float32

    _34 : Float32

    _41 : Float32

    _42 : Float32

    _43 : Float32

    _44 : Float32

    static __New() {
        DefineProp(this.Prototype, 'm', { type: Float32[16], offset: 0 })
        this.DeleteProp("__New")
    }
}
