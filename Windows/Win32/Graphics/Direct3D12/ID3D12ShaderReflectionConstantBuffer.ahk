#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This shader-reflection interface provides access to a constant buffer.
 * @remarks
 * 
  * To create a constant-buffer interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getconstantbufferbyindex">ID3D12ShaderReflection::GetConstantBufferByIndex</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nf-d3d12shader-id3d12shaderreflection-getconstantbufferbyname">ID3D12ShaderReflection::GetConstantBufferByName</a>. This isn't a COM interface, so you don't need to worry about reference counts or releasing the interface when you're done with it.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12ShaderReflectionConstantBuffer extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12ShaderReflectionConstantBuffer
     * @type {Guid}
     */
    static IID => Guid("{c59598b4-48b3-4869-b9b1-b1618b14a8b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetVariableByIndex", "GetVariableByName"]

    /**
     * 
     * @param {Pointer<D3D12_SHADER_BUFFER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectionconstantbuffer-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(0, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D12ShaderReflectionVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectionconstantbuffer-getvariablebyindex
     */
    GetVariableByIndex(Index) {
        result := ComCall(1, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D12ShaderReflectionVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12shaderreflectionconstantbuffer-getvariablebyname
     */
    GetVariableByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(2, this, "ptr", Name, "ptr")
        return result
    }
}
