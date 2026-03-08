#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An information-queue interface stores, retrieves, and filters debug messages. The queue consists of a message queue, an optional storage filter stack, and a optional retrieval filter stack. (ID3D11InfoQueue)
 * @remarks
 * To get this interface, turn on debug layer and use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>.
 *           
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11infoqueue
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11InfoQueue extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11InfoQueue
     * @type {Guid}
     */
    static IID => Guid("{6543dbb6-1b48-42f5-ab82-e97ec74326f6}")

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
     * Set the maximum number of messages that can be added to the message queue. (ID3D11InfoQueue.SetMessageCountLimit)
     * @remarks
     * When the number of messages in the message queue has reached the maximum limit, new messages coming in will push old messages out.
     * @param {Integer} MessageCountLimit Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Maximum number of messages that can be added to the message queue. -1 means no limit.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-setmessagecountlimit
     */
    SetMessageCountLimit(MessageCountLimit) {
        result := ComCall(3, this, "uint", MessageCountLimit, "HRESULT")
        return result
    }

    /**
     * Clear all messages from the message queue. (ID3D11InfoQueue.ClearStoredMessages)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-clearstoredmessages
     */
    ClearStoredMessages() {
        ComCall(4, this)
    }

    /**
     * Get a message from the message queue. (ID3D11InfoQueue.GetMessage)
     * @remarks
     * This method does not remove any messages from the message queue.
     * 
     * This method gets messages from the message queue after an optional retrieval filter has been applied.
     * 
     * Applications should call this method twice to retrieve a message - first to obtain the size of the message and second to get the message. Here is a typical example:
     * 
     * 
     * ```
     * 
     * // Get the size of the message
     * SIZE_T messageLength = 0;
     * HRESULT hr = pInfoQueue->GetMessage(0, NULL, &messageLength);
     * 
     * // Allocate space and get the message
     * D3D11_MESSAGE * pMessage = (D3D11_MESSAGE*)malloc(messageLength);
     * hr = pInfoQueue->GetMessage(0, pMessage, &messageLength);
     * 
     * ```
     * 
     * 
     * For an overview see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11infoqueue">Information Queue Overview</a>.
     * @param {Integer} MessageIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Index into message queue after an optional retrieval filter has been applied. This can be between 0 and the number of messages in the message queue that pass through the retrieval filter (which can be obtained with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getnumstoredmessagesallowedbyretrievalfilter">ID3D11InfoQueue::GetNumStoredMessagesAllowedByRetrievalFilter</a>). 0 is the message at the front of the message queue.
     * @param {Pointer} pMessage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_message">D3D11_MESSAGE</a>*</b>
     * 
     * Returned message (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_message">D3D11_MESSAGE</a>).
     * @param {Pointer<Pointer>} pMessageByteLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a>*</b>
     * 
     * Size of pMessage in bytes, including the size of the message string that the pMessage points to.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getmessage
     */
    GetMessage(MessageIndex, pMessage, pMessageByteLength) {
        pMessageByteLengthMarshal := pMessageByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", MessageIndex, "ptr", pMessage, pMessageByteLengthMarshal, pMessageByteLength, "HRESULT")
        return result
    }

    /**
     * Get the number of messages that were allowed to pass through a storage filter. (ID3D11InfoQueue.GetNumMessagesAllowedByStorageFilter)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of messages allowed by a storage filter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getnummessagesallowedbystoragefilter
     */
    GetNumMessagesAllowedByStorageFilter() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * Get the number of messages that were denied passage through a storage filter. (ID3D11InfoQueue.GetNumMessagesDeniedByStorageFilter)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of messages denied by a storage filter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getnummessagesdeniedbystoragefilter
     */
    GetNumMessagesDeniedByStorageFilter() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * Get the number of messages currently stored in the message queue. (ID3D11InfoQueue.GetNumStoredMessages)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of messages currently stored in the message queue.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getnumstoredmessages
     */
    GetNumStoredMessages() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * Get the number of messages that are able to pass through a retrieval filter. (ID3D11InfoQueue.GetNumStoredMessagesAllowedByRetrievalFilter)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of messages allowed by a retrieval filter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getnumstoredmessagesallowedbyretrievalfilter
     */
    GetNumStoredMessagesAllowedByRetrievalFilter() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * Get the number of messages that were discarded due to the message count limit. (ID3D11InfoQueue.GetNumMessagesDiscardedByMessageCountLimit)
     * @remarks
     * Get and set the message count limit with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getmessagecountlimit">ID3D11InfoQueue::GetMessageCountLimit</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-setmessagecountlimit">ID3D11InfoQueue::SetMessageCountLimit</a>, respectively.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of messages discarded.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getnummessagesdiscardedbymessagecountlimit
     */
    GetNumMessagesDiscardedByMessageCountLimit() {
        result := ComCall(10, this, "uint")
        return result
    }

    /**
     * Get the maximum number of messages that can be added to the message queue. (ID3D11InfoQueue.GetMessageCountLimit)
     * @remarks
     * When the number of messages in the message queue has reached the maximum limit, new messages coming in will push old messages out.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Maximum number of messages that can be added to the queue. -1 means no limit.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getmessagecountlimit
     */
    GetMessageCountLimit() {
        result := ComCall(11, this, "uint")
        return result
    }

    /**
     * Add storage filters to the top of the storage-filter stack. (ID3D11InfoQueue.AddStorageFilterEntries)
     * @param {Pointer<D3D11_INFO_QUEUE_FILTER>} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter">D3D11_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Array of storage filters (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter">D3D11_INFO_QUEUE_FILTER</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-addstoragefilterentries
     */
    AddStorageFilterEntries(pFilter) {
        result := ComCall(12, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Get the storage filter at the top of the storage-filter stack. (ID3D11InfoQueue.GetStorageFilter)
     * @param {Pointer} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter">D3D11_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Storage filter at the top of the storage-filter stack.
     * @param {Pointer<Pointer>} pFilterByteLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a>*</b>
     * 
     * Size of the storage filter in bytes. If pFilter is <b>NULL</b>, the size of the storage filter will be output to this parameter.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getstoragefilter
     */
    GetStorageFilter(pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * Remove a storage filter from the top of the storage-filter stack. (ID3D11InfoQueue.ClearStorageFilter)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-clearstoragefilter
     */
    ClearStorageFilter() {
        ComCall(14, this)
    }

    /**
     * Push an empty storage filter onto the storage-filter stack. (ID3D11InfoQueue.PushEmptyStorageFilter)
     * @remarks
     * An empty storage filter allows all messages to pass through.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-pushemptystoragefilter
     */
    PushEmptyStorageFilter() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Push a copy of storage filter currently on the top of the storage-filter stack onto the storage-filter stack. (ID3D11InfoQueue.PushCopyOfStorageFilter)
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-pushcopyofstoragefilter
     */
    PushCopyOfStorageFilter() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Push a storage filter onto the storage-filter stack. (ID3D11InfoQueue.PushStorageFilter)
     * @param {Pointer<D3D11_INFO_QUEUE_FILTER>} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter">D3D11_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Pointer to a storage filter (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter">D3D11_INFO_QUEUE_FILTER</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-pushstoragefilter
     */
    PushStorageFilter(pFilter) {
        result := ComCall(17, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Pop a storage filter from the top of the storage-filter stack. (ID3D11InfoQueue.PopStorageFilter)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-popstoragefilter
     */
    PopStorageFilter() {
        ComCall(18, this)
    }

    /**
     * Get the size of the storage-filter stack in bytes. (ID3D11InfoQueue.GetStorageFilterStackSize)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the storage-filter stack in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getstoragefilterstacksize
     */
    GetStorageFilterStackSize() {
        result := ComCall(19, this, "uint")
        return result
    }

    /**
     * Add storage filters to the top of the retrieval-filter stack. (ID3D11InfoQueue.AddRetrievalFilterEntries)
     * @remarks
     * The following code example shows how to use <b>ID3D11InfoQueue::AddRetrievalFilterEntries</b>:
     * 
     * 
     * ```
     * 
     * D3D11_MESSAGE_CATEGORY cats[] = { ..., ..., ... };
     * D3D11_MESSAGE_SEVERITY sevs[] = { ..., ..., ... };
     * UINT ids[] = { ..., ..., ... };
     * 
     * D3D11_INFO_QUEUE_FILTER filter;
     * memset( &filter, 0, sizeof(filter) );
     * 
     * // To set the type of messages to allow, 
     * // set filter.AllowList as follows:
     * filter.AllowList.NumCategories = sizeof(cats / sizeof(D3D11_MESSAGE_CATEGORY)); 
     * filter.AllowList.pCategoryList = cats;
     * filter.AllowList.NumSeverities = sizeof(sevs / sizeof(D3D11_MESSAGE_SEVERITY)); 
     * filter.AllowList.pSeverityList = sevs;
     * filter.AllowList.NumIDs = sizeof(ids) / sizeof(UINT);
     * filter.AllowList.pIDList = ids;
     * 
     * // To set the type of messages to deny, set filter.DenyList 
     * // similarly to the preceding filter.AllowList.
     * 
     * // The following single call sets all of the preceding information.
     * hr = infoQueue->AddRetrievalFilterEntries( &filter );
     * 
     * ```
     * @param {Pointer<D3D11_INFO_QUEUE_FILTER>} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter">D3D11_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Array of retrieval filters (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter">D3D11_INFO_QUEUE_FILTER</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-addretrievalfilterentries
     */
    AddRetrievalFilterEntries(pFilter) {
        result := ComCall(20, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Get the retrieval filter at the top of the retrieval-filter stack. (ID3D11InfoQueue.GetRetrievalFilter)
     * @param {Pointer} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter">D3D11_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Retrieval filter at the top of the retrieval-filter stack.
     * @param {Pointer<Pointer>} pFilterByteLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a>*</b>
     * 
     * Size of the retrieval filter in bytes. If pFilter is <b>NULL</b>, the size of the retrieval filter will be output to this parameter.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getretrievalfilter
     */
    GetRetrievalFilter(pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(21, this, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * Remove a retrieval filter from the top of the retrieval-filter stack. (ID3D11InfoQueue.ClearRetrievalFilter)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-clearretrievalfilter
     */
    ClearRetrievalFilter() {
        ComCall(22, this)
    }

    /**
     * Push an empty retrieval filter onto the retrieval-filter stack. (ID3D11InfoQueue.PushEmptyRetrievalFilter)
     * @remarks
     * An empty retrieval filter allows all messages to pass through.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-pushemptyretrievalfilter
     */
    PushEmptyRetrievalFilter() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * Push a copy of retrieval filter currently on the top of the retrieval-filter stack onto the retrieval-filter stack. (ID3D11InfoQueue.PushCopyOfRetrievalFilter)
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-pushcopyofretrievalfilter
     */
    PushCopyOfRetrievalFilter() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * Push a retrieval filter onto the retrieval-filter stack. (ID3D11InfoQueue.PushRetrievalFilter)
     * @param {Pointer<D3D11_INFO_QUEUE_FILTER>} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter">D3D11_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Pointer to a retrieval filter (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter">D3D11_INFO_QUEUE_FILTER</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-pushretrievalfilter
     */
    PushRetrievalFilter(pFilter) {
        result := ComCall(25, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * Pop a retrieval filter from the top of the retrieval-filter stack. (ID3D11InfoQueue.PopRetrievalFilter)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-popretrievalfilter
     */
    PopRetrievalFilter() {
        ComCall(26, this)
    }

    /**
     * Get the size of the retrieval-filter stack in bytes. (ID3D11InfoQueue.GetRetrievalFilterStackSize)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the retrieval-filter stack in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getretrievalfilterstacksize
     */
    GetRetrievalFilterStackSize() {
        result := ComCall(27, this, "uint")
        return result
    }

    /**
     * Add a debug message to the message queue and send that message to debug output.
     * @remarks
     * This method is used by the runtime's internal mechanisms to add debug messages to the message queue and send them to debug output. For applications to add their own custom messages to the message queue and send them to debug output, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-addapplicationmessage">ID3D11InfoQueue::AddApplicationMessage</a>.
     * @param {Integer} Category Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_category">D3D11_MESSAGE_CATEGORY</a></b>
     * 
     * Category of a message (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_category">D3D11_MESSAGE_CATEGORY</a>).
     * @param {Integer} Severity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity">D3D11_MESSAGE_SEVERITY</a></b>
     * 
     * Severity of a message (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity">D3D11_MESSAGE_SEVERITY</a>).
     * @param {Integer} ID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_id">D3D11_MESSAGE_ID</a></b>
     * 
     * Unique identifier of a message (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_id">D3D11_MESSAGE_ID</a>).
     * @param {PSTR} pDescription Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * User-defined message.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-addmessage
     */
    AddMessage(Category, Severity, ID, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(28, this, "int", Category, "int", Severity, "int", ID, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * Add a user-defined message to the message queue and send that message to debug output. (ID3D11InfoQueue.AddApplicationMessage)
     * @param {Integer} Severity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity">D3D11_MESSAGE_SEVERITY</a></b>
     * 
     * Severity of a message (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity">D3D11_MESSAGE_SEVERITY</a>).
     * @param {PSTR} pDescription Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Message string.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-addapplicationmessage
     */
    AddApplicationMessage(Severity, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(29, this, "int", Severity, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * Set a message category to break on when a message with that category passes through the storage filter. (ID3D11InfoQueue.SetBreakOnCategory)
     * @param {Integer} Category Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_category">D3D11_MESSAGE_CATEGORY</a></b>
     * 
     * Message category to break on (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_category">D3D11_MESSAGE_CATEGORY</a>).
     * @param {BOOL} bEnable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Turns this breaking condition on or off (true for on, false for off).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-setbreakoncategory
     */
    SetBreakOnCategory(Category, bEnable) {
        result := ComCall(30, this, "int", Category, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * Set a message severity level to break on when a message with that severity level passes through the storage filter. (ID3D11InfoQueue.SetBreakOnSeverity)
     * @param {Integer} Severity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity">D3D11_MESSAGE_SEVERITY</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity">D3D11_MESSAGE_SEVERITY</a>, which represents a message severity level to break on.
     * @param {BOOL} bEnable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Turns this breaking condition on or off (true for on, false for off).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-setbreakonseverity
     */
    SetBreakOnSeverity(Severity, bEnable) {
        result := ComCall(31, this, "int", Severity, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * Set a message identifier to break on when a message with that identifier passes through the storage filter. (ID3D11InfoQueue.SetBreakOnID)
     * @param {Integer} ID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_id">D3D11_MESSAGE_ID</a></b>
     * 
     * Message identifier to break on (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_id">D3D11_MESSAGE_ID</a>).
     * @param {BOOL} bEnable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Turns this breaking condition on or off (true for on, false for off).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-setbreakonid
     */
    SetBreakOnID(ID, bEnable) {
        result := ComCall(32, this, "int", ID, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * Get a message category to break on when a message with that category passes through the storage filter. (ID3D11InfoQueue.GetBreakOnCategory)
     * @param {Integer} Category Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_category">D3D11_MESSAGE_CATEGORY</a></b>
     * 
     * Message category to break on (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_category">D3D11_MESSAGE_CATEGORY</a>).
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Whether this breaking condition is turned on or off (true for on, false for off).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getbreakoncategory
     */
    GetBreakOnCategory(Category) {
        result := ComCall(33, this, "int", Category, "int")
        return result
    }

    /**
     * Get a message severity level to break on when a message with that severity level passes through the storage filter. (ID3D11InfoQueue.GetBreakOnSeverity)
     * @param {Integer} Severity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity">D3D11_MESSAGE_SEVERITY</a></b>
     * 
     * Message severity level to break on (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity">D3D11_MESSAGE_SEVERITY</a>).
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Whether this breaking condition is turned on or off (true for on, false for off).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getbreakonseverity
     */
    GetBreakOnSeverity(Severity) {
        result := ComCall(34, this, "int", Severity, "int")
        return result
    }

    /**
     * Get a message identifier to break on when a message with that identifier passes through the storage filter. (ID3D11InfoQueue.GetBreakOnID)
     * @param {Integer} ID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_id">D3D11_MESSAGE_ID</a></b>
     * 
     * Message identifier to break on (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_id">D3D11_MESSAGE_ID</a>).
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Whether this breaking condition is turned on or off (true for on, false for off).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getbreakonid
     */
    GetBreakOnID(ID) {
        result := ComCall(35, this, "int", ID, "int")
        return result
    }

    /**
     * Set a boolean that turns the debug output on or off. (ID3D11InfoQueue.SetMuteDebugOutput)
     * @remarks
     * This will stop messages that pass the storage filter from being printed out in the debug output, however those messages will still be added to the message queue.
     * @param {BOOL} bMute Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Disable/Enable the debug output (<b>TRUE</b> to disable or mute the output, <b>FALSE</b> to enable the output).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-setmutedebugoutput
     */
    SetMuteDebugOutput(bMute) {
        ComCall(36, this, "int", bMute)
    }

    /**
     * Get a boolean that turns the debug output on or off. (ID3D11InfoQueue.GetMuteDebugOutput)
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Whether the debug output is on or off (true for on, false for off).
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getmutedebugoutput
     */
    GetMuteDebugOutput() {
        result := ComCall(37, this, "int")
        return result
    }
}
