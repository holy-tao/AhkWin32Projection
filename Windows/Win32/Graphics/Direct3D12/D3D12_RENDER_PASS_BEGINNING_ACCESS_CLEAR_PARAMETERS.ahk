#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_DEPTH_STENCIL_VALUE.ahk
#Include .\D3D12_CLEAR_VALUE.ahk

/**
 * Describes the clear value to which resource(s) should be cleared at the beginning of a render pass.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_render_pass_beginning_access_clear_parameters
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_clear_value">D3D12_CLEAR_VALUE</a>. The clear value to which the resource(s) should be cleared.
     * @type {D3D12_CLEAR_VALUE}
     */
    ClearValue{
        get {
            if(!this.HasProp("__ClearValue"))
                this.__ClearValue := D3D12_CLEAR_VALUE(this.ptr + 0)
            return this.__ClearValue
        }
    }
}
