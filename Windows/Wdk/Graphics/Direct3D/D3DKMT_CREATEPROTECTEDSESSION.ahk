#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATEPROTECTEDSESSION {
    #StructPack 8

    hDevice : UInt32

    hSyncObject : UInt32

    pPrivateDriverData : IntPtr

    PrivateDriverDataSize : UInt32

    pPrivateRuntimeData : IntPtr

    PrivateRuntimeDataSize : UInt32

    hHandle : UInt32

}
