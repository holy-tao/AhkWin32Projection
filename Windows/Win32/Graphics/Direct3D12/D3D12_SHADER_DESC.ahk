#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_TESSELLATOR_PARTITIONING.ahk" { D3D_TESSELLATOR_PARTITIONING }
#Import "..\Direct3D\D3D_TESSELLATOR_DOMAIN.ahk" { D3D_TESSELLATOR_DOMAIN }
#Import "..\Direct3D\D3D_PRIMITIVE_TOPOLOGY.ahk" { D3D_PRIMITIVE_TOPOLOGY }
#Import "..\Direct3D\D3D_TESSELLATOR_OUTPUT_PRIMITIVE.ahk" { D3D_TESSELLATOR_OUTPUT_PRIMITIVE }
#Import "..\Direct3D\D3D_PRIMITIVE.ahk" { D3D_PRIMITIVE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a shader. (D3D12_SHADER_DESC)
 * @remarks
 * A shader is written in HLSL and compiled into an intermediate language by the HLSL compiler.
 *         The shader description returns information about the compiled shader.
 *         To get a shader description, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getdesc">ID3D12ShaderReflection::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SHADER_DESC {
    #StructPack 8

    /**
     * The Shader version, as an encoded UINT that corresponds to a shader model, such as "ps_5_0".
     *             <b>Version</b> describes the program type, a major version number, and a minor version number.
     *             The program type is a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ne-d3d12shader-d3d12_shader_version_type">D3D12_SHADER_VERSION_TYPE</a> enumeration constant.
     *             <b>Version</b> is decoded in the following way:
     *             
     * 
     * <ul>
     * <li>Program type = (Version &amp; 0xFFFF0000) &gt;&gt; 16</li>
     * <li>Major version = (Version &amp; 0x000000F0) &gt;&gt; 4</li>
     * <li>Minor version = (Version &amp; 0x0000000F)</li>
     * </ul>
     */
    Version : UInt32

    /**
     * The name of the originator of the shader.
     */
    Creator : PSTR

    /**
     * Shader compilation/parse flags.
     */
    Flags : UInt32

    /**
     * The number of shader-constant buffers.
     */
    ConstantBuffers : UInt32

    /**
     * The number of resource (textures and buffers) bound to a shader.
     */
    BoundResources : UInt32

    /**
     * The number of parameters in the input signature.
     */
    InputParameters : UInt32

    /**
     * The number of parameters in the output signature.
     */
    OutputParameters : UInt32

    /**
     * The number of intermediate-language instructions in the compiled shader.
     */
    InstructionCount : UInt32

    /**
     * The number of temporary registers in the compiled shader.
     */
    TempRegisterCount : UInt32

    /**
     * Number of temporary arrays used.
     */
    TempArrayCount : UInt32

    /**
     * Number of constant defines.
     */
    DefCount : UInt32

    /**
     * Number of declarations (input + output).
     */
    DclCount : UInt32

    /**
     * Number of non-categorized texture instructions.
     */
    TextureNormalInstructions : UInt32

    /**
     * Number of texture load instructions
     */
    TextureLoadInstructions : UInt32

    /**
     * Number of texture comparison instructions
     */
    TextureCompInstructions : UInt32

    /**
     * Number of texture bias instructions
     */
    TextureBiasInstructions : UInt32

    /**
     * Number of texture gradient instructions.
     */
    TextureGradientInstructions : UInt32

    /**
     * Number of floating point arithmetic instructions used.
     */
    FloatInstructionCount : UInt32

    /**
     * Number of signed integer arithmetic instructions used.
     */
    IntInstructionCount : UInt32

    /**
     * Number of unsigned integer arithmetic instructions used.
     */
    UintInstructionCount : UInt32

    /**
     * Number of static flow control instructions used.
     */
    StaticFlowControlCount : UInt32

    /**
     * Number of dynamic flow control instructions used.
     */
    DynamicFlowControlCount : UInt32

    /**
     * Number of macro instructions used.
     */
    MacroInstructionCount : UInt32

    /**
     * Number of array instructions used.
     */
    ArrayInstructionCount : UInt32

    /**
     * Number of cut instructions used.
     */
    CutInstructionCount : UInt32

    /**
     * Number of emit instructions used.
     */
    EmitInstructionCount : UInt32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology">D3D_PRIMITIVE_TOPOLOGY</a>-typed value that represents the geometry shader output topology.
     */
    GSOutputTopology : D3D_PRIMITIVE_TOPOLOGY

    /**
     * Geometry shader maximum output vertex count.
     */
    GSMaxOutputVertexCount : UInt32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive">D3D_PRIMITIVE</a>-typed value that represents the input primitive for a  geometry shader or hull shader.
     */
    InputPrimitive : D3D_PRIMITIVE

    /**
     * Number of parameters in the patch-constant signature.
     */
    PatchConstantParameters : UInt32

    /**
     * Number of geometry shader instances.
     */
    cGSInstanceCount : UInt32

    /**
     * Number of control points in the hull shader and domain shader.
     */
    cControlPoints : UInt32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_tessellator_output_primitive">D3D_TESSELLATOR_OUTPUT_PRIMITIVE</a>-typed value that represents the tessellator output-primitive type.
     */
    HSOutputPrimitive : D3D_TESSELLATOR_OUTPUT_PRIMITIVE

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_tessellator_partitioning">D3D_TESSELLATOR_PARTITIONING</a>-typed value that represents the tessellator partitioning mode.
     */
    HSPartitioning : D3D_TESSELLATOR_PARTITIONING

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_tessellator_domain">D3D_TESSELLATOR_DOMAIN</a>-typed value that represents the tessellator domain.
     */
    TessellatorDomain : D3D_TESSELLATOR_DOMAIN

    /**
     * Number of barrier instructions in a compute shader.
     */
    cBarrierInstructions : UInt32

    /**
     * Number of interlocked instructions in a compute shader.
     */
    cInterlockedInstructions : UInt32

    /**
     * Number of texture writes in a compute shader.
     */
    cTextureStoreInstructions : UInt32

}
