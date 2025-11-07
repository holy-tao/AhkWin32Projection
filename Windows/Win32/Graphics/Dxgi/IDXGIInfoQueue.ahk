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
     * 
     * @param {Guid} Producer 
     * @param {Integer} MessageCountLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-setmessagecountlimit
     */
    SetMessageCountLimit(Producer, MessageCountLimit) {
        result := ComCall(3, this, "ptr", Producer, "uint", MessageCountLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-clearstoredmessages
     */
    ClearStoredMessages(Producer) {
        ComCall(4, this, "ptr", Producer)
    }

    /**
     * Retrieves a message from the calling thread's message queue. The function dispatches incoming sent messages until a posted message is available for retrieval.
     * @param {Guid} Producer 
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
    GetMessage(Producer, MessageIndex, pMessage, pMessageByteLength) {
        pMessageByteLengthMarshal := pMessageByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", Producer, "uint", MessageIndex, "ptr", pMessage, pMessageByteLengthMarshal, pMessageByteLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnumstoredmessagesallowedbyretrievalfilters
     */
    GetNumStoredMessagesAllowedByRetrievalFilters(Producer) {
        result := ComCall(6, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnumstoredmessages
     */
    GetNumStoredMessages(Producer) {
        result := ComCall(7, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnummessagesdiscardedbymessagecountlimit
     */
    GetNumMessagesDiscardedByMessageCountLimit(Producer) {
        result := ComCall(8, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmessagecountlimit
     */
    GetMessageCountLimit(Producer) {
        result := ComCall(9, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnummessagesallowedbystoragefilter
     */
    GetNumMessagesAllowedByStorageFilter(Producer) {
        result := ComCall(10, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getnummessagesdeniedbystoragefilter
     */
    GetNumMessagesDeniedByStorageFilter(Producer) {
        result := ComCall(11, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Pointer<DXGI_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-addstoragefilterentries
     */
    AddStorageFilterEntries(Producer, pFilter) {
        result := ComCall(12, this, "ptr", Producer, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Pointer} pFilter 
     * @param {Pointer<Pointer>} pFilterByteLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getstoragefilter
     */
    GetStorageFilter(Producer, pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", Producer, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-clearstoragefilter
     */
    ClearStorageFilter(Producer) {
        ComCall(14, this, "ptr", Producer)
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushemptystoragefilter
     */
    PushEmptyStorageFilter(Producer) {
        result := ComCall(15, this, "ptr", Producer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushdenyallstoragefilter
     */
    PushDenyAllStorageFilter(Producer) {
        result := ComCall(16, this, "ptr", Producer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushcopyofstoragefilter
     */
    PushCopyOfStorageFilter(Producer) {
        result := ComCall(17, this, "ptr", Producer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Pointer<DXGI_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushstoragefilter
     */
    PushStorageFilter(Producer, pFilter) {
        result := ComCall(18, this, "ptr", Producer, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-popstoragefilter
     */
    PopStorageFilter(Producer) {
        ComCall(19, this, "ptr", Producer)
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getstoragefilterstacksize
     */
    GetStorageFilterStackSize(Producer) {
        result := ComCall(20, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Pointer<DXGI_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-addretrievalfilterentries
     */
    AddRetrievalFilterEntries(Producer, pFilter) {
        result := ComCall(21, this, "ptr", Producer, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Pointer} pFilter 
     * @param {Pointer<Pointer>} pFilterByteLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getretrievalfilter
     */
    GetRetrievalFilter(Producer, pFilter, pFilterByteLength) {
        pFilterByteLengthMarshal := pFilterByteLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "ptr", Producer, "ptr", pFilter, pFilterByteLengthMarshal, pFilterByteLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-clearretrievalfilter
     */
    ClearRetrievalFilter(Producer) {
        ComCall(23, this, "ptr", Producer)
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushemptyretrievalfilter
     */
    PushEmptyRetrievalFilter(Producer) {
        result := ComCall(24, this, "ptr", Producer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushdenyallretrievalfilter
     */
    PushDenyAllRetrievalFilter(Producer) {
        result := ComCall(25, this, "ptr", Producer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushcopyofretrievalfilter
     */
    PushCopyOfRetrievalFilter(Producer) {
        result := ComCall(26, this, "ptr", Producer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Pointer<DXGI_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-pushretrievalfilter
     */
    PushRetrievalFilter(Producer, pFilter) {
        result := ComCall(27, this, "ptr", Producer, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-popretrievalfilter
     */
    PopRetrievalFilter(Producer) {
        ComCall(28, this, "ptr", Producer)
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getretrievalfilterstacksize
     */
    GetRetrievalFilterStackSize(Producer) {
        result := ComCall(29, this, "ptr", Producer, "uint")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Integer} Category 
     * @param {Integer} Severity 
     * @param {Integer} ID 
     * @param {PSTR} pDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-addmessage
     */
    AddMessage(Producer, Category, Severity, ID, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(30, this, "ptr", Producer, "int", Category, "int", Severity, "int", ID, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Severity 
     * @param {PSTR} pDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-addapplicationmessage
     */
    AddApplicationMessage(Severity, pDescription) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        result := ComCall(31, this, "int", Severity, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Integer} Category 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-setbreakoncategory
     */
    SetBreakOnCategory(Producer, Category, bEnable) {
        result := ComCall(32, this, "ptr", Producer, "int", Category, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Integer} Severity 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-setbreakonseverity
     */
    SetBreakOnSeverity(Producer, Severity, bEnable) {
        result := ComCall(33, this, "ptr", Producer, "int", Severity, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Integer} ID 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-setbreakonid
     */
    SetBreakOnID(Producer, ID, bEnable) {
        result := ComCall(34, this, "ptr", Producer, "int", ID, "int", bEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Integer} Category 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getbreakoncategory
     */
    GetBreakOnCategory(Producer, Category) {
        result := ComCall(35, this, "ptr", Producer, "int", Category, "int")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Integer} Severity 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getbreakonseverity
     */
    GetBreakOnSeverity(Producer, Severity) {
        result := ComCall(36, this, "ptr", Producer, "int", Severity, "int")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {Integer} ID 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getbreakonid
     */
    GetBreakOnID(Producer, ID) {
        result := ComCall(37, this, "ptr", Producer, "int", ID, "int")
        return result
    }

    /**
     * 
     * @param {Guid} Producer 
     * @param {BOOL} bMute 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-setmutedebugoutput
     */
    SetMuteDebugOutput(Producer, bMute) {
        ComCall(38, this, "ptr", Producer, "int", bMute)
    }

    /**
     * 
     * @param {Guid} Producer 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgiinfoqueue-getmutedebugoutput
     */
    GetMuteDebugOutput(Producer) {
        result := ComCall(39, this, "ptr", Producer, "int")
        return result
    }
}
