#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An information-queue interface stores, retrieves, and filters debug messages. The queue consists of a message queue, an optional storage filter stack, and a optional retrieval filter stack.
 * @remarks
 * 
  * To get this interface, turn on debug layer and use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>.
  *           
  * 
  * <b>Windows Phone 8:
  *         </b> This API is supported.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nn-d3d11sdklayers-id3d11infoqueue
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
     * 
     * @param {Integer} MessageCountLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-setmessagecountlimit
     */
    SetMessageCountLimit(MessageCountLimit) {
        result := ComCall(3, this, "uint", MessageCountLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-clearstoredmessages
     */
    ClearStoredMessages() {
        ComCall(4, this)
    }

    /**
     * Retrieves a message from the calling thread's message queue. The function dispatches incoming sent messages until a posted message is available for retrieval.
     * @param {Integer} MessageIndex 
     * @param {Pointer} pMessage 
     * @param {Pointer<Pointer>} pMessageByteLength 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function retrieves a message other than <a href="/windows/desktop/winmsg/wm-quit">WM_QUIT</a>, the return value is nonzero.
     * 
     * If the function retrieves the <a href="/windows/desktop/winmsg/wm-quit">WM_QUIT</a> message, the return value is zero. 
     * 
     * If there is an error, the return value is -1. For example, the function fails if <i>hWnd</i> is an invalid window handle or <i>lpMsg</i> is an invalid pointer. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Because the return value can be nonzero, zero, or -1, avoid code like this:
     * 
     * 
     * ```
     * while (GetMessage( lpMsg, hWnd, 0, 0)) ...
     * ```
     * 
     * 
     * The possibility of a -1 return value in the case that hWnd is an invalid parameter (such as referring to a window that has already been destroyed) means that such code can lead to fatal application errors. Instead, use code like this:
     * 
     * 
     * ```
     * BOOL bRet;
     * 
     * while( (bRet = GetMessage( &msg, hWnd, 0, 0 )) != 0)
     * { 
     *     if (bRet == -1)
     *     {
     *         // handle the error and possibly exit
     *     }
     *     else
     *     {
     *         TranslateMessage(&msg); 
     *         DispatchMessage(&msg); 
     *     }
     * }
     * ```
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmessage
     */
    GetMessage(MessageIndex, pMessage, pMessageByteLength) {
        pMessageByteLengthMarshal := pMessageByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", MessageIndex, "ptr", pMessage, pMessageByteLengthMarshal, pMessageByteLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getnummessagesallowedbystoragefilter
     */
    GetNumMessagesAllowedByStorageFilter() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getnummessagesdeniedbystoragefilter
     */
    GetNumMessagesDeniedByStorageFilter() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getnumstoredmessages
     */
    GetNumStoredMessages() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getnumstoredmessagesallowedbyretrievalfilter
     */
    GetNumStoredMessagesAllowedByRetrievalFilter() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getnummessagesdiscardedbymessagecountlimit
     */
    GetNumMessagesDiscardedByMessageCountLimit() {
        result := ComCall(10, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getmessagecountlimit
     */
    GetMessageCountLimit() {
        result := ComCall(11, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-addstoragefilterentries
     */
    AddStorageFilterEntries(pFilter) {
        result := ComCall(12, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pFilter 
     * @param {Pointer<Pointer>} pFilterByteLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getstoragefilter
     */
    GetStorageFilter(pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-clearstoragefilter
     */
    ClearStorageFilter() {
        ComCall(14, this)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-pushemptystoragefilter
     */
    PushEmptyStorageFilter() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-pushcopyofstoragefilter
     */
    PushCopyOfStorageFilter() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-pushstoragefilter
     */
    PushStorageFilter(pFilter) {
        result := ComCall(17, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-popstoragefilter
     */
    PopStorageFilter() {
        ComCall(18, this)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getstoragefilterstacksize
     */
    GetStorageFilterStackSize() {
        result := ComCall(19, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-addretrievalfilterentries
     */
    AddRetrievalFilterEntries(pFilter) {
        result := ComCall(20, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pFilter 
     * @param {Pointer<Pointer>} pFilterByteLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getretrievalfilter
     */
    GetRetrievalFilter(pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(21, this, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-clearretrievalfilter
     */
    ClearRetrievalFilter() {
        ComCall(22, this)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-pushemptyretrievalfilter
     */
    PushEmptyRetrievalFilter() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-pushcopyofretrievalfilter
     */
    PushCopyOfRetrievalFilter() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-pushretrievalfilter
     */
    PushRetrievalFilter(pFilter) {
        result := ComCall(25, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-popretrievalfilter
     */
    PopRetrievalFilter() {
        ComCall(26, this)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getretrievalfilterstacksize
     */
    GetRetrievalFilterStackSize() {
        result := ComCall(27, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Category 
     * @param {Integer} Severity 
     * @param {Integer} ID 
     * @param {PSTR} pDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-addmessage
     */
    AddMessage(Category, Severity, ID, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(28, this, "int", Category, "int", Severity, "int", ID, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Severity 
     * @param {PSTR} pDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-addapplicationmessage
     */
    AddApplicationMessage(Severity, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(29, this, "int", Severity, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Category 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-setbreakoncategory
     */
    SetBreakOnCategory(Category, bEnable) {
        result := ComCall(30, this, "int", Category, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Severity 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-setbreakonseverity
     */
    SetBreakOnSeverity(Severity, bEnable) {
        result := ComCall(31, this, "int", Severity, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ID 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-setbreakonid
     */
    SetBreakOnID(ID, bEnable) {
        result := ComCall(32, this, "int", ID, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Category 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getbreakoncategory
     */
    GetBreakOnCategory(Category) {
        result := ComCall(33, this, "int", Category, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Severity 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getbreakonseverity
     */
    GetBreakOnSeverity(Severity) {
        result := ComCall(34, this, "int", Severity, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ID 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getbreakonid
     */
    GetBreakOnID(ID) {
        result := ComCall(35, this, "int", ID, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} bMute 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-setmutedebugoutput
     */
    SetMuteDebugOutput(bMute) {
        ComCall(36, this, "int", bMute)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-getmutedebugoutput
     */
    GetMuteDebugOutput() {
        result := ComCall(37, this, "int")
        return result
    }
}
