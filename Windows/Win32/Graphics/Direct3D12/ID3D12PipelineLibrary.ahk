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
     * 
     * @param {PWSTR} pName 
     * @param {ID3D12PipelineState} pPipeline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-storepipeline
     */
    StorePipeline(pName, pPipeline) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(8, this, "ptr", pName, "ptr", pPipeline, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Pointer<D3D12_GRAPHICS_PIPELINE_STATE_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-loadgraphicspipeline
     */
    LoadGraphicsPipeline(pName, pDesc, riid) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(9, this, "ptr", pName, "ptr", pDesc, "ptr", riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Pointer<D3D12_COMPUTE_PIPELINE_STATE_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-loadcomputepipeline
     */
    LoadComputePipeline(pName, pDesc, riid) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(10, this, "ptr", pName, "ptr", pDesc, "ptr", riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }

    /**
     * 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-getserializedsize
     */
    GetSerializedSize() {
        result := ComCall(11, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} DataSizeInBytes 
     * @returns {Void} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-serialize
     */
    Serialize(DataSizeInBytes) {
        result := ComCall(12, this, "ptr", &pData := 0, "ptr", DataSizeInBytes, "HRESULT")
        return pData
    }
}
