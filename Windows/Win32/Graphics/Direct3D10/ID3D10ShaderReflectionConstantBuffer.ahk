#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This shader-reflection interface provides access to a constant buffer.
 * @remarks
 * 
  * To create a constant-buffer interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getconstantbufferbyindex">ID3D10ShaderReflection::GetConstantBufferByIndex</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nf-d3d10shader-id3d10shaderreflection-getconstantbufferbyname">ID3D10ShaderReflection::GetConstantBufferByName</a>. This is not a COM interface; therefore, you do not need to worry about reference counts or releasing the interface when you are done with it.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nn-d3d10shader-id3d10shaderreflectionconstantbuffer
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10ShaderReflectionConstantBuffer extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10ShaderReflectionConstantBuffer
     * @type {Guid}
     */
    static IID => Guid("{66c66a94-dddd-4b62-a66a-f0da33c2b4d0}")

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
     * @param {Pointer<D3D10_SHADER_BUFFER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionconstantbuffer-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(0, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10ShaderReflectionVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionconstantbuffer-getvariablebyindex
     */
    GetVariableByIndex(Index) {
        result := ComCall(1, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10ShaderReflectionVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-id3d10shaderreflectionconstantbuffer-getvariablebyname
     */
    GetVariableByName(Name) {
        result := ComCall(2, this, "ptr", Name, "ptr")
        return result
    }
}
