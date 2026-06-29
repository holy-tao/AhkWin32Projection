#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_GRAPHICS_PIPELINE_STATE_DESC.ahk" { D3D12_GRAPHICS_PIPELINE_STATE_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12PipelineState.ahk" { ID3D12PipelineState }
#Import ".\D3D12_COMPUTE_PIPELINE_STATE_DESC.ahk" { D3D12_COMPUTE_PIPELINE_STATE_DESC }
#Import ".\ID3D12DeviceChild.ahk" { ID3D12DeviceChild }

/**
 * Manages a pipeline library, in particular loading and retrieving individual PSOs.
 * @remarks
 * Refer to the remarks and examples for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-createpipelinelibrary">CreatePipelineLibrary</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12pipelinelibrary
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12PipelineLibrary extends ID3D12DeviceChild {
    /**
     * The interface identifier for ID3D12PipelineLibrary
     * @type {Guid}
     */
    static IID := Guid("{c64226a8-9201-46af-b4cc-53fb9ff7414f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12PipelineLibrary interfaces
    */
    struct Vtbl extends ID3D12DeviceChild.Vtbl {
        StorePipeline        : IntPtr
        LoadGraphicsPipeline : IntPtr
        LoadComputePipeline  : IntPtr
        GetSerializedSize    : IntPtr
        Serialize            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12PipelineLibrary.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds the input PSO to an internal database with the corresponding name.
     * @remarks
     * Refer to the remarks and examples for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-createpipelinelibrary">CreatePipelineLibrary</a>.
     * @param {PWSTR} pName Type: <b>LPCWSTR</b>
     * 
     * Specifies a unique name for the library. Overwriting is not supported.
     * @param {ID3D12PipelineState} pPipeline Type: <b>ID3D12PipelineState*</b>
     * 
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a> to add.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code, including E_INVALIDARG if the name already exists, E_OUTOFMEMORY if unable to allocate storage in the library.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-storepipeline
     */
    StorePipeline(pName, pPipeline) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(8, this, "ptr", pName, "ptr", pPipeline, "HRESULT")
        return result
    }

    /**
     * Retrieves the requested PSO from the library.
     * @remarks
     * Refer to the remarks and examples for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-createpipelinelibrary">CreatePipelineLibrary</a>.
     * @param {PWSTR} pName Type: <b>LPCWSTR</b>
     * 
     * The unique name of the PSO.
     * @param {Pointer<D3D12_GRAPHICS_PIPELINE_STATE_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a>*</b>
     * 
     * Specifies a description of the required PSO in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> structure. This input description is matched against the data in the current library database, and stored in order to prevent duplication of PSO contents.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Specifies a REFIID for the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a> object. Typically set this, and the following parameter, with the macro <c>IID_PPV_ARGS(&amp;PSO1)</c>, where <i>PSO1</i> is the name of the object.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Specifies a pointer that will reference the returned PSO.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-loadgraphicspipeline
     */
    LoadGraphicsPipeline(pName, pDesc, riid) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(9, this, "ptr", pName, D3D12_GRAPHICS_PIPELINE_STATE_DESC.Ptr, pDesc, Guid.Ptr, riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }

    /**
     * Retrieves the requested PSO from the library. The input desc is matched against the data in the current library database, and remembered in order to prevent duplication of PSO contents.
     * @remarks
     * Refer to the remarks and examples for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-createpipelinelibrary">CreatePipelineLibrary</a>.
     * @param {PWSTR} pName Type: <b>LPCWSTR</b>
     * 
     * The unique name of the PSO.
     * @param {Pointer<D3D12_COMPUTE_PIPELINE_STATE_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc">D3D12_COMPUTE_PIPELINE_STATE_DESC</a>*</b>
     * 
     * Specifies a description of the required PSO in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc">D3D12_COMPUTE_PIPELINE_STATE_DESC</a> structure. This input description is matched against the data in the current library database, and stored in order to prevent duplication of PSO contents.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Specifies a REFIID for the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a> object. Typically set this, and the following parameter, with the macro <c>IID_PPV_ARGS(&amp;PSO1)</c>, where <i>PSO1</i> is the name of the object.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Specifies a pointer that will reference the returned PSO.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-loadcomputepipeline
     */
    LoadComputePipeline(pName, pDesc, riid) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(10, this, "ptr", pName, D3D12_COMPUTE_PIPELINE_STATE_DESC.Ptr, pDesc, Guid.Ptr, riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }

    /**
     * Returns the amount of memory required to serialize the current contents of the database.
     * @remarks
     * Refer to the remarks and examples for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-createpipelinelibrary">CreatePipelineLibrary</a>.
     * @returns {Pointer} Type: <b>SIZE_T</b>
     * 
     * This method returns a SIZE_T object, containing the size required in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-getserializedsize
     */
    GetSerializedSize() {
        result := ComCall(11, this, IntPtr)
        return result
    }

    /**
     * Writes the contents of the library to the provided memory, to be provided back to the runtime at a later time.
     * @remarks
     * Refer to the remarks and examples for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-createpipelinelibrary">CreatePipelineLibrary</a>.
     * @param {Pointer} DataSizeInBytes Type: <b>SIZE_T</b>
     * 
     * The size provided must be at least the size returned from <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12pipelinelibrary-getserializedsize">GetSerializedSize</a>.
     * @returns {Void} Type: <b>void*</b>
     * 
     * Specifies a pointer to the data. This memory must be readable and writable up to the input size. This data can be saved and provided to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-createpipelinelibrary">CreatePipelineLibrary</a> at a later time, including future instances of this or other processes. The data becomes invalidated if the runtime or driver is updated, and is not portable to other hardware or devices.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-serialize
     */
    Serialize(DataSizeInBytes) {
        result := ComCall(12, this, "ptr", &pData := 0, "ptr", DataSizeInBytes, "HRESULT")
        return pData
    }

    Query(iid) {
        if (ID3D12PipelineLibrary.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StorePipeline := CallbackCreate(GetMethod(implObj, "StorePipeline"), flags, 3)
        this.vtbl.LoadGraphicsPipeline := CallbackCreate(GetMethod(implObj, "LoadGraphicsPipeline"), flags, 5)
        this.vtbl.LoadComputePipeline := CallbackCreate(GetMethod(implObj, "LoadComputePipeline"), flags, 5)
        this.vtbl.GetSerializedSize := CallbackCreate(GetMethod(implObj, "GetSerializedSize"), flags, 1)
        this.vtbl.Serialize := CallbackCreate(GetMethod(implObj, "Serialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StorePipeline)
        CallbackFree(this.vtbl.LoadGraphicsPipeline)
        CallbackFree(this.vtbl.LoadComputePipeline)
        CallbackFree(this.vtbl.GetSerializedSize)
        CallbackFree(this.vtbl.Serialize)
    }
}
