#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERY_DEVICE_IDS {
    #StructPack 8

    PhysicalAdapterIndex : UInt32

    DeviceIds : IntPtr

}
