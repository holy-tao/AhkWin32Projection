#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_VA_RANGE_DESC {
    #StructPack 8

    VadAddress : Int64

    VaRangeIndex : UInt32

    PhysicalAdapterIndex : UInt32

    StartAddress : Int64

    EndAddress : Int64

    DriverProtection : Int64

    OwnerType : UInt32

    pOwner : Int64

    OwnerOffset : Int64

    Protection : UInt32

}
