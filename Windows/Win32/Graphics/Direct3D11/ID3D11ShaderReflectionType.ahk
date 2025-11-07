#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D11_SHADER_TYPE_DESC.ahk

/**
 * This shader-reflection interface provides access to variable type.
 * @remarks
 * 
  * The get a shader-reflection-type interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectionvariable-gettype">ID3D11ShaderReflectionVariable::GetType</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11ShaderReflectionType extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11ShaderReflectionType
     * @type {Guid}
     */
    static IID => Guid("{6e6ffa6a-9bae-4613-a51e-91652d508c21}")

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
     * 
     * @returns {D3D11_SHADER_TYPE_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getdesc
     */
    GetDesc() {
        pDesc := D3D11_SHADER_TYPE_DESC()
        result := ComCall(0, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D11ShaderReflectionType} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getmembertypebyindex
     */
    GetMemberTypeByIndex(Index) {
        result := ComCall(1, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D11ShaderReflectionType} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getmembertypebyname
     */
    GetMemberTypeByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(2, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {PSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getmembertypename
     */
    GetMemberTypeName(Index) {
        result := ComCall(3, this, "uint", Index, "char*")
        return result
    }

    /**
     * 
     * @param {ID3D11ShaderReflectionType} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-isequal
     */
    IsEqual(pType) {
        result := ComCall(4, this, "ptr", pType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ID3D11ShaderReflectionType} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getsubtype
     */
    GetSubType() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {ID3D11ShaderReflectionType} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getbaseclass
     */
    GetBaseClass() {
        result := ComCall(6, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getnuminterfaces
     */
    GetNumInterfaces() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {ID3D11ShaderReflectionType} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-getinterfacebyindex
     */
    GetInterfaceByIndex(uIndex) {
        result := ComCall(8, this, "uint", uIndex, "ptr")
        return result
    }

    /**
     * 
     * @param {ID3D11ShaderReflectionType} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-isoftype
     */
    IsOfType(pType) {
        result := ComCall(9, this, "ptr", pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11ShaderReflectionType} pBase 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflectiontype-implementsinterface
     */
    ImplementsInterface(pBase) {
        result := ComCall(10, this, "ptr", pBase, "HRESULT")
        return result
    }
}
