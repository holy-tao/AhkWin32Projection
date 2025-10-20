#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIDeviceSubObject.ahk

/**
 * The IDXGISurface interface implements methods for image-data objects.
 * @remarks
 * 
  * An image-data object is a 2D section of memory, commonly called a surface. To get the surface from an output, call <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getdisplaysurfacedata">IDXGIOutput::GetDisplaySurfaceData</a>. 
  * 
  * Runtimes earlier than Direct3D 12 automatically create an <b>IDXGISurface</b> interface when they create a Direct3D resource object that represents a surface. <b>IDXGISurface</b> interfaces are not supported in Direct3D 12. For example, the runtime creates an <b>IDXGISurface</b> interface when you call <a href="https://docs.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> or <a href="https://docs.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createtexture2d">ID3D10Device::CreateTexture2D</a> to create a 2D texture. To retrieve the <b>IDXGISurface</b> interface that represents the 2D texture surface, call <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">ID3D11Texture2D::QueryInterface</a> or <b>ID3D10Texture2D::QueryInterface</b>. In this call, you must pass the identifier of <b>IDXGISurface</b>. If the 2D texture has only a single MIP-map level and does not consist of an array of textures, <b>QueryInterface</b> succeeds and returns a pointer to the <b>IDXGISurface</b> interface pointer. Otherwise, <b>QueryInterface</b> fails and does not return the pointer to <b>IDXGISurface</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgisurface
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGISurface extends IDXGIDeviceSubObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGISurface
     * @type {Guid}
     */
    static IID => Guid("{cafcb56c-6ac3-4889-bf47-9e23bbd260ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "Map", "Unmap"]

    /**
     * 
     * @param {Pointer<DXGI_SURFACE_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgisurface-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(8, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_MAPPED_RECT>} pLockedRect 
     * @param {Integer} MapFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgisurface-map
     */
    Map(pLockedRect, MapFlags) {
        result := ComCall(9, this, "ptr", pLockedRect, "uint", MapFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgisurface-unmap
     */
    Unmap() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
