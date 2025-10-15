#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3D10_DEPTH_STENCILOP_DESC.ahk

/**
 * Describes depth-stencil state.
 * @remarks
 * 
  * Depth-stencil state controls how <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">depth-stencil</a> testing is performed by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger</a> stage.
  * 
  * The formats that support stenciling are DXGI_FORMAT_D24_UNORM_S8_UINT and DXGI_FORMAT_D32_FLOAT_S8X24_UINT.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ns-d3d10-d3d10_depth_stencil_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_DEPTH_STENCIL_DESC extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A Boolean value that enables depth testing.  The default value is <b>TRUE</b>.
     * @type {BOOL}
     */
    DepthEnable{
        get {
            if(!this.HasProp("__DepthEnable"))
                this.__DepthEnable := BOOL(this.ptr + 0)
            return this.__DepthEnable
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_depth_write_mask">D3D10_DEPTH_WRITE_MASK</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_depth_write_mask">D3D10_DEPTH_WRITE_MASK</a> enumerated type that identifies a portion of the depth-stencil buffer that can be modified by depth data.  The default value is <b>D3D10_DEPTH_WRITE_MASK_ALL</b>.
     * @type {Integer}
     */
    DepthWriteMask {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_comparison_func">D3D10_COMPARISON_FUNC</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_comparison_func">D3D10_COMPARISON_FUNC</a> enumerated type that defines how depth data is compared against existing depth data.  The default value is <b>D3D10_COMPARISON_LESS</b>
     * @type {Integer}
     */
    DepthFunc {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A Boolean value that enables stencil testing.  The default value is <b>FALSE</b>.
     * @type {BOOL}
     */
    StencilEnable{
        get {
            if(!this.HasProp("__StencilEnable"))
                this.__StencilEnable := BOOL(this.ptr + 12)
            return this.__StencilEnable
        }
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * A value that identifies a portion of the depth-stencil buffer for reading stencil data.  The default value is <b>D3D10_DEFAULT_STENCIL_READ_MASK</b>.
     * @type {Integer}
     */
    StencilReadMask {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * A value that identifies a portion of the depth-stencil buffer for writing stencil data. The default value is <b>D3D10_DEFAULT_STENCIL_WRITE_MASK</b>.
     * @type {Integer}
     */
    StencilWriteMask {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencilop_desc">D3D10_DEPTH_STENCILOP_DESC</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencilop_desc">D3D10_DEPTH_STENCILOP_DESC</a> structure that identifies how to use the results of the depth test and the stencil test for pixels whose surface normal is facing toward the camera.
     * @type {D3D10_DEPTH_STENCILOP_DESC}
     */
    FrontFace{
        get {
            if(!this.HasProp("__FrontFace"))
                this.__FrontFace := D3D10_DEPTH_STENCILOP_DESC(this.ptr + 24)
            return this.__FrontFace
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencilop_desc">D3D10_DEPTH_STENCILOP_DESC</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencilop_desc">D3D10_DEPTH_STENCILOP_DESC</a> structure that identifies how to use the results of the depth test and the stencil test for pixels whose surface normal is facing away from the camera.
     * @type {D3D10_DEPTH_STENCILOP_DESC}
     */
    BackFace{
        get {
            if(!this.HasProp("__BackFace"))
                this.__BackFace := D3D10_DEPTH_STENCILOP_DESC(this.ptr + 40)
            return this.__BackFace
        }
    }
}
