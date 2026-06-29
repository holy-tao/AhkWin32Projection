#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDXGIDeviceSubObject.ahk" { IDXGIDeviceSubObject }
#Import ".\DXGI_MAPPED_RECT.ahk" { DXGI_MAPPED_RECT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXGI_MAP_FLAGS.ahk" { DXGI_MAP_FLAGS }
#Import ".\DXGI_SURFACE_DESC.ahk" { DXGI_SURFACE_DESC }

/**
 * The IDXGISurface interface implements methods for image-data objects.
 * @remarks
 * An image-data object is a 2D section of memory, commonly called a surface. To get the surface from an output, call <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgioutput-getdisplaysurfacedata">IDXGIOutput::GetDisplaySurfaceData</a>. 
 * 
 * Runtimes earlier than Direct3D 12 automatically create an <b>IDXGISurface</b> interface when they create a Direct3D resource object that represents a surface. <b>IDXGISurface</b> interfaces are not supported in Direct3D 12. For example, the runtime creates an <b>IDXGISurface</b> interface when you call <a href="https://docs.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> or <a href="https://docs.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10device-createtexture2d">ID3D10Device::CreateTexture2D</a> to create a 2D texture. To retrieve the <b>IDXGISurface</b> interface that represents the 2D texture surface, call <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">ID3D11Texture2D::QueryInterface</a> or <b>ID3D10Texture2D::QueryInterface</b>. In this call, you must pass the identifier of <b>IDXGISurface</b>. If the 2D texture has only a single MIP-map level and does not consist of an array of textures, <b>QueryInterface</b> succeeds and returns a pointer to the <b>IDXGISurface</b> interface pointer. Otherwise, <b>QueryInterface</b> fails and does not return the pointer to <b>IDXGISurface</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgisurface
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGISurface extends IDXGIDeviceSubObject {
    /**
     * The interface identifier for IDXGISurface
     * @type {Guid}
     */
    static IID := Guid("{cafcb56c-6ac3-4889-bf47-9e23bbd260ec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGISurface interfaces
    */
    struct Vtbl extends IDXGIDeviceSubObject.Vtbl {
        GetDesc : IntPtr
        Map     : IntPtr
        Unmap   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGISurface.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a description of the surface.
     * @returns {DXGI_SURFACE_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_surface_desc">DXGI_SURFACE_DESC</a>*</b>
     * 
     * A pointer to the surface description (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_surface_desc">DXGI_SURFACE_DESC</a>).
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgisurface-getdesc
     */
    GetDesc() {
        pDesc := DXGI_SURFACE_DESC()
        result := ComCall(8, this, DXGI_SURFACE_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Get a pointer to the data contained in the surface, and deny GPU access to the surface.
     * @remarks
     * Use <b>IDXGISurface::Map</b> to access a surface from the CPU. To release a mapped surface (and allow GPU access) call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgisurface-unmap">IDXGISurface::Unmap</a>.
     * @param {DXGI_MAP_FLAGS} MapFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgisurface-map
     */
    Map(MapFlags) {
        pLockedRect := DXGI_MAPPED_RECT()
        result := ComCall(9, this, DXGI_MAPPED_RECT.Ptr, pLockedRect, DXGI_MAP_FLAGS, MapFlags, "HRESULT")
        return pLockedRect
    }

    /**
     * Invalidate the pointer to the surface retrieved by IDXGISurface::Map and re-enable GPU access to the resource.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgisurface-unmap
     */
    Unmap() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDXGISurface.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
        this.vtbl.Map := CallbackCreate(GetMethod(implObj, "Map"), flags, 3)
        this.vtbl.Unmap := CallbackCreate(GetMethod(implObj, "Unmap"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
        CallbackFree(this.vtbl.Map)
        CallbackFree(this.vtbl.Unmap)
    }
}
