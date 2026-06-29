#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_PIPELINE_STATE_STREAM_DESC.ahk" { D3D12_PIPELINE_STATE_STREAM_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12PipelineLibrary.ahk" { ID3D12PipelineLibrary }

/**
 * Manages a pipeline library. This interface extends ID3D12PipelineLibrary to load PSOs from a pipeline state stream description.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12pipelinelibrary1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12PipelineLibrary1 extends ID3D12PipelineLibrary {
    /**
     * The interface identifier for ID3D12PipelineLibrary1
     * @type {Guid}
     */
    static IID := Guid("{80eabf42-2568-4e5e-bd82-c37f86961dc3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12PipelineLibrary1 interfaces
    */
    struct Vtbl extends ID3D12PipelineLibrary.Vtbl {
        LoadPipeline : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12PipelineLibrary1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the requested PSO from the library. The pipeline stream description is matched against the library database and remembered in order to prevent duplication of PSO contents.
     * @remarks
     * This function takes the pipeline description as a <a href="../d3d12/ns-d3d12-d3d12_pipeline_state_stream_desc.md">D3D12_PIPELINE_STATE_STREAM_DESC</a> and is a replacement for the <a href="../d3d12/nf-d3d12-id3d12pipelinelibrary-loadgraphicspipeline.md">ID3D12PipelineLibrary::LoadGraphicsPipeline</a> and <a href="../d3d12/nf-d3d12-id3d12pipelinelibrary-loadcomputepipeline.md">ID3D12PipelineLibrary::LoadComputePipeline</a> functions, which take their pipeline description as the less-flexible <a href="../d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc.md">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> and <a href="../d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc.md">D3D12_COMPUTE_PIPELINE_STATE_DESC</a> structs, respectively.
     * @param {PWSTR} pName Type: <b>LPCWSTR</b>
     * 
     * <a href="https://docs.microsoft.com/cpp/code-quality/annotating-function-parameters-and-return-values">SAL</a>: <c>_In_</c>
     * 
     * The unique name of the PSO.
     * @param {Pointer<D3D12_PIPELINE_STATE_STREAM_DESC>} pDesc Type: <b>const <a href="../d3d12/ns-d3d12-d3d12_pipeline_state_stream_desc.md">D3D12_PIPELINE_STATE_STREAM_DESC</a>*</b>
     * 
     * <a href="https://docs.microsoft.com/cpp/code-quality/annotating-function-parameters-and-return-values">SAL</a>: <c>_In_</c>
     * 
     * Describes the required PSO using a <a href="../d3d12/ns-d3d12-d3d12_pipeline_state_stream_desc.md">D3D12_PIPELINE_STATE_STREAM_DESC</a> structure. This description is matched against the library database and stored in order to prevent duplication of PSO contents.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Specifies a REFIID for the ID3D12PipelineStateState object.
     * 
     * Applications should typically set this argument and the following argument, ppPipelineState, by using the macro IID_PPV_ARGS(&amp;PSO1), where PSO1 is the name of the object.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * <a href="https://docs.microsoft.com/cpp/code-quality/annotating-function-parameters-and-return-values">SAL</a>: <c>_COM_Outptr_</c>
     * 
     * Specifies the pointer that will reference the PSO after the function successfully returns.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary1-loadpipeline
     */
    LoadPipeline(pName, pDesc, riid) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(13, this, "ptr", pName, D3D12_PIPELINE_STATE_STREAM_DESC.Ptr, pDesc, Guid.Ptr, riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }

    Query(iid) {
        if (ID3D12PipelineLibrary1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadPipeline := CallbackCreate(GetMethod(implObj, "LoadPipeline"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadPipeline)
    }
}
