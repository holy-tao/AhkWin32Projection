#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POBJECT_TYPE.ahk" { POBJECT_TYPE }
#Import ".\OB_PRE_OPERATION_PARAMETERS.ahk" { OB_PRE_OPERATION_PARAMETERS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct OB_PRE_OPERATION_INFORMATION {
    #StructPack 8

    Operation : UInt32

    Flags : UInt32


    /**
     * @type {Integer}
     */
    KernelHandle {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    Object : IntPtr

    ObjectType : POBJECT_TYPE

    CallContext : IntPtr

    Parameters : OB_PRE_OPERATION_PARAMETERS.Ptr

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 4 })
        this.DeleteProp("__New")
    }
}
