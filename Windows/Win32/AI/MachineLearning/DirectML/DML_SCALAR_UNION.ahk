#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A union of scalar types.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_scalar_union
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_SCALAR_UNION {
    #StructPack 8

    /**
     * An 8-byte array.
     */
    Bytes : Int8[8]

    static __New() {
        DefineProp(this.Prototype, 'Int8', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'UInt8', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'Int16', { type: Int16, offset: 0 })
        DefineProp(this.Prototype, 'UInt16', { type: UInt16, offset: 0 })
        DefineProp(this.Prototype, 'Int32', { type: Int32, offset: 0 })
        DefineProp(this.Prototype, 'UInt32', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'Int64', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'UInt64', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'Float32', { type: Float32, offset: 0 })
        DefineProp(this.Prototype, 'Float64', { type: Float64, offset: 0 })
        this.DeleteProp("__New")
    }
}
