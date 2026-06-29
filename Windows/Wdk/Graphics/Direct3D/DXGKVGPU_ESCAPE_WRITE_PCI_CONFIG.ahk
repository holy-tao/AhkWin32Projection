#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKVGPU_ESCAPE_WRITE_PCI_CONFIG {
    #StructPack 8

    Header : IntPtr

    Offset : UInt32

    Size : UInt32

}
