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
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Integer} NumResourceRegions 
     * @param {Pointer<D3D12_TILED_RESOURCE_COORDINATE>} pResourceRegionStartCoordinates 
     * @param {Pointer<D3D12_TILE_REGION_SIZE>} pResourceRegionSizes 
     * @param {Pointer<ID3D12Heap>} pHeap 
     * @param {Integer} NumRanges 
     * @param {Pointer<Int32>} pRangeFlags 
     * @param {Pointer<UInt32>} pHeapRangeStartOffsets 
     * @param {Pointer<UInt32>} pRangeTileCounts 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    UpdateTileMappings(pResource, NumResourceRegions, pResourceRegionStartCoordinates, pResourceRegionSizes, pHeap, NumRanges, pRangeFlags, pHeapRangeStartOffsets, pRangeTileCounts, Flags) {
        ComCall(8, this, "ptr", pResource, "uint", NumResourceRegions, "ptr", pResourceRegionStartCoordinates, "ptr", pResourceRegionSizes, "ptr", pHeap, "uint", NumRanges, "int*", pRangeFlags, "uint*", pHeapRangeStartOffsets, "uint*", pRangeTileCounts, "int", Flags)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pDstResource 
     * @param {Pointer<D3D12_TILED_RESOURCE_COORDINATE>} pDstRegionStartCoordinate 
     * @param {Pointer<ID3D12Resource>} pSrcResource 
     * @param {Pointer<D3D12_TILED_RESOURCE_COORDINATE>} pSrcRegionStartCoordinate 
     * @param {Pointer<D3D12_TILE_REGION_SIZE>} pRegionSize 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    CopyTileMappings(pDstResource, pDstRegionStartCoordinate, pSrcResource, pSrcRegionStartCoordinate, pRegionSize, Flags) {
        ComCall(9, this, "ptr", pDstResource, "ptr", pDstRegionStartCoordinate, "ptr", pSrcResource, "ptr", pSrcRegionStartCoordinate, "ptr", pRegionSize, "int", Flags)
        return result
    }

    /**
     * 
     * @param {Integer} NumCommandLists 
     * @param {Pointer<ID3D12CommandList>} ppCommandLists 
     * @returns {String} Nothing - always returns an empty string
     */
    ExecuteCommandLists(NumCommandLists, ppCommandLists) {
        ComCall(10, this, "uint", NumCommandLists, "ptr", ppCommandLists)
        return result
    }

    /**
     * 
     * @param {Integer} Metadata 
     * @param {Pointer} pData 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     */
    SetMarker(Metadata, pData, Size) {
        ComCall(11, this, "uint", Metadata, "ptr", pData, "uint", Size)
        return result
    }

    /**
     * 
     * @param {Integer} Metadata 
     * @param {Pointer} pData 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     */
    BeginEvent(Metadata, pData, Size) {
        ComCall(12, this, "uint", Metadata, "ptr", pData, "uint", Size)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    EndEvent() {
        ComCall(13, this)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Fence>} pFence 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    Signal(pFence, Value) {
        result := ComCall(14, this, "ptr", pFence, "uint", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Fence>} pFence 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    Wait(pFence, Value) {
        result := ComCall(15, this, "ptr", pFence, "uint", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pFrequency 
     * @returns {HRESULT} 
     */
    GetTimestampFrequency(pFrequency) {
        result := ComCall(16, this, "uint*", pFrequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pGpuTimestamp 
     * @param {Pointer<UInt64>} pCpuTimestamp 
     * @returns {HRESULT} 
     */
    GetClockCalibration(pGpuTimestamp, pCpuTimestamp) {
        result := ComCall(17, this, "uint*", pGpuTimestamp, "uint*", pCpuTimestamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {D3D12_COMMAND_QUEUE_DESC} 
     */
    GetDesc() {
        result := ComCall(18, this, "ptr")
        return result
    }
}
