#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_UINT128.ahk" { WHV_UINT128 }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_XMM_CONTROL_STATUS_REGISTER {
    #StructPack 8

    LastFpRdp : Int64

    XmmStatusControl : UInt32

    XmmStatusControlMask : UInt32

    static __New() {
        DefineProp(this.Prototype, 'LastFpDp', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'LastFpDs', { type: UInt16, offset: 4 })
        DefineProp(this.Prototype, 'Reserved', { type: UInt16, offset: 6 })
        DefineProp(this.Prototype, 'AsUINT128', { type: WHV_UINT128, offset: 0 })
        this.DeleteProp("__New")
    }
}
