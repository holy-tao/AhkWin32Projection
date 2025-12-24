#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DeviceChild.ahk

/**
 * Manages a pipeline library, in particular loading and retrieving individual PSOs.
 * @remarks
 * 
 * Refer to the remarks and examples for <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-createpipelinelibrary">CreatePipelineLibrary</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12pipelinelibrary
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12PipelineLibrary extends ID3D12DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12PipelineLibrary
     * @type {Guid}
     */
    static IID => Guid("{c64226a8-9201-46af-b4cc-53fb9ff7414f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StorePipeline", "LoadGraphicsPipeline", "LoadComputePipeline", "GetSerializedSize", "Serialize"]

    /**
     * Adds the input PSO to an internal database with the corresponding name.
     * @param {PWSTR} pName Type: <b>LPCWSTR</b>
     * 
     * Specifies a unique name for the library. Overwriting is not supported.
     * @param {ID3D12PipelineState} pPipeline Type: <b>ID3D12PipelineState*</b>
     * 
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a> to add.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code, including E_INVALIDARG if the name already exists, E_OUTOFMEMORY if unable to allocate storage in the library.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12pipelinelibrary-storepipeline
     */
    StorePipeline(pName, pPipeline) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(8, this, "ptr", pName, "ptr", pPipeline, "HRESULT")
        return result
    }

    /**
     * Retrieves the requested PSO from the library.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12pipelinelibrary-loadgraphicspipeline
     */
    LoadGraphicsPipeline(pName, pDesc, riid) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(9, this, "ptr", pName, "ptr", pDesc, "ptr", riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }

    /**
     * Retrieves the requested PSO from the library. The input desc is matched against the data in the current library database, and remembered in order to prevent duplication of PSO contents.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12pipelinelibrary-loadcomputepipeline
     */
    LoadComputePipeline(pName, pDesc, riid) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(10, this, "ptr", pName, "ptr", pDesc, "ptr", riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }

    /**
     * Returns the amount of memory required to serialize the current contents of the database.
     * @returns {Pointer} Type: <b>SIZE_T</b>
     * 
     * This method returns a SIZE_T object, containing the size required in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12pipelinelibrary-getserializedsize
     */
    GetSerializedSize() {
        result := ComCall(11, this, "ptr")
        return result
    }

    /**
     * Writes the contents of the library to the provided memory, to be provided back to the runtime at a later time.
     * @param {Pointer} DataSizeInBytes Type: <b>SIZE_T</b>
     * 
     * The size provided must be at least the size returned from <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12pipelinelibrary-getserializedsize">GetSerializedSize</a>.
     * @returns {Void} Type: <b>void*</b>
     * 
     * Specifies a pointer to the data. This memory must be readable and writeable up to the input size. This data can be saved and provided to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-createpipelinelibrary">CreatePipelineLibrary</a> at a later time, including future instances of this or other processes. The data becomes invalidated if the runtime or driver is updated, and is not portable to other hardware or devices.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12pipelinelibrary-serialize
     */
    Serialize(DataSizeInBytes) {
        result := ComCall(12, this, "ptr", &pData := 0, "ptr", DataSizeInBytes, "HRESULT")
        return pData
    }
}
