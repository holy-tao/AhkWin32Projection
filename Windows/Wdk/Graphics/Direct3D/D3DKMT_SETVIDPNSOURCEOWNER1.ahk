#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SETVIDPNSOURCEOWNER1 {
    #StructPack 8

    Version0 : IntPtr

    Flags : IntPtr

}
