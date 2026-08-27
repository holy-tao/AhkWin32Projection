#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DedupChunk.ahk" { DedupChunk }
#Import ".\DedupDataPortRequestStatus.ahk" { DedupDataPortRequestStatus }
#Import ".\DedupDataPortVolumeStatus.ahk" { DedupDataPortVolumeStatus }
#Import ".\DedupHash.ahk" { DedupHash }
#Import ".\DedupStream.ahk" { DedupStream }
#Import ".\DedupStreamEntry.ahk" { DedupStreamEntry }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct IDedupDataPort extends IUnknown {
    /**
     * The interface identifier for IDedupDataPort
     * @type {Guid}
     */
    static IID := Guid("{7963d734-40a9-4ea3-bbf6-5a89d26f7ae8}")

    /**
     * The class identifier for DedupDataPort
     * @type {Guid}
     */
    static CLSID := Guid("{8f107207-1829-48b2-a64b-e61f8e0d9acb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDedupDataPort interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStatus               : IntPtr
        LookupChunks            : IntPtr
        InsertChunks            : IntPtr
        InsertChunksWithStream  : IntPtr
        CommitStreams           : IntPtr
        CommitStreamsWithStream : IntPtr
        GetStreams              : IntPtr
        GetStreamsResults       : IntPtr
        GetChunks               : IntPtr
        GetChunksResults        : IntPtr
        GetRequestStatus        : IntPtr
        GetRequestResults       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDedupDataPort.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @param {Pointer<DedupDataPortVolumeStatus>} pStatus 
     * @param {Pointer<Integer>} pDataHeadroomMb 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus, pDataHeadroomMb) {
        pStatusMarshal := pStatus is VarRef ? "int*" : IntPtr
        pDataHeadroomMbMarshal := pDataHeadroomMb is VarRef ? "uint*" : IntPtr

        result := ComCall(3, this, pStatusMarshal, pStatus, pDataHeadroomMbMarshal, pDataHeadroomMb, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Count 
     * @param {Pointer<DedupHash>} pHashes 
     * @returns {Guid} 
     */
    LookupChunks(Count, pHashes) {
        pRequestId := Guid()
        result := ComCall(4, this, UInt32, Count, DedupHash.Ptr, pHashes, Guid.Ptr, pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * @param {Integer} ChunkCount 
     * @param {Pointer<DedupChunk>} pChunkMetadata 
     * @param {Integer} DataByteCount 
     * @param {Pointer<Integer>} pChunkData 
     * @returns {Guid} 
     */
    InsertChunks(ChunkCount, pChunkMetadata, DataByteCount, pChunkData) {
        pChunkDataMarshal := pChunkData is VarRef ? "char*" : IntPtr

        pRequestId := Guid()
        result := ComCall(5, this, UInt32, ChunkCount, DedupChunk.Ptr, pChunkMetadata, UInt32, DataByteCount, pChunkDataMarshal, pChunkData, Guid.Ptr, pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * @param {Integer} ChunkCount 
     * @param {Pointer<DedupChunk>} pChunkMetadata 
     * @param {Integer} DataByteCount 
     * @param {IStream} pChunkDataStream 
     * @returns {Guid} 
     */
    InsertChunksWithStream(ChunkCount, pChunkMetadata, DataByteCount, pChunkDataStream) {
        pRequestId := Guid()
        result := ComCall(6, this, UInt32, ChunkCount, DedupChunk.Ptr, pChunkMetadata, UInt32, DataByteCount, "ptr", pChunkDataStream, Guid.Ptr, pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * @param {Integer} StreamCount 
     * @param {Pointer<DedupStream>} pStreams 
     * @param {Integer} EntryCount 
     * @param {Pointer<DedupStreamEntry>} pEntries 
     * @returns {Guid} 
     */
    CommitStreams(StreamCount, pStreams, EntryCount, pEntries) {
        pRequestId := Guid()
        result := ComCall(7, this, UInt32, StreamCount, DedupStream.Ptr, pStreams, UInt32, EntryCount, DedupStreamEntry.Ptr, pEntries, Guid.Ptr, pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * @param {Integer} StreamCount 
     * @param {Pointer<DedupStream>} pStreams 
     * @param {Integer} EntryCount 
     * @param {IStream} pEntriesStream 
     * @returns {Guid} 
     */
    CommitStreamsWithStream(StreamCount, pStreams, EntryCount, pEntriesStream) {
        pRequestId := Guid()
        result := ComCall(8, this, UInt32, StreamCount, DedupStream.Ptr, pStreams, UInt32, EntryCount, "ptr", pEntriesStream, Guid.Ptr, pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * @param {Integer} StreamCount 
     * @param {Pointer<BSTR>} pStreamPaths 
     * @returns {Guid} 
     */
    GetStreams(StreamCount, pStreamPaths) {
        pRequestId := Guid()
        result := ComCall(9, this, UInt32, StreamCount, BSTR.Ptr, pStreamPaths, Guid.Ptr, pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * @param {Guid} RequestId 
     * @param {Integer} MaxWaitMs 
     * @param {Integer} StreamEntryIndex 
     * @param {Pointer<Integer>} pStreamCount 
     * @param {Pointer<Pointer<DedupStream>>} ppStreams 
     * @param {Pointer<Integer>} pEntryCount 
     * @param {Pointer<Pointer<DedupStreamEntry>>} ppEntries 
     * @param {Pointer<DedupDataPortRequestStatus>} pStatus 
     * @param {Pointer<Pointer<HRESULT>>} ppItemResults 
     * @returns {HRESULT} 
     */
    GetStreamsResults(RequestId, MaxWaitMs, StreamEntryIndex, pStreamCount, ppStreams, pEntryCount, ppEntries, pStatus, ppItemResults) {
        pStreamCountMarshal := pStreamCount is VarRef ? "uint*" : IntPtr
        ppStreamsMarshal := ppStreams is VarRef ? "ptr*" : IntPtr
        pEntryCountMarshal := pEntryCount is VarRef ? "uint*" : IntPtr
        ppEntriesMarshal := ppEntries is VarRef ? "ptr*" : IntPtr
        pStatusMarshal := pStatus is VarRef ? "int*" : IntPtr
        ppItemResultsMarshal := ppItemResults is VarRef ? "ptr*" : IntPtr

        result := ComCall(10, this, Guid, RequestId, UInt32, MaxWaitMs, UInt32, StreamEntryIndex, pStreamCountMarshal, pStreamCount, ppStreamsMarshal, ppStreams, pEntryCountMarshal, pEntryCount, ppEntriesMarshal, ppEntries, pStatusMarshal, pStatus, ppItemResultsMarshal, ppItemResults, "HRESULT")
        return result
    }

    /**
     * @param {Integer} Count 
     * @param {Pointer<DedupHash>} pHashes 
     * @returns {Guid} 
     */
    GetChunks(Count, pHashes) {
        pRequestId := Guid()
        result := ComCall(11, this, UInt32, Count, DedupHash.Ptr, pHashes, Guid.Ptr, pRequestId, "HRESULT")
        return pRequestId
    }

    /**
     * @param {Guid} RequestId 
     * @param {Integer} MaxWaitMs 
     * @param {Integer} ChunkIndex 
     * @param {Pointer<Integer>} pChunkCount 
     * @param {Pointer<Pointer<DedupChunk>>} ppChunkMetadata 
     * @param {Pointer<Integer>} pDataByteCount 
     * @param {Pointer<Pointer<Integer>>} ppChunkData 
     * @param {Pointer<DedupDataPortRequestStatus>} pStatus 
     * @param {Pointer<Pointer<HRESULT>>} ppItemResults 
     * @returns {HRESULT} 
     */
    GetChunksResults(RequestId, MaxWaitMs, ChunkIndex, pChunkCount, ppChunkMetadata, pDataByteCount, ppChunkData, pStatus, ppItemResults) {
        pChunkCountMarshal := pChunkCount is VarRef ? "uint*" : IntPtr
        ppChunkMetadataMarshal := ppChunkMetadata is VarRef ? "ptr*" : IntPtr
        pDataByteCountMarshal := pDataByteCount is VarRef ? "uint*" : IntPtr
        ppChunkDataMarshal := ppChunkData is VarRef ? "ptr*" : IntPtr
        pStatusMarshal := pStatus is VarRef ? "int*" : IntPtr
        ppItemResultsMarshal := ppItemResults is VarRef ? "ptr*" : IntPtr

        result := ComCall(12, this, Guid, RequestId, UInt32, MaxWaitMs, UInt32, ChunkIndex, pChunkCountMarshal, pChunkCount, ppChunkMetadataMarshal, ppChunkMetadata, pDataByteCountMarshal, pDataByteCount, ppChunkDataMarshal, ppChunkData, pStatusMarshal, pStatus, ppItemResultsMarshal, ppItemResults, "HRESULT")
        return result
    }

    /**
     * @param {Guid} RequestId 
     * @returns {DedupDataPortRequestStatus} 
     */
    GetRequestStatus(RequestId) {
        result := ComCall(13, this, Guid, RequestId, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * @param {Guid} RequestId 
     * @param {Integer} MaxWaitMs 
     * @param {Pointer<HRESULT>} pBatchResult 
     * @param {Pointer<Integer>} pBatchCount 
     * @param {Pointer<DedupDataPortRequestStatus>} pStatus 
     * @param {Pointer<Pointer<HRESULT>>} ppItemResults 
     * @returns {HRESULT} 
     */
    GetRequestResults(RequestId, MaxWaitMs, pBatchResult, pBatchCount, pStatus, ppItemResults) {
        pBatchResultMarshal := pBatchResult is VarRef ? "int*" : IntPtr
        pBatchCountMarshal := pBatchCount is VarRef ? "uint*" : IntPtr
        pStatusMarshal := pStatus is VarRef ? "int*" : IntPtr
        ppItemResultsMarshal := ppItemResults is VarRef ? "ptr*" : IntPtr

        result := ComCall(14, this, Guid, RequestId, UInt32, MaxWaitMs, pBatchResultMarshal, pBatchResult, pBatchCountMarshal, pBatchCount, pStatusMarshal, pStatus, ppItemResultsMarshal, ppItemResults, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IDedupDataPort.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStatus := CallbackCreate(ObjBindMethod(implObj, "GetStatus"), flags, 3)
        this.vtbl.LookupChunks := CallbackCreate(ObjBindMethod(implObj, "LookupChunks"), flags, 4)
        this.vtbl.InsertChunks := CallbackCreate(ObjBindMethod(implObj, "InsertChunks"), flags, 6)
        this.vtbl.InsertChunksWithStream := CallbackCreate(ObjBindMethod(implObj, "InsertChunksWithStream"), flags, 6)
        this.vtbl.CommitStreams := CallbackCreate(ObjBindMethod(implObj, "CommitStreams"), flags, 6)
        this.vtbl.CommitStreamsWithStream := CallbackCreate(ObjBindMethod(implObj, "CommitStreamsWithStream"), flags, 6)
        this.vtbl.GetStreams := CallbackCreate(ObjBindMethod(implObj, "GetStreams"), flags, 4)
        this.vtbl.GetStreamsResults := CallbackCreate(ObjBindMethod(implObj, "GetStreamsResults"), flags, 10)
        this.vtbl.GetChunks := CallbackCreate(ObjBindMethod(implObj, "GetChunks"), flags, 4)
        this.vtbl.GetChunksResults := CallbackCreate(ObjBindMethod(implObj, "GetChunksResults"), flags, 10)
        this.vtbl.GetRequestStatus := CallbackCreate(ObjBindMethod(implObj, "GetRequestStatus"), flags, 3)
        this.vtbl.GetRequestResults := CallbackCreate(ObjBindMethod(implObj, "GetRequestResults"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.LookupChunks)
        CallbackFree(this.vtbl.InsertChunks)
        CallbackFree(this.vtbl.InsertChunksWithStream)
        CallbackFree(this.vtbl.CommitStreams)
        CallbackFree(this.vtbl.CommitStreamsWithStream)
        CallbackFree(this.vtbl.GetStreams)
        CallbackFree(this.vtbl.GetStreamsResults)
        CallbackFree(this.vtbl.GetChunks)
        CallbackFree(this.vtbl.GetChunksResults)
        CallbackFree(this.vtbl.GetRequestStatus)
        CallbackFree(this.vtbl.GetRequestResults)
    }
}
