#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a 3D box.
 * @remarks
 * 
  * The following diagram shows a 3D box, where the origin is the left, front, top corner.
  * 
  * <img alt="Diagram of a 3D box, where the origin is the left, front, top corner" src="./images/D3D10_box.png"/>
  * 
  * The values for <b>right</b>, <b>bottom</b>, and <b>back</b> are each one pixel past the end of the pixels that are included in the box region.  That is, the values for <b>left</b>, <b>top</b>, and <b>front</b> are included in the box region while the values for right, bottom, and back are excluded from the box region. For example, for a box that is one pixel wide, (right - left) == 1; the box region includes the left pixel but not the right pixel.
  * 
  * Coordinates of a box are in bytes for buffers and in texels for textures.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_box
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_BOX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The x position of the left hand side of the box.
     * @type {Integer}
     */
    left {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The y position of the top of the box.
     * @type {Integer}
     */
    top {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The z position of the front of the box.
     * @type {Integer}
     */
    front {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The x position of the right hand side of the box.
     * @type {Integer}
     */
    right {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The y position of the bottom of the box.
     * @type {Integer}
     */
    bottom {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The z position of the back of the box.
     * @type {Integer}
     */
    back {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
