#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIAdapter.ahk
#Include .\IDXGISurface.ahk
#Include .\IDXGIObject.ahk

/**
 * An IDXGIDevice interface implements a derived class for DXGI objects that produce image data.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgidevice
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIDevice extends IDXGIObject{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAdapter", "CreateSurface", "QueryResourceResidency", "SetGPUThreadPriority", "GetGPUThreadPriority"]

    /**
     * Returns the adapter for the specified device.
     * @remarks
     * If the <b>GetAdapter</b> method succeeds, the reference count on the adapter interface will be incremented. To avoid a memory leak, be sure to release the interface when you are finished using it.
     * @returns {IDXGIAdapter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> interface pointer to the adapter.  This parameter must not be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgidevice-getadapter
     */
    GetAdapter() {
        result := ComCall(7, this, "ptr*", &pAdapter := 0, "HRESULT")
        return IDXGIAdapter(pAdapter)
    }

    /**
     * Returns a surface. This method is used internally and you should not call it directly in your application.
     * @remarks
     * The <b>CreateSurface</b> method creates a buffer to exchange data between one or more devices. It is used internally, and you should not directly call it.
     * 
     * The runtime automatically creates an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> interface when it creates a Direct3D resource object that represents a surface. For example, the runtime creates an <b>IDXGISurface</b> interface when it calls <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createtexture2d">ID3D10Device::CreateTexture2D</a> to create a 2D texture. To retrieve the <b>IDXGISurface</b> interface that represents the 2D texture surface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">ID3D11Texture2D::QueryInterface</a> or <b>ID3D10Texture2D::QueryInterface</b>. In this call, you must pass the identifier of <b>IDXGISurface</b>. If the 2D texture has only a single MIP-map level and does not consist of an array of textures, <b>QueryInterface</b> succeeds and returns a pointer to the <b>IDXGISurface</b> interface pointer. Otherwise, <b>QueryInterface</b> fails and does not return the pointer to <b>IDXGISurface</b>.
     * @param {Pointer<DXGI_SURFACE_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_surface_desc">DXGI_SURFACE_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_surface_desc">DXGI_SURFACE_DESC</a> structure that describes the surface.
     * @param {Integer} NumSurfaces Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of surfaces to create.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-usage">DXGI_USAGE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-usage">DXGI_USAGE</a> flag that specifies how the surface is expected to be used.
     * @param {Pointer<DXGI_SHARED_RESOURCE>} pSharedResource Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_shared_resource">DXGI_SHARED_RESOURCE</a>*</b>
     * 
     * An optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_shared_resource">DXGI_SHARED_RESOURCE</a> structure that contains shared resource information for opening views of such resources.
     * @returns {IDXGISurface} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> interface pointer to the first created surface.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgidevice-createsurface
     */
    CreateSurface(pDesc, NumSurfaces, Usage, pSharedResource) {
        result := ComCall(8, this, "ptr", pDesc, "uint", NumSurfaces, "uint", Usage, "ptr", pSharedResource, "ptr*", &ppSurface := 0, "HRESULT")
        return IDXGISurface(ppSurface)
    }

    /**
     * Gets the residency status of an array of resources.
     * @remarks
     * The information returned by the <i>pResidencyStatus</i> argument array describes the residency status at the time that the <b>QueryResourceResidency</b> method was called.  
     *       
     * 
     * <div class="alert"><b>Note</b>  The residency status will constantly change.</div>
     * <div> </div>
     * If you call the <b>QueryResourceResidency</b> method during a device removed state, the <i>pResidencyStatus</i> argument will return the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_residency">DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY</a> flag.
     * 
     * <div class="alert"><b>Note</b>  This method should not be called every frame as it incurs a non-trivial amount of overhead.</div>
     * <div> </div>
     * @param {Pointer<IUnknown>} ppResources Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interfaces.
     * @param {Integer} NumResources Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of resources in the <i>ppResources</i> argument array and <i>pResidencyStatus</i> argument array.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_residency">DXGI_RESIDENCY</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_residency">DXGI_RESIDENCY</a> flags. Each element describes the residency status for corresponding element in 
     *         the <i>ppResources</i> argument array.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgidevice-queryresourceresidency
     */
    QueryResourceResidency(ppResources, NumResources) {
        result := ComCall(9, this, "ptr*", ppResources, "int*", &pResidencyStatus := 0, "uint", NumResources, "HRESULT")
        return pResidencyStatus
    }

    /**
     * Sets the GPU thread priority.
     * @remarks
     * The values for the <i>Priority</i> parameter function as follows:
     * 
     * <ul>
     * <li>Positive values increase the likelihood that the GPU scheduler will grant GPU execution cycles to the device when rendering.</li>
     * <li>Negative values lessen the likelihood that the device will receive GPU execution cycles when devices compete for them.</li>
     * <li>The device is guaranteed to receive some GPU execution cycles at all settings.</li>
     * </ul>
     * To use the <b>SetGPUThreadPriority</b> method, you should have a comprehensive understanding of GPU scheduling. You should profile your application to ensure that it behaves as intended. If used inappropriately, the <b>SetGPUThreadPriority</b> method can impede rendering speed and result in a poor user experience.
     * @param {Integer} Priority Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * A value that specifies the required GPU thread priority. This value must be between -7 and 7, inclusive, where 0 represents normal priority.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Return S_OK if successful; otherwise, returns E_INVALIDARG if the <i>Priority</i> parameter is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgidevice-setgputhreadpriority
     */
    SetGPUThreadPriority(Priority) {
        result := ComCall(10, this, "int", Priority, "HRESULT")
        return result
    }

    /**
     * Gets the GPU thread priority.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a>*</b>
     * 
     * A pointer to a variable that receives a value that indicates the current GPU thread priority. The value will be between -7 and 7, inclusive, where 0 represents normal priority.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgidevice-getgputhreadpriority
     */
    GetGPUThreadPriority() {
        result := ComCall(11, this, "int*", &pPriority := 0, "HRESULT")
        return pPriority
    }
}
