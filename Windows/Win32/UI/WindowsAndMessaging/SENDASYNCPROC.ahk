#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An application-defined callback function used with the SendMessageCallback function.
 * @remarks
 * You install a <i>SendAsyncProc</i> application-defined callback function by passing a <b>SENDASYNCPROC</b> pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessagecallbacka">SendMessageCallback</a> function. 
 * 
 * The callback function is only called when the thread that called <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessagecallbacka">SendMessageCallback</a> calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmessage">GetMessage</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-waitmessage">WaitMessage</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nc-winuser-sendasyncproc
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class SENDASYNCPROC extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @param {Pointer} param2 
     * @param {LRESULT} param3 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param3 := param3 is Win32Handle ? NumGet(param3, "ptr") : param3

        ComCall(3, this, "ptr", param0, "uint", param1, "ptr", param2, "ptr", param3)
    }
}
