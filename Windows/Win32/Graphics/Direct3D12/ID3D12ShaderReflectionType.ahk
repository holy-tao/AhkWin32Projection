#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

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
     * 
     * @param {Pointer<D3D12_SHADER_TYPE_DESC>} pDesc 
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
     * @returns {Pointer<ID3D12ShaderReflectionType>} 
     */
    GetMemberTypeByIndex(Index) {
        result := ComCall(1, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {Pointer<ID3D12ShaderReflectionType>} 
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
     * @param {Pointer<ID3D12ShaderReflectionType>} pType 
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
     * @returns {Pointer<ID3D12ShaderReflectionType>} 
     */
    GetSubType() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D12ShaderReflectionType>} 
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
     * @returns {Pointer<ID3D12ShaderReflectionType>} 
     */
    GetInterfaceByIndex(uIndex) {
        result := ComCall(8, this, "uint", uIndex, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12ShaderReflectionType>} pType 
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
     * @param {Pointer<ID3D12ShaderReflectionType>} pBase 
     * @returns {HRESULT} 
     */
    ImplementsInterface(pBase) {
        result := ComCall(10, this, "ptr", pBase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
