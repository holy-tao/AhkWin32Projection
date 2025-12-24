#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device1.ahk

/**
 * Represents a virtual adapter. This interface extends ID3D12Device1 to create pipeline state objects from pipeline state stream descriptions.
 * @remarks
 * 
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createdevice">D3D12CreateDevice</a> to create a device.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12device2
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device2 extends ID3D12Device1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device2
     * @type {Guid}
     */
    static IID => Guid("{30baa41e-b15b-475c-a0bb-1af5c5b64328}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 47

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePipelineState"]

    /**
     * Creates a pipeline state object from a pipeline state stream description.
     * @param {Pointer<D3D12_PIPELINE_STATE_STREAM_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_pipeline_state_stream_desc">D3D12_PIPELINE_STATE_STREAM_DESC</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_pipeline_state_stream_desc">D3D12_PIPELINE_STATE_STREAM_DESC</a> structure that describes the pipeline state.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the pipeline state interface (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a>).
     * 
     * The <b>REFIID</b>, or <b>GUID</b>, of the interface to the pipeline state can be obtained by using the __uuidof() macro. For example, __uuidof(ID3D12PipelineState) will get the <b>GUID</b> of the interface to a pipeline state.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_COM_Outptr_</c>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pipelinestate">ID3D12PipelineState</a> interface for the pipeline state object.
     * 
     * The pipeline state object is an immutable state object. It contains no methods.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device2-createpipelinestate
     */
    CreatePipelineState(pDesc, riid) {
        result := ComCall(47, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }
}
