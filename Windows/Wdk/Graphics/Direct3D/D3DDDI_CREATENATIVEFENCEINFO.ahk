#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_CREATENATIVEFENCEINFO {
    #StructPack 8

    InitialFenceValue : Int64

    pPrivateDriverData : IntPtr

    PrivateDriverDataSize : UInt32

    EngineAffinity : UInt32

    Flags : IntPtr

    hSyncObject : UInt32

    NativeFenceMapping : IntPtr

}
