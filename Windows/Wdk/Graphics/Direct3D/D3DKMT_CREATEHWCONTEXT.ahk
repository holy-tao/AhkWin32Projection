#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATEHWCONTEXT {
    #StructPack 8

    hDevice : UInt32

    NodeOrdinal : UInt32

    EngineAffinity : UInt32

    Flags : IntPtr

    PrivateDriverDataSize : UInt32

    pPrivateDriverData : IntPtr

    hHwContext : UInt32

}
