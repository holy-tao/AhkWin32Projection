#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_FUNCTION_DESC.ahk
#Include .\D3D12_SHADER_INPUT_BIND_DESC.ahk

/**
 * A function-reflection interface accesses function info.
 * @remarks
 * 
 * To get a function-reflection interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12libraryreflection-getfunctionbyindex">ID3D12LibraryReflection::GetFunctionByIndex</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D12FunctionReflection</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nn-d3d12shader-id3d12functionreflection
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12FunctionReflection extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12FunctionReflection
     * @type {Guid}
     */
    static IID => Guid("{1108795c-2772-4ba9-b2a8-d464dc7e2799}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetConstantBufferByIndex", "GetConstantBufferByName", "GetResourceBindingDesc", "GetVariableByName", "GetResourceBindingDescByName", "GetFunctionParameter"]

    /**
     * Fills the function descriptor structure for the function.
     * @returns {D3D12_FUNCTION_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_function_desc">D3D12_FUNCTION_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_function_desc">D3D12_FUNCTION_DESC</a> structure that receives a description of the function.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12functionreflection-getdesc
     */
    GetDesc() {
        pDesc := D3D12_FUNCTION_DESC()
        result := ComCall(0, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets a constant buffer by index for a function.
     * @param {Integer} BufferIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {ID3D12ShaderReflectionConstantBuffer} Type: <b><a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer">ID3D12ShaderReflectionConstantBuffer</a>*</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer">ID3D12ShaderReflectionConstantBuffer</a> interface that represents the constant buffer.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12functionreflection-getconstantbufferbyindex
     */
    GetConstantBufferByIndex(BufferIndex) {
        result := ComCall(1, this, "uint", BufferIndex, "ptr")
        return result
    }

    /**
     * Gets a constant buffer by name for a function.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The constant-buffer name.
     * @returns {ID3D12ShaderReflectionConstantBuffer} Type: <b><a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer">ID3D12ShaderReflectionConstantBuffer</a>*</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer">ID3D12ShaderReflectionConstantBuffer</a> interface that represents the constant buffer.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12functionreflection-getconstantbufferbyname
     */
    GetConstantBufferByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(2, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Gets a description of how a resource is bound to a function.
     * @param {Integer} ResourceIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based resource index.
     * @returns {D3D12_SHADER_INPUT_BIND_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_input_bind_desc">D3D12_SHADER_INPUT_BIND_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_input_bind_desc">D3D12_SHADER_INPUT_BIND_DESC</a> structure that describes input binding of the resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12functionreflection-getresourcebindingdesc
     */
    GetResourceBindingDesc(ResourceIndex) {
        pDesc := D3D12_SHADER_INPUT_BIND_DESC()
        result := ComCall(3, this, "uint", ResourceIndex, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets a variable by name.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A pointer to a string containing the variable name.
     * @returns {ID3D12ShaderReflectionVariable} Type: <b><a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionvariable">ID3D12ShaderReflectionVariable</a>*</b>
     * 
     * Returns a <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionvariable">ID3D12ShaderReflectionVariable Interface</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12functionreflection-getvariablebyname
     */
    GetVariableByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(4, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Gets a description of how a resource is bound to a function.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The constant-buffer name of the resource.
     * @returns {D3D12_SHADER_INPUT_BIND_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_input_bind_desc">D3D12_SHADER_INPUT_BIND_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_input_bind_desc">D3D12_SHADER_INPUT_BIND_DESC</a> structure that describes input binding of the resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12functionreflection-getresourcebindingdescbyname
     */
    GetResourceBindingDescByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        pDesc := D3D12_SHADER_INPUT_BIND_DESC()
        result := ComCall(5, this, "ptr", Name, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets the function parameter reflector.
     * @param {Integer} ParameterIndex Type: <b>INT</b>
     * 
     * The zero-based index of the function parameter reflector to retrieve.
     * @returns {ID3D12FunctionParameterReflection} Type: <b><a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12functionparameterreflection">ID3D12FunctionParameterReflection</a>*</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12functionparameterreflection">ID3D12FunctionParameterReflection</a> interface that represents the function parameter reflector.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12functionreflection-getfunctionparameter
     */
    GetFunctionParameter(ParameterIndex) {
        result := ComCall(6, this, "int", ParameterIndex, "ptr")
        return result
    }
}
