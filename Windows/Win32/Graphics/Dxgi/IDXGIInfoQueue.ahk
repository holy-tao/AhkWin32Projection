#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXGI_INFO_QUEUE_MESSAGE_CATEGORY.ahk" { DXGI_INFO_QUEUE_MESSAGE_CATEGORY }
#Import ".\DXGI_INFO_QUEUE_FILTER.ahk" { DXGI_INFO_QUEUE_FILTER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DXGI_INFO_QUEUE_MESSAGE_SEVERITY.ahk" { DXGI_INFO_QUEUE_MESSAGE_SEVERITY }

/**
 * This interface controls the debug information queue, and can only be used if the debug layer is turned on.
 * @remarks
 * This interface is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-dxgigetdebuginterface">DXGIGetDebugInterface</a> function.
 * 
 * For more info about the debug layer, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">Debug Layer</a>.
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nn-dxgidebug-idxgiinfoqueue
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIInfoQueue extends IUnknown {
    /**
     * The interface identifier for IDXGIInfoQueue
     * @type {Guid}
     */
    static IID := Guid("{d67441c7-672a-476f-9e82-cd55b44949ce}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIInfoQueue interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetMessageCountLimit                          : IntPtr
        ClearStoredMessages                           : IntPtr
        GetMessage                                    : IntPtr
        GetNumStoredMessagesAllowedByRetrievalFilters : IntPtr
        GetNumStoredMessages                          : IntPtr
        GetNumMessagesDiscardedByMessageCountLimit    : IntPtr
        GetMessageCountLimit                          : IntPtr
        GetNumMessagesAllowedByStorageFilter          : IntPtr
        GetNumMessagesDeniedByStorageFilter           : IntPtr
        AddStorageFilterEntries                       : IntPtr
        GetStorageFilter                              : IntPtr
        ClearStorageFilter                            : IntPtr
        PushEmptyStorageFilter                        : IntPtr
        PushDenyAllStorageFilter                      : IntPtr
        PushCopyOfStorageFilter                       : IntPtr
        PushStorageFilter                             : IntPtr
        PopStorageFilter                              : IntPtr
        GetStorageFilterStackSize                     : IntPtr
        AddRetrievalFilterEntries                     : IntPtr
        GetRetrievalFilter                            : IntPtr
        ClearRetrievalFilter                          : IntPtr
        PushEmptyRetrievalFilter                      : IntPtr
        PushDenyAllRetrievalFilter                    : IntPtr
        PushCopyOfRetrievalFilter                     : IntPtr
        PushRetrievalFilter                           : IntPtr
        PopRetrievalFilter                            : IntPtr
        GetRetrievalFilterStackSize                   : IntPtr
        AddMessage                                    : IntPtr
        AddApplicationMessage                         : IntPtr
        SetBreakOnCategory                            : IntPtr
        SetBreakOnSeverity                            : IntPtr
        SetBreakOnID                                  : IntPtr
        GetBreakOnCategory                            : IntPtr
        GetBreakOnSeverity                            : IntPtr
        GetBreakOnID                                  : IntPtr
        SetMuteDebugOutput                            : IntPtr
        GetMuteDebugOutput                            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIInfoQueue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the maximum number of messages that can be added to the message queue.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that sets the limit on the number of messages.
     * @param {Integer} MessageCountLimit The maximum number of messages that can be added to the queue. –1 means no limit.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-setmessagecountlimit
     */
    SetMessageCountLimit(Producer, MessageCountLimit) {
        result := ComCall(3, this, Guid, Producer, "uint", MessageCountLimit, "HRESULT")
        return result
    }

    /**
     * Clears all messages from the message queue.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that clears the messages.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-clearstoredmessages
     */
    ClearStoredMessages(Producer) {
        ComCall(4, this, Guid, Producer)
    }

    /**
     * Gets a message from the message queue.
     * @remarks
     * This method doesn't remove any messages from the message queue.
     * 
     * This method gets a message from the message queue after an optional retrieval filter has been applied.
     * 
     * Call this method twice to retrieve a message, first to obtain the size of the message and second to get the message. Here is a typical example:
     * 
     * 
     * ```
     * 
     * // Get the size of the message.
     * SIZE_T messageLength = 0;
     * HRESULT hr = pInfoQueue->GetMessage(DXGI_DEBUG_ALL, 0, NULL, &messageLength);
     * if(hr == S_FALSE){
     * 
     *     // Allocate space and get the message.
     *     DXGI_INFO_QUEUE_MESSAGE * pMessage = (DXGI_INFO_QUEUE_MESSAGE*)malloc(messageLength);
     *     hr = pInfoQueue->GetMessage(DXGI_DEBUG_ALL, 0, pMessage, &messageLength);
     *     
     *     // Do something with the message and free it
     *     if(hr == S_OK){
     *     
     *         // ...
     *         // ...
     *         // ...
     *         free(pMessage);
     *     }
     * }
     * ```
     * 
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the message.
     * @param {Integer} MessageIndex An index into the message queue after an optional retrieval filter has been applied. This can be between 0 and the number of messages in the message queue that pass through the retrieval filter. Call <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnumstoredmessagesallowedbyretrievalfilters">IDXGIInfoQueue::GetNumStoredMessagesAllowedByRetrievalFilters</a> to obtain this number. 0 is the message at the beginning of the message queue.
     * @param {Integer} pMessage A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_message">DXGI_INFO_QUEUE_MESSAGE</a> structure that describes the message.
     * @param {Pointer<Pointer>} pMessageByteLength A pointer to a variable that receives the size, in bytes, of the message description that <i>pMessage</i> points to. This size includes the size of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_message">DXGI_INFO_QUEUE_MESSAGE</a> structure in bytes.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmessage
     */
    GetMessage(Producer, MessageIndex, pMessage, pMessageByteLength) {
        pMessageByteLengthMarshal := pMessageByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, Guid, Producer, "uint", MessageIndex, "ptr", pMessage, pMessageByteLengthMarshal, pMessageByteLength, "HRESULT")
        return result
    }

    /**
     * Gets the number of messages that can pass through a retrieval filter.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the number.
     * @returns {Integer} Returns the number of messages that can pass through a retrieval filter.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnumstoredmessagesallowedbyretrievalfilters
     */
    GetNumStoredMessagesAllowedByRetrievalFilters(Producer) {
        result := ComCall(6, this, Guid, Producer, Int64)
        return result
    }

    /**
     * Gets the number of messages currently stored in the message queue.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the number.
     * @returns {Integer} Returns the number of messages currently stored in the message queue.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnumstoredmessages
     */
    GetNumStoredMessages(Producer) {
        result := ComCall(7, this, Guid, Producer, Int64)
        return result
    }

    /**
     * Gets the number of messages that were discarded due to the message count limit.
     * @remarks
     * Get and set the message count limit with <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmessagecountlimit">IDXGIInfoQueue::GetMessageCountLimit</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-setmessagecountlimit">IDXGIInfoQueue::SetMessageCountLimit</a>, respectively.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the number.
     * @returns {Integer} Returns the number of messages that were discarded.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnummessagesdiscardedbymessagecountlimit
     */
    GetNumMessagesDiscardedByMessageCountLimit(Producer) {
        result := ComCall(8, this, Guid, Producer, Int64)
        return result
    }

    /**
     * Gets the maximum number of messages that can be added to the message queue.
     * @remarks
     * When the number of messages in the message queue reaches the maximum limit, new messages coming in push old messages out.
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the number.
     * @returns {Integer} Returns the maximum number of messages that can be added to the queue. –1 means no limit.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmessagecountlimit
     */
    GetMessageCountLimit(Producer) {
        result := ComCall(9, this, Guid, Producer, Int64)
        return result
    }

    /**
     * Gets the number of messages that a storage filter allowed to pass through.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the number.
     * @returns {Integer} Returns the number of messages allowed by a storage filter.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnummessagesallowedbystoragefilter
     */
    GetNumMessagesAllowedByStorageFilter(Producer) {
        result := ComCall(10, this, Guid, Producer, Int64)
        return result
    }

    /**
     * Gets the number of messages that were denied passage through a storage filter.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the number.
     * @returns {Integer} Returns the number of messages denied by a storage filter.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnummessagesdeniedbystoragefilter
     */
    GetNumMessagesDeniedByStorageFilter(Producer) {
        result := ComCall(11, this, Guid, Producer, Int64)
        return result
    }

    /**
     * Adds storage filters to the top of the storage-filter stack.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that produced the filters.
     * @param {Pointer<DXGI_INFO_QUEUE_FILTER>} pFilter An array of <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structures that describe the filters.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-addstoragefilterentries
     */
    AddStorageFilterEntries(Producer, pFilter) {
        result := ComCall(12, this, Guid, Producer, DXGI_INFO_QUEUE_FILTER.Ptr, pFilter, "HRESULT")
        return result
    }

    /**
     * Gets the storage filter at the top of the storage-filter stack.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the filter.
     * @param {Integer} pFilter A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structure that describes the filter.
     * @param {Pointer<Pointer>} pFilterByteLength A pointer to a variable that receives the size, in bytes, of the filter description to which <i>pFilter</i> points. If <i>pFilter</i> is <b>NULL</b>, <b>GetStorageFilter</b> outputs the size of the storage filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getstoragefilter
     */
    GetStorageFilter(Producer, pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, Guid, Producer, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * Removes a storage filter from the top of the storage-filter stack.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that removes the filter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-clearstoragefilter
     */
    ClearStorageFilter(Producer) {
        ComCall(14, this, Guid, Producer)
    }

    /**
     * Pushes an empty storage filter onto the storage-filter stack.
     * @remarks
     * An empty storage filter allows all messages to pass through.
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the empty storage filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushemptystoragefilter
     */
    PushEmptyStorageFilter(Producer) {
        result := ComCall(15, this, Guid, Producer, "HRESULT")
        return result
    }

    /**
     * Pushes a deny-all storage filter onto the storage-filter stack.
     * @remarks
     * A deny-all storage filter prevents all messages from passing through.
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushdenyallstoragefilter
     */
    PushDenyAllStorageFilter(Producer) {
        result := ComCall(16, this, Guid, Producer, "HRESULT")
        return result
    }

    /**
     * Pushes a copy of the storage filter that is currently on the top of the storage-filter stack onto the storage-filter stack.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the copy of the storage filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushcopyofstoragefilter
     */
    PushCopyOfStorageFilter(Producer) {
        result := ComCall(17, this, Guid, Producer, "HRESULT")
        return result
    }

    /**
     * Pushes a storage filter onto the storage-filter stack.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the filter.
     * @param {Pointer<DXGI_INFO_QUEUE_FILTER>} pFilter A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structure that describes the filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushstoragefilter
     */
    PushStorageFilter(Producer, pFilter) {
        result := ComCall(18, this, Guid, Producer, DXGI_INFO_QUEUE_FILTER.Ptr, pFilter, "HRESULT")
        return result
    }

    /**
     * Pops a storage filter from the top of the storage-filter stack.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pops the filter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-popstoragefilter
     */
    PopStorageFilter(Producer) {
        ComCall(19, this, Guid, Producer)
    }

    /**
     * Gets the size of the storage-filter stack in bytes.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the size.
     * @returns {Integer} Returns the size of the storage-filter stack in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getstoragefilterstacksize
     */
    GetStorageFilterStackSize(Producer) {
        result := ComCall(20, this, Guid, Producer, UInt32)
        return result
    }

    /**
     * Adds retrieval filters to the top of the retrieval-filter stack.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that produced the filters.
     * @param {Pointer<DXGI_INFO_QUEUE_FILTER>} pFilter An array of <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structures that describe the filters.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-addretrievalfilterentries
     */
    AddRetrievalFilterEntries(Producer, pFilter) {
        result := ComCall(21, this, Guid, Producer, DXGI_INFO_QUEUE_FILTER.Ptr, pFilter, "HRESULT")
        return result
    }

    /**
     * Gets the retrieval filter at the top of the retrieval-filter stack.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the filter.
     * @param {Integer} pFilter A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structure that describes the filter.
     * @param {Pointer<Pointer>} pFilterByteLength A pointer to a variable that receives the size, in bytes, of the filter description to which <i>pFilter</i> points. If <i>pFilter</i> is <b>NULL</b>, <b>GetRetrievalFilter</b> outputs the size of the retrieval filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getretrievalfilter
     */
    GetRetrievalFilter(Producer, pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, Guid, Producer, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * Removes a retrieval filter from the top of the retrieval-filter stack.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that removes the filter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-clearretrievalfilter
     */
    ClearRetrievalFilter(Producer) {
        ComCall(23, this, Guid, Producer)
    }

    /**
     * Pushes an empty retrieval filter onto the retrieval-filter stack.
     * @remarks
     * An empty retrieval filter allows all messages to pass through.
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the empty retrieval filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushemptyretrievalfilter
     */
    PushEmptyRetrievalFilter(Producer) {
        result := ComCall(24, this, Guid, Producer, "HRESULT")
        return result
    }

    /**
     * Pushes a deny-all retrieval filter onto the retrieval-filter stack.
     * @remarks
     * A deny-all retrieval filter prevents all messages from passing through.
     * 
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the deny-all retrieval filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushdenyallretrievalfilter
     */
    PushDenyAllRetrievalFilter(Producer) {
        result := ComCall(25, this, Guid, Producer, "HRESULT")
        return result
    }

    /**
     * Pushes a copy of the retrieval filter that is currently on the top of the retrieval-filter stack onto the retrieval-filter stack.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the copy of the retrieval filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushcopyofretrievalfilter
     */
    PushCopyOfRetrievalFilter(Producer) {
        result := ComCall(26, this, Guid, Producer, "HRESULT")
        return result
    }

    /**
     * Pushes a retrieval filter onto the retrieval-filter stack.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pushes the filter.
     * @param {Pointer<DXGI_INFO_QUEUE_FILTER>} pFilter A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter">DXGI_INFO_QUEUE_FILTER</a> structure that describes the filter.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushretrievalfilter
     */
    PushRetrievalFilter(Producer, pFilter) {
        result := ComCall(27, this, Guid, Producer, DXGI_INFO_QUEUE_FILTER.Ptr, pFilter, "HRESULT")
        return result
    }

    /**
     * Pops a retrieval filter from the top of the retrieval-filter stack.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that pops the filter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-popretrievalfilter
     */
    PopRetrievalFilter(Producer) {
        ComCall(28, this, Guid, Producer)
    }

    /**
     * Gets the size of the retrieval-filter stack in bytes.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the size.
     * @returns {Integer} Returns the size of the retrieval-filter stack in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getretrievalfilterstacksize
     */
    GetRetrievalFilterStackSize(Producer) {
        result := ComCall(29, this, Guid, Producer, UInt32)
        return result
    }

    /**
     * Adds a debug message to the message queue and sends that message to the debug output.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that produced the message.
     * @param {DXGI_INFO_QUEUE_MESSAGE_CATEGORY} Category A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category">DXGI_INFO_QUEUE_MESSAGE_CATEGORY</a>-typed value that specifies the category of the message.
     * @param {DXGI_INFO_QUEUE_MESSAGE_SEVERITY} Severity A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity">DXGI_INFO_QUEUE_MESSAGE_SEVERITY</a>-typed value that specifies the severity of the message.
     * @param {Integer} ID An integer that uniquely identifies the message.
     * @param {PSTR} pDescription The message string.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-addmessage
     */
    AddMessage(Producer, Category, Severity, ID, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(30, this, Guid, Producer, DXGI_INFO_QUEUE_MESSAGE_CATEGORY, Category, DXGI_INFO_QUEUE_MESSAGE_SEVERITY, Severity, "int", ID, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * Adds a user-defined message to the message queue and sends that message to the debug output.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {DXGI_INFO_QUEUE_MESSAGE_SEVERITY} Severity A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity">DXGI_INFO_QUEUE_MESSAGE_SEVERITY</a>-typed value that specifies the severity of the message.
     * @param {PSTR} pDescription The message string.
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-addapplicationmessage
     */
    AddApplicationMessage(Severity, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(31, this, DXGI_INFO_QUEUE_MESSAGE_SEVERITY, Severity, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * Sets a message category to break on when a message with that category passes through the storage filter.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that sets the breaking condition.
     * @param {DXGI_INFO_QUEUE_MESSAGE_CATEGORY} Category A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category">DXGI_INFO_QUEUE_MESSAGE_CATEGORY</a>-typed value that specifies the category of the message.
     * @param {BOOL} bEnable A Boolean value that specifies whether <b>SetBreakOnCategory</b> turns on or off this breaking condition (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-setbreakoncategory
     */
    SetBreakOnCategory(Producer, Category, bEnable) {
        result := ComCall(32, this, Guid, Producer, DXGI_INFO_QUEUE_MESSAGE_CATEGORY, Category, BOOL, bEnable, "HRESULT")
        return result
    }

    /**
     * Sets a message severity level to break on when a message with that severity level passes through the storage filter.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that sets the breaking condition.
     * @param {DXGI_INFO_QUEUE_MESSAGE_SEVERITY} Severity A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity">DXGI_INFO_QUEUE_MESSAGE_SEVERITY</a>-typed value that specifies the severity of the message.
     * @param {BOOL} bEnable A Boolean value that specifies whether <b>SetBreakOnSeverity</b> turns on or off this breaking condition (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-setbreakonseverity
     */
    SetBreakOnSeverity(Producer, Severity, bEnable) {
        result := ComCall(33, this, Guid, Producer, DXGI_INFO_QUEUE_MESSAGE_SEVERITY, Severity, BOOL, bEnable, "HRESULT")
        return result
    }

    /**
     * Sets a message identifier to break on when a message with that identifier passes through the storage filter.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that sets the breaking condition.
     * @param {Integer} ID An integer value that specifies the identifier of the message.
     * @param {BOOL} bEnable A Boolean value that specifies whether <b>SetBreakOnID</b> turns on or off this breaking condition (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @returns {HRESULT} Returns S_OK if successful; an error code otherwise. For a list of error codes, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-setbreakonid
     */
    SetBreakOnID(Producer, ID, bEnable) {
        result := ComCall(34, this, Guid, Producer, "int", ID, BOOL, bEnable, "HRESULT")
        return result
    }

    /**
     * Determines whether the break on a message category is turned on or off.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the breaking status.
     * @param {DXGI_INFO_QUEUE_MESSAGE_CATEGORY} Category A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category">DXGI_INFO_QUEUE_MESSAGE_CATEGORY</a>-typed value that specifies the category of the message.
     * @returns {BOOL} Returns a Boolean value that specifies whether this category of breaking condition is turned on or off (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getbreakoncategory
     */
    GetBreakOnCategory(Producer, Category) {
        result := ComCall(35, this, Guid, Producer, DXGI_INFO_QUEUE_MESSAGE_CATEGORY, Category, BOOL)
        return result
    }

    /**
     * Determines whether the break on a message severity level is turned on or off.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the breaking status.
     * @param {DXGI_INFO_QUEUE_MESSAGE_SEVERITY} Severity A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity">DXGI_INFO_QUEUE_MESSAGE_SEVERITY</a>-typed value that specifies the severity of the message.
     * @returns {BOOL} Returns a Boolean value that specifies whether this severity of breaking condition is turned on or off (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getbreakonseverity
     */
    GetBreakOnSeverity(Producer, Severity) {
        result := ComCall(36, this, Guid, Producer, DXGI_INFO_QUEUE_MESSAGE_SEVERITY, Severity, BOOL)
        return result
    }

    /**
     * Determines whether the break on a message identifier is turned on or off.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the breaking status.
     * @param {Integer} ID An integer value that specifies the identifier of the message.
     * @returns {BOOL} Returns a Boolean value that specifies whether this break on a message identifier is turned on or off (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getbreakonid
     */
    GetBreakOnID(Producer, ID) {
        result := ComCall(37, this, Guid, Producer, "int", ID, BOOL)
        return result
    }

    /**
     * Turns the debug output on or off.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the mute status.
     * @param {BOOL} bMute A Boolean value that specifies whether to turn the debug output on or off (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-setmutedebugoutput
     */
    SetMuteDebugOutput(Producer, bMute) {
        ComCall(38, this, Guid, Producer, BOOL, bMute)
    }

    /**
     * Determines whether the debug output is turned on or off.
     * @remarks
     * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
     * <div> </div>
     * @param {Guid} Producer A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-debug-id">DXGI_DEBUG_ID</a> value that identifies the entity that gets the mute status.
     * @returns {BOOL} Returns a Boolean value that specifies whether the debug output is turned on or off (<b>TRUE</b> for on, <b>FALSE</b> for off).
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmutedebugoutput
     */
    GetMuteDebugOutput(Producer) {
        result := ComCall(39, this, Guid, Producer, BOOL)
        return result
    }

    Query(iid) {
        if (IDXGIInfoQueue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMessageCountLimit := CallbackCreate(GetMethod(implObj, "SetMessageCountLimit"), flags, 3)
        this.vtbl.ClearStoredMessages := CallbackCreate(GetMethod(implObj, "ClearStoredMessages"), flags, 2)
        this.vtbl.GetMessage := CallbackCreate(GetMethod(implObj, "GetMessage"), flags, 5)
        this.vtbl.GetNumStoredMessagesAllowedByRetrievalFilters := CallbackCreate(GetMethod(implObj, "GetNumStoredMessagesAllowedByRetrievalFilters"), flags, 2)
        this.vtbl.GetNumStoredMessages := CallbackCreate(GetMethod(implObj, "GetNumStoredMessages"), flags, 2)
        this.vtbl.GetNumMessagesDiscardedByMessageCountLimit := CallbackCreate(GetMethod(implObj, "GetNumMessagesDiscardedByMessageCountLimit"), flags, 2)
        this.vtbl.GetMessageCountLimit := CallbackCreate(GetMethod(implObj, "GetMessageCountLimit"), flags, 2)
        this.vtbl.GetNumMessagesAllowedByStorageFilter := CallbackCreate(GetMethod(implObj, "GetNumMessagesAllowedByStorageFilter"), flags, 2)
        this.vtbl.GetNumMessagesDeniedByStorageFilter := CallbackCreate(GetMethod(implObj, "GetNumMessagesDeniedByStorageFilter"), flags, 2)
        this.vtbl.AddStorageFilterEntries := CallbackCreate(GetMethod(implObj, "AddStorageFilterEntries"), flags, 3)
        this.vtbl.GetStorageFilter := CallbackCreate(GetMethod(implObj, "GetStorageFilter"), flags, 4)
        this.vtbl.ClearStorageFilter := CallbackCreate(GetMethod(implObj, "ClearStorageFilter"), flags, 2)
        this.vtbl.PushEmptyStorageFilter := CallbackCreate(GetMethod(implObj, "PushEmptyStorageFilter"), flags, 2)
        this.vtbl.PushDenyAllStorageFilter := CallbackCreate(GetMethod(implObj, "PushDenyAllStorageFilter"), flags, 2)
        this.vtbl.PushCopyOfStorageFilter := CallbackCreate(GetMethod(implObj, "PushCopyOfStorageFilter"), flags, 2)
        this.vtbl.PushStorageFilter := CallbackCreate(GetMethod(implObj, "PushStorageFilter"), flags, 3)
        this.vtbl.PopStorageFilter := CallbackCreate(GetMethod(implObj, "PopStorageFilter"), flags, 2)
        this.vtbl.GetStorageFilterStackSize := CallbackCreate(GetMethod(implObj, "GetStorageFilterStackSize"), flags, 2)
        this.vtbl.AddRetrievalFilterEntries := CallbackCreate(GetMethod(implObj, "AddRetrievalFilterEntries"), flags, 3)
        this.vtbl.GetRetrievalFilter := CallbackCreate(GetMethod(implObj, "GetRetrievalFilter"), flags, 4)
        this.vtbl.ClearRetrievalFilter := CallbackCreate(GetMethod(implObj, "ClearRetrievalFilter"), flags, 2)
        this.vtbl.PushEmptyRetrievalFilter := CallbackCreate(GetMethod(implObj, "PushEmptyRetrievalFilter"), flags, 2)
        this.vtbl.PushDenyAllRetrievalFilter := CallbackCreate(GetMethod(implObj, "PushDenyAllRetrievalFilter"), flags, 2)
        this.vtbl.PushCopyOfRetrievalFilter := CallbackCreate(GetMethod(implObj, "PushCopyOfRetrievalFilter"), flags, 2)
        this.vtbl.PushRetrievalFilter := CallbackCreate(GetMethod(implObj, "PushRetrievalFilter"), flags, 3)
        this.vtbl.PopRetrievalFilter := CallbackCreate(GetMethod(implObj, "PopRetrievalFilter"), flags, 2)
        this.vtbl.GetRetrievalFilterStackSize := CallbackCreate(GetMethod(implObj, "GetRetrievalFilterStackSize"), flags, 2)
        this.vtbl.AddMessage := CallbackCreate(GetMethod(implObj, "AddMessage"), flags, 6)
        this.vtbl.AddApplicationMessage := CallbackCreate(GetMethod(implObj, "AddApplicationMessage"), flags, 3)
        this.vtbl.SetBreakOnCategory := CallbackCreate(GetMethod(implObj, "SetBreakOnCategory"), flags, 4)
        this.vtbl.SetBreakOnSeverity := CallbackCreate(GetMethod(implObj, "SetBreakOnSeverity"), flags, 4)
        this.vtbl.SetBreakOnID := CallbackCreate(GetMethod(implObj, "SetBreakOnID"), flags, 4)
        this.vtbl.GetBreakOnCategory := CallbackCreate(GetMethod(implObj, "GetBreakOnCategory"), flags, 3)
        this.vtbl.GetBreakOnSeverity := CallbackCreate(GetMethod(implObj, "GetBreakOnSeverity"), flags, 3)
        this.vtbl.GetBreakOnID := CallbackCreate(GetMethod(implObj, "GetBreakOnID"), flags, 3)
        this.vtbl.SetMuteDebugOutput := CallbackCreate(GetMethod(implObj, "SetMuteDebugOutput"), flags, 3)
        this.vtbl.GetMuteDebugOutput := CallbackCreate(GetMethod(implObj, "GetMuteDebugOutput"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMessageCountLimit)
        CallbackFree(this.vtbl.ClearStoredMessages)
        CallbackFree(this.vtbl.GetMessage)
        CallbackFree(this.vtbl.GetNumStoredMessagesAllowedByRetrievalFilters)
        CallbackFree(this.vtbl.GetNumStoredMessages)
        CallbackFree(this.vtbl.GetNumMessagesDiscardedByMessageCountLimit)
        CallbackFree(this.vtbl.GetMessageCountLimit)
        CallbackFree(this.vtbl.GetNumMessagesAllowedByStorageFilter)
        CallbackFree(this.vtbl.GetNumMessagesDeniedByStorageFilter)
        CallbackFree(this.vtbl.AddStorageFilterEntries)
        CallbackFree(this.vtbl.GetStorageFilter)
        CallbackFree(this.vtbl.ClearStorageFilter)
        CallbackFree(this.vtbl.PushEmptyStorageFilter)
        CallbackFree(this.vtbl.PushDenyAllStorageFilter)
        CallbackFree(this.vtbl.PushCopyOfStorageFilter)
        CallbackFree(this.vtbl.PushStorageFilter)
        CallbackFree(this.vtbl.PopStorageFilter)
        CallbackFree(this.vtbl.GetStorageFilterStackSize)
        CallbackFree(this.vtbl.AddRetrievalFilterEntries)
        CallbackFree(this.vtbl.GetRetrievalFilter)
        CallbackFree(this.vtbl.ClearRetrievalFilter)
        CallbackFree(this.vtbl.PushEmptyRetrievalFilter)
        CallbackFree(this.vtbl.PushDenyAllRetrievalFilter)
        CallbackFree(this.vtbl.PushCopyOfRetrievalFilter)
        CallbackFree(this.vtbl.PushRetrievalFilter)
        CallbackFree(this.vtbl.PopRetrievalFilter)
        CallbackFree(this.vtbl.GetRetrievalFilterStackSize)
        CallbackFree(this.vtbl.AddMessage)
        CallbackFree(this.vtbl.AddApplicationMessage)
        CallbackFree(this.vtbl.SetBreakOnCategory)
        CallbackFree(this.vtbl.SetBreakOnSeverity)
        CallbackFree(this.vtbl.SetBreakOnID)
        CallbackFree(this.vtbl.GetBreakOnCategory)
        CallbackFree(this.vtbl.GetBreakOnSeverity)
        CallbackFree(this.vtbl.GetBreakOnID)
        CallbackFree(this.vtbl.SetMuteDebugOutput)
        CallbackFree(this.vtbl.GetMuteDebugOutput)
    }
}
