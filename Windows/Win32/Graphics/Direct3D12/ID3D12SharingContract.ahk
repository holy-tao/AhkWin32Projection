#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12Fence.ahk" { ID3D12Fence }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Part of a contract between D3D11On12 diagnostic layers and graphics diagnostics tools.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12sharingcontract
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12SharingContract extends IUnknown {
    /**
     * The interface identifier for ID3D12SharingContract
     * @type {Guid}
     */
    static IID := Guid("{0adf7d52-929c-4e61-addb-ffed30de66ef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12SharingContract interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Present             : IntPtr
        SharedFenceSignal   : IntPtr
        BeginCapturableWork : IntPtr
        EndCapturableWork   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12SharingContract.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Shares a resource (or subresource) between the D3D layers and diagnostics tools.
     * @param {ID3D12Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * A pointer to the resource that contains the final frame contents. This resource is treated as the *back buffer* of the **Present**.
     * @param {Integer} Subresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned 32bit subresource id.
     * @param {HWND} window If provided, indicates which window the tools should use for displaying additional diagnostic information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12sharingcontract-present
     */
    Present(pResource, Subresource, window) {
        ComCall(3, this, "ptr", pResource, "uint", Subresource, HWND, window)
    }

    /**
     * Signals a shared fence between the D3D layers and diagnostics tools.
     * @param {ID3D12Fence} pFence Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a>*</b>
     * 
     * A pointer to the shared fence to signal.
     * @param {Integer} FenceValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * An unsigned 64bit value to signal the shared fence with.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12sharingcontract-sharedfencesignal
     */
    SharedFenceSignal(pFence, FenceValue) {
        ComCall(4, this, "ptr", pFence, "uint", FenceValue)
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {String} Nothing - always returns an empty string
     */
    BeginCapturableWork(guid) {
        ComCall(5, this, Guid.Ptr, guid)
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {String} Nothing - always returns an empty string
     */
    EndCapturableWork(guid) {
        ComCall(6, this, Guid.Ptr, guid)
    }

    Query(iid) {
        if (ID3D12SharingContract.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Present := CallbackCreate(GetMethod(implObj, "Present"), flags, 4)
        this.vtbl.SharedFenceSignal := CallbackCreate(GetMethod(implObj, "SharedFenceSignal"), flags, 3)
        this.vtbl.BeginCapturableWork := CallbackCreate(GetMethod(implObj, "BeginCapturableWork"), flags, 2)
        this.vtbl.EndCapturableWork := CallbackCreate(GetMethod(implObj, "EndCapturableWork"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Present)
        CallbackFree(this.vtbl.SharedFenceSignal)
        CallbackFree(this.vtbl.BeginCapturableWork)
        CallbackFree(this.vtbl.EndCapturableWork)
    }
}
