#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDP_PTRSTRIDE {
    #StructPack 8

    lpvData : IntPtr

    dwStride : UInt32

}
