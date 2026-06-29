#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DEVICE_IDS {
    #StructPack 4

    VendorID : UInt32

    DeviceID : UInt32

    SubVendorID : UInt32

    SubSystemID : UInt32

    RevisionID : UInt32

    BusType : UInt32

}
