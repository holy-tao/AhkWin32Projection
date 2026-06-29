#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DPROCESSVERTICES {
    #StructPack 4

    dwFlags : UInt32

    wStart : UInt16

    wDest : UInt16

    dwCount : UInt32

    dwReserved : UInt32

}
