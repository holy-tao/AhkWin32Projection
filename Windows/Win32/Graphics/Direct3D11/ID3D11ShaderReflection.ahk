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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetConstantBufferByIndex", "GetConstantBufferByName", "GetResourceBindingDesc", "GetInputParameterDesc", "GetOutputParameterDesc", "GetPatchConstantParameterDesc", "GetVariableByName", "GetResourceBindingDescByName", "GetMovInstructionCount", "GetMovcInstructionCount", "GetConversionInstructionCount", "GetBitwiseInstructionCount", "GetGSInputPrimitive", "IsSampleFrequencyShader", "GetNumInterfaceSlots", "GetMinFeatureLevel", "GetThreadGroupSize", "GetRequiresFlags"]

    /**
     * 
     * @param {Pointer<D3D11_SHADER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(3, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D11ShaderReflectionConstantBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getconstantbufferbyindex
     */
    GetConstantBufferByIndex(Index) {
        result := ComCall(4, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D11ShaderReflectionConstantBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getconstantbufferbyname
     */
    GetConstantBufferByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} ResourceIndex 
     * @param {Pointer<D3D11_SHADER_INPUT_BIND_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getresourcebindingdesc
     */
    GetResourceBindingDesc(ResourceIndex, pDesc) {
        result := ComCall(6, this, "uint", ResourceIndex, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @param {Pointer<D3D11_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getinputparameterdesc
     */
    GetInputParameterDesc(ParameterIndex, pDesc) {
        result := ComCall(7, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @param {Pointer<D3D11_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getoutputparameterdesc
     */
    GetOutputParameterDesc(ParameterIndex, pDesc) {
        result := ComCall(8, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @param {Pointer<D3D11_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getpatchconstantparameterdesc
     */
    GetPatchConstantParameterDesc(ParameterIndex, pDesc) {
        result := ComCall(9, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D11ShaderReflectionVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getvariablebyname
     */
    GetVariableByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(10, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Pointer<D3D11_SHADER_INPUT_BIND_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getresourcebindingdescbyname
     */
    GetResourceBindingDescByName(Name, pDesc) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(11, this, "ptr", Name, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getmovinstructioncount
     */
    GetMovInstructionCount() {
        result := ComCall(12, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getmovcinstructioncount
     */
    GetMovcInstructionCount() {
        result := ComCall(13, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getconversioninstructioncount
     */
    GetConversionInstructionCount() {
        result := ComCall(14, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getbitwiseinstructioncount
     */
    GetBitwiseInstructionCount() {
        result := ComCall(15, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getgsinputprimitive
     */
    GetGSInputPrimitive() {
        result := ComCall(16, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-issamplefrequencyshader
     */
    IsSampleFrequencyShader() {
        result := ComCall(17, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getnuminterfaceslots
     */
    GetNumInterfaceSlots() {
        result := ComCall(18, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getminfeaturelevel
     */
    GetMinFeatureLevel(pLevel) {
        result := ComCall(19, this, "int*", pLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSizeX 
     * @param {Pointer<Integer>} pSizeY 
     * @param {Pointer<Integer>} pSizeZ 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getthreadgroupsize
     */
    GetThreadGroupSize(pSizeX, pSizeY, pSizeZ) {
        result := ComCall(20, this, "uint*", pSizeX, "uint*", pSizeY, "uint*", pSizeZ, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11shaderreflection-getrequiresflags
     */
    GetRequiresFlags() {
        result := ComCall(21, this, "uint")
        return result
    }
}
