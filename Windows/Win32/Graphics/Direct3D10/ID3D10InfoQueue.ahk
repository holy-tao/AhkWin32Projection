#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D10_MESSAGE_CATEGORY.ahk" { D3D10_MESSAGE_CATEGORY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\D3D10_MESSAGE_SEVERITY.ahk" { D3D10_MESSAGE_SEVERITY }
#Import ".\D3D10_MESSAGE_ID.ahk" { D3D10_MESSAGE_ID }
#Import ".\D3D10_INFO_QUEUE_FILTER.ahk" { D3D10_INFO_QUEUE_FILTER }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * An information-queue interface stores, retrieves, and filters debug messages. The queue consists of a message queue, an optional storage filter stack, and a optional retrieval filter stack. (ID3D10InfoQueue)
 * @remarks
 * This interface is obtained by turning on the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">debug layer</a> and querying it from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a> using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
 * 
 * 
 * ```
 * hr = D3D10CreateDeviceAndSwapChain( NULL, g_driverType, NULL, D3D10_CREATE_DEVICE_DEBUG, D3D10_SDK_VERSION, &sd, &g_pSwapChain, &g_pd3dDevice );
 * ...
 * ID3D10InfoQueue * infoQueue;
 * g_pd3dDevice->QueryInterface(__uuidof(ID3D10InfoQueue),  (void **)&infoQueue); 
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nn-d3d10sdklayers-id3d10infoqueue
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10InfoQueue extends IUnknown {
    /**
     * The interface identifier for ID3D10InfoQueue
     * @type {Guid}
     */
    static IID := Guid("{1b940b17-2642-4d1f-ab1f-b99bad0c395f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10InfoQueue interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetMessageCountLimit                         : IntPtr
        ClearStoredMessages                          : IntPtr
        GetMessage                                   : IntPtr
        GetNumMessagesAllowedByStorageFilter         : IntPtr
        GetNumMessagesDeniedByStorageFilter          : IntPtr
        GetNumStoredMessages                         : IntPtr
        GetNumStoredMessagesAllowedByRetrievalFilter : IntPtr
        GetNumMessagesDiscardedByMessageCountLimit   : IntPtr
        GetMessageCountLimit                         : IntPtr
        AddStorageFilterEntries                      : IntPtr
        GetStorageFilter                             : IntPtr
        ClearStorageFilter                           : IntPtr
        PushEmptyStorageFilter                       : IntPtr
        PushCopyOfStorageFilter                      : IntPtr
        PushStorageFilter                            : IntPtr
        PopStorageFilter                             : IntPtr
        GetStorageFilterStackSize                    : IntPtr
        AddRetrievalFilterEntries                    : IntPtr
        GetRetrievalFilter                           : IntPtr
        ClearRetrievalFilter                         : IntPtr
        PushEmptyRetrievalFilter                     : IntPtr
        PushCopyOfRetrievalFilter                    : IntPtr
        PushRetrievalFilter                          : IntPtr
        PopRetrievalFilter                           : IntPtr
        GetRetrievalFilterStackSize                  : IntPtr
        AddMessage                                   : IntPtr
        AddApplicationMessage                        : IntPtr
        SetBreakOnCategory                           : IntPtr
        SetBreakOnSeverity                           : IntPtr
        SetBreakOnID                                 : IntPtr
        GetBreakOnCategory                           : IntPtr
        GetBreakOnSeverity                           : IntPtr
        GetBreakOnID                                 : IntPtr
        SetMuteDebugOutput                           : IntPtr
        GetMuteDebugOutput                           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10InfoQueue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Set the maximum number of messages that can be added to the message queue. (ID3D10InfoQueue.SetMessageCountLimit)
     * @remarks
     * When the number of messages in the message queue has reached the maximum limit, new messages coming in will push old messages out.
     * @param {Integer} MessageCountLimit Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Maximum number of messages that can be added to the message queue. -1 means no limit.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-setmessagecountlimit
     */
    SetMessageCountLimit(MessageCountLimit) {
        result := ComCall(3, this, "uint", MessageCountLimit, "HRESULT")
        return result
    }

    /**
     * Clear all messages from the message queue. (ID3D10InfoQueue.ClearStoredMessages)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-clearstoredmessages
     */
    ClearStoredMessages() {
        ComCall(4, this)
    }

    /**
     * Get a message from the message queue. (ID3D10InfoQueue.GetMessage)
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
     * D3D10_MESSAGE * pMessage = (D3D10_MESSAGE*)malloc(messageLength);
     * hr = pInfoQueue->GetMessage(0, pMessage, &messageLength);
     * 
     * ```
     * 
     * 
     * For an overview see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nn-d3d10sdklayers-id3d10infoqueue">Information Queue Overview</a>.
     * @param {Integer} MessageIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Index into message queue after an optional retrieval filter has been applied. This can be between 0 and the number of messages in the message queue that pass through the retrieval filter (which can be obtained with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getnumstoredmessagesallowedbyretrievalfilter">ID3D10InfoQueue::GetNumStoredMessagesAllowedByRetrievalFilter</a>). 0 is the message at the front of the message queue.
     * @param {Integer} pMessage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_message">D3D10_MESSAGE</a>*</b>
     * 
     * Returned message (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_message">D3D10_MESSAGE</a>).
     * @param {Pointer<Pointer>} pMessageByteLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a>*</b>
     * 
     * Size of pMessage in bytes, including the size of the message string that the pMessage points to.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getmessage
     */
    GetMessage(MessageIndex, pMessage, pMessageByteLength) {
        pMessageByteLengthMarshal := pMessageByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", MessageIndex, "ptr", pMessage, pMessageByteLengthMarshal, pMessageByteLength, "HRESULT")
        return result
    }

    /**
     * Get the number of messages that were allowed to pass through a storage filter. (ID3D10InfoQueue.GetNumMessagesAllowedByStorageFilter)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of messages allowed by a storage filter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getnummessagesallowedbystoragefilter
     */
    GetNumMessagesAllowedByStorageFilter() {
        result := ComCall(6, this, Int64)
        return result
    }

    /**
     * Get the number of messages that were denied passage through a storage filter. (ID3D10InfoQueue.GetNumMessagesDeniedByStorageFilter)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of messages denied by a storage filter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getnummessagesdeniedbystoragefilter
     */
    GetNumMessagesDeniedByStorageFilter() {
        result := ComCall(7, this, Int64)
        return result
    }

    /**
     * Get the number of messages currently stored in the message queue. (ID3D10InfoQueue.GetNumStoredMessages)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of messages currently stored in the message queue.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getnumstoredmessages
     */
    GetNumStoredMessages() {
        result := ComCall(8, this, Int64)
        return result
    }

    /**
     * Get the number of messages that are able to pass through a retrieval filter. (ID3D10InfoQueue.GetNumStoredMessagesAllowedByRetrievalFilter)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of messages allowed by a retrieval filter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getnumstoredmessagesallowedbyretrievalfilter
     */
    GetNumStoredMessagesAllowedByRetrievalFilter() {
        result := ComCall(9, this, Int64)
        return result
    }

    /**
     * Get the number of messages that were discarded due to the message count limit. (ID3D10InfoQueue.GetNumMessagesDiscardedByMessageCountLimit)
     * @remarks
     * Get and set the message count limit with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getmessagecountlimit">ID3D10InfoQueue::GetMessageCountLimit</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-setmessagecountlimit">ID3D10InfoQueue::SetMessageCountLimit</a>, respectively.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Number of messages discarded.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getnummessagesdiscardedbymessagecountlimit
     */
    GetNumMessagesDiscardedByMessageCountLimit() {
        result := ComCall(10, this, Int64)
        return result
    }

    /**
     * Get the maximum number of messages that can be added to the message queue. (ID3D10InfoQueue.GetMessageCountLimit)
     * @remarks
     * When the number of messages in the message queue has reached the maximum limit, new messages coming in will push old messages out.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Maximum number of messages that can be added to the queue. -1 means no limit.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getmessagecountlimit
     */
    GetMessageCountLimit() {
        result := ComCall(11, this, Int64)
        return result
    }

    /**
     * Add storage filters to the top of the storage-filter stack. (ID3D10InfoQueue.AddStorageFilterEntries)
     * @remarks
     * A storage filter defines a grouping of debug messages that should be allowed into the info queue.
     * @param {Pointer<D3D10_INFO_QUEUE_FILTER>} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter">D3D10_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Array of storage filters (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter">D3D10_INFO_QUEUE_FILTER</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-addstoragefilterentries
     */
    AddStorageFilterEntries(pFilter) {
        result := ComCall(12, this, D3D10_INFO_QUEUE_FILTER.Ptr, pFilter, "HRESULT")
        return result
    }

    /**
     * Get the storage filter at the top of the storage-filter stack. (ID3D10InfoQueue.GetStorageFilter)
     * @param {Integer} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter">D3D10_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Storage filter at the top of the storage-filter stack.
     * @param {Pointer<Pointer>} pFilterByteLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a>*</b>
     * 
     * Size of the storage filter in bytes. If pFilter is <b>NULL</b>, the size of the storage filter will be output to this parameter.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getstoragefilter
     */
    GetStorageFilter(pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * Remove a storage filter from the top of the storage-filter stack. (ID3D10InfoQueue.ClearStorageFilter)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-clearstoragefilter
     */
    ClearStorageFilter() {
        ComCall(14, this)
    }

    /**
     * Push an empty storage filter onto the storage-filter stack. (ID3D10InfoQueue.PushEmptyStorageFilter)
     * @remarks
     * An empty storage filter allows all messages to pass through.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-pushemptystoragefilter
     */
    PushEmptyStorageFilter() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Push a copy of storage filter currently on the top of the storage-filter stack onto the storage-filter stack. (ID3D10InfoQueue.PushCopyOfStorageFilter)
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-pushcopyofstoragefilter
     */
    PushCopyOfStorageFilter() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Push a storage filter onto the storage-filter stack. (ID3D10InfoQueue.PushStorageFilter)
     * @param {Pointer<D3D10_INFO_QUEUE_FILTER>} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter">D3D10_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Pointer to a storage filter (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter">D3D10_INFO_QUEUE_FILTER</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-pushstoragefilter
     */
    PushStorageFilter(pFilter) {
        result := ComCall(17, this, D3D10_INFO_QUEUE_FILTER.Ptr, pFilter, "HRESULT")
        return result
    }

    /**
     * Pop a storage filter from the top of the storage-filter stack. (ID3D10InfoQueue.PopStorageFilter)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-popstoragefilter
     */
    PopStorageFilter() {
        ComCall(18, this)
    }

    /**
     * Get the size of the storage-filter stack in bytes. (ID3D10InfoQueue.GetStorageFilterStackSize)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the storage-filter stack in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getstoragefilterstacksize
     */
    GetStorageFilterStackSize() {
        result := ComCall(19, this, UInt32)
        return result
    }

    /**
     * Add storage filters to the top of the retrieval-filter stack. (ID3D10InfoQueue.AddRetrievalFilterEntries)
     * @remarks
     * A retrieval filter is used to define a subgroup of the messages that are already in the info queue.  
     *       Retrieval filters affect the messages that will be returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getmessage">ID3D10InfoQueue::GetMessage</a>.
     * 
     * The number of messages already in the info queue that will be allowed through the retrieval filter can be determined 
     *       by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getnumstoredmessagesallowedbyretrievalfilter">ID3D10InfoQueue::GetNumStoredMessagesAllowedByRetrievalFilter</a>.
     * @param {Pointer<D3D10_INFO_QUEUE_FILTER>} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter">D3D10_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Array of retrieval filters (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter">D3D10_INFO_QUEUE_FILTER</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-addretrievalfilterentries
     */
    AddRetrievalFilterEntries(pFilter) {
        result := ComCall(20, this, D3D10_INFO_QUEUE_FILTER.Ptr, pFilter, "HRESULT")
        return result
    }

    /**
     * Get the retrieval filter at the top of the retrieval-filter stack. (ID3D10InfoQueue.GetRetrievalFilter)
     * @param {Integer} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter">D3D10_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Retrieval filter at the top of the retrieval-filter stack.
     * @param {Pointer<Pointer>} pFilterByteLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a>*</b>
     * 
     * Size of the retrieval filter in bytes. If pFilter is <b>NULL</b>, the size of the retrieval filter will be output to this parameter.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getretrievalfilter
     */
    GetRetrievalFilter(pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(21, this, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * Remove a retrieval filter from the top of the retrieval-filter stack. (ID3D10InfoQueue.ClearRetrievalFilter)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-clearretrievalfilter
     */
    ClearRetrievalFilter() {
        ComCall(22, this)
    }

    /**
     * Push an empty retrieval filter onto the retrieval-filter stack. (ID3D10InfoQueue.PushEmptyRetrievalFilter)
     * @remarks
     * An empty retrieval filter allows all messages to pass through.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-pushemptyretrievalfilter
     */
    PushEmptyRetrievalFilter() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * Push a copy of retrieval filter currently on the top of the retrieval-filter stack onto the retrieval-filter stack. (ID3D10InfoQueue.PushCopyOfRetrievalFilter)
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-pushcopyofretrievalfilter
     */
    PushCopyOfRetrievalFilter() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * Push a retrieval filter onto the retrieval-filter stack. (ID3D10InfoQueue.PushRetrievalFilter)
     * @param {Pointer<D3D10_INFO_QUEUE_FILTER>} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter">D3D10_INFO_QUEUE_FILTER</a>*</b>
     * 
     * Pointer to a retrieval filter (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter">D3D10_INFO_QUEUE_FILTER</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-pushretrievalfilter
     */
    PushRetrievalFilter(pFilter) {
        result := ComCall(25, this, D3D10_INFO_QUEUE_FILTER.Ptr, pFilter, "HRESULT")
        return result
    }

    /**
     * Pop a retrieval filter from the top of the retrieval-filter stack. (ID3D10InfoQueue.PopRetrievalFilter)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-popretrievalfilter
     */
    PopRetrievalFilter() {
        ComCall(26, this)
    }

    /**
     * Get the size of the retrieval-filter stack in bytes. (ID3D10InfoQueue.GetRetrievalFilterStackSize)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the retrieval-filter stack in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getretrievalfilterstacksize
     */
    GetRetrievalFilterStackSize() {
        result := ComCall(27, this, UInt32)
        return result
    }

    /**
     * Add a Direct3D 10 debug message to the message queue and send that message to debug output.
     * @remarks
     * This method is used by the runtime's internal mechanisms to add Direct3D 10 debug messages to the message queue and send them to debug output. For applications to add their own custom messages to the message queue and send them to debug output, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-addapplicationmessage">ID3D10InfoQueue::AddApplicationMessage</a>.
     * @param {D3D10_MESSAGE_CATEGORY} Category Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_category">D3D10_MESSAGE_CATEGORY</a></b>
     * 
     * Category of a message (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_category">D3D10_MESSAGE_CATEGORY</a>).
     * @param {D3D10_MESSAGE_SEVERITY} Severity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity">D3D10_MESSAGE_SEVERITY</a></b>
     * 
     * Severity of a message (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity">D3D10_MESSAGE_SEVERITY</a>).
     * @param {D3D10_MESSAGE_ID} ID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_id">D3D10_MESSAGE_ID</a></b>
     * 
     * Unique identifier of a message (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_id">D3D10_MESSAGE_ID</a>).
     * @param {PSTR} pDescription Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * User-defined message.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-addmessage
     */
    AddMessage(Category, Severity, ID, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(28, this, D3D10_MESSAGE_CATEGORY, Category, D3D10_MESSAGE_SEVERITY, Severity, D3D10_MESSAGE_ID, ID, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * Add a user-defined message to the message queue and send that message to debug output. (ID3D10InfoQueue.AddApplicationMessage)
     * @param {D3D10_MESSAGE_SEVERITY} Severity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity">D3D10_MESSAGE_SEVERITY</a></b>
     * 
     * Severity of a message (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity">D3D10_MESSAGE_SEVERITY</a>).
     * @param {PSTR} pDescription Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Message string.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-addapplicationmessage
     */
    AddApplicationMessage(Severity, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(29, this, D3D10_MESSAGE_SEVERITY, Severity, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * Set a message category to break on when a message with that category passes through the storage filter. (ID3D10InfoQueue.SetBreakOnCategory)
     * @param {D3D10_MESSAGE_CATEGORY} Category Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_category">D3D10_MESSAGE_CATEGORY</a></b>
     * 
     * Message category to break on (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_category">D3D10_MESSAGE_CATEGORY</a>).
     * @param {BOOL} bEnable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Turns this breaking condition on or off (true for on, false for off).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-setbreakoncategory
     */
    SetBreakOnCategory(Category, bEnable) {
        result := ComCall(30, this, D3D10_MESSAGE_CATEGORY, Category, BOOL, bEnable, "HRESULT")
        return result
    }

    /**
     * Set a message severity level to break on when a message with that severity level passes through the storage filter. (ID3D10InfoQueue.SetBreakOnSeverity)
     * @param {D3D10_MESSAGE_SEVERITY} Severity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity">D3D10_MESSAGE_SEVERITY</a></b>
     * 
     * Message severity level to break on (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity">D3D10_MESSAGE_SEVERITY</a>).
     * @param {BOOL} bEnable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Turns this breaking condition on or off (true for on, false for off).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-setbreakonseverity
     */
    SetBreakOnSeverity(Severity, bEnable) {
        result := ComCall(31, this, D3D10_MESSAGE_SEVERITY, Severity, BOOL, bEnable, "HRESULT")
        return result
    }

    /**
     * Set a message identifier to break on when a message with that identifier passes through the storage filter. (ID3D10InfoQueue.SetBreakOnID)
     * @param {D3D10_MESSAGE_ID} ID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_id">D3D10_MESSAGE_ID</a></b>
     * 
     * Message identifier to break on (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_id">D3D10_MESSAGE_ID</a>).
     * @param {BOOL} bEnable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Turns this breaking condition on or off (true for on, false for off).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-setbreakonid
     */
    SetBreakOnID(ID, bEnable) {
        result := ComCall(32, this, D3D10_MESSAGE_ID, ID, BOOL, bEnable, "HRESULT")
        return result
    }

    /**
     * Get a message category to break on when a message with that category passes through the storage filter. (ID3D10InfoQueue.GetBreakOnCategory)
     * @param {D3D10_MESSAGE_CATEGORY} Category Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_category">D3D10_MESSAGE_CATEGORY</a></b>
     * 
     * Message category to break on (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_category">D3D10_MESSAGE_CATEGORY</a>).
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Whether this breaking condition is turned on or off (true for on, false for off).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getbreakoncategory
     */
    GetBreakOnCategory(Category) {
        result := ComCall(33, this, D3D10_MESSAGE_CATEGORY, Category, BOOL)
        return result
    }

    /**
     * Get a message severity level to break on when a message with that severity level passes through the storage filter. (ID3D10InfoQueue.GetBreakOnSeverity)
     * @param {D3D10_MESSAGE_SEVERITY} Severity Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity">D3D10_MESSAGE_SEVERITY</a></b>
     * 
     * Message severity level to break on (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_severity">D3D10_MESSAGE_SEVERITY</a>).
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Whether this breaking condition is turned on or off (true for on, false for off).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getbreakonseverity
     */
    GetBreakOnSeverity(Severity) {
        result := ComCall(34, this, D3D10_MESSAGE_SEVERITY, Severity, BOOL)
        return result
    }

    /**
     * Get a message identifier to break on when a message with that identifier passes through the storage filter. (ID3D10InfoQueue.GetBreakOnID)
     * @param {D3D10_MESSAGE_ID} ID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_id">D3D10_MESSAGE_ID</a></b>
     * 
     * Message identifier to break on (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_id">D3D10_MESSAGE_ID</a>).
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Whether this breaking condition is turned on or off (true for on, false for off).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getbreakonid
     */
    GetBreakOnID(ID) {
        result := ComCall(35, this, D3D10_MESSAGE_ID, ID, BOOL)
        return result
    }

    /**
     * Set a boolean that turns the debug output on or off. (ID3D10InfoQueue.SetMuteDebugOutput)
     * @remarks
     * This will stop messages that pass the storage filter from being printed out in the debug output, however those messages will still be added to the message queue.
     * @param {BOOL} bMute Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Disable/Enable the debug output (<b>TRUE</b> to disable or mute the output, <b>FALSE</b> to enable the output).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-setmutedebugoutput
     */
    SetMuteDebugOutput(bMute) {
        ComCall(36, this, BOOL, bMute)
    }

    /**
     * Get a boolean that turns the debug output on or off. (ID3D10InfoQueue.GetMuteDebugOutput)
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Whether the debug output is on or off (true for on, false for off).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getmutedebugoutput
     */
    GetMuteDebugOutput() {
        result := ComCall(37, this, BOOL)
        return result
    }

    Query(iid) {
        if (ID3D10InfoQueue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMessageCountLimit := CallbackCreate(GetMethod(implObj, "SetMessageCountLimit"), flags, 2)
        this.vtbl.ClearStoredMessages := CallbackCreate(GetMethod(implObj, "ClearStoredMessages"), flags, 1)
        this.vtbl.GetMessage := CallbackCreate(GetMethod(implObj, "GetMessage"), flags, 4)
        this.vtbl.GetNumMessagesAllowedByStorageFilter := CallbackCreate(GetMethod(implObj, "GetNumMessagesAllowedByStorageFilter"), flags, 1)
        this.vtbl.GetNumMessagesDeniedByStorageFilter := CallbackCreate(GetMethod(implObj, "GetNumMessagesDeniedByStorageFilter"), flags, 1)
        this.vtbl.GetNumStoredMessages := CallbackCreate(GetMethod(implObj, "GetNumStoredMessages"), flags, 1)
        this.vtbl.GetNumStoredMessagesAllowedByRetrievalFilter := CallbackCreate(GetMethod(implObj, "GetNumStoredMessagesAllowedByRetrievalFilter"), flags, 1)
        this.vtbl.GetNumMessagesDiscardedByMessageCountLimit := CallbackCreate(GetMethod(implObj, "GetNumMessagesDiscardedByMessageCountLimit"), flags, 1)
        this.vtbl.GetMessageCountLimit := CallbackCreate(GetMethod(implObj, "GetMessageCountLimit"), flags, 1)
        this.vtbl.AddStorageFilterEntries := CallbackCreate(GetMethod(implObj, "AddStorageFilterEntries"), flags, 2)
        this.vtbl.GetStorageFilter := CallbackCreate(GetMethod(implObj, "GetStorageFilter"), flags, 3)
        this.vtbl.ClearStorageFilter := CallbackCreate(GetMethod(implObj, "ClearStorageFilter"), flags, 1)
        this.vtbl.PushEmptyStorageFilter := CallbackCreate(GetMethod(implObj, "PushEmptyStorageFilter"), flags, 1)
        this.vtbl.PushCopyOfStorageFilter := CallbackCreate(GetMethod(implObj, "PushCopyOfStorageFilter"), flags, 1)
        this.vtbl.PushStorageFilter := CallbackCreate(GetMethod(implObj, "PushStorageFilter"), flags, 2)
        this.vtbl.PopStorageFilter := CallbackCreate(GetMethod(implObj, "PopStorageFilter"), flags, 1)
        this.vtbl.GetStorageFilterStackSize := CallbackCreate(GetMethod(implObj, "GetStorageFilterStackSize"), flags, 1)
        this.vtbl.AddRetrievalFilterEntries := CallbackCreate(GetMethod(implObj, "AddRetrievalFilterEntries"), flags, 2)
        this.vtbl.GetRetrievalFilter := CallbackCreate(GetMethod(implObj, "GetRetrievalFilter"), flags, 3)
        this.vtbl.ClearRetrievalFilter := CallbackCreate(GetMethod(implObj, "ClearRetrievalFilter"), flags, 1)
        this.vtbl.PushEmptyRetrievalFilter := CallbackCreate(GetMethod(implObj, "PushEmptyRetrievalFilter"), flags, 1)
        this.vtbl.PushCopyOfRetrievalFilter := CallbackCreate(GetMethod(implObj, "PushCopyOfRetrievalFilter"), flags, 1)
        this.vtbl.PushRetrievalFilter := CallbackCreate(GetMethod(implObj, "PushRetrievalFilter"), flags, 2)
        this.vtbl.PopRetrievalFilter := CallbackCreate(GetMethod(implObj, "PopRetrievalFilter"), flags, 1)
        this.vtbl.GetRetrievalFilterStackSize := CallbackCreate(GetMethod(implObj, "GetRetrievalFilterStackSize"), flags, 1)
        this.vtbl.AddMessage := CallbackCreate(GetMethod(implObj, "AddMessage"), flags, 5)
        this.vtbl.AddApplicationMessage := CallbackCreate(GetMethod(implObj, "AddApplicationMessage"), flags, 3)
        this.vtbl.SetBreakOnCategory := CallbackCreate(GetMethod(implObj, "SetBreakOnCategory"), flags, 3)
        this.vtbl.SetBreakOnSeverity := CallbackCreate(GetMethod(implObj, "SetBreakOnSeverity"), flags, 3)
        this.vtbl.SetBreakOnID := CallbackCreate(GetMethod(implObj, "SetBreakOnID"), flags, 3)
        this.vtbl.GetBreakOnCategory := CallbackCreate(GetMethod(implObj, "GetBreakOnCategory"), flags, 2)
        this.vtbl.GetBreakOnSeverity := CallbackCreate(GetMethod(implObj, "GetBreakOnSeverity"), flags, 2)
        this.vtbl.GetBreakOnID := CallbackCreate(GetMethod(implObj, "GetBreakOnID"), flags, 2)
        this.vtbl.SetMuteDebugOutput := CallbackCreate(GetMethod(implObj, "SetMuteDebugOutput"), flags, 2)
        this.vtbl.GetMuteDebugOutput := CallbackCreate(GetMethod(implObj, "GetMuteDebugOutput"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMessageCountLimit)
        CallbackFree(this.vtbl.ClearStoredMessages)
        CallbackFree(this.vtbl.GetMessage)
        CallbackFree(this.vtbl.GetNumMessagesAllowedByStorageFilter)
        CallbackFree(this.vtbl.GetNumMessagesDeniedByStorageFilter)
        CallbackFree(this.vtbl.GetNumStoredMessages)
        CallbackFree(this.vtbl.GetNumStoredMessagesAllowedByRetrievalFilter)
        CallbackFree(this.vtbl.GetNumMessagesDiscardedByMessageCountLimit)
        CallbackFree(this.vtbl.GetMessageCountLimit)
        CallbackFree(this.vtbl.AddStorageFilterEntries)
        CallbackFree(this.vtbl.GetStorageFilter)
        CallbackFree(this.vtbl.ClearStorageFilter)
        CallbackFree(this.vtbl.PushEmptyStorageFilter)
        CallbackFree(this.vtbl.PushCopyOfStorageFilter)
        CallbackFree(this.vtbl.PushStorageFilter)
        CallbackFree(this.vtbl.PopStorageFilter)
        CallbackFree(this.vtbl.GetStorageFilterStackSize)
        CallbackFree(this.vtbl.AddRetrievalFilterEntries)
        CallbackFree(this.vtbl.GetRetrievalFilter)
        CallbackFree(this.vtbl.ClearRetrievalFilter)
        CallbackFree(this.vtbl.PushEmptyRetrievalFilter)
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
