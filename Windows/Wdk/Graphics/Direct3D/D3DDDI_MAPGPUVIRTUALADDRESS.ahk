#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_MAPGPUVIRTUALADDRESS {
    #StructPack 8

    hPagingQueue : UInt32

    BaseAddress : Int64

    MinimumAddress : Int64

    MaximumAddress : Int64

    hAllocation : UInt32

    OffsetInPages : Int64

    SizeInPages : Int64

    Protection : IntPtr

    DriverProtection : Int64

    Reserved0 : UInt32

    Reserved1 : Int64

    VirtualAddress : Int64

    PagingFenceValue : Int64

}
