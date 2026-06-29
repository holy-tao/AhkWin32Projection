#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ENUMADAPTERS {
    #StructPack 8

    NumAdapters : UInt32

    Adapters : IntPtr[16]

}
