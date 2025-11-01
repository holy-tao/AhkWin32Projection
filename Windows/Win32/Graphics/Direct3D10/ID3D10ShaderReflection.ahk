#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A shader-reflection interface accesses shader information.
 * @remarks
 * 
  * Create the interface by calling <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10reflectshader">D3DX10ReflectShader</a>. Since it is a COM interface, creating the interface increases a reference count and the interface must be released when it is no longer needed. The remaining shader-reflection interfaces are not COM interfaces.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nn-d3d10shader-id3d10shaderreflection
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10ShaderReflection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10ShaderReflection
     * @type {Guid}
     */
    static IID => Guid("{d40e20b6-f8f7-42ad-ab20-4baf8f15dfaa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetConstantBufferByIndex", "GetConstantBufferByName", "GetResourceBindingDesc", "GetInputParameterDesc", "GetOutputParameterDesc"]

    /**
     * 
     * @param {Pointer<D3D10_SHADER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(3, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10ShaderReflectionConstantBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getconstantbufferbyindex
     */
    GetConstantBufferByIndex(Index) {
        result := ComCall(4, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10ShaderReflectionConstantBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getconstantbufferbyname
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getresourcebindingdesc
     */
    GetResourceBindingDesc(ResourceIndex, pDesc) {
        result := ComCall(6, this, "uint", ResourceIndex, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @param {Pointer<D3D10_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getinputparameterdesc
     */
    GetInputParameterDesc(ParameterIndex, pDesc) {
        result := ComCall(7, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ParameterIndex 
     * @param {Pointer<D3D10_SIGNATURE_PARAMETER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getoutputparameterdesc
     */
    GetOutputParameterDesc(ParameterIndex, pDesc) {
        result := ComCall(8, this, "uint", ParameterIndex, "ptr", pDesc, "HRESULT")
        return result
    }
}
