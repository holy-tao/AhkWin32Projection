#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the elements in a buffer resource to use in a shader-resource view. (D3D10_BUFFER_SRV)
 * @remarks
 * The <b>D3D10_BUFFER_SRV</b> structure is a member of the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_shader_resource_view_desc">D3D10_SHADER_RESOURCE_VIEW_DESC</a> structure, which represents a shader-resource view description. You can create a shader-resource view by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview">ID3D10Device::CreateShaderResourceView</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_buffer_srv
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_BUFFER_SRV extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    FirstElement {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ElementOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ElementWidth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
