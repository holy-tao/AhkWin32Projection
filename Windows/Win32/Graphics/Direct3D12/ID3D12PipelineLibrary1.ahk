#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12PipelineLibrary.ahk

/**
 * Manages a pipeline library. This interface extends ID3D12PipelineLibrary to load PSOs from a pipeline state stream description.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12pipelinelibrary1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12PipelineLibrary1 extends ID3D12PipelineLibrary{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12PipelineLibrary1
     * @type {Guid}
     */
    static IID => Guid("{80eabf42-2568-4e5e-bd82-c37f86961dc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadPipeline"]

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Pointer<D3D12_PIPELINE_STATE_STREAM_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppPipelineState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary1-loadpipeline
     */
    LoadPipeline(pName, pDesc, riid, ppPipelineState) {
        pName := pName is String ? StrPtr(pName) : pName

        ppPipelineStateMarshal := ppPipelineState is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", pName, "ptr", pDesc, "ptr", riid, ppPipelineStateMarshal, ppPipelineState, "HRESULT")
        return result
    }
}
