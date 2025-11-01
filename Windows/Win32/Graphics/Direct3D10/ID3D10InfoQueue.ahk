#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An information-queue interface stores, retrieves, and filters debug messages. The queue consists of a message queue, an optional storage filter stack, and a optional retrieval filter stack.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nn-d3d10sdklayers-id3d10infoqueue
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10InfoQueue extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10InfoQueue
     * @type {Guid}
     */
    static IID => Guid("{1b940b17-2642-4d1f-ab1f-b99bad0c395f}")

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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-setmessagecountlimit
     */
    SetMessageCountLimit(MessageCountLimit) {
        result := ComCall(3, this, "uint", MessageCountLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-clearstoredmessages
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
        result := ComCall(5, this, "uint", MessageIndex, "ptr", pMessage, "ptr*", pMessageByteLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getnummessagesallowedbystoragefilter
     */
    GetNumMessagesAllowedByStorageFilter() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getnummessagesdeniedbystoragefilter
     */
    GetNumMessagesDeniedByStorageFilter() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getnumstoredmessages
     */
    GetNumStoredMessages() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getnumstoredmessagesallowedbyretrievalfilter
     */
    GetNumStoredMessagesAllowedByRetrievalFilter() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getnummessagesdiscardedbymessagecountlimit
     */
    GetNumMessagesDiscardedByMessageCountLimit() {
        result := ComCall(10, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getmessagecountlimit
     */
    GetMessageCountLimit() {
        result := ComCall(11, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-addstoragefilterentries
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getstoragefilter
     */
    GetStorageFilter(pFilter, pFilterByteLength) {
        result := ComCall(13, this, "ptr", pFilter, "ptr*", pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-clearstoragefilter
     */
    ClearStorageFilter() {
        ComCall(14, this)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-pushemptystoragefilter
     */
    PushEmptyStorageFilter() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-pushcopyofstoragefilter
     */
    PushCopyOfStorageFilter() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-pushstoragefilter
     */
    PushStorageFilter(pFilter) {
        result := ComCall(17, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-popstoragefilter
     */
    PopStorageFilter() {
        ComCall(18, this)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getstoragefilterstacksize
     */
    GetStorageFilterStackSize() {
        result := ComCall(19, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-addretrievalfilterentries
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getretrievalfilter
     */
    GetRetrievalFilter(pFilter, pFilterByteLength) {
        result := ComCall(21, this, "ptr", pFilter, "ptr*", pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-clearretrievalfilter
     */
    ClearRetrievalFilter() {
        ComCall(22, this)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-pushemptyretrievalfilter
     */
    PushEmptyRetrievalFilter() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-pushcopyofretrievalfilter
     */
    PushCopyOfRetrievalFilter() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-pushretrievalfilter
     */
    PushRetrievalFilter(pFilter) {
        result := ComCall(25, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-popretrievalfilter
     */
    PopRetrievalFilter() {
        ComCall(26, this)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getretrievalfilterstacksize
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-addmessage
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-addapplicationmessage
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-setbreakoncategory
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-setbreakonseverity
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-setbreakonid
     */
    SetBreakOnID(ID, bEnable) {
        result := ComCall(32, this, "int", ID, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Category 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getbreakoncategory
     */
    GetBreakOnCategory(Category) {
        result := ComCall(33, this, "int", Category, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Severity 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getbreakonseverity
     */
    GetBreakOnSeverity(Severity) {
        result := ComCall(34, this, "int", Severity, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ID 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getbreakonid
     */
    GetBreakOnID(ID) {
        result := ComCall(35, this, "int", ID, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} bMute 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-setmutedebugoutput
     */
    SetMuteDebugOutput(bMute) {
        ComCall(36, this, "int", bMute)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-getmutedebugoutput
     */
    GetMuteDebugOutput() {
        result := ComCall(37, this, "int")
        return result
    }
}
