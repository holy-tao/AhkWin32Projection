#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_SURFACE_DESC.ahk
#Include .\DXGI_MAPPED_RECT.ahk
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
     * Get a description of the surface.
     * @returns {DXGI_SURFACE_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_surface_desc">DXGI_SURFACE_DESC</a>*</b>
     * 
     * A pointer to the surface description (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_surface_desc">DXGI_SURFACE_DESC</a>).
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgisurface-getdesc
     */
    GetDesc() {
        pDesc := DXGI_SURFACE_DESC()
        result := ComCall(8, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Get a pointer to the data contained in the surface, and deny GPU access to the surface.
     * @param {Integer} MapFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * CPU read-write flags. These flags can be combined with a logical OR.
     * 
     * 
     * 
     * <ul>
     * <li>DXGI_MAP_READ - Allow CPU read access.</li>
     * <li>DXGI_MAP_WRITE - Allow CPU write access.</li>
     * <li>DXGI_MAP_DISCARD - Discard the previous contents of a resource when it is mapped.</li>
     * </ul>
     * @returns {DXGI_MAPPED_RECT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_mapped_rect">DXGI_MAPPED_RECT</a>*</b>
     * 
     * A pointer to the surface data (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_mapped_rect">DXGI_MAPPED_RECT</a>).
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgisurface-map
     */
    Map(MapFlags) {
        pLockedRect := DXGI_MAPPED_RECT()
        result := ComCall(9, this, "ptr", pLockedRect, "uint", MapFlags, "HRESULT")
        return pLockedRect
    }

    /**
     * Invalidate the pointer to the surface retrieved by IDXGISurface::Map and re-enable GPU access to the resource.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the error codes that are described in the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgisurface-unmap
     */
    Unmap() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
