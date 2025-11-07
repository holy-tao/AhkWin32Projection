#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the dimensions of a viewport.
 * @remarks
 * 
 * Pass an array of these structures to the <i>pViewports</i> parameter  in a call to  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-rssetviewports">ID3D12GraphicsCommandList::RSSetViewports</a> to set viewports for the display.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_viewport
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_VIEWPORT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * X position of the left hand side of the viewport.
     * @type {Float}
     */
    TopLeftX {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Y position of the top of the viewport.
     * @type {Float}
     */
    TopLeftY {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Width of the viewport.
     * @type {Float}
     */
    Width {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Height of the viewport.
     * @type {Float}
     */
    Height {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Minimum depth of the viewport. Ranges between 0 and 1.
     * @type {Float}
     */
    MinDepth {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Maximum depth of the viewport. Ranges between 0 and 1.
     * @type {Float}
     */
    MaxDepth {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
