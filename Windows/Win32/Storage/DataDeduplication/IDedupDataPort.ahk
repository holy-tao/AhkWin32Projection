#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class IDedupDataPort extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "LookupChunks", "InsertChunks", "InsertChunksWithStream", "CommitStreams", "CommitStreamsWithStream", "GetStreams", "GetStreamsResults", "GetChunks", "GetChunksResults", "GetRequestStatus", "GetRequestResults"]

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @param {Pointer<Integer>} pDataHeadroomMb 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus, pDataHeadroomMb) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"
        pDataHeadroomMbMarshal := pDataHeadroomMb is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pStatusMarshal, pStatus, pDataHeadroomMbMarshal, pDataHeadroomMb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DedupHash>} pHashes 
     * @returns {Guid} 
     */
    LookupChunks(Count, pHashes) {
        pRequestId := Guid()
        result := ComCall(4, this, "uint", Count, "ptr", pHashes, "ptr", pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * 
     * @param {Integer} ChunkCount 
     * @param {Pointer<DedupChunk>} pChunkMetadata 
     * @param {Integer} DataByteCount 
     * @param {Pointer<Integer>} pChunkData 
     * @returns {Guid} 
     */
    InsertChunks(ChunkCount, pChunkMetadata, DataByteCount, pChunkData) {
        pChunkDataMarshal := pChunkData is VarRef ? "char*" : "ptr"

        pRequestId := Guid()
        result := ComCall(5, this, "uint", ChunkCount, "ptr", pChunkMetadata, "uint", DataByteCount, pChunkDataMarshal, pChunkData, "ptr", pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * 
     * @param {Integer} ChunkCount 
     * @param {Pointer<DedupChunk>} pChunkMetadata 
     * @param {Integer} DataByteCount 
     * @param {IStream} pChunkDataStream 
     * @returns {Guid} 
     */
    InsertChunksWithStream(ChunkCount, pChunkMetadata, DataByteCount, pChunkDataStream) {
        pRequestId := Guid()
        result := ComCall(6, this, "uint", ChunkCount, "ptr", pChunkMetadata, "uint", DataByteCount, "ptr", pChunkDataStream, "ptr", pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * 
     * @param {Integer} StreamCount 
     * @param {Pointer<DedupStream>} pStreams 
     * @param {Integer} EntryCount 
     * @param {Pointer<DedupStreamEntry>} pEntries 
     * @returns {Guid} 
     */
    CommitStreams(StreamCount, pStreams, EntryCount, pEntries) {
        pRequestId := Guid()
        result := ComCall(7, this, "uint", StreamCount, "ptr", pStreams, "uint", EntryCount, "ptr", pEntries, "ptr", pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * 
     * @param {Integer} StreamCount 
     * @param {Pointer<DedupStream>} pStreams 
     * @param {Integer} EntryCount 
     * @param {IStream} pEntriesStream 
     * @returns {Guid} 
     */
    CommitStreamsWithStream(StreamCount, pStreams, EntryCount, pEntriesStream) {
        pRequestId := Guid()
        result := ComCall(8, this, "uint", StreamCount, "ptr", pStreams, "uint", EntryCount, "ptr", pEntriesStream, "ptr", pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * 
     * @param {Integer} StreamCount 
     * @param {Pointer<BSTR>} pStreamPaths 
     * @returns {Guid} 
     */
    GetStreams(StreamCount, pStreamPaths) {
        pRequestId := Guid()
        result := ComCall(9, this, "uint", StreamCount, "ptr", pStreamPaths, "ptr", pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * 
     * @param {Guid} RequestId 
     * @param {Integer} MaxWaitMs 
     * @param {Integer} StreamEntryIndex 
     * @param {Pointer<Integer>} pStreamCount 
     * @param {Pointer<Pointer<DedupStream>>} ppStreams 
     * @param {Pointer<Integer>} pEntryCount 
     * @param {Pointer<Pointer<DedupStreamEntry>>} ppEntries 
     * @param {Pointer<Integer>} pStatus 
     * @param {Pointer<Pointer<HRESULT>>} ppItemResults 
     * @returns {HRESULT} 
     */
    GetStreamsResults(RequestId, MaxWaitMs, StreamEntryIndex, pStreamCount, ppStreams, pEntryCount, ppEntries, pStatus, ppItemResults) {
        pStreamCountMarshal := pStreamCount is VarRef ? "uint*" : "ptr"
        ppStreamsMarshal := ppStreams is VarRef ? "ptr*" : "ptr"
        pEntryCountMarshal := pEntryCount is VarRef ? "uint*" : "ptr"
        ppEntriesMarshal := ppEntries is VarRef ? "ptr*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"
        ppItemResultsMarshal := ppItemResults is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", RequestId, "uint", MaxWaitMs, "uint", StreamEntryIndex, pStreamCountMarshal, pStreamCount, ppStreamsMarshal, ppStreams, pEntryCountMarshal, pEntryCount, ppEntriesMarshal, ppEntries, pStatusMarshal, pStatus, ppItemResultsMarshal, ppItemResults, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DedupHash>} pHashes 
     * @returns {Guid} 
     */
    GetChunks(Count, pHashes) {
        pRequestId := Guid()
        result := ComCall(11, this, "uint", Count, "ptr", pHashes, "ptr", pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * 
     * @param {Guid} RequestId 
     * @param {Integer} MaxWaitMs 
     * @param {Integer} ChunkIndex 
     * @param {Pointer<Integer>} pChunkCount 
     * @param {Pointer<Pointer<DedupChunk>>} ppChunkMetadata 
     * @param {Pointer<Integer>} pDataByteCount 
     * @param {Pointer<Pointer<Integer>>} ppChunkData 
     * @param {Pointer<Integer>} pStatus 
     * @param {Pointer<Pointer<HRESULT>>} ppItemResults 
     * @returns {HRESULT} 
     */
    GetChunksResults(RequestId, MaxWaitMs, ChunkIndex, pChunkCount, ppChunkMetadata, pDataByteCount, ppChunkData, pStatus, ppItemResults) {
        pChunkCountMarshal := pChunkCount is VarRef ? "uint*" : "ptr"
        ppChunkMetadataMarshal := ppChunkMetadata is VarRef ? "ptr*" : "ptr"
        pDataByteCountMarshal := pDataByteCount is VarRef ? "uint*" : "ptr"
        ppChunkDataMarshal := ppChunkData is VarRef ? "ptr*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"
        ppItemResultsMarshal := ppItemResults is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "ptr", RequestId, "uint", MaxWaitMs, "uint", ChunkIndex, pChunkCountMarshal, pChunkCount, ppChunkMetadataMarshal, ppChunkMetadata, pDataByteCountMarshal, pDataByteCount, ppChunkDataMarshal, ppChunkData, pStatusMarshal, pStatus, ppItemResultsMarshal, ppItemResults, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} RequestId 
     * @returns {Integer} 
     */
    GetRequestStatus(RequestId) {
        result := ComCall(13, this, "ptr", RequestId, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @param {Guid} RequestId 
     * @param {Integer} MaxWaitMs 
     * @param {Pointer<HRESULT>} pBatchResult 
     * @param {Pointer<Integer>} pBatchCount 
     * @param {Pointer<Integer>} pStatus 
     * @param {Pointer<Pointer<HRESULT>>} ppItemResults 
     * @returns {HRESULT} 
     */
    GetRequestResults(RequestId, MaxWaitMs, pBatchResult, pBatchCount, pStatus, ppItemResults) {
        pBatchResultMarshal := pBatchResult is VarRef ? "int*" : "ptr"
        pBatchCountMarshal := pBatchCount is VarRef ? "uint*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"
        ppItemResultsMarshal := ppItemResults is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, "ptr", RequestId, "uint", MaxWaitMs, pBatchResultMarshal, pBatchResult, pBatchCountMarshal, pBatchCount, pStatusMarshal, pStatus, ppItemResultsMarshal, ppItemResults, "HRESULT")
        return result
    }
}
