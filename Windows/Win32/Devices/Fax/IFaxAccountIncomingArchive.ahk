#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used by a fax client application to access a particular fax account's archive of successfully received inbound fax messages. Use this interface to retrieve messages and get the size of the archive.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxaccountincomingarchive
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccountIncomingArchive extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxAccountIncomingArchive
     * @type {Guid}
     */
    static IID => Guid("{a8a5b6ef-e0d6-4aee-955c-91625bec9db4}")

    /**
     * The class identifier for FaxAccountIncomingArchive
     * @type {Guid}
     */
    static CLSID => Guid("{14b33db5-4c40-4ecf-9ef8-a360cbe809ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SizeLow", "get_SizeHigh", "Refresh", "GetMessages", "GetMessage"]

    /**
     * 
     * @param {Pointer<Integer>} plSizeLow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-get_sizelow
     */
    get_SizeLow(plSizeLow) {
        plSizeLowMarshal := plSizeLow is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plSizeLowMarshal, plSizeLow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSizeHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-get_sizehigh
     */
    get_SizeHigh(plSizeHigh) {
        plSizeHighMarshal := plSizeHigh is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plSizeHighMarshal, plSizeHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-refresh
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPrefetchSize 
     * @param {Pointer<IFaxIncomingMessageIterator>} pFaxIncomingMessageIterator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingarchive-getmessages
     */
    GetMessages(lPrefetchSize, pFaxIncomingMessageIterator) {
        result := ComCall(10, this, "int", lPrefetchSize, "ptr*", pFaxIncomingMessageIterator, "HRESULT")
        return result
    }

    /**
     * Retrieves a message from the calling thread's message queue. The function dispatches incoming sent messages until a posted message is available for retrieval.
     * @param {BSTR} bstrMessageId 
     * @param {Pointer<IFaxIncomingMessage>} pFaxIncomingMessage 
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
    GetMessage(bstrMessageId, pFaxIncomingMessage) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(11, this, "ptr", bstrMessageId, "ptr*", pFaxIncomingMessage, "HRESULT")
        return result
    }
}
