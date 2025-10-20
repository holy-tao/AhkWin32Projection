#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIResource.ahk

/**
 * An IDXGIResource1 interface extends the IDXGIResource interface by adding support for creating a subresource surface object and for creating a handle to a shared resource.
 * @remarks
 * 
  * To determine the type of memory a resource is currently located in, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-queryresourceresidency">IDXGIDevice::QueryResourceResidency</a>. 
  *           To share resources between processes, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-opensharedresource1">ID3D11Device1::OpenSharedResource1</a>. 
  *           For information about how to share resources between multiple Windows graphics APIs, including Direct3D 11, Direct2D, Direct3D 10, and Direct3D 9Ex, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/surface-sharing-between-windows-graphics-apis">Surface Sharing Between Windows Graphics APIs</a>.
  *         
  * 
  * You can retrieve the <b>IDXGIResource1</b> interface from any video memory resource that you create from a Direct3D 10 and later function. Any Direct3D object that supports <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> also supports <b>IDXGIResource1</b>. For example, the Direct3D 2D texture object that you create from <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> supports <b>IDXGIResource1</b>. You can call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the 2D texture object (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture2d">ID3D11Texture2D</a>) to retrieve the <b>IDXGIResource1</b> interface. For example, to retrieve the <b>IDXGIResource1</b>  interface from  the 2D texture object, use the following code.
  *         
  * 
  * 
  * ```
  * IDXGIResource1 * pDXGIResource;
  * hr = g_pd3dTexture2D->QueryInterface(__uuidof(IDXGIResource1), (void **)&pDXGIResource);
  * ```
  * 
  * 
  * <b>Windows Phone 8:
  *         </b> This API is supported.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgiresource1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIResource1 extends IDXGIResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIResource1
     * @type {Guid}
     */
    static IID => Guid("{30961379-4609-4a41-998e-54fe567ee0c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSubresourceSurface", "CreateSharedHandle"]

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDXGISurface2>} ppSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiresource1-createsubresourcesurface
     */
    CreateSubresourceSurface(index, ppSurface) {
        result := ComCall(12, this, "uint", index, "ptr*", ppSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SECURITY_ATTRIBUTES>} pAttributes 
     * @param {Integer} dwAccess 
     * @param {PWSTR} lpName 
     * @param {Pointer<HANDLE>} pHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiresource1-createsharedhandle
     */
    CreateSharedHandle(pAttributes, dwAccess, lpName, pHandle) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := ComCall(13, this, "ptr", pAttributes, "uint", dwAccess, "ptr", lpName, "ptr", pHandle, "HRESULT")
        return result
    }
}
