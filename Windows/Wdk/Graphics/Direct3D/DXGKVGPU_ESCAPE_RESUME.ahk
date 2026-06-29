#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKVGPU_ESCAPE_RESUME {
    #StructPack 8

    Header : IntPtr

    DeviceLuid : IntPtr

    Flags : UInt32

}
