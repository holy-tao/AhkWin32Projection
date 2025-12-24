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
     * Retrieves the requested PSO from the library. The pipeline stream description is matched against the library database and remembered in order to prevent duplication of PSO contents.
     * @param {PWSTR} pName Type: <b>LPCWSTR</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * The unique name of the PSO.
     * @param {Pointer<D3D12_PIPELINE_STATE_STREAM_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_pipeline_state_stream_desc">D3D12_PIPELINE_STATE_STREAM_DESC</a>*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * Describes the required PSO using a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_pipeline_state_stream_desc">D3D12_PIPELINE_STATE_STREAM_DESC</a> structure. This description is matched against the library database and stored in order to prevent duplication of PSO contents.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Specifies a REFIID for the ID3D12PipelineStateState object.
     * 
     * Applications should typically set this argument and the following argument, ppPipelineState, by using the macro IID_PPV_ARGS(&amp;PSO1), where PSO1 is the name of the object.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_COM_Outptr_</c>
     * 
     * Specifies the pointer that will reference the PSO after the function successfully returns.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12pipelinelibrary1-loadpipeline
     */
    LoadPipeline(pName, pDesc, riid) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(13, this, "ptr", pName, "ptr", pDesc, "ptr", riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }
}
