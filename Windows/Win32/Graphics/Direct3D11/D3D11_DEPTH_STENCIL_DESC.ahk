#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_DEPTH_STENCILOP_DESC.ahk

/**
 * Describes depth-stencil state.
 * @remarks
 * 
  * Pass a pointer to <b>D3D11_DEPTH_STENCIL_DESC</b> to the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createdepthstencilstate">ID3D11Device::CreateDepthStencilState</a> method to create the depth-stencil state object.
  * 
  * Depth-stencil state controls how depth-stencil testing is performed by the output-merger stage.
  * 
  * The following table shows the default values of depth-stencil states.
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
  * <td>D3D11_DEPTH_WRITE_MASK_ALL</td>
  * </tr>
  * <tr>
  * <td>DepthFunc</td>
  * <td>D3D11_COMPARISON_LESS</td>
  * </tr>
  * <tr>
  * <td>StencilEnable</td>
  * <td>FALSE</td>
  * </tr>
  * <tr>
  * <td>StencilReadMask</td>
  * <td>D3D11_DEFAULT_STENCIL_READ_MASK</td>
  * </tr>
  * <tr>
  * <td>StencilWriteMask</td>
  * <td>D3D11_DEFAULT_STENCIL_WRITE_MASK</td>
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
  * <td>D3D11_COMPARISON_ALWAYS</td>
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
  * <td>D3D11_STENCIL_OP_KEEP</td>
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
  * <td>D3D11_STENCIL_OP_KEEP</td>
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
  * <td>D3D11_STENCIL_OP_KEEP</td>
  * </tr>
  * </table>
  *  
  * 
  * The formats that support stenciling are DXGI_FORMAT_D24_UNORM_S8_UINT and DXGI_FORMAT_D32_FLOAT_S8X24_UINT.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_depth_stencil_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_DEPTH_STENCIL_DESC extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enable depth testing.
     * @type {Integer}
     */
    DepthEnable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_depth_write_mask">D3D11_DEPTH_WRITE_MASK</a></b>
     * 
     * Identify a portion of the depth-stencil buffer that can be modified by depth data (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_depth_write_mask">D3D11_DEPTH_WRITE_MASK</a>).
     * @type {Integer}
     */
    DepthWriteMask {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_comparison_func">D3D11_COMPARISON_FUNC</a></b>
     * 
     * A function that compares depth data against existing depth data. The function options are listed in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_comparison_func">D3D11_COMPARISON_FUNC</a>.
     * @type {Integer}
     */
    DepthFunc {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enable stencil testing.
     * @type {Integer}
     */
    StencilEnable {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * Identify a portion of the depth-stencil buffer for reading stencil data.
     * @type {Integer}
     */
    StencilReadMask {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * Type: <b>UINT8</b>
     * 
     * Identify a portion of the depth-stencil buffer for writing stencil data.
     * @type {Integer}
     */
    StencilWriteMask {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencilop_desc">D3D11_DEPTH_STENCILOP_DESC</a></b>
     * 
     * Identify how to use the results of the depth test and the stencil test for pixels whose surface normal is facing towards the camera (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencilop_desc">D3D11_DEPTH_STENCILOP_DESC</a>).
     * @type {D3D11_DEPTH_STENCILOP_DESC}
     */
    FrontFace{
        get {
            if(!this.HasProp("__FrontFace"))
                this.__FrontFace := D3D11_DEPTH_STENCILOP_DESC(this.ptr + 24)
            return this.__FrontFace
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencilop_desc">D3D11_DEPTH_STENCILOP_DESC</a></b>
     * 
     * Identify how to use the results of the depth test and the stencil test for pixels whose surface normal is facing away from the camera (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencilop_desc">D3D11_DEPTH_STENCILOP_DESC</a>).
     * @type {D3D11_DEPTH_STENCILOP_DESC}
     */
    BackFace{
        get {
            if(!this.HasProp("__BackFace"))
                this.__BackFace := D3D11_DEPTH_STENCILOP_DESC(this.ptr + 40)
            return this.__BackFace
        }
    }
}
