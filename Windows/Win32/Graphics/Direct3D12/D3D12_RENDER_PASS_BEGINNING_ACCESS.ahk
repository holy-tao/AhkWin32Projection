#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_DEPTH_STENCIL_VALUE.ahk
#Include .\D3D12_CLEAR_VALUE.ahk
#Include .\D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS.ahk
#Include .\D3D12_RENDER_PASS_BEGINNING_ACCESS_PRESERVE_LOCAL_PARAMETERS.ahk

/**
 * Describes the access to resource(s) that is requested by an application at the transition into a render pass.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_beginning_access
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RENDER_PASS_BEGINNING_ACCESS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_render_pass_beginning_access_type">D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE</a>. The type of access being requested.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS}
     */
    Clear{
        get {
            if(!this.HasProp("__Clear"))
                this.__Clear := D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS(4, this)
            return this.__Clear
        }
    }

    /**
     * @type {D3D12_RENDER_PASS_BEGINNING_ACCESS_PRESERVE_LOCAL_PARAMETERS}
     */
    PreserveLocal{
        get {
            if(!this.HasProp("__PreserveLocal"))
                this.__PreserveLocal := D3D12_RENDER_PASS_BEGINNING_ACCESS_PRESERVE_LOCAL_PARAMETERS(4, this)
            return this.__PreserveLocal
        }
    }
}
