#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * Represents the allocations of storage for graphics processing unit (GPU) commands.
 * @remarks
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommandallocator">ID3D12Device::CreateCommandAllocator</a> to create a command allocator object. 
 * 
 * The command allocator object corresponds to the underlying allocations in which GPU commands are stored.  The command allocator object applies to both direct command lists and bundles.  You must use a command allocator object in a DirectX 12 app.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12commandallocator
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12CommandAllocator extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12CommandAllocator
     * @type {Guid}
     */
    static IID := Guid("{6102dee4-af59-4b09-b999-b44d73f09b24}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12CommandAllocator interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
        Reset : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12CommandAllocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates to re-use the memory that is associated with the command allocator.
     * @remarks
     * Apps call <b>Reset</b> to re-use the memory that is associated with a command allocator.  From this call to <b>Reset</b>, the runtime and driver determine that the graphics processing unit (GPU) is no longer executing any command lists that have recorded commands with the command allocator.
     * 
     * Unlike <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-reset">ID3D12GraphicsCommandList::Reset</a>, it is not recommended that you call <b>Reset</b>  on the command allocator while a command list is still being executed. 
     * 
     * The debug layer will issue a warning if it can't prove that there are no pending GPU references to command lists that have recorded commands in the allocator.
     * 
     * The debug layer will issue an error if <b>Reset</b> is called concurrently by multiple threads (on the same allocator object).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns <b>E_FAIL</b> if there is an actively recording command list referencing the command allocator.  The debug layer will also issue an error in this case.  
     *         See <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a> for other possible return values.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandallocator-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12CommandAllocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reset)
    }
}
