#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the rasterizer state.
 * @remarks
 * Rasterizer state defines the behavior of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-rasterizer-stage">rasterizer stage</a>. To create a rasterizer-state object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createrasterizerstate">ID3D10Device::CreateRasterizerState</a>. To set rasterizer state, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-rssetstate">ID3D10Device::RSSetState</a>.
 * 
 * <div class="alert"><b>Note</b>  For <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> 9.1, 9.2, 9.3, and 10.0, if you set <b>MultisampleEnable</b> to <b>FALSE</b>, the runtime renders all points, lines, and triangles without anti-aliasing even for render targets with a sample count greater than 1. For feature level 10.1, the setting of <b>MultisampleEnable</b> has no effect on points and triangles with regard to MSAA and impacts only the selection of the line-rendering algorithm as shown in this table:</div>
 * <div> </div>
 * 
 * <table>
 * <tr>
 * <th>Line-rendering algorithm</th>
 * <th><b>MultisampleEnable</b></th>
 * <th><b>AntialiasedLineEnable</b></th>
 * </tr>
 * <tr>
 * <td>Aliased</td>
 * <td><b>FALSE</b></td>
 * <td><b>FALSE</b></td>
 * </tr>
 * <tr>
 * <td>Alpha antialiased</td>
 * <td><b>FALSE</b></td>
 * <td><b>TRUE</b></td>
 * </tr>
 * <tr>
 * <td>Quadrilateral</td>
 * <td><b>TRUE</b></td>
 * <td><b>FALSE</b></td>
 * </tr>
 * <tr>
 * <td>Quadrilateral</td>
 * <td><b>TRUE</b></td>
 * <td><b>TRUE</b></td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * The settings of the <b>MultisampleEnable</b> and <b>AntialiasedLineEnable</b> members apply only to multisample antialiasing (MSAA) render targets (that is, render targets with sample counts greater than 1). Because of the differences in <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature-level</a> behavior and as long as you aren’t performing any line drawing or don’t mind that lines render as quadrilaterals, we recommend that you always set <b>MultisampleEnable</b> to <b>TRUE</b> whenever you render on MSAA render targets.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_rasterizer_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_RASTERIZER_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_fill_mode">D3D10_FILL_MODE</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_fill_mode">D3D10_FILL_MODE</a> enumerated type that determines the fill mode to use when rendering.  The default value is <b>D3D10_FILL_SOLID</b>.
     * @type {Integer}
     */
    FillMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_cull_mode">D3D10_CULL_MODE</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_cull_mode">D3D10_CULL_MODE</a> enumerated type that indicates whether triangles facing the specified direction are drawn.  The default value is <b>D3D10_CULL_BACK</b>.
     * @type {Integer}
     */
    CullMode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Determines if a triangle is front-facing or back-facing. If this parameter is <b>TRUE</b>, then a triangle is considered front-facing if its vertices are counter-clockwise on the render target, and considered back-facing if they are clockwise. If this parameter is <b>FALSE</b>, then the opposite is true.  The default value is <b>FALSE</b>.
     * @type {BOOL}
     */
    FrontCounterClockwise {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Specifies the depth value added to a given pixel. The default value is 0. For info about depth bias, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage-depth-bias">Depth Bias</a>.
     * @type {Integer}
     */
    DepthBias {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Specifies the maximum depth bias of a pixel. The default value is 0.0f. For info about depth bias, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage-depth-bias">Depth Bias</a>.
     * @type {Float}
     */
    DepthBiasClamp {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Specifies a scalar on a given pixel's slope. The default value is 0.0f. For info about depth bias, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage-depth-bias">Depth Bias</a>.
     * @type {Float}
     */
    SlopeScaledDepthBias {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enables or disables clipping based on distance.  The default value is <b>TRUE</b>.
     * 
     * The hardware always performs x and y clipping of rasterized coordinates. When <b>DepthClipEnable</b> is set to the default value, the hardware also clips the z value (that is, the hardware performs the last step of the following algorithm).
     * 
     * 
     * 
     * ``` syntax
     * 
     * 0 &lt; w
     * -w &lt;= x &lt;= w (or arbitrarily wider range if implementation uses a guard band to reduce clipping burden)
     * -w &lt;= y &lt;= w (or arbitrarily wider range if implementation uses a guard band to reduce clipping burden)
     * 0 &lt;= z &lt;= w
     * 
     * ```
     * 
     * When you set <b>DepthClipEnable</b> to FALSE, the hardware skips the z clipping (that is, the last step in the preceding algorithm). However, the hardware still performs the "0 &lt; w" clipping. When z clipping is disabled, improper depth ordering at the pixel level might result. However, when z clipping is disabled, stencil shadow implementations are simplified. In other words, you can avoid complex special-case handling for geometry that goes beyond the back clipping plane.
     * @type {BOOL}
     */
    DepthClipEnable {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Enable or disables scissor-rectangle culling. All pixels outside an active scissor rectangle are culled. The default value is <b>FALSE</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-rasterizer-stage-getting-started">Set the Scissor Rectangle</a>.
     * @type {BOOL}
     */
    ScissorEnable {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Specifies whether to use the quadrilateral or alpha line anti-aliasing algorithm on multisample antialiasing (MSAA) render targets. The default value is <b>FALSE</b>. Set to <b>TRUE</b> to use the quadrilateral line anti-aliasing algorithm and to <b>FALSE</b> to use the alpha line anti-aliasing algorithm. For more info about this member, see Remarks.
     * @type {BOOL}
     */
    MultisampleEnable {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Specifies whether to enable line antialiasing; only applies when alpha blending is enabled, you are drawing lines, and the <b>MultisampleEnable</b> member is <b>FALSE</b>.  The default value is <b>FALSE</b>. For more info about this member, see Remarks.
     * @type {BOOL}
     */
    AntialiasedLineEnable {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
