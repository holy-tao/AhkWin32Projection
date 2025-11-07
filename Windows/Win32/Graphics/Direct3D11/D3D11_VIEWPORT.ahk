#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the dimensions of a viewport.
 * @remarks
 * 
 * In all cases, <b>Width</b> and <b>Height</b> must be &gt;= 0 and <b>TopLeftX</b> + <b>Width</b> and <b>TopLeftY</b> + <b>Height</b> must be &lt;= D3D11_VIEWPORT_BOUNDS_MAX.
 * 
 * <table>
 * <tr>
 * <td>
 * Viewport Sizes and Feature Level Support Differences between Direct3D 11 and Direct3D 10:
 * 
 * The range for the minimum and maximum viewport size is dependent on the feature level defined by <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>.
 * 
 * <ul>
 * <li>Direct3D 11 supports fractional viewports; the parameter types are  floating-point numbers. The feature level, D3D_FEATURE_LEVEL_11_0, supports (D3D11_VIEWPORT_BOUNDS_MIN, D3D11_VIEWPORT_BOUNDS_MAX) values between (-32768, 32,767).</li>
 * <li>Direct3D 10 does not support fractional viewports. The feature levels, D3D_FEATURE_LEVEL_10_1 (or below), supports (D3D10_VIEWPORT_BOUNDS_MIN, D3D10_VIEWPORT_BOUNDS_MAX) values between (-16384, 16383).</li>
 * </ul>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * <div class="alert"><b>Note</b>  Even though you specify float values to the members of the <b>D3D11_VIEWPORT</b> structure for the <i>pViewports</i> array in a call to  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-rssetviewports">ID3D11DeviceContext::RSSetViewports</a> for <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> 9_x, <b>RSSetViewports</b> uses DWORDs internally. Because of this behavior, when you use a negative top left corner for the viewport, the call to  <b>RSSetViewports</b> for feature levels 9_x fails. This failure occurs because <b>RSSetViewports</b> for 9_x casts the floating point values into unsigned integers without validation, which results in integer overflow. </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_viewport
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIEWPORT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * X position of the left hand side of the viewport. Ranges between D3D11_VIEWPORT_BOUNDS_MIN and D3D11_VIEWPORT_BOUNDS_MAX.
     * @type {Float}
     */
    TopLeftX {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Y position of the top of the viewport. Ranges between D3D11_VIEWPORT_BOUNDS_MIN and D3D11_VIEWPORT_BOUNDS_MAX.
     * @type {Float}
     */
    TopLeftY {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Width of the viewport.
     * @type {Float}
     */
    Width {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Height of the viewport.
     * @type {Float}
     */
    Height {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Minimum depth of the viewport. Ranges between 0 and 1.
     * @type {Float}
     */
    MinDepth {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Maximum depth of the viewport. Ranges between 0 and 1.
     * @type {Float}
     */
    MaxDepth {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
