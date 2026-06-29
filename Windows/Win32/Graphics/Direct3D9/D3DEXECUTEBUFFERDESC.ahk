#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DEXECUTEBUFFERDESC {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    dwCaps : UInt32

    dwBufferSize : UInt32

    lpData : IntPtr

}
