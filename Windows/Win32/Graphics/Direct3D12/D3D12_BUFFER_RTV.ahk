#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the elements in a buffer resource to use in a render-target view.
 * @remarks
 * 
  * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_view_desc">D3D12_RENDER_TARGET_VIEW_DESC</a> structure to view the resource as a buffer.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_buffer_rtv
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BUFFER_RTV extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of bytes between the beginning of the buffer and the first element to access.
     * @type {Integer}
     */
    FirstElement {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The total number of elements in the view.
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
