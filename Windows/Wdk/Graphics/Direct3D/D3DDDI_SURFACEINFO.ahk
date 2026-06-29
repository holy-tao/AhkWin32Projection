#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_SURFACEINFO {
    #StructPack 8

    Width : UInt32

    Height : UInt32

    Depth : UInt32

    pSysMem : IntPtr

    SysMemPitch : UInt32

    SysMemSlicePitch : UInt32

}
