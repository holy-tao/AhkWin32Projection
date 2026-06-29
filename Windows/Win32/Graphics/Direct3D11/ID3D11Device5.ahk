#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_FENCE_FLAG.ahk" { D3D11_FENCE_FLAG }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\ID3D11Device4.ahk" { ID3D11Device4 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device5 adds new methods to those in ID3D11Device4.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nn-d3d11_4-id3d11device5
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11Device5 extends ID3D11Device4 {
    /**
     * The interface identifier for ID3D11Device5
     * @type {Guid}
     */
    static IID := Guid("{8ffde202-a0e7-45df-9e01-e837801b5ea0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11Device5 interfaces
    */
    struct Vtbl extends ID3D11Device4.Vtbl {
        OpenSharedFence : IntPtr
        CreateFence     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11Device5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Opens a handle for a shared fence by using HANDLE and REFIID.
     * @param {HANDLE} hFence Type: <b>HANDLE</b>
     * 
     * The handle that was returned by a call to <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11fence-createsharedhandle">ID3D11Fence::CreateSharedHandle</a> or <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createsharedhandle">ID3D12Device::CreateSharedHandle</a>.
     * @param {Pointer<Guid>} ReturnedInterface Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a> interface. The <b>REFIID</b>, or <b>GUID</b>, of the interface can be obtained by using the __uuidof() macro. For example, __uuidof(ID3D11Fence) will get the <b>GUID</b> of the interface to the fence.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11device5-opensharedfence
     */
    OpenSharedFence(hFence, ReturnedInterface) {
        result := ComCall(67, this, HANDLE, hFence, Guid.Ptr, ReturnedInterface, "ptr*", &ppFence := 0, "HRESULT")
        return ppFence
    }

    /**
     * Creates a fence object. (ID3D11Device5.CreateFence)
     * @param {Integer} InitialValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The initial value for the fence.
     * @param {D3D11_FENCE_FLAG} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ne-d3d11_3-d3d11_fence_flag">D3D11_FENCE_FLAG</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ne-d3d11_3-d3d11_fence_flag">D3D11_FENCE_FLAG</a>-typed values that are combined by using a bitwise OR operation. 
     *             The resulting value specifies options for the fence.
     * @param {Pointer<Guid>} ReturnedInterface Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the fence interface (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a>).
     *             The <b>REFIID</b>, or <b>GUID</b>, of the interface to the fence can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(ID3D11Fence) will get the <b>GUID</b> of the interface to a fence.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a> interface that is used to access the fence.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11device5-createfence
     */
    CreateFence(InitialValue, Flags, ReturnedInterface) {
        result := ComCall(68, this, "uint", InitialValue, D3D11_FENCE_FLAG, Flags, Guid.Ptr, ReturnedInterface, "ptr*", &ppFence := 0, "HRESULT")
        return ppFence
    }

    Query(iid) {
        if (ID3D11Device5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OpenSharedFence := CallbackCreate(GetMethod(implObj, "OpenSharedFence"), flags, 4)
        this.vtbl.CreateFence := CallbackCreate(GetMethod(implObj, "CreateFence"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OpenSharedFence)
        CallbackFree(this.vtbl.CreateFence)
    }
}
