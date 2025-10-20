#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * The sampler-state interface holds a description for sampler state that you can bind to any shader stage of the pipeline for reference by texture sample operations.
 * @remarks
 * 
  * To create a sampler-state object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createsamplerstate">ID3D11Device::CreateSamplerState</a>.
  * 
  * To bind a sampler-state object to any <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-graphics-pipeline">pipeline</a> shader stage, call the following methods:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetsamplers">ID3D11DeviceContext::VSSetSamplers</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-hssetsamplers">ID3D11DeviceContext::HSSetSamplers</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dssetsamplers">ID3D11DeviceContext::DSSetSamplers</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetsamplers">ID3D11DeviceContext::GSSetSamplers</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetsamplers">ID3D11DeviceContext::PSSetSamplers</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cssetsamplers">ID3D11DeviceContext::CSSetSamplers</a>
  * </li>
  * </ul>
  * You can bind the same sampler-state object to multiple shader stages simultaneously.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11samplerstate
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11SamplerState extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11SamplerState
     * @type {Guid}
     */
    static IID => Guid("{da6fea51-564c-4487-9810-f0d0f9b4e3a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc"]

    /**
     * 
     * @param {Pointer<D3D11_SAMPLER_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11samplerstate-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, "ptr", pDesc)
    }
}
