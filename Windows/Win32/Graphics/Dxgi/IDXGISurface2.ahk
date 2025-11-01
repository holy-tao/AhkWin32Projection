#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGISurface1.ahk

/**
 * The IDXGISurface2 interface extends the IDXGISurface1 interface by adding support for subresource surfaces and getting a handle to a shared resource.
 * @remarks
 * 
  * An image-data object is a 2D section of memory, commonly called a surface. To get the surface from an output, call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-getdisplaysurfacedata">IDXGIOutput::GetDisplaySurfaceData</a>. Then, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> object that <b>IDXGIOutput::GetDisplaySurfaceData</b> returns to retrieve the <b>IDXGISurface2</b> interface.
  * 
  * Any object that supports <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> also supports <b>IDXGISurface2</b>.
  * 
  * The runtime automatically creates an <b>IDXGISurface2</b> interface when it creates a Direct3D resource object that represents a surface. For example, the runtime creates an <b>IDXGISurface2</b> interface when you call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> to create a 2D texture. To retrieve the <b>IDXGISurface2</b> interface that represents the 2D texture surface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">ID3D11Texture2D::QueryInterface</a>. In this call, you must pass the identifier of <b>IDXGISurface2</b>. If the 2D texture has only a single MIP-map level and does not consist of an array of textures, <b>QueryInterface</b> succeeds and returns a pointer to the <b>IDXGISurface2</b> interface pointer. Otherwise, <b>QueryInterface</b> fails and does not return the pointer to <b>IDXGISurface2</b>.
  * 
  * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiresource1-createsubresourcesurface">IDXGIResource1::CreateSubresourceSurface</a> method to create an <b>IDXGISurface2</b> interface that refers to one subresource of a stereo resource.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgisurface2
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGISurface2 extends IDXGISurface1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGISurface2
     * @type {Guid}
     */
    static IID => Guid("{aba496dd-b617-4cb8-a866-bc44d7eb1fa2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResource"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppParentResource 
     * @param {Pointer<Integer>} pSubresourceIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgisurface2-getresource
     */
    GetResource(riid, ppParentResource, pSubresourceIndex) {
        result := ComCall(13, this, "ptr", riid, "ptr*", ppParentResource, "uint*", pSubresourceIndex, "HRESULT")
        return result
    }
}
