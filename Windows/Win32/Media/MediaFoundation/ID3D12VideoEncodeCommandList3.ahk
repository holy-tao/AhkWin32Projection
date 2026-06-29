#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12VideoEncodeCommandList2.ahk" { ID3D12VideoEncodeCommandList2 }
#Import "..\..\Graphics\Direct3D12\D3D12_BARRIER_GROUP.ahk" { D3D12_BARRIER_GROUP }

/**
 * Encapsulates a list of graphics commands for video encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videoencodecommandlist3
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoEncodeCommandList3 extends ID3D12VideoEncodeCommandList2 {
    /**
     * The interface identifier for ID3D12VideoEncodeCommandList3
     * @type {Guid}
     */
    static IID := Guid("{7f027b22-1515-4e85-aa0d-026486580576}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoEncodeCommandList3 interfaces
    */
    struct Vtbl extends ID3D12VideoEncodeCommandList2.Vtbl {
        Barrier : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoEncodeCommandList3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a collection of barriers into a video encode command list recording.
     * @param {Integer} NumBarrierGroups Number of barrier groups pointed to by *pBarrierGroups*.
     * @param {Pointer<D3D12_BARRIER_GROUP>} pBarrierGroups Pointer to an array of [D3D12_BARRIER_GROUP](/windows/win32/api/d3d12/ns-d3d12-d3d12_barrier_group) objects.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencodecommandlist3-barrier
     */
    Barrier(NumBarrierGroups, pBarrierGroups) {
        ComCall(29, this, "uint", NumBarrierGroups, D3D12_BARRIER_GROUP.Ptr, pBarrierGroups)
    }

    Query(iid) {
        if (ID3D12VideoEncodeCommandList3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Barrier := CallbackCreate(GetMethod(implObj, "Barrier"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Barrier)
    }
}
