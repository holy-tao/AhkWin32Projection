#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DD_DXVERSION {
    #StructPack 8

    gdi2 : IntPtr

    dwDXVersion : UInt32

    dwReserved : UInt32

}
