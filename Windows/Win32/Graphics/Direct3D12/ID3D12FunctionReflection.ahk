#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A function-reflection interface accesses function info.
 * @remarks
 * 
  * To get a function-reflection interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12libraryreflection-getfunctionbyindex">ID3D12LibraryReflection::GetFunctionByIndex</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
  *       
  * 
  * <div class="alert"><b>Note</b>  <b>ID3D12FunctionReflection</b> requires the D3dcompiler_47.dll or a later version of the DLL.
  *       </div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nn-d3d12shader-id3d12functionreflection
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12FunctionReflection extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12FunctionReflection
     * @type {Guid}
     */
    static IID => Guid("{1108795c-2772-4ba9-b2a8-d464dc7e2799}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetConstantBufferByIndex", "GetConstantBufferByName", "GetResourceBindingDesc", "GetVariableByName", "GetResourceBindingDescByName", "GetFunctionParameter"]

    /**
     * 
     * @param {Pointer<D3D12_FUNCTION_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12functionreflection-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(0, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BufferIndex 
     * @returns {ID3D12ShaderReflectionConstantBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12functionreflection-getconstantbufferbyindex
     */
    GetConstantBufferByIndex(BufferIndex) {
        result := ComCall(1, this, "uint", BufferIndex, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D12ShaderReflectionConstantBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12functionreflection-getconstantbufferbyname
     */
    GetConstantBufferByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(2, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} ResourceIndex 
     * @param {Pointer<D3D12_SHADER_INPUT_BIND_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12functionreflection-getresourcebindingdesc
     */
    GetResourceBindingDesc(ResourceIndex, pDesc) {
        result := ComCall(3, this, "uint", ResourceIndex, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D12ShaderReflectionVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12functionreflection-getvariablebyname
     */
    GetVariableByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(4, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Pointer<D3D12_SHADER_INPUT_BIND_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12functionreflection-getresourcebindingdescbyname
     */
    GetResourceBindingDescByName(Name, pDesc) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @returns {ID3D12FunctionParameterReflection} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12functionreflection-getfunctionparameter
     */
    GetFunctionParameter(ParameterIndex) {
        result := ComCall(6, this, "int", ParameterIndex, "ptr")
        return result
    }
}
