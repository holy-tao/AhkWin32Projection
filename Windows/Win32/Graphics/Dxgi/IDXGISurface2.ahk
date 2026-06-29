#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDXGISurface1.ahk" { IDXGISurface1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IDXGISurface2 interface extends the IDXGISurface1 interface by adding support for subresource surfaces and getting a handle to a shared resource.
 * @remarks
 * An image-data object is a 2D section of memory, commonly called a surface. To get the surface from an output, call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-getdisplaysurfacedata">IDXGIOutput::GetDisplaySurfaceData</a>. Then, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> object that <b>IDXGIOutput::GetDisplaySurfaceData</b> returns to retrieve the <b>IDXGISurface2</b> interface.
 * 
 * Any object that supports <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> also supports <b>IDXGISurface2</b>.
 * 
 * The runtime automatically creates an <b>IDXGISurface2</b> interface when it creates a Direct3D resource object that represents a surface. For example, the runtime creates an <b>IDXGISurface2</b> interface when you call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> to create a 2D texture. To retrieve the <b>IDXGISurface2</b> interface that represents the 2D texture surface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">ID3D11Texture2D::QueryInterface</a>. In this call, you must pass the identifier of <b>IDXGISurface2</b>. If the 2D texture has only a single MIP-map level and does not consist of an array of textures, <b>QueryInterface</b> succeeds and returns a pointer to the <b>IDXGISurface2</b> interface pointer. Otherwise, <b>QueryInterface</b> fails and does not return the pointer to <b>IDXGISurface2</b>.
 * 
 * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiresource1-createsubresourcesurface">IDXGIResource1::CreateSubresourceSurface</a> method to create an <b>IDXGISurface2</b> interface that refers to one subresource of a stereo resource.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgisurface2
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGISurface2 extends IDXGISurface1 {
    /**
     * The interface identifier for IDXGISurface2
     * @type {Guid}
     */
    static IID := Guid("{aba496dd-b617-4cb8-a866-bc44d7eb1fa2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGISurface2 interfaces
    */
    struct Vtbl extends IDXGISurface1.Vtbl {
        GetResource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGISurface2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the parent resource and subresource index that support a subresource surface.
     * @remarks
     * For subresource surface objects that the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiresource1-createsubresourcesurface">IDXGIResource1::CreateSubresourceSurface</a> method creates, <b>GetResource</b> simply returns the values that were used to create the subresource surface.
     * 
     * Current objects that implement <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> are either resources or views.  <b>GetResource</b> for these objects returns “this” or the resource that supports the view respectively.  In this situation, the subresource index is 0.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID)  of the requested interface type.
     * @param {Pointer<Pointer<Void>>} ppParentResource A pointer to a buffer that receives a pointer to the parent resource object for the subresource surface.
     * @param {Pointer<Integer>} pSubresourceIndex A pointer to a variable that receives the index of the subresource surface.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns one of the following values:
     * 
     * <ul>
     * <li>E_NOINTERFACE if the object does not implement the GUID that the <i>riid</i> parameter specifies.</li>
     * <li>Possibly other error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgisurface2-getresource
     */
    GetResource(riid, ppParentResource, pSubresourceIndex) {
        ppParentResourceMarshal := ppParentResource is VarRef ? "ptr*" : "ptr"
        pSubresourceIndexMarshal := pSubresourceIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, Guid.Ptr, riid, ppParentResourceMarshal, ppParentResource, pSubresourceIndexMarshal, pSubresourceIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDXGISurface2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetResource := CallbackCreate(GetMethod(implObj, "GetResource"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetResource)
    }
}
