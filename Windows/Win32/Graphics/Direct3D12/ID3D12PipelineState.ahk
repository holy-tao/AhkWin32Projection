#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D\ID3DBlob.ahk" { ID3DBlob }
#Import ".\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * Represents the state of all currently set shaders as well as certain fixed function state objects.
 * @remarks
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-creategraphicspipelinestate">ID3D12Device::CreateGraphicsPipelineState</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcomputepipelinestate">ID3D12Device::CreateComputePipelineState</a> to create a pipeline state object (PSO). 
 * 
 * A pipeline state object corresponds to a significant portion of the state of the graphics processing unit (GPU).  This state includes all currently set shaders and certain fixed function state objects.  The only way to change states contained within the pipeline object is to change the currently bound pipeline object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12pipelinestate
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12PipelineState extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12PipelineState
     * @type {Guid}
     */
    static IID := Guid("{765a30f3-f624-4c6f-a828-ace948622445}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12PipelineState interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
        GetCachedBlob : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12PipelineState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the cached blob representing the pipeline state.
     * @remarks
     * Refer to the remarks for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cached_pipeline_state">D3D12_CACHED_PIPELINE_STATE</a>.
     * @returns {ID3DBlob} Type: <b>ID3DBlob**</b>
     * 
     * After this method returns, points to the cached blob representing the pipeline state.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinestate-getcachedblob
     */
    GetCachedBlob() {
        result := ComCall(8, this, "ptr*", &ppBlob := 0, "HRESULT")
        return ID3DBlob(ppBlob)
    }

    Query(iid) {
        if (ID3D12PipelineState.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCachedBlob := CallbackCreate(GetMethod(implObj, "GetCachedBlob"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCachedBlob)
    }
}
