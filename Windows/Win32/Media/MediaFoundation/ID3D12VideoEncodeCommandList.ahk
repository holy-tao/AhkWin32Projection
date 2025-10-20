#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12CommandList.ahk

/**
 * Encapsulates a list of graphics commands for video encoding, including motion estimation.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videoencodecommandlist
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoEncodeCommandList extends ID3D12CommandList{
    /**
     * The interface identifier for ID3D12VideoEncodeCommandList
     * @type {Guid}
     */
    static IID => Guid("{8455293a-0cbd-4831-9b39-fbdbab724723}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12CommandAllocator>} pAllocator 
     * @returns {HRESULT} 
     */
    Reset(pAllocator) {
        result := ComCall(10, this, "ptr", pAllocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearState() {
        ComCall(11, this)
        return result
    }

    /**
     * 
     * @param {Integer} NumBarriers 
     * @param {Pointer<D3D12_RESOURCE_BARRIER>} pBarriers 
     * @returns {String} Nothing - always returns an empty string
     */
    ResourceBarrier(NumBarriers, pBarriers) {
        ComCall(12, this, "uint", NumBarriers, "ptr", pBarriers)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Pointer<D3D12_DISCARD_REGION>} pRegion 
     * @returns {String} Nothing - always returns an empty string
     */
    DiscardResource(pResource, pRegion) {
        ComCall(13, this, "ptr", pResource, "ptr", pRegion)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12QueryHeap>} pQueryHeap 
     * @param {Integer} Type 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    BeginQuery(pQueryHeap, Type, Index) {
        ComCall(14, this, "ptr", pQueryHeap, "int", Type, "uint", Index)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12QueryHeap>} pQueryHeap 
     * @param {Integer} Type 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     */
    EndQuery(pQueryHeap, Type, Index) {
        ComCall(15, this, "ptr", pQueryHeap, "int", Type, "uint", Index)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12QueryHeap>} pQueryHeap 
     * @param {Integer} Type 
     * @param {Integer} StartIndex 
     * @param {Integer} NumQueries 
     * @param {Pointer<ID3D12Resource>} pDestinationBuffer 
     * @param {Integer} AlignedDestinationBufferOffset 
     * @returns {String} Nothing - always returns an empty string
     */
    ResolveQueryData(pQueryHeap, Type, StartIndex, NumQueries, pDestinationBuffer, AlignedDestinationBufferOffset) {
        ComCall(16, this, "ptr", pQueryHeap, "int", Type, "uint", StartIndex, "uint", NumQueries, "ptr", pDestinationBuffer, "uint", AlignedDestinationBufferOffset)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pBuffer 
     * @param {Integer} AlignedBufferOffset 
     * @param {Integer} Operation 
     * @returns {String} Nothing - always returns an empty string
     */
    SetPredication(pBuffer, AlignedBufferOffset, Operation) {
        ComCall(17, this, "ptr", pBuffer, "uint", AlignedBufferOffset, "int", Operation)
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
        ComCall(18, this, "uint", Metadata, "ptr", pData, "uint", Size)
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
        ComCall(19, this, "uint", Metadata, "ptr", pData, "uint", Size)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    EndEvent() {
        ComCall(20, this)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12VideoMotionEstimator>} pMotionEstimator 
     * @param {Pointer<D3D12_VIDEO_MOTION_ESTIMATOR_OUTPUT>} pOutputArguments 
     * @param {Pointer<D3D12_VIDEO_MOTION_ESTIMATOR_INPUT>} pInputArguments 
     * @returns {String} Nothing - always returns an empty string
     */
    EstimateMotion(pMotionEstimator, pOutputArguments, pInputArguments) {
        ComCall(21, this, "ptr", pMotionEstimator, "ptr", pOutputArguments, "ptr", pInputArguments)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_RESOLVE_VIDEO_MOTION_VECTOR_HEAP_OUTPUT>} pOutputArguments 
     * @param {Pointer<D3D12_RESOLVE_VIDEO_MOTION_VECTOR_HEAP_INPUT>} pInputArguments 
     * @returns {String} Nothing - always returns an empty string
     */
    ResolveMotionVectorHeap(pOutputArguments, pInputArguments) {
        ComCall(22, this, "ptr", pOutputArguments, "ptr", pInputArguments)
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<D3D12_WRITEBUFFERIMMEDIATE_PARAMETER>} pParams 
     * @param {Pointer<Int32>} pModes 
     * @returns {String} Nothing - always returns an empty string
     */
    WriteBufferImmediate(Count, pParams, pModes) {
        ComCall(23, this, "uint", Count, "ptr", pParams, "int*", pModes)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12ProtectedResourceSession>} pProtectedResourceSession 
     * @returns {String} Nothing - always returns an empty string
     */
    SetProtectedResourceSession(pProtectedResourceSession) {
        ComCall(24, this, "ptr", pProtectedResourceSession)
        return result
    }
}
