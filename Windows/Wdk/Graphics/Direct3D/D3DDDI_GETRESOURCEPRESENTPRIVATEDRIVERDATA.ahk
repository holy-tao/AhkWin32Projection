#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_GETRESOURCEPRESENTPRIVATEDRIVERDATA {
    #StructPack 8

    hResource : UInt32

    PrivateDriverDataSize : UInt32

    pPrivateDriverData : IntPtr

}
