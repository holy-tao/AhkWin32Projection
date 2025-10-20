#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class IDedupDataPort extends IUnknown{
    /**
     * The interface identifier for IDedupDataPort
     * @type {Guid}
     */
    static IID => Guid("{7963d734-40a9-4ea3-bbf6-5a89d26f7ae8}")

    /**
     * The class identifier for DedupDataPort
     * @type {Guid}
     */
    static CLSID => Guid("{8f107207-1829-48b2-a64b-e61f8e0d9acb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pStatus 
     * @param {Pointer<UInt32>} pDataHeadroomMb 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus, pDataHeadroomMb) {
        result := ComCall(3, this, "int*", pStatus, "uint*", pDataHeadroomMb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DedupHash>} pHashes 
     * @param {Pointer<Guid>} pRequestId 
     * @returns {HRESULT} 
     */
    LookupChunks(Count, pHashes, pRequestId) {
        result := ComCall(4, this, "uint", Count, "ptr", pHashes, "ptr", pRequestId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ChunkCount 
     * @param {Pointer<DedupChunk>} pChunkMetadata 
     * @param {Integer} DataByteCount 
     * @param {Pointer<Byte>} pChunkData 
     * @param {Pointer<Guid>} pRequestId 
     * @returns {HRESULT} 
     */
    InsertChunks(ChunkCount, pChunkMetadata, DataByteCount, pChunkData, pRequestId) {
        result := ComCall(5, this, "uint", ChunkCount, "ptr", pChunkMetadata, "uint", DataByteCount, "char*", pChunkData, "ptr", pRequestId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ChunkCount 
     * @param {Pointer<DedupChunk>} pChunkMetadata 
     * @param {Integer} DataByteCount 
     * @param {Pointer<IStream>} pChunkDataStream 
     * @param {Pointer<Guid>} pRequestId 
     * @returns {HRESULT} 
     */
    InsertChunksWithStream(ChunkCount, pChunkMetadata, DataByteCount, pChunkDataStream, pRequestId) {
        result := ComCall(6, this, "uint", ChunkCount, "ptr", pChunkMetadata, "uint", DataByteCount, "ptr", pChunkDataStream, "ptr", pRequestId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StreamCount 
     * @param {Pointer<DedupStream>} pStreams 
     * @param {Integer} EntryCount 
     * @param {Pointer<DedupStreamEntry>} pEntries 
     * @param {Pointer<Guid>} pRequestId 
     * @returns {HRESULT} 
     */
    CommitStreams(StreamCount, pStreams, EntryCount, pEntries, pRequestId) {
        result := ComCall(7, this, "uint", StreamCount, "ptr", pStreams, "uint", EntryCount, "ptr", pEntries, "ptr", pRequestId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StreamCount 
     * @param {Pointer<DedupStream>} pStreams 
     * @param {Integer} EntryCount 
     * @param {Pointer<IStream>} pEntriesStream 
     * @param {Pointer<Guid>} pRequestId 
     * @returns {HRESULT} 
     */
    CommitStreamsWithStream(StreamCount, pStreams, EntryCount, pEntriesStream, pRequestId) {
        result := ComCall(8, this, "uint", StreamCount, "ptr", pStreams, "uint", EntryCount, "ptr", pEntriesStream, "ptr", pRequestId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StreamCount 
     * @param {Pointer<BSTR>} pStreamPaths 
     * @param {Pointer<Guid>} pRequestId 
     * @returns {HRESULT} 
     */
    GetStreams(StreamCount, pStreamPaths, pRequestId) {
        result := ComCall(9, this, "uint", StreamCount, "ptr", pStreamPaths, "ptr", pRequestId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} RequestId 
     * @param {Integer} MaxWaitMs 
     * @param {Integer} StreamEntryIndex 
     * @param {Pointer<UInt32>} pStreamCount 
     * @param {Pointer<DedupStream>} ppStreams 
     * @param {Pointer<UInt32>} pEntryCount 
     * @param {Pointer<DedupStreamEntry>} ppEntries 
     * @param {Pointer<Int32>} pStatus 
     * @param {Pointer<HRESULT>} ppItemResults 
     * @returns {HRESULT} 
     */
    GetStreamsResults(RequestId, MaxWaitMs, StreamEntryIndex, pStreamCount, ppStreams, pEntryCount, ppEntries, pStatus, ppItemResults) {
        result := ComCall(10, this, "ptr", RequestId, "uint", MaxWaitMs, "uint", StreamEntryIndex, "uint*", pStreamCount, "ptr", ppStreams, "uint*", pEntryCount, "ptr", ppEntries, "int*", pStatus, "ptr", ppItemResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DedupHash>} pHashes 
     * @param {Pointer<Guid>} pRequestId 
     * @returns {HRESULT} 
     */
    GetChunks(Count, pHashes, pRequestId) {
        result := ComCall(11, this, "uint", Count, "ptr", pHashes, "ptr", pRequestId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} RequestId 
     * @param {Integer} MaxWaitMs 
     * @param {Integer} ChunkIndex 
     * @param {Pointer<UInt32>} pChunkCount 
     * @param {Pointer<DedupChunk>} ppChunkMetadata 
     * @param {Pointer<UInt32>} pDataByteCount 
     * @param {Pointer<Byte>} ppChunkData 
     * @param {Pointer<Int32>} pStatus 
     * @param {Pointer<HRESULT>} ppItemResults 
     * @returns {HRESULT} 
     */
    GetChunksResults(RequestId, MaxWaitMs, ChunkIndex, pChunkCount, ppChunkMetadata, pDataByteCount, ppChunkData, pStatus, ppItemResults) {
        result := ComCall(12, this, "ptr", RequestId, "uint", MaxWaitMs, "uint", ChunkIndex, "uint*", pChunkCount, "ptr", ppChunkMetadata, "uint*", pDataByteCount, "char*", ppChunkData, "int*", pStatus, "ptr", ppItemResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} RequestId 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    GetRequestStatus(RequestId, pStatus) {
        result := ComCall(13, this, "ptr", RequestId, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} RequestId 
     * @param {Integer} MaxWaitMs 
     * @param {Pointer<HRESULT>} pBatchResult 
     * @param {Pointer<UInt32>} pBatchCount 
     * @param {Pointer<Int32>} pStatus 
     * @param {Pointer<HRESULT>} ppItemResults 
     * @returns {HRESULT} 
     */
    GetRequestResults(RequestId, MaxWaitMs, pBatchResult, pBatchCount, pStatus, ppItemResults) {
        result := ComCall(14, this, "ptr", RequestId, "uint", MaxWaitMs, "ptr", pBatchResult, "uint*", pBatchCount, "int*", pStatus, "ptr", ppItemResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
