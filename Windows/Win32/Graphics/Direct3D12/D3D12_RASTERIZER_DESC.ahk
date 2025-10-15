#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Describes rasterizer state.
 * @remarks
 * 
  * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> contains a rasterizer-state structure.
  *       
  * 
  * Rasterizer state defines the behavior of the rasterizer stage.
  *         
  * 
  * If you do not specify some rasterizer state,  the Direct3D runtime uses the following default values for rasterizer state.
  *         
  * 
  * <table>
  * <tr>
  * <th>State</th>
  * <th>Default Value</th>
  * </tr>
  * <tr>
  * <td><b>FillMode</b></td>
  * <td>D3D12_FILL_MODE_SOLID</td>
  * </tr>
  * <tr>
  * <td><b>CullMode</b></td>
  * <td>D3D12_CULL_MODE_BACK</td>
  * </tr>
  * <tr>
  * <td><b>FrontCounterClockwise</b></td>
  * <td><b>FALSE</b></td>
  * </tr>
  * <tr>
  * <td><b>DepthBias</b></td>
  * <td>0</td>
  * </tr>
  * <tr>
  * <td><b>DepthBiasClamp</b></td>
  * <td>0.0f</td>
  * </tr>
  * <tr>
  * <td><b>SlopeScaledDepthBias</b></td>
  * <td>0.0f</td>
  * </tr>
  * <tr>
  * <td><b>DepthClipEnable</b></td>
  * <td><b>TRUE</b></td>
  * </tr>
  * <tr>
  * <td><b>MultisampleEnable</b></td>
  * <td><b>FALSE</b></td>
  * </tr>
  * <tr>
  * <td><b>AntialiasedLineEnable</b></td>
  * <td><b>FALSE</b></td>
  * </tr>
  * <tr>
  * <td><b>ForcedSampleCount</b></td>
  * <td>0</td>
  * </tr>
  * <tr>
  * <td><b>ConservativeRaster</b></td>
  * <td><b>D3D12_CONSERVATIVE_RASTERIZATION_MODE_OFF</b></td>
  * </tr>
  * </table>
  *  
  * <div class="alert"><b>Note</b>  For <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> 9.1, 9.2, 9.3, and 10.0, if you set <b>MultisampleEnable</b> to <b>FALSE</b>, the runtime renders all points, lines, and triangles without anti-aliasing even for render targets with a sample count greater than 1. For feature levels 10.1 and higher, the setting of <b>MultisampleEnable</b> has no effect on points and triangles with regard to MSAA and impacts only the selection of the line-rendering algorithm as shown in this table:</div>
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
  * The settings of the <b>MultisampleEnable</b> and <b>AntialiasedLineEnable</b> members apply only to multisample antialiasing (MSAA) render targets (that is, render targets with sample counts greater than 1). Because of the differences in <a href="https://docs.microsoft.com/windows/win32/direct3d12/hardware-feature-levels">feature-level</a> behavior and as long as you aren’t performing any line drawing or don’t mind that lines render as quadrilaterals, we recommend that you always set <b>MultisampleEnable</b> to <b>TRUE</b> whenever you render on MSAA render targets.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_rasterizer_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RASTERIZER_DESC extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_fill_mode">D3D12_FILL_MODE</a>-typed value that specifies the fill mode to use when rendering.
     * @type {Integer}
     */
    FillMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_cull_mode">D3D12_CULL_MODE</a>-typed value that specifies that triangles facing the specified direction are not drawn.
     * @type {Integer}
     */
    CullMode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Determines if a triangle is front- or back-facing. If this member is <b>TRUE</b>, a triangle will be considered front-facing if its vertices are counter-clockwise on the render target and considered back-facing if they are clockwise. If this parameter is <b>FALSE</b>, the opposite is true.
     * @type {BOOL}
     */
    FrontCounterClockwise{
        get {
            if(!this.HasProp("__FrontCounterClockwise"))
                this.__FrontCounterClockwise := BOOL(this.ptr + 8)
            return this.__FrontCounterClockwise
        }
    }

    /**
     * Depth value added to a given pixel. For info about depth bias, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage-depth-bias">Depth Bias</a>.
     * @type {Integer}
     */
    DepthBias {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Maximum depth bias of a pixel. For info about depth bias, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage-depth-bias">Depth Bias</a>.
     * @type {Float}
     */
    DepthBiasClamp {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Scalar on a given pixel's slope. For info about depth bias, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage-depth-bias">Depth Bias</a>.
     * @type {Float}
     */
    SlopeScaledDepthBias {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * Specifies whether to enable clipping based on distance.
     *             
     * 
     * The hardware always performs x and y clipping of rasterized coordinates. When <b>DepthClipEnable</b> is set to the default–<b>TRUE</b>, the hardware also clips the z value (that is, the hardware performs the last step of the following algorithm).
     *             
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * 0 &lt; w
     * -w &lt;= x &lt;= w (or arbitrarily wider range if implementation uses a guard band to reduce clipping burden)
     * -w &lt;= y &lt;= w (or arbitrarily wider range if implementation uses a guard band to reduce clipping burden)
     * 0 &lt;= z &lt;= w
     * </code></pre>
     * When you set <b>DepthClipEnable</b> to <b>FALSE</b>, the hardware skips the z clipping (that is, the last step in the preceding algorithm). However, the hardware still performs the "0 &lt; w" clipping. When z clipping is disabled, improper depth ordering at the pixel level might result. However, when z clipping is disabled, stencil shadow implementations are simplified. In other words, you can avoid complex special-case handling for geometry that goes beyond the back clipping plane.
     * @type {BOOL}
     */
    DepthClipEnable{
        get {
            if(!this.HasProp("__DepthClipEnable"))
                this.__DepthClipEnable := BOOL(this.ptr + 24)
            return this.__DepthClipEnable
        }
    }

    /**
     * Specifies whether to use the quadrilateral or alpha line anti-aliasing algorithm on multisample antialiasing (MSAA) render targets. Set to <b>TRUE</b> to use the quadrilateral line anti-aliasing algorithm and to <b>FALSE</b> to use the alpha line anti-aliasing algorithm. For more info about this member, see Remarks.
     * @type {BOOL}
     */
    MultisampleEnable{
        get {
            if(!this.HasProp("__MultisampleEnable"))
                this.__MultisampleEnable := BOOL(this.ptr + 28)
            return this.__MultisampleEnable
        }
    }

    /**
     * Specifies whether to enable line antialiasing; only applies if doing line drawing and <b>MultisampleEnable</b> is <b>FALSE</b>. For more info about this member, see Remarks.
     * @type {BOOL}
     */
    AntialiasedLineEnable{
        get {
            if(!this.HasProp("__AntialiasedLineEnable"))
                this.__AntialiasedLineEnable := BOOL(this.ptr + 32)
            return this.__AntialiasedLineEnable
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The sample count that is forced while UAV rendering or rasterizing. Valid values are 0, 1, 2, 4, 8, and optionally 16. 0 indicates that the sample count is not forced.
     * 
     * <div class="alert"><b>Note</b>  If you want to render with <b>ForcedSampleCount</b> set to 1 or greater, you must follow these guidelines: 
     * 
     * <ul>
     * <li>Don't bind depth-stencil views.</li>
     * <li>Disable depth testing.</li>
     * <li>Ensure the shader doesn't output depth.</li>
     * <li>If you have any render-target views bound (<a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_heap_type">D3D12_DESCRIPTOR_HEAP_TYPE_RTV</a>) and <b>ForcedSampleCount</b> is greater than 1, ensure that every render target has only a single sample.</li>
     * <li>Don't operate the shader at sample frequency. Therefore, <a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-issamplefrequencyshader">ID3D12ShaderReflection::IsSampleFrequencyShader</a> returns <b>FALSE</b>.</li>
     * </ul>Otherwise, rendering behavior is undefined.</div>
     * <div></div>
     * @type {Integer}
     */
    ForcedSampleCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_conservative_rasterization_mode">D3D12_CONSERVATIVE_RASTERIZATION_MODE</a>-typed value that identifies whether conservative rasterization is on or off.
     * @type {Integer}
     */
    ConservativeRaster {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
