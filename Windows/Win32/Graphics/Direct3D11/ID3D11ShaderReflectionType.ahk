#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

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
     * 
     * @param {Pointer<D3D11_SHADER_TYPE_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetDesc(pDesc) {
        result := ComCall(0, this, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Pointer<ID3D11ShaderReflectionType>} 
     */
    GetMemberTypeByIndex(Index) {
        result := ComCall(1, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {Pointer<ID3D11ShaderReflectionType>} 
     */
    GetMemberTypeByName(Name) {
        result := ComCall(2, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {PSTR} 
     */
    GetMemberTypeName(Index) {
        result := ComCall(3, this, "uint", Index, "char*")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11ShaderReflectionType>} pType 
     * @returns {HRESULT} 
     */
    IsEqual(pType) {
        result := ComCall(4, this, "ptr", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D11ShaderReflectionType>} 
     */
    GetSubType() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D11ShaderReflectionType>} 
     */
    GetBaseClass() {
        result := ComCall(6, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumInterfaces() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {Pointer<ID3D11ShaderReflectionType>} 
     */
    GetInterfaceByIndex(uIndex) {
        result := ComCall(8, this, "uint", uIndex, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11ShaderReflectionType>} pType 
     * @returns {HRESULT} 
     */
    IsOfType(pType) {
        result := ComCall(9, this, "ptr", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11ShaderReflectionType>} pBase 
     * @returns {HRESULT} 
     */
    ImplementsInterface(pBase) {
        result := ComCall(10, this, "ptr", pBase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
