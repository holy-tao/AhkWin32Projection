#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An information-queue interface stores, retrieves, and filters debug messages. The queue consists of a message queue, an optional storage filter stack, and a optional retrieval filter stack.
 * @remarks
 * 
 * This interface is obtained by querying it from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a> using <c>IUnknown::QueryInterface</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12infoqueue
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12InfoQueue extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12InfoQueue
     * @type {Guid}
     */
    static IID => Guid("{0742a90b-c387-483f-b946-30a7e4e61458}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMessageCountLimit", "ClearStoredMessages", "GetMessage", "GetNumMessagesAllowedByStorageFilter", "GetNumMessagesDeniedByStorageFilter", "GetNumStoredMessages", "GetNumStoredMessagesAllowedByRetrievalFilter", "GetNumMessagesDiscardedByMessageCountLimit", "GetMessageCountLimit", "AddStorageFilterEntries", "GetStorageFilter", "ClearStorageFilter", "PushEmptyStorageFilter", "PushCopyOfStorageFilter", "PushStorageFilter", "PopStorageFilter", "GetStorageFilterStackSize", "AddRetrievalFilterEntries", "GetRetrievalFilter", "ClearRetrievalFilter", "PushEmptyRetrievalFilter", "PushCopyOfRetrievalFilter", "PushRetrievalFilter", "PopRetrievalFilter", "GetRetrievalFilterStackSize", "AddMessage", "AddApplicationMessage", "SetBreakOnCategory", "SetBreakOnSeverity", "SetBreakOnID", "GetBreakOnCategory", "GetBreakOnSeverity", "GetBreakOnID", "SetMuteDebugOutput", "GetMuteDebugOutput"]

    /**
     * Set the maximum number of messages that can be added to the message queue.
     * @param {Integer} MessageCountLimit Type: <b>UINT64</b>
     * 
     * Maximum number of messages that can be added to the message queue. -1 means no limit.
     * 
     * When the number of messages in the message queue has reached the maximum limit, new messages coming in will push old messages out.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-setmessagecountlimit
     */
    SetMessageCountLimit(MessageCountLimit) {
        result := ComCall(3, this, "uint", MessageCountLimit, "HRESULT")
        return result
    }

    /**
     * Clear all messages from the message queue.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-clearstoredmessages
     */
    ClearStoredMessages() {
        ComCall(4, this)
    }

    /**
     * Get a message from the message queue.
     * @param {Integer} MessageIndex Type: <b>UINT64</b>
     * 
     * Index into message queue after an optional retrieval filter has been applied. This can be between 0 and the number of messages in the message queue that pass through the retrieval filter (which can be obtained with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getnumstoredmessagesallowedbyretrievalfilter">GetNumStoredMessagesAllowedByRetrievalFilter</a>). 0 is the message at the front of the message queue.
     * @param {Pointer} pMessage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_message">D3D12_MESSAGE</a>*</b>
     * 
     * Returned message.
     * @param {Pointer<Pointer>} pMessageByteLength Type: <b>SIZE_T*</b>
     * 
     * Size of <i>pMessage</i> in bytes.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getmessage
     */
    GetMessage(MessageIndex, pMessage, pMessageByteLength) {
        pMessageByteLengthMarshal := pMessageByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", MessageIndex, "ptr", pMessage, pMessageByteLengthMarshal, pMessageByteLength, "HRESULT")
        return result
    }

    /**
     * Get the number of messages that were allowed to pass through a storage filter.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * Number of messages allowed by a storage filter.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getnummessagesallowedbystoragefilter
     */
    GetNumMessagesAllowedByStorageFilter() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * Get the number of messages that were denied passage through a storage filter.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * Number of messages denied by a storage filter.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getnummessagesdeniedbystoragefilter
     */
    GetNumMessagesDeniedByStorageFilter() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * Get the number of messages currently stored in the message queue.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * Number of messages currently stored in the message queue.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getnumstoredmessages
     */
    GetNumStoredMessages() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * Get the number of messages that are able to pass through a retrieval filter.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * Number of messages allowed by a retrieval filter.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getnumstoredmessagesallowedbyretrievalfilter
     */
    GetNumStoredMessagesAllowedByRetrievalFilter() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * Get the number of messages that were discarded due to the message count limit.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * Number of messages discarded.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getnummessagesdiscardedbymessagecountlimit
     */
    GetNumMessagesDiscardedByMessageCountLimit() {
        result := ComCall(10, this, "uint")
        return result
    }

    /**
     * Get the maximum number of messages that can be added to the message queue.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * Maximum number of messages that can be added to the queue. -1 means no limit.
     * 
     * When the number of messages in the message queue has reached the maximum limit, new messages coming in will push old messages out.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getmessagecountlimit
     */
    GetMessageCountLimit() {
        result := ComCall(11, this, "uint")
        return result
    }

    /**
     * Add storage filters to the top of the storage-filter stack.
     * @param {Pointer<D3D12_INFO_QUEUE_FILTER>} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter">D3D12_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Array of storage filters.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-addstoragefilterentries
     */
    AddStorageFilterEntries(pFilter) {
        result := ComCall(12, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Get the storage filter at the top of the storage-filter stack.
     * @param {Pointer} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter">D3D12_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Storage filter at the top of the storage-filter stack.
     * @param {Pointer<Pointer>} pFilterByteLength Type: <b>SIZE_T*</b>
     * 
     * Size of the storage filter in bytes. If <i>pFilter</i> is NULL, the size of the storage filter will be output to this parameter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getstoragefilter
     */
    GetStorageFilter(pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * Remove a storage filter from the top of the storage-filter stack.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-clearstoragefilter
     */
    ClearStorageFilter() {
        ComCall(14, this)
    }

    /**
     * Push an empty storage filter onto the storage-filter stack.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-pushemptystoragefilter
     */
    PushEmptyStorageFilter() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Push a copy of storage filter currently on the top of the storage-filter stack onto the storage-filter stack.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-pushcopyofstoragefilter
     */
    PushCopyOfStorageFilter() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Push a storage filter onto the storage-filter stack.
     * @param {Pointer<D3D12_INFO_QUEUE_FILTER>} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter">D3D12_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Pointer to a storage filter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-pushstoragefilter
     */
    PushStorageFilter(pFilter) {
        result := ComCall(17, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Pop a storage filter from the top of the storage-filter stack.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-popstoragefilter
     */
    PopStorageFilter() {
        ComCall(18, this)
    }

    /**
     * Get the size of the storage-filter stack in bytes.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * Size of the storage-filter stack in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getstoragefilterstacksize
     */
    GetStorageFilterStackSize() {
        result := ComCall(19, this, "uint")
        return result
    }

    /**
     * Add storage filters to the top of the retrieval-filter stack.
     * @param {Pointer<D3D12_INFO_QUEUE_FILTER>} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter">D3D12_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Array of retrieval filters.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-addretrievalfilterentries
     */
    AddRetrievalFilterEntries(pFilter) {
        result := ComCall(20, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Get the retrieval filter at the top of the retrieval-filter stack.
     * @param {Pointer} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter">D3D12_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Retrieval filter at the top of the retrieval-filter stack.
     * @param {Pointer<Pointer>} pFilterByteLength Type: <b>SIZE_T*</b>
     * 
     * Size of the retrieval filter in bytes. If <i>pFilter</i> is NULL, the size of the retrieval filter will be output to this parameter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getretrievalfilter
     */
    GetRetrievalFilter(pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(21, this, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * Remove a retrieval filter from the top of the retrieval-filter stack.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-clearretrievalfilter
     */
    ClearRetrievalFilter() {
        ComCall(22, this)
    }

    /**
     * Push an empty retrieval filter onto the retrieval-filter stack.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-pushemptyretrievalfilter
     */
    PushEmptyRetrievalFilter() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * Push a copy of retrieval filter currently on the top of the retrieval-filter stack onto the retrieval-filter stack.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-pushcopyofretrievalfilter
     */
    PushCopyOfRetrievalFilter() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * Push a retrieval filter onto the retrieval-filter stack.
     * @param {Pointer<D3D12_INFO_QUEUE_FILTER>} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter">D3D12_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Pointer to a retrieval filter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-pushretrievalfilter
     */
    PushRetrievalFilter(pFilter) {
        result := ComCall(25, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Pop a retrieval filter from the top of the retrieval-filter stack.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-popretrievalfilter
     */
    PopRetrievalFilter() {
        ComCall(26, this)
    }

    /**
     * Get the size of the retrieval-filter stack in bytes.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * Size of the retrieval-filter stack in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getretrievalfilterstacksize
     */
    GetRetrievalFilterStackSize() {
        result := ComCall(27, this, "uint")
        return result
    }

    /**
     * Adds a debug message to the message queue and sends that message to debug output.
     * @param {Integer} Category Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_category">D3D12_MESSAGE_CATEGORY</a></b>
     * 
     * Category of a message.
     * @param {Integer} Severity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_severity">D3D12_MESSAGE_SEVERITY</a></b>
     * 
     * Severity of a message.
     * @param {Integer} ID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_id">D3D12_MESSAGE_ID</a></b>
     * 
     * Unique identifier of a message.
     * @param {PSTR} pDescription Type: <b>LPCSTR</b>
     * 
     * User-defined message.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-addmessage
     */
    AddMessage(Category, Severity, ID, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(28, this, "int", Category, "int", Severity, "int", ID, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * Adds a user-defined message to the message queue and sends that message to debug output.
     * @param {Integer} Severity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_severity">D3D12_MESSAGE_SEVERITY</a></b>
     * 
     * Severity of a message.
     * @param {PSTR} pDescription Type: <b>LPCSTR</b>
     * 
     * Specifies the message string.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-addapplicationmessage
     */
    AddApplicationMessage(Severity, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(29, this, "int", Severity, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * Set a message category to break on when a message with that category passes through the storage filter.
     * @param {Integer} Category Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_category">D3D12_MESSAGE_CATEGORY</a></b>
     * 
     * Message category to break on.
     * @param {BOOL} bEnable Type: <b>BOOL</b>
     * 
     * Turns this breaking condition on or off (true for on, false for off).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-setbreakoncategory
     */
    SetBreakOnCategory(Category, bEnable) {
        result := ComCall(30, this, "int", Category, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * Set a message severity level to break on when a message with that severity level passes through the storage filter.
     * @param {Integer} Severity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_severity">D3D12_MESSAGE_SEVERITY</a></b>
     * 
     * A message severity level to break on.
     * @param {BOOL} bEnable Type: <b>BOOL</b>
     * 
     * Turns this breaking condition on or off (true for on, false for off).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-setbreakonseverity
     */
    SetBreakOnSeverity(Severity, bEnable) {
        result := ComCall(31, this, "int", Severity, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * Set a message identifier to break on when a message with that identifier passes through the storage filter.
     * @param {Integer} ID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_id">D3D12_MESSAGE_ID</a></b>
     * 
     * Message identifier to break on.
     * @param {BOOL} bEnable Type: <b>BOOL</b>
     * 
     * Turns this breaking condition on or off (true for on, false for off).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-setbreakonid
     */
    SetBreakOnID(ID, bEnable) {
        result := ComCall(32, this, "int", ID, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * Get a message category to break on when a message with that category passes through the storage filter.
     * @param {Integer} Category Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_category">D3D12_MESSAGE_CATEGORY</a></b>
     * 
     * Message category to break on.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Whether this breaking condition is turned on or off (true for on, false for off).
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getbreakoncategory
     */
    GetBreakOnCategory(Category) {
        result := ComCall(33, this, "int", Category, "int")
        return result
    }

    /**
     * Get a message severity level to break on when a message with that severity level passes through the storage filter.
     * @param {Integer} Severity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_severity">D3D12_MESSAGE_SEVERITY</a></b>
     * 
     * Message severity level to break on.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Whether this breaking condition is turned on or off (true for on, false for off).
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getbreakonseverity
     */
    GetBreakOnSeverity(Severity) {
        result := ComCall(34, this, "int", Severity, "int")
        return result
    }

    /**
     * Get a message identifier to break on when a message with that identifier passes through the storage filter.
     * @param {Integer} ID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_id">D3D12_MESSAGE_ID</a></b>
     * 
     * Message identifier to break on.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Whether this breaking condition is turned on or off (true for on, false for off).
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getbreakonid
     */
    GetBreakOnID(ID) {
        result := ComCall(35, this, "int", ID, "int")
        return result
    }

    /**
     * Set a boolean that turns the debug output on or off.
     * @remarks
     * 
     * This will stop messages that pass the storage filter from being printed out in the debug output, however those messages will still be added to the message queue.
     * 
     * 
     * @param {BOOL} bMute Type: <b>BOOL</b>
     * 
     * Disable/Enable the debug output (true to disable or mute the output, false to enable the output).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-setmutedebugoutput
     */
    SetMuteDebugOutput(bMute) {
        ComCall(36, this, "int", bMute)
    }

    /**
     * Get a boolean that determines if debug output is on or off.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Whether the debug output is on or off (true for on, false for off).
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-getmutedebugoutput
     */
    GetMuteDebugOutput() {
        result := ComCall(37, this, "int")
        return result
    }
}
