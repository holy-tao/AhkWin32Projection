#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A shader-reflection interface accesses shader information.
 * @remarks
 * 
  * An <b>ID3D12ShaderReflection</b> interface can be retrieved for a shader by using <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dreflect">D3DReflect</a>.
  * 
  * > [!NOTE]
  * > This function from `d3dcompiler.dll` supports Shader Model 2 - 5.1. For Shader Model 6 shader reflection, see `dxcompiler.dll` and  [Using dxc.exe and dxcompiler.dll](https://github.com/microsoft/DirectXShaderCompiler/wiki/Using-dxc.exe-and-dxcompiler.dll).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nn-d3d12shader-id3d12shaderreflection
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12ShaderReflection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12ShaderReflection
     * @type {Guid}
     */
    static IID => Guid("{5a58797d-a72c-478d-8ba2-efc6b0efe88e}")

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
     * @param {Pointer<D3D12_SHADER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(3, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D12ShaderReflectionConstantBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getconstantbufferbyindex
     */
    GetConstantBufferByIndex(Index) {
        result := ComCall(4, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D12ShaderReflectionConstantBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getconstantbufferbyname
     */
    GetConstantBufferByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} ResourceIndex 
     * @param {Pointer<D3D12_SHADER_INPUT_BIND_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getresourcebindingdesc
     */
    GetResourceBindingDesc(ResourceIndex, pDesc) {
        result := ComCall(6, this, "uint", ResourceIndex, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @param {Pointer<D3D12_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getinputparameterdesc
     */
    GetInputParameterDesc(ParameterIndex, pDesc) {
        result := ComCall(7, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @param {Pointer<D3D12_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getoutputparameterdesc
     */
    GetOutputParameterDesc(ParameterIndex, pDesc) {
        result := ComCall(8, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @param {Pointer<D3D12_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getpatchconstantparameterdesc
     */
    GetPatchConstantParameterDesc(ParameterIndex, pDesc) {
        result := ComCall(9, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D12ShaderReflectionVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getvariablebyname
     */
    GetVariableByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(10, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Pointer<D3D12_SHADER_INPUT_BIND_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getresourcebindingdescbyname
     */
    GetResourceBindingDescByName(Name, pDesc) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(11, this, "ptr", Name, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getmovinstructioncount
     */
    GetMovInstructionCount() {
        result := ComCall(12, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getmovcinstructioncount
     */
    GetMovcInstructionCount() {
        result := ComCall(13, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getconversioninstructioncount
     */
    GetConversionInstructionCount() {
        result := ComCall(14, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getbitwiseinstructioncount
     */
    GetBitwiseInstructionCount() {
        result := ComCall(15, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getgsinputprimitive
     */
    GetGSInputPrimitive() {
        result := ComCall(16, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-issamplefrequencyshader
     */
    IsSampleFrequencyShader() {
        result := ComCall(17, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getnuminterfaceslots
     */
    GetNumInterfaceSlots() {
        result := ComCall(18, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getminfeaturelevel
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getthreadgroupsize
     */
    GetThreadGroupSize(pSizeX, pSizeY, pSizeZ) {
        result := ComCall(20, this, "uint*", pSizeX, "uint*", pSizeY, "uint*", pSizeZ, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getrequiresflags
     */
    GetRequiresFlags() {
        result := ComCall(21, this, "uint")
        return result
    }
}
