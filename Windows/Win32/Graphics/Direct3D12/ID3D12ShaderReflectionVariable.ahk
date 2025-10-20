#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

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
     * 
     * @param {Pointer<D3D12_SHADER_VARIABLE_DESC>} pDesc 
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
     * @returns {Pointer<ID3D12ShaderReflectionType>} 
     */
    GetType() {
        result := ComCall(1, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<ID3D12ShaderReflectionConstantBuffer>} 
     */
    GetBuffer() {
        result := ComCall(2, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} uArrayIndex 
     * @returns {Integer} 
     */
    GetInterfaceSlot(uArrayIndex) {
        result := ComCall(3, this, "uint", uArrayIndex, "uint")
        return result
    }
}
