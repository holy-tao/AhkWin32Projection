#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D11_SHADER_VARIABLE_DESC.ahk

/**
 * This shader-reflection interface provides access to a variable.
 * @remarks
 * 
 * To get a shader-reflection-variable interface, call a method like <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getvariablebyname">ID3D11ShaderReflection::GetVariableByName</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nn-d3d11shader-id3d11shaderreflectionvariable
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11ShaderReflectionVariable extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11ShaderReflectionVariable
     * @type {Guid}
     */
    static IID => Guid("{51f23923-f3e5-4bd1-91cb-606177d8db4c}")

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
     * Get a shader-variable description.
     * @returns {D3D11_SHADER_VARIABLE_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_variable_desc">D3D11_SHADER_VARIABLE_DESC</a>*</b>
     * 
     * A pointer to a shader-variable description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_variable_desc">D3D11_SHADER_VARIABLE_DESC</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11shaderreflectionvariable-getdesc
     */
    GetDesc() {
        pDesc := D3D11_SHADER_VARIABLE_DESC()
        result := ComCall(0, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Get a shader-variable type.
     * @returns {ID3D11ShaderReflectionType} Type: <b><a href="/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype">ID3D11ShaderReflectionType Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11shaderreflectionvariable-gettype
     */
    GetType() {
        result := ComCall(1, this, "ptr")
        return result
    }

    /**
     * This method returns the buffer of the current ID3D11ShaderReflectionVariable.
     * @returns {ID3D11ShaderReflectionConstantBuffer} Type: <b><a href="/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectionconstantbuffer">ID3D11ShaderReflectionConstantBuffer</a>*</b>
     * 
     * Returns a pointer to the <a href="/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectionconstantbuffer">ID3D11ShaderReflectionConstantBuffer</a> of the present <a href="/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectionvariable">ID3D11ShaderReflectionVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11shaderreflectionvariable-getbuffer
     */
    GetBuffer() {
        result := ComCall(2, this, "ptr")
        return result
    }

    /**
     * Gets the corresponding interface slot for a variable that represents an interface pointer.
     * @param {Integer} uArrayIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the array element to get the slot number for.  For a non-array variable this value will be zero.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Returns the index of the interface in the interface array.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11shaderreflectionvariable-getinterfaceslot
     */
    GetInterfaceSlot(uArrayIndex) {
        result := ComCall(3, this, "uint", uArrayIndex, "uint")
        return result
    }
}
