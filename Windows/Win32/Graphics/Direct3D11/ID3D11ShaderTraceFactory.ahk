#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An ID3D11ShaderTraceFactory interface implements a method for generating shader trace information objects.
 * @remarks
 * 
  * These APIs require the Windows Software Development Kit (SDK) for Windows 8.
  * 
  * To retrieve an instance of <b>ID3D11ShaderTraceFactory</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> on a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> that you created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_DEBUGGABLE</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shadertracing/nn-d3d11shadertracing-id3d11shadertracefactory
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11ShaderTraceFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11ShaderTraceFactory
     * @type {Guid}
     */
    static IID => Guid("{1fbad429-66ab-41cc-9617-667ac10e4459}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateShaderTrace"]

    /**
     * 
     * @param {IUnknown} pShader 
     * @param {Pointer<D3D11_SHADER_TRACE_DESC>} pTraceDesc 
     * @param {Pointer<ID3D11ShaderTrace>} ppShaderTrace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nf-d3d11shadertracing-id3d11shadertracefactory-createshadertrace
     */
    CreateShaderTrace(pShader, pTraceDesc, ppShaderTrace) {
        result := ComCall(3, this, "ptr", pShader, "ptr", pTraceDesc, "ptr*", ppShaderTrace, "HRESULT")
        return result
    }
}
