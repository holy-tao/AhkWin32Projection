#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIObject.ahk

/**
 * An IDXGIDevice interface implements a derived class for DXGI objects that produce image data.
 * @remarks
 * 
  * The <b>IDXGIDevice</b> interface is designed for use by DXGI objects that need access to other DXGI objects. This interface is useful to
  *           applications that do not use Direct3D to communicate with DXGI.
  *         
  * 
  * The Direct3D create device functions return a Direct3D device object. This Direct3D device object implements the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. You can query this Direct3D device object for the device's
  *           corresponding <b>IDXGIDevice</b> interface. To retrieve the <b>IDXGIDevice</b>  interface of a Direct3D device, use the following code:
  *         
  * 
  * 
  * ```
  * IDXGIDevice * pDXGIDevice;
  * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice), (void **)&pDXGIDevice);
  * 
  * ```
  * 
  * 
  * <b>Windows Phone 8:
  *         </b> This API is supported.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgidevice
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIDevice extends IDXGIObject{
    /**
     * The interface identifier for IDXGIDevice
     * @type {Guid}
     */
    static IID => Guid("{54ec77fa-1377-44e6-8c32-88fd5f44c84c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IDXGIAdapter>} pAdapter 
     * @returns {HRESULT} 
     */
    GetAdapter(pAdapter) {
        result := ComCall(7, this, "ptr", pAdapter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_SURFACE_DESC>} pDesc 
     * @param {Integer} NumSurfaces 
     * @param {Integer} Usage 
     * @param {Pointer<DXGI_SHARED_RESOURCE>} pSharedResource 
     * @param {Pointer<IDXGISurface>} ppSurface 
     * @returns {HRESULT} 
     */
    CreateSurface(pDesc, NumSurfaces, Usage, pSharedResource, ppSurface) {
        result := ComCall(8, this, "ptr", pDesc, "uint", NumSurfaces, "uint", Usage, "ptr", pSharedResource, "ptr", ppSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppResources 
     * @param {Pointer<Int32>} pResidencyStatus 
     * @param {Integer} NumResources 
     * @returns {HRESULT} 
     */
    QueryResourceResidency(ppResources, pResidencyStatus, NumResources) {
        result := ComCall(9, this, "ptr", ppResources, "int*", pResidencyStatus, "uint", NumResources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     */
    SetGPUThreadPriority(Priority) {
        result := ComCall(10, this, "int", Priority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPriority 
     * @returns {HRESULT} 
     */
    GetGPUThreadPriority(pPriority) {
        result := ComCall(11, this, "int*", pPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
