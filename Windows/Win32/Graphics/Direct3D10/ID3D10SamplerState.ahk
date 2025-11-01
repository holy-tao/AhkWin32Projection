#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10DeviceChild.ahk

/**
 * A sampler-state interface accesses sampler state for a texture.
 * @remarks
 * 
  * Create a sampler-state object by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createsamplerstate">ID3D10Device::CreateSamplerState</a>.
  * 
  * To initialize sampler state, bind the sampler-state object to the pipeline by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vssetsamplers">ID3D10Device::VSSetSamplers</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gssetsamplers">ID3D10Device::GSSetSamplers</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-pssetsamplers">ID3D10Device::PSSetSamplers</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10samplerstate
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10SamplerState extends ID3D10DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10SamplerState
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c0c-342c-4106-a19f-4f2704f689f0}")

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
     * @param {Pointer<D3D10_SAMPLER_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10samplerstate-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, "ptr", pDesc)
    }
}
