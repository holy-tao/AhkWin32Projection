#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_NAME.ahk" { D3D_NAME }
#Import "..\Direct3D\D3D_REGISTER_COMPONENT_TYPE.ahk" { D3D_REGISTER_COMPONENT_TYPE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes a shader signature. (D3D10_SIGNATURE_PARAMETER_DESC)
 * @remarks
 * A shader can take n inputs and can produce m outputs. The order of the input (or output) parameters, their associated types, and any attached semantics make up the shader signature. Each shader has an input and an output signature.
 * 
 * When compiling a shader or an effect, some API calls validate shader signatures (such as <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-d3d10compileshader">D3D10CompileShader</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-d3d10compileeffectfrommemory">D3D10CompileEffectFromMemory</a>). That is, they compare the output signature of one shader (like a vertex shader) with the input signature of another shader (like a pixel shader). This ensures that a shader outputs data that is compatible with a downstream shader that is consuming that data. Compatible means that a shader signature is a exact-match subset of the preceding shader stage. Exact match means parameter types and semantics must exactly match. Subset means that a parameter that is not required by a downstream stage, does not need to include that parameter in its shader signature.
 * 
 * Get a shader-signature from a shader or an effect by calling APIs such as <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getinputparameterdesc">ID3D10ShaderReflection::GetInputParameterDesc</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effectshadervariable-getinputsignatureelementdesc">ID3D10EffectShaderVariable::GetInputSignatureElementDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SIGNATURE_PARAMETER_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A per-parameter string that identifies how the data will be used. See <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">Semantics (DirectX HLSL)</a>.
     */
    SemanticName : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Semantic index that modifies the semantic. Used to differentiate different parameters that use the same semantic.
     */
    SemanticIndex : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The register that will contain this variable's data.
     */
    Register : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_name">D3D10_NAME</a></b>
     * 
     * A predefined string that determines the functionality of certain pipeline stages. See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_name">D3D10_NAME</a>.
     */
    SystemValueType : D3D_NAME

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_register_component_type">D3D10_REGISTER_COMPONENT_TYPE</a></b>
     * 
     * The per-component-data type that is stored in a register. See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_register_component_type">D3D10_REGISTER_COMPONENT_TYPE</a>. Each register can store up to four-components of data.
     */
    ComponentType : D3D_REGISTER_COMPONENT_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Mask which indicates which components of a register are used.
     */
    Mask : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Mask which indicates whether a given component is never written (if the signature is an output signature) or always read (if the signature is an input signature). The mask is a combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_register_component_type">D3D10_REGISTER_COMPONENT_TYPE</a> values.
     */
    ReadWriteMask : Int8

}
