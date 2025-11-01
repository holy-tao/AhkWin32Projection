#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10DeviceChild.ahk

/**
 * A depth-stencil-state interface accesses depth-stencil state which sets up the depth-stencil test for the output-merger stage.
 * @remarks
 * 
  * Create a depth-stencil state object by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createdepthstencilstate">ID3D10Device::CreateDepthStencilState</a>.
  * 
  * To initialize depth-stencil state, bind the depth-stencil-state object to the pipeline by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetdepthstencilstate">ID3D10Device::OMSetDepthStencilState</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10depthstencilstate
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10DepthStencilState extends ID3D10DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10DepthStencilState
     * @type {Guid}
     */
    static IID => Guid("{2b4b1cc8-a4ad-41f8-8322-ca86fc3ec675}")

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
     * @param {Pointer<D3D10_DEPTH_STENCIL_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10depthstencilstate-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, "ptr", pDesc)
    }
}
