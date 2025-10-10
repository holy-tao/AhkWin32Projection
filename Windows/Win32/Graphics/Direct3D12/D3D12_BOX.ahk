#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a 3D box.
 * @remarks
 * 
  * This structure is used by the methods <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-writetosubresource">WriteToSubresource</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-readfromsubresource">ReadFromSubresource</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytextureregion">CopyTextureRegion</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_box
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BOX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The x position of the left hand side of the box.
     * @type {Integer}
     */
    left {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The y position of the top of the box.
     * @type {Integer}
     */
    top {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The z position of the front of the box.
     * @type {Integer}
     */
    front {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The x position of the right hand side of the box, plus 1. This means that <c>right - left</c> equals the width of the box.
     * @type {Integer}
     */
    right {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The y position of the bottom of the box, plus 1. This means that <c>bottom - top</c> equals the height of the box.
     * @type {Integer}
     */
    bottom {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The z position of the back of the box, plus 1. This means that <c>back - front</c> equals the depth of the box.
     * @type {Integer}
     */
    back {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
