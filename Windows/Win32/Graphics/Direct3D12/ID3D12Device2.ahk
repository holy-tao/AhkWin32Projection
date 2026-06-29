#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_PIPELINE_STATE_STREAM_DESC.ahk" { D3D12_PIPELINE_STATE_STREAM_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12Device1.ahk" { ID3D12Device1 }

/**
 * Represents a virtual adapter. This interface extends ID3D12Device1 to create pipeline state objects from pipeline state stream descriptions.
 * @remarks
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createdevice">D3D12CreateDevice</a> to create a device.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device2
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Device2 extends ID3D12Device1 {
    /**
     * The interface identifier for ID3D12Device2
     * @type {Guid}
     */
    static IID := Guid("{30baa41e-b15b-475c-a0bb-1af5c5b64328}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Device2 interfaces
    */
    struct Vtbl extends ID3D12Device1.Vtbl {
        CreatePipelineState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Device2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a pipeline state object from a pipeline state stream description.
     * @remarks
     * This function takes the pipeline description as a <a href="../d3d12/ns-d3d12-d3d12_pipeline_state_stream_desc.md">D3D12_PIPELINE_STATE_STREAM_DESC</a> and combines the functionality of the <a href="../d3d12/nf-d3d12-id3d12device-creategraphicspipelinestate.md">ID3D12Device::CreateGraphicsPipelineState</a> and <a href="../d3d12/nf-d3d12-id3d12device-createcomputepipelinestate.md">ID3D12Device::CreateComputePipelineState</a> functions, which take their pipeline description as the less-flexible <a href="../d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc.md">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> and <a href="../d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc.md">D3D12_COMPUTE_PIPELINE_STATE_DESC</a> structs, respectively.
     * @param {Pointer<D3D12_PIPELINE_STATE_STREAM_DESC>} pDesc Type: <b>const <a href="../d3d12/ns-d3d12-d3d12_pipeline_state_stream_desc.md">D3D12_PIPELINE_STATE_STREAM_DESC</a>*</b>
     * 
     * The address of a <a href="../d3d12/ns-d3d12-d3d12_pipeline_state_stream_desc.md">D3D12_PIPELINE_STATE_STREAM_DESC</a> structure that describes the pipeline state.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the pipeline state interface (<a href="../d3d12/nn-d3d12-id3d12pipelinestate.md">ID3D12PipelineState</a>).
     * 
     * The <b>REFIID</b>, or <b>GUID</b>, of the interface to the pipeline state can be obtained by using the __uuidof() macro. For example, __uuidof(ID3D12PipelineState) will get the <b>GUID</b> of the interface to a pipeline state.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * <a href="https://docs.microsoft.com/cpp/code-quality/annotating-function-parameters-and-return-values">SAL</a>: <c>_COM_Outptr_</c>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="../d3d12/nn-d3d12-id3d12pipelinestate.md">ID3D12PipelineState</a> interface for the pipeline state object.
     * 
     * The pipeline state object is an immutable state object. It contains no methods.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device2-createpipelinestate
     */
    CreatePipelineState(pDesc, riid) {
        result := ComCall(47, this, D3D12_PIPELINE_STATE_STREAM_DESC.Ptr, pDesc, Guid.Ptr, riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }

    Query(iid) {
        if (ID3D12Device2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreatePipelineState := CallbackCreate(GetMethod(implObj, "CreatePipelineState"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreatePipelineState)
    }
}
