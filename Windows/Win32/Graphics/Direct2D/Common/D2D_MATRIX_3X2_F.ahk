#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a 3-by-2 matrix.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_matrix_3x2_f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D_MATRIX_3X2_F {
    #StructPack 4

    m11 : Float32

    m12 : Float32

    m21 : Float32

    m22 : Float32

    dx : Float32

    dy : Float32

    static __New() {
        DefineProp(this.Prototype, '_11', { type: Float32, offset: 0 })
        DefineProp(this.Prototype, '_12', { type: Float32, offset: 4 })
        DefineProp(this.Prototype, '_21', { type: Float32, offset: 8 })
        DefineProp(this.Prototype, '_22', { type: Float32, offset: 12 })
        DefineProp(this.Prototype, '_31', { type: Float32, offset: 16 })
        DefineProp(this.Prototype, '_32', { type: Float32, offset: 20 })
        DefineProp(this.Prototype, 'm', { type: Float32[6], offset: 0 })
        this.DeleteProp("__New")
    }
}
