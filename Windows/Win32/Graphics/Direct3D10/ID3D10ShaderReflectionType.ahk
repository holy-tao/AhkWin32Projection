#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This shader-reflection interface provides access to variable type.
 * @remarks
 * 
 * The get a shader-reflection-type interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionvariable-gettype">ID3D10ShaderReflectionVariable::GetType</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nn-d3d10shader-id3d10shaderreflectiontype
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10ShaderReflectionType extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10ShaderReflectionType
     * @type {Guid}
     */
    static IID => Guid("{c530ad7d-9b16-4395-a979-ba2ecff83add}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetMemberTypeByIndex", "GetMemberTypeByName", "GetMemberTypeName"]

    /**
     * Get the description of a shader-reflection-variable type.
     * @param {Pointer<D3D10_SHADER_TYPE_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/ns-d3d10shader-d3d10_shader_type_desc">D3D10_SHADER_TYPE_DESC</a>*</b>
     * 
     * A pointer to a shader-type description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/ns-d3d10shader-d3d10_shader_type_desc">D3D10_SHADER_TYPE_DESC</a>).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(0, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * Get a shader-reflection-variable type by index.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {ID3D10ShaderReflectionType} Type: <b><a href="/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectiontype">ID3D10ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectiontype">ID3D10ShaderReflectionType Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getmembertypebyindex
     */
    GetMemberTypeByIndex(Index) {
        result := ComCall(1, this, "uint", Index, "ptr")
        return result
    }

    /**
     * Get a shader-reflection-variable type by name.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Member name.
     * @returns {ID3D10ShaderReflectionType} Type: <b><a href="/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectiontype">ID3D10ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflectiontype">ID3D10ShaderReflectionType Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getmembertypebyname
     */
    GetMemberTypeByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(2, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Get a shader-reflection-variable type.
     * @param {Integer} Index Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * A zero-based index to a member of the struct type.
     * @returns {PSTR} Type: **[LPCSTR](/windows/desktop/winprog/windows-data-types)**
     * 
     * The member name in the form of a stringified value of the [D3D_SHADER_VARIABLE_TYPE](../d3dcommon/ne-d3dcommon-d3d_shader_variable_type.md) enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getmembertypename
     */
    GetMemberTypeName(Index) {
        result := ComCall(3, this, "uint", Index, "char*")
        return result
    }
}
