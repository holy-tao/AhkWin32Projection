#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct DxcBuffer {
    #StructPack 8

    Ptr : IntPtr

    Size : IntPtr

    Encoding : UInt32

}
