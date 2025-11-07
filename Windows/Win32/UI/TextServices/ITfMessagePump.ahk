#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfMessagePump interface is implemented by the TSF manager and is used by an application to obtain messages from the application message queue.
 * @remarks
 * 
  * If the application is Unicode, it should use the PeekMessageW and GetMessageW methods. Otherwise, the application should use the PeekMessageA and GetMessageA methods.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfmessagepump
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfMessagePump extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfMessagePump
     * @type {Guid}
     */
    static IID => Guid("{8f1b8ad8-0b6b-4874-90c5-bd76011e8f7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PeekMessageA", "GetMessageA", "PeekMessageW", "GetMessageW"]

    /**
     * Dispatches incoming sent messages, checks the thread message queue for a posted message, and retrieves the message (if any exist).
     * @param {Pointer<MSG>} pMsg 
     * @param {HWND} hwnd 
     * @param {Integer} wMsgFilterMin Type: <b>UINT</b>
     * 
     * The value of the first message in the range of messages to be examined. Use <b>WM_KEYFIRST</b> (0x0100) to specify the first keyboard message or <b>WM_MOUSEFIRST</b> (0x0200) to specify the first mouse message.
     * 
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, <b>PeekMessage</b> returns all available messages (that is, no range filtering is performed).
     * @param {Integer} wMsgFilterMax Type: <b>UINT</b>
     * 
     * The value of the last message in the range of messages to be examined. Use <b>WM_KEYLAST</b> to specify the last keyboard message or <b>WM_MOUSELAST</b> to specify the last mouse message.
     * 
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, <b>PeekMessage</b> returns all available messages (that is, no range filtering is performed).
     * @param {Integer} wRemoveMsg Type: <b>UINT</b>
     * @param {Pointer<BOOL>} pfResult 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If a message is available, the return value is nonzero.
     * 
     * If no messages are available, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-peekmessagea
     */
    PeekMessageA(pMsg, hwnd, wMsgFilterMin, wMsgFilterMax, wRemoveMsg, pfResult) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pfResultMarshal := pfResult is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pMsg, "ptr", hwnd, "uint", wMsgFilterMin, "uint", wMsgFilterMax, "uint", wRemoveMsg, pfResultMarshal, pfResult, "HRESULT")
        return result
    }

    /**
     * Retrieves a message from the calling thread's message queue. The function dispatches incoming sent messages until a posted message is available for retrieval.
     * @param {Pointer<MSG>} pMsg 
     * @param {HWND} hwnd 
     * @param {Integer} wMsgFilterMin Type: <b>UINT</b>
     * 
     * The integer value of the lowest message value to be retrieved. Use <b>WM_KEYFIRST</b> (0x0100) to specify the first keyboard message or <b>WM_MOUSEFIRST</b> (0x0200) to specify the first mouse message. 
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-input">WM_INPUT</a> here and in <i>wMsgFilterMax</i> to specify only the <b>WM_INPUT</b> messages.
     * 
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, <b>GetMessage</b> returns all available messages (that is, no range filtering is performed).
     * @param {Integer} wMsgFilterMax Type: <b>UINT</b>
     * 
     * The integer value of the highest message value to be retrieved. Use <b>WM_KEYLAST</b> to specify the last keyboard message or <b>WM_MOUSELAST</b> to specify the last mouse message. 
     * 					
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-input">WM_INPUT</a> here and in <i>wMsgFilterMin</i> to specify only the <b>WM_INPUT</b> messages.
     * 
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, <b>GetMessage</b> returns all available messages (that is, no range filtering is performed).
     * @param {Pointer<BOOL>} pfResult 
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
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmessagea
     */
    GetMessageA(pMsg, hwnd, wMsgFilterMin, wMsgFilterMax, pfResult) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pfResultMarshal := pfResult is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pMsg, "ptr", hwnd, "uint", wMsgFilterMin, "uint", wMsgFilterMax, pfResultMarshal, pfResult, "HRESULT")
        return result
    }

    /**
     * Dispatches incoming sent messages, checks the thread message queue for a posted message, and retrieves the message (if any exist).
     * @param {Pointer<MSG>} pMsg 
     * @param {HWND} hwnd 
     * @param {Integer} wMsgFilterMin Type: <b>UINT</b>
     * 
     * The value of the first message in the range of messages to be examined. Use <b>WM_KEYFIRST</b> (0x0100) to specify the first keyboard message or <b>WM_MOUSEFIRST</b> (0x0200) to specify the first mouse message.
     * 
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, <b>PeekMessage</b> returns all available messages (that is, no range filtering is performed).
     * @param {Integer} wMsgFilterMax Type: <b>UINT</b>
     * 
     * The value of the last message in the range of messages to be examined. Use <b>WM_KEYLAST</b> to specify the last keyboard message or <b>WM_MOUSELAST</b> to specify the last mouse message.
     * 
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, <b>PeekMessage</b> returns all available messages (that is, no range filtering is performed).
     * @param {Integer} wRemoveMsg Type: <b>UINT</b>
     * @param {Pointer<BOOL>} pfResult 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If a message is available, the return value is nonzero.
     * 
     * If no messages are available, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-peekmessagew
     */
    PeekMessageW(pMsg, hwnd, wMsgFilterMin, wMsgFilterMax, wRemoveMsg, pfResult) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pfResultMarshal := pfResult is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pMsg, "ptr", hwnd, "uint", wMsgFilterMin, "uint", wMsgFilterMax, "uint", wRemoveMsg, pfResultMarshal, pfResult, "HRESULT")
        return result
    }

    /**
     * Retrieves a message from the calling thread's message queue. The function dispatches incoming sent messages until a posted message is available for retrieval.
     * @param {Pointer<MSG>} pMsg 
     * @param {HWND} hwnd 
     * @param {Integer} wMsgFilterMin Type: <b>UINT</b>
     * 
     * The integer value of the lowest message value to be retrieved. Use <b>WM_KEYFIRST</b> (0x0100) to specify the first keyboard message or <b>WM_MOUSEFIRST</b> (0x0200) to specify the first mouse message. 
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-input">WM_INPUT</a> here and in <i>wMsgFilterMax</i> to specify only the <b>WM_INPUT</b> messages.
     * 
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, <b>GetMessage</b> returns all available messages (that is, no range filtering is performed).
     * @param {Integer} wMsgFilterMax Type: <b>UINT</b>
     * 
     * The integer value of the highest message value to be retrieved. Use <b>WM_KEYLAST</b> to specify the last keyboard message or <b>WM_MOUSELAST</b> to specify the last mouse message. 
     * 					
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-input">WM_INPUT</a> here and in <i>wMsgFilterMin</i> to specify only the <b>WM_INPUT</b> messages.
     * 
     * If <i>wMsgFilterMin</i> and <i>wMsgFilterMax</i> are both zero, <b>GetMessage</b> returns all available messages (that is, no range filtering is performed).
     * @param {Pointer<BOOL>} pfResult 
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
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmessagew
     */
    GetMessageW(pMsg, hwnd, wMsgFilterMin, wMsgFilterMax, pfResult) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pfResultMarshal := pfResult is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pMsg, "ptr", hwnd, "uint", wMsgFilterMin, "uint", wMsgFilterMax, pfResultMarshal, pfResult, "HRESULT")
        return result
    }
}
