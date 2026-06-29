#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_UDPROW2 {
    #StructPack 8

    dwLocalAddr : UInt32

    dwLocalPort : UInt32

    dwOwningPid : UInt32

    liCreateTimestamp : Int64

    /**
     * This bitfield backs the following members:
     * - SpecificPortBind
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    SpecificPortBind {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    OwningModuleInfo : Int64[16]

    dwRemoteAddr : UInt32

    dwRemotePort : UInt32

    static __New() {
        DefineProp(this.Prototype, 'dwFlags', { type: Int32, offset: 24 })
        this.DeleteProp("__New")
    }
}
