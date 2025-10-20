#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This shader-reflection interface provides access to a variable.
 * @remarks
 * 
  * To get a shader-reflection-variable interface, call a method like <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionconstantbuffer-getvariablebyindex">ID3D10ShaderReflectionConstantBuffer::GetVariableByIndex</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nn-d3d10shader-id3d10shaderreflectionvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10ShaderReflectionVariable extends Win32ComInterface{
    /**
     * The interface identifier for ID3D10ShaderReflectionVariable
     * @type {Guid}
     */
    static IID => Guid("{1bf63c95-2650-405d-99c1-3636bd1da0a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * 
     * @param {Pointer<D3D10_SHADER_VARIABLE_DESC>} pDesc 
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
     * @returns {Pointer<ID3D10ShaderReflectionType>} 
     */
    GetType() {
        result := ComCall(1, this, "ptr")
        return result
    }
}
