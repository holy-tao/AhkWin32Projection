#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Provides methods to monitor and debug a command queue.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugcommandqueue
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DebugCommandQueue extends IUnknown {
    /**
     * The interface identifier for ID3D12DebugCommandQueue
     * @type {Guid}
     */
    static IID := Guid("{09e0bf36-54ac-484f-8847-4baeeab6053a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DebugCommandQueue interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AssertResourceState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DebugCommandQueue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Checks whether a resource, or subresource, is in a specified state, or not. (ID3D12DebugCommandQueue.AssertResourceState)
     * @remarks
     * This method is very similar to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist-assertresourcestate">ID3D12DebugCommandList::AssertResourceState</a>, however there are methods on the command queue that work directly with resources that might need to be monitored (for example <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-copytilemappings">ID3D12CommandQueue::CopyTileMappings</a>).
     * @param {ID3D12Resource} pResource Type: <b>ID3D12Resource*</b>
     * 
     * Specifies the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> to check.
     * @param {Integer} Subresource Type: <b>UINT</b>
     * 
     * The index of the subresource to check.
     *           This can be set to an index, or D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES.
     * @param {Integer} State Type: <b>UINT</b>
     * 
     * Specifies the state to check for. This can be one or more D3D12_RESOURCE_STATES flags Or'ed together.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * This method returns true if the resource or subresource is in the specified state, false otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandqueue-assertresourcestate
     */
    AssertResourceState(pResource, Subresource, State) {
        result := ComCall(3, this, "ptr", pResource, "uint", Subresource, "uint", State, BOOL)
        return result
    }

    Query(iid) {
        if (ID3D12DebugCommandQueue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AssertResourceState := CallbackCreate(GetMethod(implObj, "AssertResourceState"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AssertResourceState)
    }
}
