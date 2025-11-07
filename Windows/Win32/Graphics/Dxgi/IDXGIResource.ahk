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
     * 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiresource-getsharedhandle
     */
    GetSharedHandle() {
        pSharedHandle := HANDLE()
        result := ComCall(8, this, "ptr", pSharedHandle, "HRESULT")
        return pSharedHandle
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiresource-getusage
     */
    GetUsage() {
        result := ComCall(9, this, "uint*", &pUsage := 0, "HRESULT")
        return pUsage
    }

    /**
     * 
     * @param {Integer} EvictionPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiresource-setevictionpriority
     */
    SetEvictionPriority(EvictionPriority) {
        result := ComCall(10, this, "uint", EvictionPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiresource-getevictionpriority
     */
    GetEvictionPriority() {
        result := ComCall(11, this, "uint*", &pEvictionPriority := 0, "HRESULT")
        return pEvictionPriority
    }
}
