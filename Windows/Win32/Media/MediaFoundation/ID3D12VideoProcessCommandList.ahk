#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12CommandList.ahk

/**
 * Encapsulates a list of graphics commands for video processing. (ID3D12VideoProcessCommandList)
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videoprocesscommandlist
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoProcessCommandList extends ID3D12CommandList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoProcessCommandList
     * @type {Guid}
     */
    static IID => Guid("{aeb2543a-167f-4682-acc8-d159ed4a6209}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Close", "Reset", "ClearState", "ResourceBarrier", "DiscardResource", "BeginQuery", "EndQuery", "ResolveQueryData", "SetPredication", "SetMarker", "BeginEvent", "EndEvent", "ProcessFrames", "WriteBufferImmediate"]

    /**
     * Indicates that recording to the command list has finished. (ID3D12VideoProcessCommandList::Close)
     * @remarks
     * The runtime will validate that the command list has not previously been closed.  If an error was encountered during recording, the error code is returned here.  The runtime won't call the close device driver interface (DDI) in this case.
     * 
     * For an example of creating a command list, see [ID3D12GraphicsCommandList::Close method](/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-close)
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful; otherwise, returns one of the following values:
     *               
     * 
     * <ul>
     * <li><b>E_FAIL</b> if the command list has already been closed, or an invalid API was called during command list recording.
     *               </li>
     * <li><b>E_OUTOFMEMORY</b> if the operating system ran out of memory during recording.
     *               </li>
     * <li><b>E_INVALIDARG</b> if an invalid argument was passed to the command list API during recording.
     *               </li>
     * </ul>
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a> for other possible return values.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-close
     */
    Close() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Resets a command list back to its initial state as if a new command list was just created. (ID3D12VideoProcessCommandList::Reset)
     * @remarks
     * For additional information and examples of using this method, see [ID3D12GraphicsCommandList::Reset method](/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-reset)
     * @param {ID3D12CommandAllocator} pAllocator Type: <b>ID3D12CommandAllocator*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12commandallocator">ID3D12CommandAllocator</a> object that the device creates command lists from.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful; otherwise, returns one of the following values:
     *               
     * 
     * <ul>
     * <li><b>E_FAIL</b> if the command list was not in the "closed" state when the <b>Reset</b> call was made, or the per-device limit would have been exceeded.
     *               </li>
     * <li><b>E_OUTOFMEMORY</b> if the operating system ran out of memory.
     *               </li>
     * <li><b>E_INVALIDARG</b> if the allocator is currently being used with another command list in the "recording" state or if the specified allocator was created with the wrong type.
     *               </li>
     * </ul>
     * See <a href="https://docs.microsoft.com/windows/win32/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a> for other possible return values.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-reset
     */
    Reset(pAllocator) {
        result := ComCall(10, this, "ptr", pAllocator, "HRESULT")
        return result
    }

    /**
     * Resets the state of a direct command list back to the state it was in when the command list was created. (ID3D12VideoProcessCommandList::ClearState)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-clearstate
     */
    ClearState() {
        ComCall(11, this)
    }

    /**
     * Notifies the driver that it needs to synchronize multiple accesses to resources. (ID3D12VideoProcessCommandList::ResourceBarrier)
     * @param {Integer} NumBarriers Type: <b>UINT</b>
     * 
     * The number of submitted barrier descriptions.
     * @param {Pointer<D3D12_RESOURCE_BARRIER>} pBarriers Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_barrier">D3D12_RESOURCE_BARRIER</a>*</b>
     * 
     * Pointer to an array of barrier descriptions.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-resourcebarrier
     */
    ResourceBarrier(NumBarriers, pBarriers) {
        ComCall(12, this, "uint", NumBarriers, "ptr", pBarriers)
    }

    /**
     * Indicates that the current contents of a resource can be discarded.
     * @param {ID3D12Resource} pResource A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> interface for the resource to discard.
     * @param {Pointer<D3D12_DISCARD_REGION>} pRegion A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_discard_region">D3D12_DISCARD_REGION</a> structure that describes details for the discard-resource operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-discardresource
     */
    DiscardResource(pResource, pRegion) {
        ComCall(13, this, "ptr", pResource, "ptr", pRegion)
    }

    /**
     * Starts a query running. (ID3D12VideoProcessCommandList::BeginQuery)
     * @remarks
     * Some queries do not use **BeginQuery** and only have an **EndQuery**.  See each query type in [D3D12_QUERY_TYPE](/windows/desktop/api/d3d12/ne-d3d12-d3d12_query_type) to determine proper usage.
     * @param {ID3D12QueryHeap} pQueryHeap A pointer to an [ID3D12QueryHeap](/windows/desktop/api/d3d12/nn-d3d12-id3d12queryheap) specifying the storage for this query.
     * @param {Integer} Type A member of the [D3D12_QUERY_TYPE](/windows/desktop/api/d3d12/ne-d3d12-d3d12_query_type) enumeration specifying the type of the query.
     * @param {Integer} Index The index of the query within the query heap.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-beginquery
     */
    BeginQuery(pQueryHeap, Type, Index) {
        ComCall(14, this, "ptr", pQueryHeap, "int", Type, "uint", Index)
    }

    /**
     * Ends a query. (ID3D12VideoProcessCommandList::EndQuery)
     * @param {ID3D12QueryHeap} pQueryHeap A pointer to an [ID3D12QueryHeap](/windows/desktop/api/d3d12/nn-d3d12-id3d12queryheap) specifying the storage for this query.
     * @param {Integer} Type A member of the [D3D12_QUERY_TYPE](/windows/desktop/api/d3d12/ne-d3d12-d3d12_query_type) enumeration specifying the type of the query.
     * @param {Integer} Index The index of the query within the query heap.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-endquery
     */
    EndQuery(pQueryHeap, Type, Index) {
        ComCall(15, this, "ptr", pQueryHeap, "int", Type, "uint", Index)
    }

    /**
     * Extracts data from a query. (ID3D12VideoProcessCommandList::ResolveQueryData)
     * @param {ID3D12QueryHeap} pQueryHeap A pointer to an [ID3D12QueryHeap](/windows/desktop/api/d3d12/nn-d3d12-id3d12queryheap) specifying the storage containing the queries to resolve.
     * @param {Integer} Type A member of the [D3D12_QUERY_TYPE](/windows/desktop/api/d3d12/ne-d3d12-d3d12_query_type) enumeration specifying the type of the query.
     * @param {Integer} StartIndex The index of the first query to resolve.
     * @param {Integer} NumQueries The number of queries to resolve.
     * @param {ID3D12Resource} pDestinationBuffer A pointer to an [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) representing the destination buffer. The resource must be in the state [D3D12_RESOURCE_STATE_COPY_DEST](/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states).
     * @param {Integer} AlignedDestinationBufferOffset The alignment offset into the destination buffer. This must be a multiple of 8 bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-resolvequerydata
     */
    ResolveQueryData(pQueryHeap, Type, StartIndex, NumQueries, pDestinationBuffer, AlignedDestinationBufferOffset) {
        ComCall(16, this, "ptr", pQueryHeap, "int", Type, "uint", StartIndex, "uint", NumQueries, "ptr", pDestinationBuffer, "uint", AlignedDestinationBufferOffset)
    }

    /**
     * Specifies that subsequent commands should not be performed if the predicate value passes the specified operation. (ID3D12VideoProcessCommandList::SetPredication)
     * @param {ID3D12Resource} pBuffer A pointer to an [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) representing the buffer from which to read the 64-bit predication value.
     * @param {Integer} AlignedBufferOffset The UINT64-aligned buffer offset.
     * @param {Integer} Operation A member of the [D3D12_PREDICATION_OP](/windows/desktop/api/d3d12/ne-d3d12-d3d12_predication_op) enumeration specifying the predicate operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-setpredication
     */
    SetPredication(pBuffer, AlignedBufferOffset, Operation) {
        ComCall(17, this, "ptr", pBuffer, "uint", AlignedBufferOffset, "int", Operation)
    }

    /**
     * For internal use only. Not intended to be called directly
     * @param {Integer} Metadata Internal.
     * @param {Pointer} pData Internal.
     * @param {Integer} _Size 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-setmarker
     */
    SetMarker(Metadata, pData, _Size) {
        ComCall(18, this, "uint", Metadata, "ptr", pData, "uint", _Size)
    }

    /**
     * For internal use only. Not intended to be called directly. (ID3D12VideoProcessCommandList::BeginEvent)
     * @param {Integer} Metadata Internal.
     * @param {Pointer} pData Internal.
     * @param {Integer} _Size 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-beginevent
     */
    BeginEvent(Metadata, pData, _Size) {
        ComCall(19, this, "uint", Metadata, "ptr", pData, "uint", _Size)
    }

    /**
     * For internal use only. Not intended to be called directly. (ID3D12VideoProcessCommandList::EndEvent)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-endevent
     */
    EndEvent() {
        ComCall(20, this)
    }

    /**
     * Records a video processing operation to the command list, operating on one or more input samples and writing the result to an output surface. (ID3D12VideoProcessCommandList::ProcessFrames)
     * @remarks
     * This version of the method does not allow you to change the [D3D12_VIDEO_FIELD_TYPE](ne-d3d12video-d3d12_video_field_type.md). When dealing with mixed content, use [ID3D12VideoProcessCommandList::ProcessFrames1](nf-d3d12video-id3d12videoprocesscommandlist1-processframes1.md) instead, which allows you to specify a field type with each call.
     * @param {ID3D12VideoProcessor} pVideoProcessor A pointer to an [ID3D12VideoProcessor](nn-d3d12video-id3d12videoprocessor.md) interface representing a video processor instance.
     * @param {Pointer<D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS>} pOutputArguments A [D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS](ns-d3d12video-d3d12_video_process_output_stream_arguments.md) structure specifying the output surface and output arguments.
     * @param {Integer} NumInputStreams The count of input streams.
     * @param {Pointer<D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS>} pInputArguments A pointer to an array of [D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS](ns-d3d12video-d3d12_video_process_input_stream_arguments.md) structures specifying the input parameters.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-processframes
     */
    ProcessFrames(pVideoProcessor, pOutputArguments, NumInputStreams, pInputArguments) {
        ComCall(21, this, "ptr", pVideoProcessor, "ptr", pOutputArguments, "uint", NumInputStreams, "ptr", pInputArguments)
    }

    /**
     * Writes a number of 32-bit immediate values to the specified buffer locations directly from the command stream. (ID3D12VideoProcessCommandList::WriteBufferImmediate)
     * @param {Integer} Count The number of elements in the *pParams* and *pModes* arrays.
     * @param {Pointer<D3D12_WRITEBUFFERIMMEDIATE_PARAMETER>} pParams The address of an array of [D3D12_WRITEBUFFERIMMEDIATE_PARAMETER](/windows/desktop/api/d3d12/ns-d3d12-d3d12_writebufferimmediate_parameter) structures of size *Count*.
     * @param {Pointer<Integer>} pModes The address of an array of [D3D12_WRITEBUFFERIMMEDIATE_MODE](/windows/desktop/api/d3d12/ne-d3d12-d3d12_writebufferimmediate_mode) structures of size *Count*. The default value is <b>null</b>. Passing <b>null</b> causes the system to write all immediate values using **D3D12_WRITEBUFFERIMMEDIATE_MODE_DEFAULT**.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-writebufferimmediate
     */
    WriteBufferImmediate(Count, pParams, pModes) {
        pModesMarshal := pModes is VarRef ? "int*" : "ptr"

        ComCall(22, this, "uint", Count, "ptr", pParams, pModesMarshal, pModes)
    }
}
