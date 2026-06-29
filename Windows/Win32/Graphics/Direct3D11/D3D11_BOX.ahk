#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a 3D box. (D3D11_BOX)
 * @remarks
 * The following diagram shows a 3D box, where the origin is the left, front, top corner.
 * 
 * <img alt="Diagram of a 3D box, where the origin is the left, front, top corner" src="./images/D3D10_box.png"/>
 * 
 * The values for <b>right</b>, <b>bottom</b>, and <b>back</b> are each one pixel past the end of the pixels that are included in the box region.  That is, the values for <b>left</b>, <b>top</b>, and <b>front</b> are included in the box region while the values for right, bottom, and back are excluded from the box region. For example, for a box that is one pixel wide, (right - left) == 1; the box region includes the left pixel but not the right pixel.
 * 
 * Coordinates of a box are in bytes for buffers and in texels for textures.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_box
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_BOX {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The x position of the left hand side of the box.
     */
    left : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The y position of the top of the box.
     */
    top : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The z position of the front of the box.
     */
    front : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The x position of the right hand side of the box.
     */
    right : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The y position of the bottom of the box.
     */
    bottom : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The z position of the back of the box.
     */
    back : UInt32

}
