#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Describes the subresources involved in resolving at the conclusion of a render pass.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_render_pass_ending_access_resolve_subresource_parameters
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_SUBRESOURCE_PARAMETERS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <b>UINT</b>. The source subresource.
     * @type {Integer}
     */
    SrcSubresource {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <b>UINT</b>. The destination subresource.
     * @type {Integer}
     */
    DstSubresource {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <b>UINT</b>. The x coordinate within the destination subresource.
     * @type {Integer}
     */
    DstX {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A <b>UINT</b>. The y coordinate within the destination subresource.
     * @type {Integer}
     */
    DstY {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-rect">D3D12_RECT</a>. The rectangle within the source subresource.
     * @type {RECT}
     */
    SrcRect{
        get {
            if(!this.HasProp("__SrcRect"))
                this.__SrcRect := RECT(this.ptr + 16)
            return this.__SrcRect
        }
    }
}
