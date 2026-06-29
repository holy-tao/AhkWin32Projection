#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATESYNCHRONIZATIONOBJECT2 {
    #StructPack 8

    hDevice : UInt32

    Info : IntPtr

    hSyncObject : UInt32

}
