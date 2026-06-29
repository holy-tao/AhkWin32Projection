#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_FENCE_FLAGS.ahk" { D3D12_FENCE_FLAGS }
#Import ".\ID3D12Fence.ahk" { ID3D12Fence }

/**
 * Represents a fence. This interface extends ID3D12Fence, and supports the retrieval of the flags used to create the original fence.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12fence1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Fence1 extends ID3D12Fence {
    /**
     * The interface identifier for ID3D12Fence1
     * @type {Guid}
     */
    static IID := Guid("{433685fe-e22b-4ca0-a8db-b5b4f4dd0e4a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Fence1 interfaces
    */
    struct Vtbl extends ID3D12Fence.Vtbl {
        GetCreationFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Fence1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the flags used to create the fence represented by the current instance.
     * @remarks
     * The flags returned by <b>GetCreationFlags</b> are used mainly for opening a shared fence.
     * @returns {D3D12_FENCE_FLAGS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_fence_flags">D3D12_FENCE_FLAGS</a></b>
     * 
     * The flags used to create the fence.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12fence1-getcreationflags
     */
    GetCreationFlags() {
        result := ComCall(11, this, D3D12_FENCE_FLAGS)
        return result
    }

    Query(iid) {
        if (ID3D12Fence1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCreationFlags := CallbackCreate(GetMethod(implObj, "GetCreationFlags"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCreationFlags)
    }
}
