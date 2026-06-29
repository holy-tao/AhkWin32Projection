#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_NAME.ahk" { D3D_NAME }
#Import "..\Direct3D\D3D_REGISTER_COMPONENT_TYPE.ahk" { D3D_REGISTER_COMPONENT_TYPE }
#Import "..\Direct3D\D3D_MIN_PRECISION.ahk" { D3D_MIN_PRECISION }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a shader signature. (D3D12_SIGNATURE_PARAMETER_DESC)
 * @remarks
 * A shader can take n inputs and can produce m outputs. The order of the input (or output) parameters, their associated types, and any attached semantics make up the shader signature. Each shader has an input and an output signature.
 *         
 * 
 * When compiling a shader or an effect, some API calls validate shader signatures  That is, they compare the output signature of one shader (like a vertex shader) with the input signature of another shader (like a pixel shader). This ensures that a shader outputs data that is compatible with a downstream shader that is consuming that data. Compatible means that a shader signature is a exact-match subset of the preceding shader stage. Exact match means parameter types and semantics must exactly match. Subset means that a parameter that is not required by a downstream stage, does not need to include that parameter in its shader signature.
 *         
 * 
 * Get a shader-signature from a shader or an effect by calling APIs such as <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getinputparameterdesc">ID3D12ShaderReflection::GetInputParameterDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_signature_parameter_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SIGNATURE_PARAMETER_DESC {
    #StructPack 8

    /**
     * A per-parameter string that identifies how the data will be used. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">Semantics</a>.
     */
    SemanticName : PSTR

    /**
     * Semantic index that modifies the semantic. Used to differentiate different parameters that use the same semantic.
     */
    SemanticIndex : UInt32

    /**
     * The register that will contain this variable's data.
     */
    Register : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_name">D3D_NAME</a>-typed value that identifies a predefined string that determines the functionality of certain pipeline stages.
     */
    SystemValueType : D3D_NAME

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_register_component_type">D3D_REGISTER_COMPONENT_TYPE</a>-typed value that identifies the per-component-data type that is stored in a register.  Each register can store up to four-components of data.
     */
    ComponentType : D3D_REGISTER_COMPONENT_TYPE

    /**
     * Mask which indicates which components of a register are used.
     */
    Mask : Int8

    /**
     * Mask which indicates whether a given component is never written (if the signature is an output signature) or always read (if the signature is an input signature).
     */
    ReadWriteMask : Int8

    /**
     * Indicates which stream the geometry shader is using for the signature parameter.
     */
    Stream : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_min_precision">D3D_MIN_PRECISION</a>-typed value that indicates the minimum desired interpolation precision. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/using-hlsl-minimum-precision">Using HLSL minimum precision</a>.
     */
    MinPrecision : D3D_MIN_PRECISION

}
