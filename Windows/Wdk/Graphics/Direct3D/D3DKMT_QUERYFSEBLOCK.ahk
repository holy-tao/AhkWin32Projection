#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYFSEBLOCK {
    #StructPack 8

    AdapterLuid : IntPtr

    hAdapter : UInt32

    VidPnSourceId : UInt32

    Flags : IntPtr

}
