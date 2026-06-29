#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a 5-by-4 floating point matrix.
 * @remarks
 * The <b>D2D1_MATRIX_5X4_F</b> structure is type defined from a <b>D2D_MATRIX_5X4_F</b> structure in D2d1_1.h.
 * 
 * ```cpp
 * typedef D2D_MATRIX_5X4_F D2D1_MATRIX_5X4_F;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_matrix_5x4_f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D_MATRIX_5X4_F {
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

    _51 : Float32

    _52 : Float32

    _53 : Float32

    _54 : Float32

    static __New() {
        DefineProp(this.Prototype, 'm', { type: Float32[20], offset: 0 })
        this.DeleteProp("__New")
    }
}
