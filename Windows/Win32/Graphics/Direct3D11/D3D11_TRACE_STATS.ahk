#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_PIXEL_SHADER_TRACE_DESC.ahk
#Include .\D3D11_COMPUTE_SHADER_TRACE_DESC.ahk
#Include .\D3D11_SHADER_TRACE_DESC.ahk

/**
 * Specifies statistics about a trace.
 * @remarks
 * This API requires the Windows Software Development Kit (SDK) for Windows 8.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_stats
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TRACE_STATS extends Win32Struct
{
    static sizeof => 8592

    static packingSize => 8

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_shader_trace_desc">D3D11_SHADER_TRACE_DESC</a> structure that describes the shader trace object for which this structure specifies statistics.
     * @type {D3D11_SHADER_TRACE_DESC}
     */
    TraceDesc{
        get {
            if(!this.HasProp("__TraceDesc"))
                this.__TraceDesc := D3D11_SHADER_TRACE_DESC(this.ptr + 0)
            return this.__TraceDesc
        }
    }

    /**
     * The number of calls in the stamp for the trace. This value is always 1 for vertex shaders, hull shaders, domain shaders, geometry shaders, and compute shaders. This value is 4 for pixel shaders.
     * @type {Integer}
     */
    NumInvocationsInStamp {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * The index of the target stamp. This value is always 0 for vertex shaders, hull shaders, domain shaders, geometry shaders, and compute shaders. However, for pixel shaders this value indicates which of the four pixels in the stamp is the target for the trace.  You can examine the traces for other pixels in the stamp to determine how derivative calculations occurred. You can make this determination by correlating the registers across traces.
     * @type {Integer}
     */
    TargetStampIndex {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * The total number of steps for the trace. This number is the same for all stamp calls.
     * @type {Integer}
     */
    NumTraceSteps {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The component trace mask for each input v# register. For information about D3D11_TRACE_COMPONENT_MASK, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_value">D3D11_TRACE_VALUE</a>.
     * 
     * For vertex shaders, geometry shaders, pixel shaders, hull shaders, and domain shaders, the valid range is [0..31]. For compute shaders, this member is not applicable. Also, inputs for geometry shaders are 2D-indexed. For example, consider v[vertex][attribute]. In this example, the range of [attribute] is [0..31]. The [vertex] axis is the same size for all inputs, which are determined by the <b>GSInputPrimitive</b> member.
     * 
     * Similarly, inputs for hull shader and domain shader are 2D-indexed. For example, consider v[vertex][attribute]. In this example, the range of [attribute] is [0..15]. The [vertex] axis is the same size for all inputs.
     * @type {Array<Byte>}
     */
    InputMask{
        get {
            if(!this.HasProp("__InputMaskProxyArray"))
                this.__InputMaskProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__InputMaskProxyArray
        }
    }

    /**
     * The component trace mask for each output o# register. For information about D3D11_TRACE_COMPONENT_MASK, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_value">D3D11_TRACE_VALUE</a>.
     * 
     * For vertex shaders and geometry shaders, the valid range is [0..31]. For pixel shaders, the valid range is [0..7]. For compute shaders, this member is not applicable. For output control points for hull shaders, the registers are 2D-indexed. For example, consider ocp[vertex][attribute]. In this example, the range of [attribute] is [0..31]. The [vertex] axis is the same size for all inputs.
     * @type {Array<Byte>}
     */
    OutputMask{
        get {
            if(!this.HasProp("__OutputMaskProxyArray"))
                this.__OutputMaskProxyArray := Win32FixedArray(this.ptr + 56, 1, Primitive, "char")
            return this.__OutputMaskProxyArray
        }
    }

    /**
     * The number of temps, that is, 4x32 bit r# registers that are declared.
     * @type {Integer}
     */
    NumTemps {
        get => NumGet(this, 88, "ushort")
        set => NumPut("ushort", value, this, 88)
    }

    /**
     * The maximum index #+1 of all indexable temps x#[] that are declared. If they are declared sparsely (for example, x3[12] and x200[30] only), this value is 201 (200+1).
     * @type {Integer}
     */
    MaxIndexableTempIndex {
        get => NumGet(this, 90, "ushort")
        set => NumPut("ushort", value, this, 90)
    }

    /**
     * The number of temps for each indexable temp x#[numTemps]. You can only have temps up to the value in the <b>MaxIndexableTempIndex</b> member.
     * @type {Array<UInt16>}
     */
    IndexableTempSize{
        get {
            if(!this.HasProp("__IndexableTempSizeProxyArray"))
                this.__IndexableTempSizeProxyArray := Win32FixedArray(this.ptr + 92, 2, Primitive, "ushort")
            return this.__IndexableTempSizeProxyArray
        }
    }

    /**
     * The number of 4x32 bit values (if any) that are in the immediate constant buffer.
     * @type {Integer}
     */
    ImmediateConstantBufferSize {
        get => NumGet(this, 8284, "ushort")
        set => NumPut("ushort", value, this, 8284)
    }

    /**
     * @type {Array<UInt32>}
     */
    PixelPosition{
        get {
            if(!this.HasProp("__PixelPositionProxyArray"))
                this.__PixelPositionProxyArray := Win32FixedArray(this.ptr + 8288, 4, Primitive, "uint")
            return this.__PixelPositionProxyArray
        }
    }

    /**
     * <div class="alert"><b>Note</b>  This member is for pixel shaders only, [stampIndex].</div>
     * <div> </div>
     * A mask that indicates which MSAA samples are covered for each stamp. This coverage occurs before alpha-to-coverage, depth, and stencil operations are performed on the pixel. For non-MSAA, examine the least significant bit (LSB). This mask can be 0 for pixels that are only executed to support derivatives for neighboring pixels.
     * @type {Array<UInt64>}
     */
    PixelCoverageMask{
        get {
            if(!this.HasProp("__PixelCoverageMaskProxyArray"))
                this.__PixelCoverageMaskProxyArray := Win32FixedArray(this.ptr + 8320, 8, Primitive, "uint")
            return this.__PixelCoverageMaskProxyArray
        }
    }

    /**
     * <div class="alert"><b>Note</b>  This member is for pixel shaders only, [stampIndex].</div>
     * <div> </div>
     * A mask that indicates discarded samples.  If the pixel shader runs at pixel-frequency, "discard" turns off all the samples. 	If all the samples are off, the following four mask members are also 0.
     * @type {Array<UInt64>}
     */
    PixelDiscardedMask{
        get {
            if(!this.HasProp("__PixelDiscardedMaskProxyArray"))
                this.__PixelDiscardedMaskProxyArray := Win32FixedArray(this.ptr + 8352, 8, Primitive, "uint")
            return this.__PixelDiscardedMaskProxyArray
        }
    }

    /**
     * <div class="alert"><b>Note</b>  This member is for pixel shaders only, [stampIndex].</div>
     * <div> </div>
     * A mask that indicates the MSAA samples that are covered. For non-MSAA, examine the LSB.
     * @type {Array<UInt64>}
     */
    PixelCoverageMaskAfterShader{
        get {
            if(!this.HasProp("__PixelCoverageMaskAfterShaderProxyArray"))
                this.__PixelCoverageMaskAfterShaderProxyArray := Win32FixedArray(this.ptr + 8384, 8, Primitive, "uint")
            return this.__PixelCoverageMaskAfterShaderProxyArray
        }
    }

    /**
     * <div class="alert"><b>Note</b>  This member is for pixel shaders only, [stampIndex].</div>
     * <div> </div>
     * A mask that indicates the MSAA samples that are covered after alpha-to-coverage+sampleMask, but before depth and stencil. For non-MSAA, examine the LSB.
     * @type {Array<UInt64>}
     */
    PixelCoverageMaskAfterA2CSampleMask{
        get {
            if(!this.HasProp("__PixelCoverageMaskAfterA2CSampleMaskProxyArray"))
                this.__PixelCoverageMaskAfterA2CSampleMaskProxyArray := Win32FixedArray(this.ptr + 8416, 8, Primitive, "uint")
            return this.__PixelCoverageMaskAfterA2CSampleMaskProxyArray
        }
    }

    /**
     * <div class="alert"><b>Note</b>  This member is for pixel shaders only, [stampIndex].</div>
     * <div> </div>
     * A mask that indicates the MSAA samples that are covered after alpha-to-coverage+sampleMask+depth, but before stencil. For non-MSAA, examine the LSB.
     * @type {Array<UInt64>}
     */
    PixelCoverageMaskAfterA2CSampleMaskDepth{
        get {
            if(!this.HasProp("__PixelCoverageMaskAfterA2CSampleMaskDepthProxyArray"))
                this.__PixelCoverageMaskAfterA2CSampleMaskDepthProxyArray := Win32FixedArray(this.ptr + 8448, 8, Primitive, "uint")
            return this.__PixelCoverageMaskAfterA2CSampleMaskDepthProxyArray
        }
    }

    /**
     * <div class="alert"><b>Note</b>  This member is for pixel shaders only, [stampIndex].</div>
     * <div> </div>
     * A mask that indicates the MSAA samples that are covered after alpha-to-coverage+sampleMask+depth+stencil. For non-MSAA, examine the LSB.
     * @type {Array<UInt64>}
     */
    PixelCoverageMaskAfterA2CSampleMaskDepthStencil{
        get {
            if(!this.HasProp("__PixelCoverageMaskAfterA2CSampleMaskDepthStencilProxyArray"))
                this.__PixelCoverageMaskAfterA2CSampleMaskDepthStencilProxyArray := Win32FixedArray(this.ptr + 8480, 8, Primitive, "uint")
            return this.__PixelCoverageMaskAfterA2CSampleMaskDepthStencilProxyArray
        }
    }

    /**
     * A value that specifies whether this trace is for a pixel shader that outputs the oDepth register. TRUE indicates that the pixel shader outputs the oDepth register; otherwise, FALSE.
     * @type {Integer}
     */
    PSOutputsDepth {
        get => NumGet(this, 8512, "int")
        set => NumPut("int", value, this, 8512)
    }

    /**
     * A value that specifies whether this trace is for a pixel shader that outputs the oMask register. TRUE indicates that the pixel shader outputs the oMask register; otherwise, FALSE.
     * @type {Integer}
     */
    PSOutputsMask {
        get => NumGet(this, 8516, "int")
        set => NumPut("int", value, this, 8516)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_trace_gs_input_primitive">D3D11_TRACE_GS_INPUT_PRIMITIVE</a>-typed value that identifies the type of geometry shader input primitive. That is, this value identifies:  {point, line, triangle, line_adj, triangle_adj} or the number of vertices: 1, 2, 3, 4, or 6 respectively. For example, for a line, input v[][#] is actually v[2][#]. For vertex shaders and pixel shaders, set this member to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_trace_gs_input_primitive">D3D11_TRACE_GS_INPUT_PRIMITIVE_UNDEFINED</a>.
     * @type {Integer}
     */
    GSInputPrimitive {
        get => NumGet(this, 8520, "int")
        set => NumPut("int", value, this, 8520)
    }

    /**
     * A value that specifies whether this trace is for a geometry shader that inputs the PrimitiveID register. TRUE indicates that the geometry shader inputs the PrimitiveID register; otherwise, FALSE.
     * @type {Integer}
     */
    GSInputsPrimitiveID {
        get => NumGet(this, 8524, "int")
        set => NumPut("int", value, this, 8524)
    }

    /**
     * <div class="alert"><b>Note</b>  This member is for hull shaders only.</div>
     * <div> </div>
     * The component trace mask for the hull-shader output. For information about D3D11_TRACE_COMPONENT_MASK, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_value">D3D11_TRACE_VALUE</a>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_trace_register_type">D3D11_TRACE_INPUT_PRIMITIVE_ID_REGISTER</a> value is available through a call to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-getinitialregistercontents">ID3D11ShaderTrace::GetInitialRegisterContents</a> method.
     * @type {Array<Byte>}
     */
    HSOutputPatchConstantMask{
        get {
            if(!this.HasProp("__HSOutputPatchConstantMaskProxyArray"))
                this.__HSOutputPatchConstantMaskProxyArray := Win32FixedArray(this.ptr + 8528, 1, Primitive, "char")
            return this.__HSOutputPatchConstantMaskProxyArray
        }
    }

    /**
     * <div class="alert"><b>Note</b>  This member is for domain shaders only.</div>
     * <div> </div>
     * The component trace mask for the domain-shader input. For information about D3D11_TRACE_COMPONENT_MASK, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_value">D3D11_TRACE_VALUE</a>.
     * 
     * The following values are available through a call to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertrace-getinitialregistercontents">ID3D11ShaderTrace::GetInitialRegisterContents</a> method:
     * 
     * <ul>
     * <li><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_trace_register_type">D3D11_TRACE_INPUT_PRIMITIVE_ID_REGISTER</a></li>
     * <li><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_trace_register_type">D3D11_TRACE_INPUT_DOMAIN_POINT_REGISTER</a></li>
     * </ul>
     * @type {Array<Byte>}
     */
    DSInputPatchConstantMask{
        get {
            if(!this.HasProp("__DSInputPatchConstantMaskProxyArray"))
                this.__DSInputPatchConstantMaskProxyArray := Win32FixedArray(this.ptr + 8560, 1, Primitive, "char")
            return this.__DSInputPatchConstantMaskProxyArray
        }
    }
}
