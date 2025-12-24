#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Pageable.ahk

/**
 * Provides methods for submitting command lists, synchronizing command list execution, instrumenting the command queue, and updating resource tile mappings.
 * @remarks
 * 
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommandqueue">ID3D12Device::CreateCommandQueue</a> to create a command queue object. 
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12commandqueue
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12CommandQueue extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12CommandQueue
     * @type {Guid}
     */
    static IID => Guid("{0ec870a6-5d7e-4c22-8cfc-5baae07616ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateTileMappings", "CopyTileMappings", "ExecuteCommandLists", "SetMarker", "BeginEvent", "EndEvent", "Signal", "Wait", "GetTimestampFrequency", "GetClockCalibration", "GetDesc"]

    /**
     * Updates mappings of tile locations in reserved resources to memory locations in a resource heap.
     * @remarks
     * 
     * Use <b>UpdateTileMappings</b> to map the virtual pages of a reserved resource to the physical pages of a heap. The mapping does not have to be in order. The operation is similar to  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-updatetilemappings">ID3D11DeviceContext2::UpdateTileMappings</a> with the one key difference that D3D12 allows a reserved resource to have tiles from multiple heaps.
     * 
     * In a single call to <b>UpdateTileMappings</b>, you can map one or more ranges of resource tiles to one or more ranges of heap tiles. 
     *       
     * 
     * You can organize the parameters of  <b>UpdateTileMappings</b> in these ways to perform an update:
     *           
     * 
     * <ul>
     * <li><b>Reserved resource whose mappings are updated.</b> Mappings start off all NULL when a resource is initially created.
     *           </li>
     * <li><b>Set of tile regions on the reserved resource whose mappings are updated.</b> You can make one <b>UpdateTileMappings</b> call to update many mappings or multiple calls with a bit more API call overhead as well if that is more convenient. <ul>
     * <li><i>NumResourceRegions</i> specifies how many regions there are.</li>
     * <li><i>pResourceRegionStartCoordinates</i> and <i>pResourceRegionSizes</i> are each arrays that identify the start location and extend of each region. If <i>NumResourceRegions</i> is 1, for convenience either or both of the arrays that describe the regions can be NULL.  NULL for <i>pResourceRegionStartCoordinates</i> means the start coordinate is all 0s, and NULL for <i>pResourceRegionSizes</i> identifies a default region that is the full set of tiles for the entire reserved resource, including all mipmaps, array slices, or both.  </li>
     * <li>
     * If <i>pResourceRegionStartCoordinates</i> isn't NULL and <i>pResourceRegionSizes</i> is NULL, the region size defaults to 1 tile for all regions.  This makes it easy to define mappings for a set of individual tiles each at disparate locations by providing an array of locations in <i>pResourceRegionStartCoordinates</i> without having to send an array of <i>pResourceRegionSizes</i> all set to 1.
     *             
     * 
     * </li>
     * </ul>
     * The updates are applied from first region to last; so, if regions overlap in a single call, the updates later in the list overwrite the areas that overlap with previous updates.
     * 
     * </li>
     * <li><b>Heap that provides memory where tile mappings can go.</b>  If <b>UpdateTileMappings</b> only defines NULL mappings, you don't need to specify a heap.</li>
     * <li><b>Set of tile ranges where mappings are going.</b> Each given tile range can specify one of a few types of ranges: a range of tiles in a heap (default), a count of tiles in the reserved resource to map to a single tile in a heap (sharing the tile), a count of tile mappings in the reserved resource to skip and leave as they are, or a count of tiles in the heap to map to NULL.<i>NumRanges</i> specifies the number of tile ranges, where the total tiles identified across all ranges must match the total number of tiles in the tile regions from the previously described reserved resource.  Mappings are defined by iterating through the tiles in the tile regions in sequential order - x then y then z order for box regions - while walking through the set of tile ranges in sequential order.  The breakdown of tile regions doesn't have to line up with the breakdown of tile ranges, but the total number of tiles on both sides must be equal so that each reserved resource tile specified has a mapping specified.
     *             
     * 
     * <i>pRangeFlags</i>, <i>pHeapRangeStartOffsets</i>, and <i>pRangeTileCounts</i> are all arrays, of size <i>NumRanges</i>, that describe the tile ranges.  If <i>pRangeFlags</i> is NULL, all ranges are sequential tiles in the heap; otherwise, for each range i,<i>pRangeFlags[i]</i> identifies how the mappings in that range of tiles work:
     *               
     * 
     * <ul>
     * <li>If <i>pRangeFlags[i]</i> is <b>D3D12_TILE_RANGE_FLAG_NONE</b>, that range defines sequential tiles in the heap, with the number of tiles being <i>pRangeTileCounts[i]</i> and the starting location <i>pHeapRangeStartOffsets[i]</i>.  If <i>NumRanges</i> is 1, <i>pRangeTileCounts</i> can be NULL and defaults to the total number of tiles specified by all the tile regions.
     *               </li>
     * <li>If <i>pRangeFlags[i]</i> is <b>D3D12_TILE_RANGE_FLAG_REUSE_SINGLE_TILE</b>, <i>pHeapRangeStartOffsets[i]</i> identifies the single tile in the heap to map to, and <i>pRangeTileCounts[i]</i> specifies how many tiles from the tile regions to map to that heap location.  If <i>NumRanges</i> is 1, <i>pRangeTileCounts</i> can be NULL and defaults to the total number of tiles specified by all the tile regions.
     *               </li>
     * <li>If <i>pRangeFlags[i]</i> is <b>D3D12_TILE_RANGE_FLAG_NULL</b>, <i>pRangeTileCounts[i]</i> specifies how many tiles from the tile regions to map to NULL.  If <i>NumRanges</i> is 1, <i>pRangeTileCounts</i> can be NULL and defaults to the total number of tiles specified by all the tile regions. <i>pHeapRangeStartOffsets[i]</i> is ignored for NULL mappings.
     *               </li>
     * <li>If <i>pRangeFlags[i]</i> is <b>D3D12_TILE_RANGE_FLAG_SKIP</b>, <i>pRangeTileCounts[i]</i> specifies how many tiles from the tile regions to skip over and leave existing mappings unchanged for.  This can be useful if a tile region conveniently bounds an area of tile mappings to update except with some exceptions that need to be left the same as whatever they were mapped to before. <i>pHeapRangeStartOffsets[i]</i> is ignored for SKIP mappings.
     *               </li>
     * </ul>
     * </li>
     * </ul>
     * Reserved resources must follow the same rules for tile aliasing, initialization, and data inheritance as placed resources. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createplacedresource">CreatePlacedResource</a> for more details.
     * 
     * Here are some examples of common <b>UpdateTileMappings</b> cases:
     *       
     * 
     * 
     * 
     * @param {ID3D12Resource} pResource A pointer to the reserved resource.
     * @param {Integer} NumResourceRegions The number of reserved resource regions.
     * @param {Pointer<D3D12_TILED_RESOURCE_COORDINATE>} pResourceRegionStartCoordinates An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_tiled_resource_coordinate">D3D12_TILED_RESOURCE_COORDINATE</a> structures that describe the starting coordinates of the reserved resource regions. The <i>NumResourceRegions</i> parameter specifies the number of <b>D3D12_TILED_RESOURCE_COORDINATE</b> structures in the array.
     * @param {Pointer<D3D12_TILE_REGION_SIZE>} pResourceRegionSizes An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_tile_region_size">D3D12_TILE_REGION_SIZE</a> structures that describe the sizes of the reserved resource regions. The <i>NumResourceRegions</i> parameter specifies the number of <b>D3D12_TILE_REGION_SIZE</b> structures in the array.
     * @param {ID3D12Heap} pHeap A pointer to the resource heap.
     * @param {Integer} NumRanges The number of tile  ranges.
     * @param {Pointer<Integer>} pRangeFlags A pointer to an  array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_tile_range_flags">D3D12_TILE_RANGE_FLAGS</a> values that describes each tile range. The <i>NumRanges</i> parameter specifies the number of values in the array.
     * @param {Pointer<Integer>} pHeapRangeStartOffsets An array of offsets into the resource heap. These are 0-based tile offsets, counting in tiles (not bytes).
     * @param {Pointer<Integer>} pRangeTileCounts An array of tiles.
     *             An array of values that specify the number of tiles in each tile range. The <i>NumRanges</i> parameter specifies the number of values in the array.
     * @param {Integer} Flags A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_tile_mapping_flags">D3D12_TILE_MAPPING_FLAGS</a> values that are combined by using a bitwise OR operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12commandqueue-updatetilemappings
     */
    UpdateTileMappings(pResource, NumResourceRegions, pResourceRegionStartCoordinates, pResourceRegionSizes, pHeap, NumRanges, pRangeFlags, pHeapRangeStartOffsets, pRangeTileCounts, Flags) {
        pRangeFlagsMarshal := pRangeFlags is VarRef ? "int*" : "ptr"
        pHeapRangeStartOffsetsMarshal := pHeapRangeStartOffsets is VarRef ? "uint*" : "ptr"
        pRangeTileCountsMarshal := pRangeTileCounts is VarRef ? "uint*" : "ptr"

        ComCall(8, this, "ptr", pResource, "uint", NumResourceRegions, "ptr", pResourceRegionStartCoordinates, "ptr", pResourceRegionSizes, "ptr", pHeap, "uint", NumRanges, pRangeFlagsMarshal, pRangeFlags, pHeapRangeStartOffsetsMarshal, pHeapRangeStartOffsets, pRangeTileCountsMarshal, pRangeTileCounts, "int", Flags)
    }

    /**
     * Copies mappings from a source reserved resource to a destination reserved resource.
     * @remarks
     * 
     * Use <b>CopyTileMappings</b> to copy the tile mappings from one reserved resource to another, either to duplicate a resource mapping, or to initialize a new mapping before modifying it using <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-updatetilemappings">UpdateTileMappings</a>.
     * 
     * <b>CopyTileMappings</b> helps with tasks such as shifting mappings around within and across reserved resources, for example, scrolling tiles. 
     *         The source and destination regions can overlap; the result of the copy in this situation is as if the source was saved to a temporary location 
     *         and from there written to the destination.
     *       
     * 
     * The destination and the source regions must each entirely fit in their resource or behavior is undefined and the debug layer will emit an error.
     * 
     * 
     * @param {ID3D12Resource} pDstResource A pointer to the destination reserved resource.
     * @param {Pointer<D3D12_TILED_RESOURCE_COORDINATE>} pDstRegionStartCoordinate A pointer to a
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_tiled_resource_coordinate">D3D12_TILED_RESOURCE_COORDINATE</a> structure that describes the starting coordinates of the destination reserved resource.
     * @param {ID3D12Resource} pSrcResource A pointer to the source reserved resource.
     * @param {Pointer<D3D12_TILED_RESOURCE_COORDINATE>} pSrcRegionStartCoordinate A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_tiled_resource_coordinate">D3D12_TILED_RESOURCE_COORDINATE</a> structure that describes the starting coordinates of the source reserved resource.
     * @param {Pointer<D3D12_TILE_REGION_SIZE>} pRegionSize A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_tile_region_size">D3D12_TILE_REGION_SIZE</a> structure that describes the size of the reserved region.
     * @param {Integer} Flags One member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_tile_mapping_flags">D3D12_TILE_MAPPING_FLAGS</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12commandqueue-copytilemappings
     */
    CopyTileMappings(pDstResource, pDstRegionStartCoordinate, pSrcResource, pSrcRegionStartCoordinate, pRegionSize, Flags) {
        ComCall(9, this, "ptr", pDstResource, "ptr", pDstRegionStartCoordinate, "ptr", pSrcResource, "ptr", pSrcRegionStartCoordinate, "ptr", pRegionSize, "int", Flags)
    }

    /**
     * Submits an array of command lists for execution.
     * @remarks
     * 
     * Calling **ExecuteCommandLists** twice in succession (from the same thread, or different threads) guarantees that the first workload (A) finishes before the second workload (B). Calling **ExecuteCommandLists** with *two* command lists allows the driver to merge the two command lists such that the second command list (D) may begin executing work before all work from the first (C) has finished. Specifically, your application is allowed to insert a fence signal or wait between A and B, and the driver has no visibility into this, so the driver must ensure that everything in A is complete before the fence operation. There is no such opportunity in a single call to the API, so the driver is able to optimize that scenario.
     * 
     * The driver is free to patch the submitted command lists. It is the calling application’s responsibility to ensure that the graphics processing unit (GPU) is not currently reading the any of the submitted command lists from a previous execution.
     * 
     * Applications are encouraged to batch together command list executions to reduce fixed costs associated with submitted commands to the GPU.
     * 
     * 
     * @param {Integer} NumCommandLists The number of command lists to be executed.
     * @param {Pointer<ID3D12CommandList>} ppCommandLists The array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandlist">ID3D12CommandList</a> command lists to be executed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12commandqueue-executecommandlists
     */
    ExecuteCommandLists(NumCommandLists, ppCommandLists) {
        ComCall(10, this, "uint", NumCommandLists, "ptr*", ppCommandLists)
    }

    /**
     * Not intended to be called directly.  Use the PIX event runtime to insert events into a command queue.
     * @remarks
     * 
     * This is a support method used internally by the PIX event runtime.  It is not intended to be called directly.
     * 
     * To insert instrumentation markers at the current location within a D3D12 command queue, use the <b>PIXSetMarker</b> function.  This is provided by the <a href="https://devblogs.microsoft.com/pix/winpixeventruntime/">WinPixEventRuntime</a> NuGet package.
     * 
     * 
     * @param {Integer} Metadata Type: <b>UINT</b>
     * 
     * Internal.
     * @param {Pointer} pData Type: <b>const void*</b>
     * 
     * Internal.
     * @param {Integer} Size Type: <b>UINT</b>
     * 
     * Internal.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12commandqueue-setmarker
     */
    SetMarker(Metadata, pData, Size) {
        ComCall(11, this, "uint", Metadata, "ptr", pData, "uint", Size)
    }

    /**
     * Not intended to be called directly.  Use the PIX event runtime to insert events into a command queue.
     * @remarks
     * 
     * This is a support method used internally by the PIX event runtime.  It is not intended to be called directly.
     * 
     * To mark the start of an instrumentation region at the current location within a D3D12 command queue, use the <b>PIXBeginEvent</b> function or <b>PIXScopedEvent</b> macro.  These are provided by the <a href="https://devblogs.microsoft.com/pix/winpixeventruntime/">WinPixEventRuntime</a> NuGet package.
     * 
     * 
     * @param {Integer} Metadata Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Internal.
     * @param {Pointer} pData Type: <b>const void*</b>
     * 
     * Internal.
     * @param {Integer} Size Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Internal.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12commandqueue-beginevent
     */
    BeginEvent(Metadata, pData, Size) {
        ComCall(12, this, "uint", Metadata, "ptr", pData, "uint", Size)
    }

    /**
     * Not intended to be called directly.  Use the PIX event runtime to insert events into a command queue.
     * @remarks
     * 
     * This is a support method used internally by the PIX event runtime.  It is not intended to be called directly.
     * 
     * To mark the end of an instrumentation region at the current location within a D3D12 command queue, use the <b>PIXEndEvent</b> function or <b>PIXScopedEvent</b> macro.  These are provided by the <a href="https://devblogs.microsoft.com/pix/winpixeventruntime/">WinPixEventRuntime</a> NuGet package.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12commandqueue-endevent
     */
    EndEvent() {
        ComCall(13, this)
    }

    /**
     * Updates a fence to a specified value.
     * @param {ID3D12Fence} pFence Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a> object.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The value to set the fence to.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/win32/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12commandqueue-signal
     */
    Signal(pFence, Value) {
        result := ComCall(14, this, "ptr", pFence, "uint", Value, "HRESULT")
        return result
    }

    /**
     * Queues a GPU-side wait, and returns immediately. A GPU-side wait is where the GPU waits until the specified fence reaches or exceeds the specified value.
     * @param {ID3D12Fence} pFence Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a> object.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The value that the command queue is waiting for the fence to reach or exceed.  So when  <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12fence-getcompletedvalue">ID3D12Fence::GetCompletedValue</a> is greater than or equal to <i>Value</i>, the wait is terminated.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/win32/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12commandqueue-wait
     */
    Wait(pFence, Value) {
        result := ComCall(15, this, "ptr", pFence, "uint", Value, "HRESULT")
        return result
    }

    /**
     * This method is used to determine the rate at which the GPU timestamp counter increments.
     * @returns {Integer} Type: <b>UINT64*</b>
     * 
     * The GPU timestamp counter frequency (in ticks/second).
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12commandqueue-gettimestampfrequency
     */
    GetTimestampFrequency() {
        result := ComCall(16, this, "uint*", &pFrequency := 0, "HRESULT")
        return pFrequency
    }

    /**
     * This method samples the CPU and GPU timestamp counters at the same moment in time.
     * @param {Pointer<Integer>} pGpuTimestamp Type: <b>UINT64*</b>
     * 
     * The value of the GPU timestamp counter.
     * @param {Pointer<Integer>} pCpuTimestamp Type: <b>UINT64*</b>
     * 
     * The value of the CPU timestamp counter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12commandqueue-getclockcalibration
     */
    GetClockCalibration(pGpuTimestamp, pCpuTimestamp) {
        pGpuTimestampMarshal := pGpuTimestamp is VarRef ? "uint*" : "ptr"
        pCpuTimestampMarshal := pCpuTimestamp is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, pGpuTimestampMarshal, pGpuTimestamp, pCpuTimestampMarshal, pCpuTimestamp, "HRESULT")
        return result
    }

    /**
     * Gets the description of the command queue.
     * @returns {D3D12_COMMAND_QUEUE_DESC} Type: <b><a href="/windows/desktop/api/d3d12/ns-d3d12-d3d12_command_queue_desc">D3D12_COMMAND_QUEUE_DESC</a></b>
     * 
     * The description of the command queue, as a <a href="/windows/desktop/api/d3d12/ns-d3d12-d3d12_command_queue_desc">D3D12_COMMAND_QUEUE_DESC</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12commandqueue-getdesc
     */
    GetDesc() {
        result := ComCall(18, this, "ptr")
        return result
    }
}
