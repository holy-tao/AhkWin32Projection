#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D10_SHADER_DESC.ahk
#Include .\D3D10_SHADER_INPUT_BIND_DESC.ahk
#Include .\D3D10_SIGNATURE_PARAMETER_DESC.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A shader-reflection interface accesses shader information.
 * @remarks
 * 
 * This interface requires Windows Vista Service Pack 1.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/nn-d3d10_1shader-id3d10shaderreflection1
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10ShaderReflection1 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10ShaderReflection1
     * @type {Guid}
     */
    static IID => Guid("{c3457783-a846-47ce-9520-cea6f66e7447}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetConstantBufferByIndex", "GetConstantBufferByName", "GetResourceBindingDesc", "GetInputParameterDesc", "GetOutputParameterDesc", "GetVariableByName", "GetResourceBindingDescByName", "GetMovInstructionCount", "GetMovcInstructionCount", "GetConversionInstructionCount", "GetBitwiseInstructionCount", "GetGSInputPrimitive", "IsLevel9Shader", "IsSampleFrequencyShader"]

    /**
     * 
     * @returns {D3D10_SHADER_DESC} 
     */
    GetDesc() {
        pDesc := D3D10_SHADER_DESC()
        result := ComCall(3, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10ShaderReflectionConstantBuffer} 
     */
    GetConstantBufferByIndex(Index) {
        result := ComCall(4, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10ShaderReflectionConstantBuffer} 
     */
    GetConstantBufferByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} ResourceIndex 
     * @returns {D3D10_SHADER_INPUT_BIND_DESC} 
     */
    GetResourceBindingDesc(ResourceIndex) {
        pDesc := D3D10_SHADER_INPUT_BIND_DESC()
        result := ComCall(6, this, "uint", ResourceIndex, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} 
     */
    GetInputParameterDesc(ParameterIndex) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(7, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @returns {D3D10_SIGNATURE_PARAMETER_DESC} 
     */
    GetOutputParameterDesc(ParameterIndex) {
        pDesc := D3D10_SIGNATURE_PARAMETER_DESC()
        result := ComCall(8, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets a variable by name.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a>*</b>
     * 
     * A pointer to a string containing the variable name.
     * @returns {ID3D10ShaderReflectionVariable} Type: <b><a href="/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionvariable">ID3D10ShaderReflectionVariable</a>*</b>
     * 
     * Returns a <a href="/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectionvariable">ID3D10ShaderReflectionVariable Interface</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getvariablebyname
     */
    GetVariableByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(9, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Gets a resource binding description by name.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a>*</b>
     * 
     * A pointer to a string containing the variable name.
     * @returns {D3D10_SHADER_INPUT_BIND_DESC} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_shader_input_bind_desc">D3D10_SHADER_INPUT_BIND_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/d3d10shader/ns-d3d10shader-d3d10_shader_input_bind_desc">D3D10_SHADER_INPUT_BIND_DESC</a> structure that will be populated with resource binding information.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getresourcebindingdescbyname
     */
    GetResourceBindingDescByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        pDesc := D3D10_SHADER_INPUT_BIND_DESC()
        result := ComCall(10, this, "ptr", Name, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets the number of Mov instructions.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to the number of Mov instructions.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getmovinstructioncount
     */
    GetMovInstructionCount() {
        result := ComCall(11, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets the number of Movc instructions.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to the number of Movc instructions.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getmovcinstructioncount
     */
    GetMovcInstructionCount() {
        result := ComCall(12, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets the number of conversion instructions used in a shader.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a UINT that will contain the conversion instruction count when the method returns.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getconversioninstructioncount
     */
    GetConversionInstructionCount() {
        result := ComCall(13, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets the number of bitwise instructions.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to the number of bitwise instructions.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getbitwiseinstructioncount
     */
    GetBitwiseInstructionCount() {
        result := ComCall(14, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets the geometry-shader input-primitive description.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive">D3D10_PRIMITIVE</a>*</b>
     * 
     * A pointer to the input-primitive type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_primitive">D3D10_PRIMITIVE</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-getgsinputprimitive
     */
    GetGSInputPrimitive() {
        result := ComCall(15, this, "int*", &pPrim := 0, "HRESULT")
        return pPrim
    }

    /**
     * Indicates whether a shader was compiled in Direct3D 10 on Direct3D 9 mode.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Pointer to a BOOL variable that will be set true if the shader was compiled in Direct3D 10 on Direct3D 9 mode; otherwise false.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-islevel9shader
     */
    IsLevel9Shader() {
        result := ComCall(16, this, "int*", &pbLevel9Shader := 0, "HRESULT")
        return pbLevel9Shader
    }

    /**
     * Indicates whether a pixel shader is intended to run a pixel frequency or sample frequency.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * A pointer to a BOOL variable that will be set to true if the shader is intended to run at sample frequency; false otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/nf-d3d10_1shader-id3d10shaderreflection1-issamplefrequencyshader
     */
    IsSampleFrequencyShader() {
        result := ComCall(17, this, "int*", &pbSampleFrequency := 0, "HRESULT")
        return pbSampleFrequency
    }
}
