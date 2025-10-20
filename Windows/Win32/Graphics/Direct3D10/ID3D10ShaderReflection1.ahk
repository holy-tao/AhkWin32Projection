#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A shader-reflection interface accesses shader information.
 * @remarks
 * 
  * This interface requires Windows Vista Service Pack 1.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/nn-d3d10_1shader-id3d10shaderreflection1
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10ShaderReflection1 extends IUnknown{
    /**
     * The interface identifier for ID3D10ShaderReflection1
     * @type {Guid}
     */
    static IID => Guid("{c3457783-a846-47ce-9520-cea6f66e7447}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<D3D10_SHADER_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetDesc(pDesc) {
        result := ComCall(3, this, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Pointer<ID3D10ShaderReflectionConstantBuffer>} 
     */
    GetConstantBufferByIndex(Index) {
        result := ComCall(4, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {Pointer<ID3D10ShaderReflectionConstantBuffer>} 
     */
    GetConstantBufferByName(Name) {
        result := ComCall(5, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} ResourceIndex 
     * @param {Pointer<D3D10_SHADER_INPUT_BIND_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetResourceBindingDesc(ResourceIndex, pDesc) {
        result := ComCall(6, this, "uint", ResourceIndex, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @param {Pointer<D3D10_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetInputParameterDesc(ParameterIndex, pDesc) {
        result := ComCall(7, this, "uint", ParameterIndex, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @param {Pointer<D3D10_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetOutputParameterDesc(ParameterIndex, pDesc) {
        result := ComCall(8, this, "uint", ParameterIndex, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {Pointer<ID3D10ShaderReflectionVariable>} 
     */
    GetVariableByName(Name) {
        result := ComCall(9, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Pointer<D3D10_SHADER_INPUT_BIND_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetResourceBindingDescByName(Name, pDesc) {
        result := ComCall(10, this, "ptr", Name, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetMovInstructionCount(pCount) {
        result := ComCall(11, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetMovcInstructionCount(pCount) {
        result := ComCall(12, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetConversionInstructionCount(pCount) {
        result := ComCall(13, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetBitwiseInstructionCount(pCount) {
        result := ComCall(14, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPrim 
     * @returns {HRESULT} 
     */
    GetGSInputPrimitive(pPrim) {
        result := ComCall(15, this, "int*", pPrim, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbLevel9Shader 
     * @returns {HRESULT} 
     */
    IsLevel9Shader(pbLevel9Shader) {
        result := ComCall(16, this, "ptr", pbLevel9Shader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbSampleFrequency 
     * @returns {HRESULT} 
     */
    IsSampleFrequencyShader(pbSampleFrequency) {
        result := ComCall(17, this, "ptr", pbSampleFrequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
