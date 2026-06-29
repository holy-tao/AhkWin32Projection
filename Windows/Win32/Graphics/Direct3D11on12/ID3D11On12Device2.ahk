#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Direct3D11\ID3D11Resource.ahk" { ID3D11Resource }
#Import "..\Direct3D12\ID3D12Fence.ahk" { ID3D12Fence }
#Import "..\Direct3D12\ID3D12CommandQueue.ahk" { ID3D12CommandQueue }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D11On12Device1.ahk" { ID3D11On12Device1 }

/**
 * Enables you to take resources created through the Direct3D 11 APIs, and use them in Direct3D 12.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nn-d3d11on12-id3d11on12device2
 * @namespace Windows.Win32.Graphics.Direct3D11on12
 */
export default struct ID3D11On12Device2 extends ID3D11On12Device1 {
    /**
     * The interface identifier for ID3D11On12Device2
     * @type {Guid}
     */
    static IID := Guid("{dc90f331-4740-43fa-866e-67f12cb58223}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11On12Device2 interfaces
    */
    struct Vtbl extends ID3D11On12Device1.Vtbl {
        UnwrapUnderlyingResource : IntPtr
        ReturnUnderlyingResource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11On12Device2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Unwraps a Direct3D 11 resource object, and retrieves it as a Direct3D 12 resource object.
     * @remarks
     * The resource is transitioned to **D3D12_RESOURCE_STATE_COMMON** (if it wasn't already in that state), and appropriate waits are inserted into the command queue (*pCommandQueue*).
     * 
     * There are some restrictions on what can be unwrapped: no keyed mutex resources, no GDI-compatible resources, and no buffers. However, you can use **UnwrapUnderlyingResource** to unwrap resources created through the **[ID3D11On12Device::CreateWrappedResource](./nf-d3d11on12-id3d11on12device-createwrappedresource.md)** method, as well as resources created through [ID3D11Device::CreateTexture2D](../d3d11/nf-d3d11-id3d11device-createtexture2d.md).
     * 
     * In general, you must return the object to Direct3D11on12 before using it again in Direct3D 11 (see [ID3D11On12Device2::ReturnUnderlyingResource](nf-d3d11on12-id3d11on12device2-returnunderlyingresource.md)).
     * 
     * You can also use **UnwrapUnderlyingResource** to unwrap a swapchain buffer. You must also return the resource to Direct3D11on12 before calling **Present** (or otherwise using the resource).
     * 
     * Unwrapping a resource checks out the resource from the Direct3D11On12 translation layer. You may not schedule any translation layer usage (through either version of the API) while the resource is checked out. Check the resource back in (also known as *returning* the resource) with [ID3D11On12Device2::ReturnUnderlyingResource](nf-d3d11on12-id3d11on12device2-returnunderlyingresource.md).
     * 
     * **UnwrapUnderlyingResource** doesn't flush, and it may schedule GPU work. You should flush after calling **UnwrapUnderlyingResource** if you externally wait for completion.
     * @param {ID3D11Resource} pResource11 Type: **[ID3D11Resource](../d3d11/nn-d3d11-id3d11resource.md)\***
     * 
     * The Direct3D 11 resource object to unwrap.
     * @param {ID3D12CommandQueue} pCommandQueue Type: **[ID3D12CommandQueue](../d3d12/nn-d3d12-id3d12commandqueue.md)\***
     * 
     * The command queue on which your application plans to use the resource. Any pending work accessing the resource causes fence waits to be scheduled on this queue. You can then queue further work on this queue, including a signal on a caller-owned fence.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in `ppvResource12`.
     * @returns {Pointer<Void>} Type: **[void](/windows/desktop/winprog/windows-data-types)\*\***
     * 
     * A pointer to a memory block that receives a pointer to the Direct3D 12 resource.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-id3d11on12device2-unwrapunderlyingresource
     */
    UnwrapUnderlyingResource(pResource11, pCommandQueue, riid) {
        result := ComCall(7, this, "ptr", pResource11, "ptr", pCommandQueue, Guid.Ptr, riid, "ptr*", &ppvResource12 := 0, "HRESULT")
        return ppvResource12
    }

    /**
     * With this method, you can return a Direct3D 11 resource object to Direct3D11On12, and indicate when the resource will be ready to consume.
     * @remarks
     * When you return a resource, you provide a set of fences and fence signal values whose completion indicates that the resource is back in the **D3D12_RESOURCE_STATE_COMMON** state, and ready for Direct3D11On12 to consume it.
     * 
     * In the parallel arrays *pSignalValues* and *ppFences*, include any pending work against the resource. The Direct3D11On12 translation layer defers the waits for these arguments until work is scheduled against the resource.
     * @param {ID3D11Resource} pResource11 Type: **[ID3D11Resource](../d3d11/nn-d3d11-id3d11resource.md)\***
     * 
     * The Direct3D 11 resource object that you wish to return.
     * @param {Integer} NumSync Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of elements in the arrays pointed to by *pSignalValues* and *ppFences*.
     * @param {Pointer<Integer>} pSignalValues Type: **[UINT64](/windows/win32/winprog/windows-data-types)\***
     * 
     * A pointer to an array of fence signal values.
     * @param {Pointer<ID3D12Fence>} ppFences Type: **[ID3D12Fence](../d3d12/nn-d3d12-id3d12fence.md)\*\***
     * 
     * A pointer to an array of fence objects.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [HRESULT](/windows/desktop/com/structure-of-com-error-codes) [error code](/windows/desktop/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-id3d11on12device2-returnunderlyingresource
     */
    ReturnUnderlyingResource(pResource11, NumSync, pSignalValues, ppFences) {
        pSignalValuesMarshal := pSignalValues is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pResource11, "uint", NumSync, pSignalValuesMarshal, pSignalValues, ID3D12Fence.Ptr, ppFences, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D11On12Device2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UnwrapUnderlyingResource := CallbackCreate(GetMethod(implObj, "UnwrapUnderlyingResource"), flags, 5)
        this.vtbl.ReturnUnderlyingResource := CallbackCreate(GetMethod(implObj, "ReturnUnderlyingResource"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UnwrapUnderlyingResource)
        CallbackFree(this.vtbl.ReturnUnderlyingResource)
    }
}
