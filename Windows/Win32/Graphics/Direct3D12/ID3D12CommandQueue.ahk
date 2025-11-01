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
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Integer} NumResourceRegions 
     * @param {Pointer<D3D12_TILED_RESOURCE_COORDINATE>} pResourceRegionStartCoordinates 
     * @param {Pointer<D3D12_TILE_REGION_SIZE>} pResourceRegionSizes 
     * @param {ID3D12Heap} pHeap 
     * @param {Integer} NumRanges 
     * @param {Pointer<Integer>} pRangeFlags 
     * @param {Pointer<Integer>} pHeapRangeStartOffsets 
     * @param {Pointer<Integer>} pRangeTileCounts 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-updatetilemappings
     */
    UpdateTileMappings(pResource, NumResourceRegions, pResourceRegionStartCoordinates, pResourceRegionSizes, pHeap, NumRanges, pRangeFlags, pHeapRangeStartOffsets, pRangeTileCounts, Flags) {
        pRangeFlagsMarshal := pRangeFlags is VarRef ? "int*" : "ptr"
        pHeapRangeStartOffsetsMarshal := pHeapRangeStartOffsets is VarRef ? "uint*" : "ptr"
        pRangeTileCountsMarshal := pRangeTileCounts is VarRef ? "uint*" : "ptr"

        ComCall(8, this, "ptr", pResource, "uint", NumResourceRegions, "ptr", pResourceRegionStartCoordinates, "ptr", pResourceRegionSizes, "ptr", pHeap, "uint", NumRanges, pRangeFlagsMarshal, pRangeFlags, pHeapRangeStartOffsetsMarshal, pHeapRangeStartOffsets, pRangeTileCountsMarshal, pRangeTileCounts, "int", Flags)
    }

    /**
     * 
     * @param {ID3D12Resource} pDstResource 
     * @param {Pointer<D3D12_TILED_RESOURCE_COORDINATE>} pDstRegionStartCoordinate 
     * @param {ID3D12Resource} pSrcResource 
     * @param {Pointer<D3D12_TILED_RESOURCE_COORDINATE>} pSrcRegionStartCoordinate 
     * @param {Pointer<D3D12_TILE_REGION_SIZE>} pRegionSize 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-copytilemappings
     */
    CopyTileMappings(pDstResource, pDstRegionStartCoordinate, pSrcResource, pSrcRegionStartCoordinate, pRegionSize, Flags) {
        ComCall(9, this, "ptr", pDstResource, "ptr", pDstRegionStartCoordinate, "ptr", pSrcResource, "ptr", pSrcRegionStartCoordinate, "ptr", pRegionSize, "int", Flags)
    }

    /**
     * 
     * @param {Integer} NumCommandLists 
     * @param {Pointer<ID3D12CommandList>} ppCommandLists 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-executecommandlists
     */
    ExecuteCommandLists(NumCommandLists, ppCommandLists) {
        ComCall(10, this, "uint", NumCommandLists, "ptr*", ppCommandLists)
    }

    /**
     * 
     * @param {Integer} Metadata 
     * @param {Pointer} pData 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-setmarker
     */
    SetMarker(Metadata, pData, Size) {
        ComCall(11, this, "uint", Metadata, "ptr", pData, "uint", Size)
    }

    /**
     * 
     * @param {Integer} Metadata 
     * @param {Pointer} pData 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-beginevent
     */
    BeginEvent(Metadata, pData, Size) {
        ComCall(12, this, "uint", Metadata, "ptr", pData, "uint", Size)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-endevent
     */
    EndEvent() {
        ComCall(13, this)
    }

    /**
     * 
     * @param {ID3D12Fence} pFence 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-signal
     */
    Signal(pFence, Value) {
        result := ComCall(14, this, "ptr", pFence, "uint", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Fence} pFence 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-wait
     */
    Wait(pFence, Value) {
        result := ComCall(15, this, "ptr", pFence, "uint", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFrequency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-gettimestampfrequency
     */
    GetTimestampFrequency(pFrequency) {
        pFrequencyMarshal := pFrequency is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pFrequencyMarshal, pFrequency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pGpuTimestamp 
     * @param {Pointer<Integer>} pCpuTimestamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-getclockcalibration
     */
    GetClockCalibration(pGpuTimestamp, pCpuTimestamp) {
        pGpuTimestampMarshal := pGpuTimestamp is VarRef ? "uint*" : "ptr"
        pCpuTimestampMarshal := pCpuTimestamp is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, pGpuTimestampMarshal, pGpuTimestamp, pCpuTimestampMarshal, pCpuTimestamp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {D3D12_COMMAND_QUEUE_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-getdesc
     */
    GetDesc() {
        result := ComCall(18, this, "ptr")
        return result
    }
}
