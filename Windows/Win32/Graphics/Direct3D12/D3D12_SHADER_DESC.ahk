#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Describes a shader. (D3D12_SHADER_DESC)
 * @remarks
 * A shader is written in HLSL and compiled into an intermediate language by the HLSL compiler.
  *         The shader description returns information about the compiled shader.
  *         To get a shader description, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getdesc">ID3D12ShaderReflection::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_DESC extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

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
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The name of the originator of the shader.
     * @type {PSTR}
     */
    Creator{
        get {
            if(!this.HasProp("__Creator"))
                this.__Creator := PSTR(this.ptr + 8)
            return this.__Creator
        }
    }

    /**
     * Shader compilation/parse flags.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of shader-constant buffers.
     * @type {Integer}
     */
    ConstantBuffers {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of resource (textures and buffers) bound to a shader.
     * @type {Integer}
     */
    BoundResources {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of parameters in the input signature.
     * @type {Integer}
     */
    InputParameters {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The number of parameters in the output signature.
     * @type {Integer}
     */
    OutputParameters {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of intermediate-language instructions in the compiled shader.
     * @type {Integer}
     */
    InstructionCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The number of temporary registers in the compiled shader.
     * @type {Integer}
     */
    TempRegisterCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Number of temporary arrays used.
     * @type {Integer}
     */
    TempArrayCount {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Number of constant defines.
     * @type {Integer}
     */
    DefCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Number of declarations (input + output).
     * @type {Integer}
     */
    DclCount {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Number of non-categorized texture instructions.
     * @type {Integer}
     */
    TextureNormalInstructions {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Number of texture load instructions
     * @type {Integer}
     */
    TextureLoadInstructions {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Number of texture comparison instructions
     * @type {Integer}
     */
    TextureCompInstructions {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Number of texture bias instructions
     * @type {Integer}
     */
    TextureBiasInstructions {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Number of texture gradient instructions.
     * @type {Integer}
     */
    TextureGradientInstructions {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Number of floating point arithmetic instructions used.
     * @type {Integer}
     */
    FloatInstructionCount {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Number of signed integer arithmetic instructions used.
     * @type {Integer}
     */
    IntInstructionCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Number of unsigned integer arithmetic instructions used.
     * @type {Integer}
     */
    UintInstructionCount {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Number of static flow control instructions used.
     * @type {Integer}
     */
    StaticFlowControlCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Number of dynamic flow control instructions used.
     * @type {Integer}
     */
    DynamicFlowControlCount {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Number of macro instructions used.
     * @type {Integer}
     */
    MacroInstructionCount {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Number of array instructions used.
     * @type {Integer}
     */
    ArrayInstructionCount {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Number of cut instructions used.
     * @type {Integer}
     */
    CutInstructionCount {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Number of emit instructions used.
     * @type {Integer}
     */
    EmitInstructionCount {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology">D3D_PRIMITIVE_TOPOLOGY</a>-typed value that represents the geometry shader output topology.
     * @type {Integer}
     */
    GSOutputTopology {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Geometry shader maximum output vertex count.
     * @type {Integer}
     */
    GSMaxOutputVertexCount {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive">D3D_PRIMITIVE</a>-typed value that represents the input primitive for a  geometry shader or hull shader.
     * @type {Integer}
     */
    InputPrimitive {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * Number of parameters in the patch-constant signature.
     * @type {Integer}
     */
    PatchConstantParameters {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Number of geometry shader instances.
     * @type {Integer}
     */
    cGSInstanceCount {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Number of control points in the hull shader and domain shader.
     * @type {Integer}
     */
    cControlPoints {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_tessellator_output_primitive">D3D_TESSELLATOR_OUTPUT_PRIMITIVE</a>-typed value that represents the tessellator output-primitive type.
     * @type {Integer}
     */
    HSOutputPrimitive {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_tessellator_partitioning">D3D_TESSELLATOR_PARTITIONING</a>-typed value that represents the tessellator partitioning mode.
     * @type {Integer}
     */
    HSPartitioning {
        get => NumGet(this, 140, "int")
        set => NumPut("int", value, this, 140)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_tessellator_domain">D3D_TESSELLATOR_DOMAIN</a>-typed value that represents the tessellator domain.
     * @type {Integer}
     */
    TessellatorDomain {
        get => NumGet(this, 144, "int")
        set => NumPut("int", value, this, 144)
    }

    /**
     * Number of barrier instructions in a compute shader.
     * @type {Integer}
     */
    cBarrierInstructions {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Number of interlocked instructions in a compute shader.
     * @type {Integer}
     */
    cInterlockedInstructions {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * Number of texture writes in a compute shader.
     * @type {Integer}
     */
    cTextureStoreInstructions {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }
}
