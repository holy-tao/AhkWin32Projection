#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10DeviceChild.ahk

/**
 * A view interface specifies the parts of a resource the pipeline can access during rendering (see view).
 * @remarks
 * 
  * A view interface is the base interface for all views. There are three types of views; a depth-stencil view, a render-target view, and a shader-resource view.
  * 
  * <ul>
  * <li>To create a render-target view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createrendertargetview">ID3D10Device::CreateRenderTargetView</a>.</li>
  * <li>To create a depth-stencil view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createdepthstencilview">ID3D10Device::CreateDepthStencilView</a>.</li>
  * <li>To create a shader-resource view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview">ID3D10Device::CreateShaderResourceView</a>.</li>
  * </ul>
  * All resources must be bound to the pipeline before they can be accessed.
  * 
  * <ul>
  * <li>To bind a render-target view or a depth-stencil view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetrendertargets">ID3D10Device::OMSetRenderTargets</a>.</li>
  * <li>To bind a shader-resource view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vssetshaderresources">ID3D10Device::VSSetShaderResources</a>.</li>
  * </ul>
  * A view can also be used to access a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-access-views">typeless resource</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10view
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10View extends ID3D10DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10View
     * @type {Guid}
     */
    static IID => Guid("{c902b03f-60a7-49ba-9936-2a3ab37a7e33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResource"]

    /**
     * 
     * @param {Pointer<ID3D10Resource>} ppResource 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10view-getresource
     */
    GetResource(ppResource) {
        ComCall(7, this, "ptr*", ppResource)
    }
}
