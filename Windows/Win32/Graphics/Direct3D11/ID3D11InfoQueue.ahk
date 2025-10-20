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
     * 
     * @param {Integer} MessageCountLimit 
     * @returns {HRESULT} 
     */
    SetMessageCountLimit(MessageCountLimit) {
        result := ComCall(3, this, "uint", MessageCountLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearStoredMessages() {
        ComCall(4, this)
        return result
    }

    /**
     * Retrieves a message from the calling thread's message queue. The function dispatches incoming sent messages until a posted message is available for retrieval.
     * @param {Integer} MessageIndex 
     * @param {Pointer} pMessage 
     * @param {Pointer<UIntPtr>} pMessageByteLength 
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
        result := ComCall(5, this, "uint", MessageIndex, "ptr", pMessage, "ptr*", pMessageByteLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumMessagesAllowedByStorageFilter() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumMessagesDeniedByStorageFilter() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumStoredMessages() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumStoredMessagesAllowedByRetrievalFilter() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumMessagesDiscardedByMessageCountLimit() {
        result := ComCall(10, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMessageCountLimit() {
        result := ComCall(11, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     */
    AddStorageFilterEntries(pFilter) {
        result := ComCall(12, this, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pFilter 
     * @param {Pointer<UIntPtr>} pFilterByteLength 
     * @returns {HRESULT} 
     */
    GetStorageFilter(pFilter, pFilterByteLength) {
        result := ComCall(13, this, "ptr", pFilter, "ptr*", pFilterByteLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearStorageFilter() {
        ComCall(14, this)
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PushEmptyStorageFilter() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PushCopyOfStorageFilter() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     */
    PushStorageFilter(pFilter) {
        result := ComCall(17, this, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    PopStorageFilter() {
        ComCall(18, this)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStorageFilterStackSize() {
        result := ComCall(19, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     */
    AddRetrievalFilterEntries(pFilter) {
        result := ComCall(20, this, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pFilter 
     * @param {Pointer<UIntPtr>} pFilterByteLength 
     * @returns {HRESULT} 
     */
    GetRetrievalFilter(pFilter, pFilterByteLength) {
        result := ComCall(21, this, "ptr", pFilter, "ptr*", pFilterByteLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearRetrievalFilter() {
        ComCall(22, this)
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PushEmptyRetrievalFilter() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PushCopyOfRetrievalFilter() {
        result := ComCall(24, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_INFO_QUEUE_FILTER>} pFilter 
     * @returns {HRESULT} 
     */
    PushRetrievalFilter(pFilter) {
        result := ComCall(25, this, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    PopRetrievalFilter() {
        ComCall(26, this)
        return result
    }

    /**
     * 
     * @returns {Integer} 
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
     */
    AddMessage(Category, Severity, ID, pDescription) {
        result := ComCall(28, this, "int", Category, "int", Severity, "int", ID, "ptr", pDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Severity 
     * @param {PSTR} pDescription 
     * @returns {HRESULT} 
     */
    AddApplicationMessage(Severity, pDescription) {
        result := ComCall(29, this, "int", Severity, "ptr", pDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Category 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     */
    SetBreakOnCategory(Category, bEnable) {
        result := ComCall(30, this, "int", Category, "int", bEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Severity 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     */
    SetBreakOnSeverity(Severity, bEnable) {
        result := ComCall(31, this, "int", Severity, "int", bEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ID 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     */
    SetBreakOnID(ID, bEnable) {
        result := ComCall(32, this, "int", ID, "int", bEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Category 
     * @returns {BOOL} 
     */
    GetBreakOnCategory(Category) {
        result := ComCall(33, this, "int", Category, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Severity 
     * @returns {BOOL} 
     */
    GetBreakOnSeverity(Severity) {
        result := ComCall(34, this, "int", Severity, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ID 
     * @returns {BOOL} 
     */
    GetBreakOnID(ID) {
        result := ComCall(35, this, "int", ID, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} bMute 
     * @returns {String} Nothing - always returns an empty string
     */
    SetMuteDebugOutput(bMute) {
        ComCall(36, this, "int", bMute)
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetMuteDebugOutput() {
        result := ComCall(37, this, "int")
        return result
    }
}
