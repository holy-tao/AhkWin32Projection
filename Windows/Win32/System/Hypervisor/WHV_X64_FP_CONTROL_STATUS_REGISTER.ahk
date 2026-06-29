#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_UINT128.ahk" { WHV_UINT128 }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_FP_CONTROL_STATUS_REGISTER {
    #StructPack 8

    FpControl : UInt16

    FpStatus : UInt16

    FpTag : Int8

    Reserved : Int8

    LastFpOp : UInt16

    LastFpRip : Int64

    static __New() {
        DefineProp(this.Prototype, 'LastFpEip', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'LastFpCs', { type: UInt16, offset: 12 })
        DefineProp(this.Prototype, 'Reserved2', { type: UInt16, offset: 14 })
        DefineProp(this.Prototype, 'AsUINT128', { type: WHV_UINT128, offset: 0 })
        this.DeleteProp("__New")
    }
}
