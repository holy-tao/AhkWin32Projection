#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a range.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3drange
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DRANGE {
    #StructPack 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Offset, in bytes.
     */
    Offset : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Size, in bytes.
     */
    Size : UInt32

}
