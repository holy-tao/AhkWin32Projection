#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3D12_DEPTH_STENCILOP_DESC.ahk

/**
 * Describes depth-stencil state.
 * @remarks
 * 
  * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> object contains a depth-stencil-state structure that controls how depth-stencil testing is performed by the output-merger stage.
  * 
  * This table shows the default values of depth-stencil states.
  * 
  * <table>
  * <tr>
  * <th>State</th>
  * <th>Default Value</th>
  * </tr>
  * <tr>
  * <td>DepthEnable</td>
  * <td>TRUE</td>
  * </tr>
  * <tr>
  * <td>DepthWriteMask</td>
  * <td>D3D12_DEPTH_WRITE_MASK_ALL</td>
  * </tr>
  * <tr>
  * <td>DepthFunc</td>
  * <td>D3D12_COMPARISON_LESS</td>
  * </tr>
  * <tr>
  * <td>StencilEnable</td>
  * <td>FALSE</td>
  * </tr>
  * <tr>
  * <td>StencilReadMask</td>
  * <td>D3D12_DEFAULT_STENCIL_READ_MASK</td>
  * </tr>
  * <tr>
  * <td>StencilWriteMask</td>
  * <td>D3D12_DEFAULT_STENCIL_WRITE_MASK</td>
  * </tr>
  * <tr>
  * <td>
  * FrontFace.StencilFunc
  * 
  * and
  * 
  * BackFace.StencilFunc
  * 
  * </td>
  * <td>D3D12_COMPARISON_ALWAYS</td>
  * </tr>
  * <tr>
  * <td>
  * FrontFace.StencilDepthFailOp
  * 
  * and
  * 
  * BackFace.StencilDepthFailOp
  * 
  * </td>
  * <td>D3D12_STENCIL_OP_KEEP</td>
  * </tr>
  * <tr>
  * <td>
  * FrontFace.StencilPassOp
  * 
  * and
  * 
  * BackFace.StencilPassOp
  * 
  * </td>
  * <td>D3D12_STENCIL_OP_KEEP</td>
  * </tr>
  * <tr>
  * <td>
  * FrontFace.StencilFailOp
  * 
  * and
  * 
  * BackFace.StencilFailOp
  * 
  * </td>
  * <td>D3D12_STENCIL_OP_KEEP</td>
  * </tr>
  * <tr>
  * <td>DepthBoundsTestEnable</td>
  * <td>FALSE</td>
  * </tr>
  * </table>
  *  
  * 
  * The formats that support stenciling are DXGI_FORMAT_D24_UNORM_S8_UINT and DXGI_FORMAT_D32_FLOAT_S8X24_UINT.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_depth_stencil_desc1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEPTH_STENCIL_DESC1 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Specifies whether to enable depth testing. Set this member to <b>TRUE</b> to enable depth testing.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_depth_write_mask">D3D12_DEPTH_WRITE_MASK</a>-typed value that identifies a portion of the depth-stencil buffer that can be modified by depth data.
     * @type {Integer}
     */
    DepthWriteMask {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_comparison_func">D3D12_COMPARISON_FUNC</a>-typed value that identifies a function that compares depth data against existing depth data.
     * @type {Integer}
     */
    DepthFunc {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Specifies whether to enable stencil testing. Set this member to <b>TRUE</b> to enable stencil testing.
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
     * Identify a portion of the depth-stencil buffer for reading stencil data.
     * @type {Integer}
     */
    StencilReadMask {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * Identify a portion of the depth-stencil buffer for writing stencil data.
     * @type {Integer}
     */
    StencilWriteMask {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencilop_desc">D3D12_DEPTH_STENCILOP_DESC</a> structure that describes how to use the results of the depth test and the stencil test for pixels whose surface normal is facing towards the camera.
     * @type {D3D12_DEPTH_STENCILOP_DESC}
     */
    FrontFace{
        get {
            if(!this.HasProp("__FrontFace"))
                this.__FrontFace := D3D12_DEPTH_STENCILOP_DESC(this.ptr + 24)
            return this.__FrontFace
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencilop_desc">D3D12_DEPTH_STENCILOP_DESC</a> structure that describes how to use the results of the depth test and the stencil test for pixels whose surface normal is facing away from the camera.
     * @type {D3D12_DEPTH_STENCILOP_DESC}
     */
    BackFace{
        get {
            if(!this.HasProp("__BackFace"))
                this.__BackFace := D3D12_DEPTH_STENCILOP_DESC(this.ptr + 40)
            return this.__BackFace
        }
    }

    /**
     * TRUE to enable depth-bounds testing; otherwise, FALSE. The default value is FALSE.
     * @type {BOOL}
     */
    DepthBoundsTestEnable{
        get {
            if(!this.HasProp("__DepthBoundsTestEnable"))
                this.__DepthBoundsTestEnable := BOOL(this.ptr + 56)
            return this.__DepthBoundsTestEnable
        }
    }
}
