#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IDXGIDeviceSubObject.ahk

/**
 * An IDXGIResource interface allows resource sharing and identifies the memory that a resource resides in.
 * @remarks
 * 
 * To find out what type of memory a resource is currently located in, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-queryresourceresidency">IDXGIDevice::QueryResourceResidency</a>. To share resources between processes, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-opensharedresource">ID3D10Device::OpenSharedResource</a>. For information about how to share resources between multiple Windows graphics APIs, including Direct3D 11, Direct2D, Direct3D 10, and Direct3D 9Ex, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/surface-sharing-between-windows-graphics-apis">Surface Sharing Between Windows Graphics APIs</a>.
 *           
 * 
 * You can retrieve the <b>IDXGIResource</b>  interface from any video memory resource that you create from a Direct3D 10 and later function. Any Direct3D object that supports <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> also supports <b>IDXGIResource</b>. For example, the Direct3D 2D texture object that you create from <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> supports <b>IDXGIResource</b>. You can call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the 2D texture object (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture2d">ID3D11Texture2D</a>) to retrieve the <b>IDXGIResource</b> interface. For example, to retrieve the <b>IDXGIResource</b>  interface from  the 2D texture object, use the following code.
 *           
 * 
 * 
 * ```
 * IDXGIResource * pDXGIResource;
 * hr = g_pd3dTexture2D->QueryInterface(__uuidof(IDXGIResource), (void **)&pDXGIResource);
 * ```
 * 
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgiresource
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIResource extends IDXGIDeviceSubObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIResource
     * @type {Guid}
     */
    static IID => Guid("{035f3ab4-482e-4e50-b41f-8a7f8bd8960b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSharedHandle", "GetUsage", "SetEvictionPriority", "GetEvictionPriority"]

    /**
     * Gets the handle to a shared resource.
     * @returns {HANDLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * A pointer to a handle.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiresource-getsharedhandle
     */
    GetSharedHandle() {
        pSharedHandle := HANDLE()
        result := ComCall(8, this, "ptr", pSharedHandle, "HRESULT")
        return pSharedHandle
    }

    /**
     * Get the expected resource usage.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-usage">DXGI_USAGE</a>*</b>
     * 
     * A pointer to a usage flag (see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-usage">DXGI_USAGE</a>). For Direct3D 10, a surface can be used as a shader input or a render-target output.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiresource-getusage
     */
    GetUsage() {
        result := ComCall(9, this, "uint*", &pUsage := 0, "HRESULT")
        return pUsage
    }

    /**
     * Set the priority for evicting the resource from memory.
     * @param {Integer} EvictionPriority Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiresource-setevictionpriority
     */
    SetEvictionPriority(EvictionPriority) {
        result := ComCall(10, this, "uint", EvictionPriority, "HRESULT")
        return result
    }

    /**
     * Get the eviction priority.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to the eviction priority, which determines when a resource can be evicted from memory.  
     * 
     * The following defined values are possible.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXGI_RESOURCE_PRIORITY_MINIMUM__0x28000000_"></a><a id="dxgi_resource_priority_minimum__0x28000000_"></a><a id="DXGI_RESOURCE_PRIORITY_MINIMUM__0X28000000_"></a><dl>
     * <dt><b>DXGI_RESOURCE_PRIORITY_MINIMUM (0x28000000)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is unused and can be evicted as soon as another resource requires the memory that the resource occupies.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXGI_RESOURCE_PRIORITY_LOW__0x50000000_"></a><a id="dxgi_resource_priority_low__0x50000000_"></a><a id="DXGI_RESOURCE_PRIORITY_LOW__0X50000000_"></a><dl>
     * <dt><b>DXGI_RESOURCE_PRIORITY_LOW (0x50000000)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The eviction priority of the resource is low. The placement of the resource is not critical, and minimal work is performed to find a location for the resource. For example, if a GPU can render with a vertex buffer from either local or non-local memory with little difference in performance, that vertex buffer is low priority. Other more critical resources (for example, a render target or texture) can then occupy the faster memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXGI_RESOURCE_PRIORITY_NORMAL__0x78000000_"></a><a id="dxgi_resource_priority_normal__0x78000000_"></a><a id="DXGI_RESOURCE_PRIORITY_NORMAL__0X78000000_"></a><dl>
     * <dt><b>DXGI_RESOURCE_PRIORITY_NORMAL (0x78000000)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The eviction priority of the resource is normal. The placement of the resource is important, but not critical, for performance. The resource is placed in its preferred location instead of a low-priority resource. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXGI_RESOURCE_PRIORITY_HIGH__0xa0000000_"></a><a id="dxgi_resource_priority_high__0xa0000000_"></a><a id="DXGI_RESOURCE_PRIORITY_HIGH__0XA0000000_"></a><dl>
     * <dt><b>DXGI_RESOURCE_PRIORITY_HIGH (0xa0000000)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The eviction priority of the resource is high. The resource is placed in its preferred location instead of a low-priority or normal-priority resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXGI_RESOURCE_PRIORITY_MAXIMUM__0xc8000000_"></a><a id="dxgi_resource_priority_maximum__0xc8000000_"></a><a id="DXGI_RESOURCE_PRIORITY_MAXIMUM__0XC8000000_"></a><dl>
     * <dt><b>DXGI_RESOURCE_PRIORITY_MAXIMUM (0xc8000000)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is evicted from memory only if there is no other way of resolving the memory requirement.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiresource-getevictionpriority
     */
    GetEvictionPriority() {
        result := ComCall(11, this, "uint*", &pEvictionPriority := 0, "HRESULT")
        return pEvictionPriority
    }
}
