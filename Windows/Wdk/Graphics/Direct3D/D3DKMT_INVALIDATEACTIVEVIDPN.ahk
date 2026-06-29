#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_INVALIDATEACTIVEVIDPN {
    #StructPack 8

    hAdapter : UInt32

    pPrivateDriverData : IntPtr

    PrivateDriverDataSize : UInt32

}
