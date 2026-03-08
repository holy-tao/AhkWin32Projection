#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D10_SHADER_DESC.ahk
#Include .\D3D10_SHADER_INPUT_BIND_DESC.ahk
#Include .\D3D10_SIGNATURE_PARAMETER_DESC.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A shader-reflection interface accesses shader information. (ID3D10ShaderReflection)
 * @remarks
 * Create the interface by calling <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10reflectshader">D3DX10ReflectShader</a>. Since it is a COM interface, creating the interface increases a reference count and the interface must be released when it is no longer needed. The remaining shader-reflection interfaces are not COM interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nn-d3d10shader-id3d10shaderreflection
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10ShaderReflection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10ShaderReflection
     * @type {Guid}
     */
    static IID => Guid("{d40e20b6-f8f7-42ad-ab20-4baf8f15dfaa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetConstantBufferByIndex", "GetConstantBufferByName", "GetResourceBindingDesc", "GetInputParameterDesc", "GetOutputParameterDesc"]

    /**
     * Get a shader description. (ID3D10ShaderReflection.GetDesc)
     * @returns {D3D10_SHADER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/ns-d3d10shader-d3d10_shader_desc">D3D10_SHADER_DESC</a>*</b>
     * 
     * A pointer to a shader description. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/ns-d3d10shader-d3d10_shader_desc">D3D10_SHADER_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getdesc
     */
    GetDesc() {
        pDesc := D3D10_SHADER_DESC()
        result := ComCall(3, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * The ID3D10ShaderReflection::GetConstantBufferByIndex (d3d10shader.h) method gets a constant buffer by index.
     * @remarks
     * A constant buffer supplies either scalar constants or texture constants to a shader. A shader can use one or more constant buffers. For best performance, separate constants into buffers based on the frequency they are updated.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {ID3D10ShaderReflectionConstantBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionconstantbuffer">ID3D10ShaderReflectionConstantBuffer</a>*</b>
     * 
     * A pointer to a constant buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionconstantbuffer">ID3D10ShaderReflectionConstantBuffer Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getconstantbufferbyindex
     */
    GetConstantBufferByIndex(Index) {
        result := ComCall(4, this, "uint", Index, "ptr")
        return result
    }

    /**
     * Get a constant buffer by name. (ID3D10ShaderReflection.GetConstantBufferByName)
     * @remarks
     * A constant buffer supplies either scalar constants or texture constants to a shader. A shader can use one or more constant buffers. For best performance, separate constants into buffers based on the frequency they are updated.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The constant-buffer name.
     * @returns {ID3D10ShaderReflectionConstantBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionconstantbuffer">ID3D10ShaderReflectionConstantBuffer</a>*</b>
     * 
     * A pointer to a constant buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionconstantbuffer">ID3D10ShaderReflectionConstantBuffer Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getconstantbufferbyname
     */
    GetConstantBufferByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Get a description of the resources bound to a shader.
     * @remarks
     * A shader consists of executable code (the compiled HLSL functions) and a set of resources that supply the shader with input data. This API gets a list of the resources that are bound as inputs to the shader.
     * @param {Integer} ResourceIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based resource index.
     * @returns {D3D10_SHADER_INPUT_BIND_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_shader_input_bind_desc">D3D10_SHADER_INPUT_BIND_DESC</a>*</b>
     * 
     * A pointer to an input-binding description. See <a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_shader_input_bind_desc">D3D10_SHADER_INPUT_BIND_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getresourcebindingdesc
     */
    GetResourceBindingDesc(ResourceIndex) {
        pDesc := D3D10_SHADER_INPUT_BIND_DESC()
        result := ComCall(6, this, "uint", ResourceIndex, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Get an input-parameter description for a shader. (ID3D10ShaderReflection.GetInputParameterDesc)
     * @remarks
     * An input-parameter description is also called a shader signature. The shader signature contains information about the input parameters such as the order or parameters, their data type, and a parameter semantic.
     * @param {Integer} ParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based parameter index.
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>*</b>
     * 
     * A pointer to a shader-input-signature description. See <a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getinputparameterdesc
     */
    GetInputParameterDesc(ParameterIndex) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(7, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Get an output-parameter description for a shader. (ID3D10ShaderReflection.GetOutputParameterDesc)
     * @remarks
     * An output-parameter description is also called a shader signature. The shader signature contains information about the output parameters such as the order or parameters, their data type, and a parameter semantic.
     * @param {Integer} ParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based parameter index.
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>*</b>
     * 
     * A pointer to a shader-output-parameter description. See <a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_signature_parameter_desc">D3D10_SIGNATURE_PARAMETER_DESC</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getoutputparameterdesc
     */
    GetOutputParameterDesc(ParameterIndex) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(8, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
        return pDesc
    }
}
