#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_SHADER_TYPE_DESC.ahk

/**
 * This shader-reflection interface provides access to variable type.
 * @remarks
 * 
 * The get a shader-reflection-type interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectionvariable-gettype">ID3D12ShaderReflectionVariable::GetType</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12ShaderReflectionType extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12ShaderReflectionType
     * @type {Guid}
     */
    static IID => Guid("{e913c351-783d-48ca-a1d1-4f306284ad56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetMemberTypeByIndex", "GetMemberTypeByName", "GetMemberTypeName", "IsEqual", "GetSubType", "GetBaseClass", "GetNumInterfaces", "GetInterfaceByIndex", "IsOfType", "ImplementsInterface"]

    /**
     * Gets the description of a shader-reflection-variable type.
     * @returns {D3D12_SHADER_TYPE_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_shader_type_desc">D3D12_SHADER_TYPE_DESC</a>*</b>
     * 
     * A pointer to a shader-type description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_shader_type_desc">D3D12_SHADER_TYPE_DESC</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-getdesc
     */
    GetDesc() {
        pDesc := D3D12_SHADER_TYPE_DESC()
        result := ComCall(0, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets a shader-reflection-variable type by index.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {ID3D12ShaderReflectionType} Type: <b><a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-getmembertypebyindex
     */
    GetMemberTypeByIndex(Index) {
        result := ComCall(1, this, "uint", Index, "ptr")
        return result
    }

    /**
     * Gets a shader-reflection-variable type by name.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Member name.
     * @returns {ID3D12ShaderReflectionType} Type: <b><a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-getmembertypebyname
     */
    GetMemberTypeByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(2, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Gets a shader-reflection-variable type.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {PSTR} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The variable type.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-getmembertypename
     */
    GetMemberTypeName(Index) {
        result := ComCall(3, this, "uint", Index, "char*")
        return result
    }

    /**
     * Indicates whether two ID3D12ShaderReflectionType Interface pointers have the same underlying type.
     * @param {ID3D12ShaderReflectionType} pType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType Interface</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if the pointers have the same underlying type; otherwise returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-isequal
     */
    IsEqual(pType) {
        result := ComCall(4, this, "ptr", pType, "HRESULT")
        return result
    }

    /**
     * Gets the base class of a class.
     * @returns {ID3D12ShaderReflectionType} Type: <b><a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType</a>*</b>
     * 
     * Returns a pointer to an <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType</a> containing the base class type.
     *             Returns <b>NULL</b> if the class does not have a base class.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-getsubtype
     */
    GetSubType() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * Gets an ID3D12ShaderReflectionType Interface interface containing the variable base class type.
     * @returns {ID3D12ShaderReflectionType} Type: <b><a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType</a>*</b>
     * 
     * Returns A pointer to a <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-getbaseclass
     */
    GetBaseClass() {
        result := ComCall(6, this, "ptr")
        return result
    }

    /**
     * Gets the number of interfaces.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Returns the number of interfaces.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-getnuminterfaces
     */
    GetNumInterfaces() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * Gets an interface by index.
     * @param {Integer} uIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index.
     * @returns {ID3D12ShaderReflectionType} Type: <b><a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-getinterfacebyindex
     */
    GetInterfaceByIndex(uIndex) {
        result := ComCall(8, this, "uint", uIndex, "ptr")
        return result
    }

    /**
     * Indicates whether a variable is of the specified type.
     * @param {ID3D12ShaderReflectionType} pType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType Interface</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if object being queried is equal to or inherits from the type in the <i>pType</i> parameter; otherwise returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-isoftype
     */
    IsOfType(pType) {
        result := ComCall(9, this, "ptr", pType, "HRESULT")
        return result
    }

    /**
     * Indicates whether a class type implements an interface.
     * @param {ID3D12ShaderReflectionType} pBase Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype">ID3D12ShaderReflectionType Interface</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if the interface is implemented; otherwise return S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nf-d3d12shader-id3d12shaderreflectiontype-implementsinterface
     */
    ImplementsInterface(pBase) {
        result := ComCall(10, this, "ptr", pBase, "HRESULT")
        return result
    }
}
