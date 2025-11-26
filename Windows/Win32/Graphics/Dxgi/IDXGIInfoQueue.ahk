#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface controls the debug information queue, and can only be used if the debug layer is turned on.
 * @remarks
 * 
 * This interface is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-dxgigetdebuginterface">DXGIGetDebugInterface</a> function.
 * 
 * For more info about the debug layer, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">Debug Layer</a>.
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nn-dxgidebug-idxgiinfoqueue
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIInfoQueue extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIInfoQueue
     * @type {Guid}
     */
    static IID => Guid("{d67441c7-672a-476f-9e82-cd55b44949ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMessageCountLimit", "ClearStoredMessages", "GetMessage", "GetNumStoredMessagesAllowedByRetrievalFilters", "GetNumStoredMessages", "GetNumMessagesDiscardedByMessageCountLimit", "GetMessageCountLimit", "GetNumMessagesAllowedByStorageFilter", "GetNumMessagesDeniedByStorageFilter", "AddStorageFilterEntries", "GetStorageFilter", "ClearStorageFilter", "PushEmptyStorageFilter", "PushDenyAllStorageFilter", "PushCopyOfStorageFilter", "PushStorageFilter", "PopStorageFilter", "GetStorageFilterStackSize", "AddRetrievalFilterEntries", "GetRetrievalFilter", "ClearRetrievalFilter", "PushEmptyRetrievalFilter", "PushDenyAllRetrievalFilter", "PushCopyOfRetrievalFilter", "PushRetrievalFilter", "PopRetrievalFilter", "GetRetrievalFilterStackSize", "AddMessage", "AddApplicationMessage", "SetBreakOnCategory", "SetBreakOnSeverity", "SetBreakOnID", "GetBreakOnCategory", "GetBreakOnSeverity", "GetBreakOnID", "SetMuteDebugOutput", "GetMuteDebugOutput"]

    /**
     * Sets the maximum number of messages that can be added to the message queue.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that sets the limit on the number of messages.
     * @param {Integer} MessageCountLimit The maximum number of messages that can be added to the queue. –1 means no limit.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-setmessagecountlimit
     */
    SetMessageCountLimit(Producer, MessageCountLimit) {
        result := ComCall(3, this, "ptr", Producer, "uint", MessageCountLimit, "HRESULT")
        return result
    }

    /**
     * Clears all messages from the message queue.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * 
     * 
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that clears the messages.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-clearstoredmessages
     */
    ClearStoredMessages(Producer) {
        ComCall(4, this, "ptr", Producer)
    }

    /**
     * Gets a message from the message queue.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the message.
     * @param {Integer} MessageIndex An index into the message queue after an optional retrieval filter has been applied. This can be between 0 and the number of messages in the message queue that pass through the retrieval filter. Call <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnumstoredmessagesallowedbyretrievalfilters">IDXGIInfoQueue::GetNumStoredMessagesAllowedByRetrievalFilters</a> to obtain this number. 0 is the message at the beginning of the message queue.
     * @param {Pointer} pMessage A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_message">DXGI_INFO_QUEUE_MESSAGE</a> structure that describes the message.
     * @param {Pointer<Pointer>} pMessageByteLength A pointer to a variable that receives the size, in bytes, of the message description that <i>pMessage</i> points to. This size includes the size of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_message">DXGI_INFO_QUEUE_MESSAGE</a> structure in bytes.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmessage
     */
    GetMessage(Producer, MessageIndex, pMessage, pMessageByteLength) {
        pMessageByteLengthMarshal := pMessageByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", Producer, "uint", MessageIndex, "ptr", pMessage, pMessageByteLengthMarshal, pMessageByteLength, "HRESULT")
        return result
    }

    /**
     * Gets the number of messages that can pass through a retrieval filter.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the number.
     * @returns {Integer} Returns the number of messages that can pass through a retrieval filter.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnumstoredmessagesallowedbyretrievalfilters
     */
    GetNumStoredMessagesAllowedByRetrievalFilters(Producer) {
        result := ComCall(6, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * Gets the number of messages currently stored in the message queue.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the number.
     * @returns {Integer} Returns the number of messages currently stored in the message queue.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnumstoredmessages
     */
    GetNumStoredMessages(Producer) {
        result := ComCall(7, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * Gets the number of messages that were discarded due to the message count limit.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the number.
     * @returns {Integer} Returns the number of messages that were discarded.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnummessagesdiscardedbymessagecountlimit
     */
    GetNumMessagesDiscardedByMessageCountLimit(Producer) {
        result := ComCall(8, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * Gets the maximum number of messages that can be added to the message queue.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the number.
     * @returns {Integer} Returns the maximum number of messages that can be added to the queue. –1 means no limit.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmessagecountlimit
     */
    GetMessageCountLimit(Producer) {
        result := ComCall(9, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * Gets the number of messages that a storage filter allowed to pass through.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the number.
     * @returns {Integer} Returns the number of messages allowed by a storage filter.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnummessagesallowedbystoragefilter
     */
    GetNumMessagesAllowedByStorageFilter(Producer) {
        result := ComCall(10, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * Gets the number of messages that were denied passage through a storage filter.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the number.
     * @returns {Integer} Returns the number of messages denied by a storage filter.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnummessagesdeniedbystoragefilter
     */
    GetNumMessagesDeniedByStorageFilter(Producer) {
        result := ComCall(11, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * Adds storage filters to the top of the storage-filter stack.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that produced the filters.
     * @param {Pointer<DXGI_INFO_QUEUE_FILTER>} pFilter An array of <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structures that describe the filters.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-addstoragefilterentries
     */
    AddStorageFilterEntries(Producer, pFilter) {
        result := ComCall(12, this, "ptr", Producer, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Gets the storage filter at the top of the storage-filter stack.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the filter.
     * @param {Pointer} pFilter A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structure that describes the filter.
     * @param {Pointer<Pointer>} pFilterByteLength A pointer to a variable that receives the size, in bytes, of the filter description to which <i>pFilter</i> points. If <i>pFilter</i> is <b>NULL</b>, <b>GetStorageFilter</b> outputs the size of the storage filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getstoragefilter
     */
    GetStorageFilter(Producer, pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", Producer, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * Removes a storage filter from the top of the storage-filter stack.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * 
     * 
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that removes the filter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-clearstoragefilter
     */
    ClearStorageFilter(Producer) {
        ComCall(14, this, "ptr", Producer)
    }

    /**
     * Pushes an empty storage filter onto the storage-filter stack.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the empty storage filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushemptystoragefilter
     */
    PushEmptyStorageFilter(Producer) {
        result := ComCall(15, this, "ptr", Producer, "HRESULT")
        return result
    }

    /**
     * Pushes a deny-all storage filter onto the storage-filter stack.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushdenyallstoragefilter
     */
    PushDenyAllStorageFilter(Producer) {
        result := ComCall(16, this, "ptr", Producer, "HRESULT")
        return result
    }

    /**
     * Pushes a copy of the storage filter that is currently on the top of the storage-filter stack onto the storage-filter stack.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the copy of the storage filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushcopyofstoragefilter
     */
    PushCopyOfStorageFilter(Producer) {
        result := ComCall(17, this, "ptr", Producer, "HRESULT")
        return result
    }

    /**
     * Pushes a storage filter onto the storage-filter stack.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the filter.
     * @param {Pointer<DXGI_INFO_QUEUE_FILTER>} pFilter A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structure that describes the filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushstoragefilter
     */
    PushStorageFilter(Producer, pFilter) {
        result := ComCall(18, this, "ptr", Producer, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Pops a storage filter from the top of the storage-filter stack.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * 
     * 
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pops the filter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-popstoragefilter
     */
    PopStorageFilter(Producer) {
        ComCall(19, this, "ptr", Producer)
    }

    /**
     * Gets the size of the storage-filter stack in bytes.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the size.
     * @returns {Integer} Returns the size of the storage-filter stack in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getstoragefilterstacksize
     */
    GetStorageFilterStackSize(Producer) {
        result := ComCall(20, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * Adds retrieval filters to the top of the retrieval-filter stack.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that produced the filters.
     * @param {Pointer<DXGI_INFO_QUEUE_FILTER>} pFilter An array of <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structures that describe the filters.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-addretrievalfilterentries
     */
    AddRetrievalFilterEntries(Producer, pFilter) {
        result := ComCall(21, this, "ptr", Producer, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Gets the retrieval filter at the top of the retrieval-filter stack.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the filter.
     * @param {Pointer} pFilter A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structure that describes the filter.
     * @param {Pointer<Pointer>} pFilterByteLength A pointer to a variable that receives the size, in bytes, of the filter description to which <i>pFilter</i> points. If <i>pFilter</i> is <b>NULL</b>, <b>GetRetrievalFilter</b> outputs the size of the retrieval filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getretrievalfilter
     */
    GetRetrievalFilter(Producer, pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "ptr", Producer, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * Removes a retrieval filter from the top of the retrieval-filter stack.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * 
     * 
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that removes the filter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-clearretrievalfilter
     */
    ClearRetrievalFilter(Producer) {
        ComCall(23, this, "ptr", Producer)
    }

    /**
     * Pushes an empty retrieval filter onto the retrieval-filter stack.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the empty retrieval filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushemptyretrievalfilter
     */
    PushEmptyRetrievalFilter(Producer) {
        result := ComCall(24, this, "ptr", Producer, "HRESULT")
        return result
    }

    /**
     * Pushes a deny-all retrieval filter onto the retrieval-filter stack.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the deny-all retrieval filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushdenyallretrievalfilter
     */
    PushDenyAllRetrievalFilter(Producer) {
        result := ComCall(25, this, "ptr", Producer, "HRESULT")
        return result
    }

    /**
     * Pushes a copy of the retrieval filter that is currently on the top of the retrieval-filter stack onto the retrieval-filter stack.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the copy of the retrieval filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushcopyofretrievalfilter
     */
    PushCopyOfRetrievalFilter(Producer) {
        result := ComCall(26, this, "ptr", Producer, "HRESULT")
        return result
    }

    /**
     * Pushes a retrieval filter onto the retrieval-filter stack.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the filter.
     * @param {Pointer<DXGI_INFO_QUEUE_FILTER>} pFilter A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structure that describes the filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushretrievalfilter
     */
    PushRetrievalFilter(Producer, pFilter) {
        result := ComCall(27, this, "ptr", Producer, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Pops a retrieval filter from the top of the retrieval-filter stack.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * 
     * 
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pops the filter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-popretrievalfilter
     */
    PopRetrievalFilter(Producer) {
        ComCall(28, this, "ptr", Producer)
    }

    /**
     * Gets the size of the retrieval-filter stack in bytes.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the size.
     * @returns {Integer} Returns the size of the retrieval-filter stack in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getretrievalfilterstacksize
     */
    GetRetrievalFilterStackSize(Producer) {
        result := ComCall(29, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * Adds a debug message to the message queue and sends that message to the debug output.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that produced the message.
     * @param {Integer} Category A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category">DXGI_INFO_QUEUE_MESSAGE_CATEGORY</a>-typed value that specifies the category of the message.
     * @param {Integer} Severity A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity">DXGI_INFO_QUEUE_MESSAGE_SEVERITY</a>-typed value that specifies the severity of the message.
     * @param {Integer} ID An integer that uniquely identifies the message.
     * @param {PSTR} pDescription The message string.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-addmessage
     */
    AddMessage(Producer, Category, Severity, ID, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(30, this, "ptr", Producer, "int", Category, "int", Severity, "int", ID, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * Adds a user-defined message to the message queue and sends that message to the debug output.
     * @param {Integer} Severity A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity">DXGI_INFO_QUEUE_MESSAGE_SEVERITY</a>-typed value that specifies the severity of the message.
     * @param {PSTR} pDescription The message string.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-addapplicationmessage
     */
    AddApplicationMessage(Severity, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(31, this, "int", Severity, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * Sets a message category to break on when a message with that category passes through the storage filter.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that sets the breaking condition.
     * @param {Integer} Category A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category">DXGI_INFO_QUEUE_MESSAGE_CATEGORY</a>-typed value that specifies the category of the message.
     * @param {BOOL} bEnable A Boolean value that specifies whether <b>SetBreakOnCategory</b> turns on or off this breaking condition (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-setbreakoncategory
     */
    SetBreakOnCategory(Producer, Category, bEnable) {
        result := ComCall(32, this, "ptr", Producer, "int", Category, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * Sets a message severity level to break on when a message with that severity level passes through the storage filter.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that sets the breaking condition.
     * @param {Integer} Severity A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity">DXGI_INFO_QUEUE_MESSAGE_SEVERITY</a>-typed value that specifies the severity of the message.
     * @param {BOOL} bEnable A Boolean value that specifies whether <b>SetBreakOnSeverity</b> turns on or off this breaking condition (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-setbreakonseverity
     */
    SetBreakOnSeverity(Producer, Severity, bEnable) {
        result := ComCall(33, this, "ptr", Producer, "int", Severity, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * Sets a message identifier to break on when a message with that identifier passes through the storage filter.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that sets the breaking condition.
     * @param {Integer} ID An integer value that specifies the identifier of the message.
     * @param {BOOL} bEnable A Boolean value that specifies whether <b>SetBreakOnID</b> turns on or off this breaking condition (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-setbreakonid
     */
    SetBreakOnID(Producer, ID, bEnable) {
        result := ComCall(34, this, "ptr", Producer, "int", ID, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * Determines whether the break on a message category is turned on or off.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the breaking status.
     * @param {Integer} Category A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category">DXGI_INFO_QUEUE_MESSAGE_CATEGORY</a>-typed value that specifies the category of the message.
     * @returns {BOOL} Returns a Boolean value that specifies whether this category of breaking condition is turned on or off (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getbreakoncategory
     */
    GetBreakOnCategory(Producer, Category) {
        result := ComCall(35, this, "ptr", Producer, "int", Category, "int")
        return result
    }

    /**
     * Determines whether the break on a message severity level is turned on or off.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the breaking status.
     * @param {Integer} Severity A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity">DXGI_INFO_QUEUE_MESSAGE_SEVERITY</a>-typed value that specifies the severity of the message.
     * @returns {BOOL} Returns a Boolean value that specifies whether this severity of breaking condition is turned on or off (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getbreakonseverity
     */
    GetBreakOnSeverity(Producer, Severity) {
        result := ComCall(36, this, "ptr", Producer, "int", Severity, "int")
        return result
    }

    /**
     * Determines whether the break on a message identifier is turned on or off.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the breaking status.
     * @param {Integer} ID An integer value that specifies the identifier of the message.
     * @returns {BOOL} Returns a Boolean value that specifies whether this break on a message identifier is turned on or off (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getbreakonid
     */
    GetBreakOnID(Producer, ID) {
        result := ComCall(37, this, "ptr", Producer, "int", ID, "int")
        return result
    }

    /**
     * Turns the debug output on or off.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * 
     * 
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the mute status.
     * @param {BOOL} bMute A Boolean value that specifies whether to turn the debug output on or off (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-setmutedebugoutput
     */
    SetMuteDebugOutput(Producer, bMute) {
        ComCall(38, this, "ptr", Producer, "int", bMute)
    }

    /**
     * Determines whether the debug output is turned on or off.
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the mute status.
     * @returns {BOOL} Returns a Boolean value that specifies whether the debug output is turned on or off (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmutedebugoutput
     */
    GetMuteDebugOutput(Producer) {
        result := ComCall(39, this, "ptr", Producer, "int")
        return result
    }
}
