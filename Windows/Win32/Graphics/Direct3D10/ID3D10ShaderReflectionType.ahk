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
     * 
     * @param {Pointer<D3D10_SHADER_TYPE_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(0, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10ShaderReflectionType} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getmembertypebyindex
     */
    GetMemberTypeByIndex(Index) {
        result := ComCall(1, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10ShaderReflectionType} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getmembertypebyname
     */
    GetMemberTypeByName(Name) {
        result := ComCall(2, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {PSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectiontype-getmembertypename
     */
    GetMemberTypeName(Index) {
        result := ComCall(3, this, "uint", Index, "char*")
        return result
    }
}
