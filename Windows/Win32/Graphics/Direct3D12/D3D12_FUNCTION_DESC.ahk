#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a function. (D3D12_FUNCTION_DESC)
 * @remarks
 * This structure is returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12functionreflection-getdesc">ID3D12FunctionReflection::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_function_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FUNCTION_DESC extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * The shader version.
     *             See also <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ne-d3d12shader-d3d12_shader_version_type">D3D12_SHADER_VERSION_TYPE</a>.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The name of the originator of the function.
     * @type {Pointer<Byte>}
     */
    Creator {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompile-constants">D3DCOMPILE Constants</a> that are combined by using a bitwise OR operation. The resulting value specifies shader compilation and parsing.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of constant buffers for the function.
     * @type {Integer}
     */
    ConstantBuffers {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of bound resources for the function.
     * @type {Integer}
     */
    BoundResources {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of emitted instructions for the function.
     * @type {Integer}
     */
    InstructionCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The number of temporary registers used by the function.
     * @type {Integer}
     */
    TempRegisterCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of temporary arrays used by the function.
     * @type {Integer}
     */
    TempArrayCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The number of constant defines for the function.
     * @type {Integer}
     */
    DefCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of declarations (input + output) for the function.
     * @type {Integer}
     */
    DclCount {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The number of non-categorized texture instructions for the function.
     * @type {Integer}
     */
    TextureNormalInstructions {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The number of texture load instructions for the function.
     * @type {Integer}
     */
    TextureLoadInstructions {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The number of texture comparison instructions for the function.
     * @type {Integer}
     */
    TextureCompInstructions {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The number of texture bias instructions for the function.
     * @type {Integer}
     */
    TextureBiasInstructions {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The number of texture gradient instructions for the function.
     * @type {Integer}
     */
    TextureGradientInstructions {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The number of floating point arithmetic instructions used by the function.
     * @type {Integer}
     */
    FloatInstructionCount {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The number of signed integer arithmetic instructions used by the function.
     * @type {Integer}
     */
    IntInstructionCount {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The number of unsigned integer arithmetic instructions used by the function.
     * @type {Integer}
     */
    UintInstructionCount {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The number of static flow control instructions used by the function.
     * @type {Integer}
     */
    StaticFlowControlCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The number of dynamic flow control instructions used by the function.
     * @type {Integer}
     */
    DynamicFlowControlCount {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * The number of macro instructions used by the function.
     * @type {Integer}
     */
    MacroInstructionCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The number of array instructions used by the function.
     * @type {Integer}
     */
    ArrayInstructionCount {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * The number of mov instructions used by the function.
     * @type {Integer}
     */
    MovInstructionCount {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The number of movc instructions used by the function.
     * @type {Integer}
     */
    MovcInstructionCount {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * The number of type conversion instructions used by the function.
     * @type {Integer}
     */
    ConversionInstructionCount {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * The number of bitwise arithmetic instructions used by the function.
     * @type {Integer}
     */
    BitwiseInstructionCount {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>-typed value that specifies the minimum Direct3D feature level target of the function byte code.
     * @type {Integer}
     */
    MinFeatureLevel {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * A value that contains a combination of one or more shader requirements flags; each flag specifies a requirement of the shader. A default value of 0 means there are no requirements. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getrequiresflags">ID3D12ShaderReflection::GetRequiresFlags</a>.
     * @type {Integer}
     */
    RequiredFeatureFlags {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * The name of the function.
     * @type {Pointer<Byte>}
     */
    Name {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * The number of logical parameters in the function signature, not including the return value.
     * @type {Integer}
     */
    FunctionParameterCount {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }

    /**
     * Indicates whether the function returns a value. <b>TRUE</b> indicates it returns a value; otherwise, <b>FALSE</b> (it is a subroutine).
     * @type {Integer}
     */
    HasReturn {
        get => NumGet(this, 140, "int")
        set => NumPut("int", value, this, 140)
    }

    /**
     * Indicates whether there is a Direct3D 10Level9 vertex shader blob. <b>TRUE</b> indicates there is a 10Level9 vertex shader blob; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    Has10Level9VertexShader {
        get => NumGet(this, 144, "int")
        set => NumPut("int", value, this, 144)
    }

    /**
     * Indicates whether there is a Direct3D 10Level9 pixel shader blob. <b>TRUE</b> indicates there is a 10Level9 pixel shader blob; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    Has10Level9PixelShader {
        get => NumGet(this, 148, "int")
        set => NumPut("int", value, this, 148)
    }
}
