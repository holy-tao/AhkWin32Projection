#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VEC3D.ahk" { VEC3D }

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct MATRIX3X3 {
    #StructPack 4

    A11 : Float32

    A12 : Float32

    A13 : Float32

    A21 : Float32

    A22 : Float32

    A23 : Float32

    A31 : Float32

    A32 : Float32

    A33 : Float32

    static __New() {
        DefineProp(this.Prototype, 'V1', { type: VEC3D, offset: 0 })
        DefineProp(this.Prototype, 'V2', { type: VEC3D, offset: 12 })
        DefineProp(this.Prototype, 'V3', { type: VEC3D, offset: 24 })
        DefineProp(this.Prototype, 'M', { type: Float32[9], offset: 0 })
        this.DeleteProp("__New")
    }
}
