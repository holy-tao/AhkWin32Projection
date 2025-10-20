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
     * 
     * @param {PWSTR} pName 
     * @param {Pointer<ID3D12PipelineState>} pPipeline 
     * @returns {HRESULT} 
     */
    StorePipeline(pName, pPipeline) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(8, this, "ptr", pName, "ptr", pPipeline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Pointer<D3D12_GRAPHICS_PIPELINE_STATE_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppPipelineState 
     * @returns {HRESULT} 
     */
    LoadGraphicsPipeline(pName, pDesc, riid, ppPipelineState) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(9, this, "ptr", pName, "ptr", pDesc, "ptr", riid, "ptr", ppPipelineState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Pointer<D3D12_COMPUTE_PIPELINE_STATE_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppPipelineState 
     * @returns {HRESULT} 
     */
    LoadComputePipeline(pName, pDesc, riid, ppPipelineState) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(10, this, "ptr", pName, "ptr", pDesc, "ptr", riid, "ptr", ppPipelineState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetSerializedSize() {
        result := ComCall(11, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pData 
     * @param {Pointer} DataSizeInBytes 
     * @returns {HRESULT} 
     */
    Serialize(pData, DataSizeInBytes) {
        result := ComCall(12, this, "ptr", pData, "ptr", DataSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
