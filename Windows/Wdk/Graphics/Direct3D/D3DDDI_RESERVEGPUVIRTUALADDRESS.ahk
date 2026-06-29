#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDIGPUVIRTUALADDRESS_RESERVATION_TYPE.ahk" { D3DDDIGPUVIRTUALADDRESS_RESERVATION_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_RESERVEGPUVIRTUALADDRESS {
    #StructPack 8

    hPagingQueue : UInt32

    BaseAddress : Int64

    MinimumAddress : Int64

    MaximumAddress : Int64

    Size : Int64

    ReservationType : D3DDDIGPUVIRTUALADDRESS_RESERVATION_TYPE

    DriverProtection : Int64

    VirtualAddress : Int64

    PagingFenceValue : Int64

    static __New() {
        DefineProp(this.Prototype, 'hAdapter', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'Reserved0', { type: UInt32, offset: 40 })
        DefineProp(this.Prototype, 'Reserved1', { type: Int64, offset: 48 })
        DefineProp(this.Prototype, 'Reserved2', { type: Int64, offset: 64 })
        this.DeleteProp("__New")
    }
}
