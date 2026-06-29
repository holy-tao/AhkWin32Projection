#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_VALUE {
    #StructPack 8


    struct _I64Parts32 {
        LowPart : UInt32

        HighPart : UInt32

    }

    struct _F128Parts64 {
        LowPart : Int64

        HighPart : Int64

    }

    I8 : Int8

    Nat : BOOL

    TailOfRawBytes : UInt32

    Type : UInt32

    static __New() {
        DefineProp(this.Prototype, 'I16', { type: UInt16, offset: 0 })
        DefineProp(this.Prototype, 'I32', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'I64', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'F32', { type: Float32, offset: 0 })
        DefineProp(this.Prototype, 'F64', { type: Float64, offset: 0 })
        DefineProp(this.Prototype, 'F80Bytes', { type: Int8[10], offset: 0 })
        DefineProp(this.Prototype, 'F82Bytes', { type: Int8[11], offset: 0 })
        DefineProp(this.Prototype, 'F128Bytes', { type: Int8[16], offset: 0 })
        DefineProp(this.Prototype, 'VI8', { type: Int8[16], offset: 0 })
        DefineProp(this.Prototype, 'VI16', { type: UInt16[8], offset: 0 })
        DefineProp(this.Prototype, 'VI32', { type: UInt32[4], offset: 0 })
        DefineProp(this.Prototype, 'VI64', { type: Int64[2], offset: 0 })
        DefineProp(this.Prototype, 'VF32', { type: Float32[4], offset: 0 })
        DefineProp(this.Prototype, 'VF64', { type: Float64[2], offset: 0 })
        DefineProp(this.Prototype, 'I64Parts32', { type: DEBUG_VALUE._I64Parts32, offset: 0 })
        DefineProp(this.Prototype, 'F128Parts64', { type: DEBUG_VALUE._F128Parts64, offset: 0 })
        DefineProp(this.Prototype, 'RawBytes', { type: Int8[24], offset: 0 })
        this.DeleteProp("__New")
    }
}
