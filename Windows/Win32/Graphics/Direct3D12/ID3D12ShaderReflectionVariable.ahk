#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_SHADER_VARIABLE_DESC.ahk

/**
 * This shader-reflection interface provides access to a variable.
 * @remarks
 * 
 * To get a shader-reflection-variable interface, call a method like <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getvariablebyname">ID3D12ShaderReflection::GetVariableByName</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nn-d3d12shader-id3d12shaderreflectionvariable
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12ShaderReflectionVariable extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12ShaderReflectionVariable
     * @type {Guid}
     */
    static IID => Guid("{8337a8a6-a216-444a-b2f4-314733a73aea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetType", "GetBuffer", "GetInterfaceSlot"]

    /**
     * Gets a shader-variable description.
     * @returns {D3D12_SHADER_VARIABLE_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_shader_variable_desc">D3D12_SHADER_VARIABLE_DESC</a>*</b>
     * 
     * A pointer to a shader-variable description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_shader_variable_desc">D3D12_SHADER_VARIABLE_DESC</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectionvariable-getdesc
     */
    GetDesc() {
        pDesc := D3D12_SHADER_VARIABLE_DESC()
        result := ComCall(0, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets a shader-variable type.
     * @returns {ID3D12ShaderReflectionType} Type: <b><a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectionvariable-gettype
     */
    GetType() {
        result := ComCall(1, this, "ptr")
        return result
    }

    /**
     * Returns the ID3D12ShaderReflectionConstantBuffer of the present ID3D12ShaderReflectionVariable.
     * @returns {ID3D12ShaderReflectionConstantBuffer} Type: <b><a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer">ID3D12ShaderReflectionConstantBuffer</a>*</b>
     * 
     * Returns a pointer to the <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer">ID3D12ShaderReflectionConstantBuffer</a> of the present <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionvariable">ID3D12ShaderReflectionVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectionvariable-getbuffer
     */
    GetBuffer() {
        result := ComCall(2, this, "ptr")
        return result
    }

    /**
     * Gets the corresponding interface slot for a variable that represents an interface pointer.
     * @param {Integer} uArrayIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the array element to get the slot number for.
     *             For a non-array variable this value will be zero.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Returns the index of the interface in the interface array.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectionvariable-getinterfaceslot
     */
    GetInterfaceSlot(uArrayIndex) {
        result := ComCall(3, this, "uint", uArrayIndex, "uint")
        return result
    }
}
