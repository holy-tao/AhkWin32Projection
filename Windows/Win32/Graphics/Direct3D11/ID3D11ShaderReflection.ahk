#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A shader-reflection interface accesses shader information.
 * @remarks
 * 
  * An <b>ID3D11ShaderReflection</b> interface can be retrieved for a shader by using  <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dreflect">D3DReflect</a>.  The following code illustrates retrieving a <b>ID3D11ShaderReflection</b>  from a shader.
  *           
  * 
  * 
  * ```
  * pd3dDevice->CreatePixelShader( pPixelShaderBuffer->GetBufferPointer(),
  *                                pPixelShaderBuffer->GetBufferSize(), g_pPSClassLinkage, &g_pPixelShader );
  * 
  * ID3D11ShaderReflection* pReflector = NULL; 
  * D3DReflect( pPixelShaderBuffer->GetBufferPointer(), pPixelShaderBuffer->GetBufferSize(), 
  *             IID_ID3D11ShaderReflection, (void**) &pReflector);
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nn-d3d11shader-id3d11shaderreflection
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11ShaderReflection extends IUnknown{
    /**
     * The interface identifier for ID3D11ShaderReflection
     * @type {Guid}
     */
    static IID => Guid("{8d536ca1-0cca-4956-a837-786963755584}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<D3D11_SHADER_DESC>} pDesc 
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
     * @returns {Pointer<ID3D11ShaderReflectionConstantBuffer>} 
     */
    GetConstantBufferByIndex(Index) {
        result := ComCall(4, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {Pointer<ID3D11ShaderReflectionConstantBuffer>} 
     */
    GetConstantBufferByName(Name) {
        result := ComCall(5, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} ResourceIndex 
     * @param {Pointer<D3D11_SHADER_INPUT_BIND_DESC>} pDesc 
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
     * @param {Pointer<D3D11_SIGNATURE_PARAMETER_DESC>} pDesc 
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
     * @param {Pointer<D3D11_SIGNATURE_PARAMETER_DESC>} pDesc 
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
     * @param {Integer} ParameterIndex 
     * @param {Pointer<D3D11_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetPatchConstantParameterDesc(ParameterIndex, pDesc) {
        result := ComCall(9, this, "uint", ParameterIndex, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {Pointer<ID3D11ShaderReflectionVariable>} 
     */
    GetVariableByName(Name) {
        result := ComCall(10, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Pointer<D3D11_SHADER_INPUT_BIND_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetResourceBindingDescByName(Name, pDesc) {
        result := ComCall(11, this, "ptr", Name, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMovInstructionCount() {
        result := ComCall(12, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMovcInstructionCount() {
        result := ComCall(13, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetConversionInstructionCount() {
        result := ComCall(14, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetBitwiseInstructionCount() {
        result := ComCall(15, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetGSInputPrimitive() {
        result := ComCall(16, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsSampleFrequencyShader() {
        result := ComCall(17, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumInterfaceSlots() {
        result := ComCall(18, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pLevel 
     * @returns {HRESULT} 
     */
    GetMinFeatureLevel(pLevel) {
        result := ComCall(19, this, "int*", pLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pSizeX 
     * @param {Pointer<UInt32>} pSizeY 
     * @param {Pointer<UInt32>} pSizeZ 
     * @returns {Integer} 
     */
    GetThreadGroupSize(pSizeX, pSizeY, pSizeZ) {
        result := ComCall(20, this, "uint*", pSizeX, "uint*", pSizeY, "uint*", pSizeZ, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRequiresFlags() {
        result := ComCall(21, this, "uint")
        return result
    }
}
