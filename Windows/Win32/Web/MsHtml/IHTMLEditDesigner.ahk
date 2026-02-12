#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLEditDesigner extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLEditDesigner
     * @type {Guid}
     */
    static IID => Guid("{3050f662-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PreHandleEvent", "PostHandleEvent", "TranslateAccelerator", "PostEditorEventNotify"]

    /**
     * 
     * @param {Integer} inEvtDispId 
     * @param {IHTMLEventObj} pIEventObj 
     * @returns {HRESULT} 
     */
    PreHandleEvent(inEvtDispId, pIEventObj) {
        result := ComCall(3, this, "int", inEvtDispId, "ptr", pIEventObj, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} inEvtDispId 
     * @param {IHTMLEventObj} pIEventObj 
     * @returns {HRESULT} 
     */
    PostHandleEvent(inEvtDispId, pIEventObj) {
        result := ComCall(4, this, "int", inEvtDispId, "ptr", pIEventObj, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Processes accelerator keys for menu commands. (Unicode)
     * @remarks
     * To differentiate the message that this function sends from messages sent by menus or controls, the high-order word of the
     *         <i>wParam</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> or <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-syscommand">WM_SYSCOMMAND</a> message contains the value 1.
     * 
     * Accelerator key combinations used to select items from the
     *         <b>window</b> menu are translated into <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-syscommand">WM_SYSCOMMAND</a> messages; all other accelerator key combinations are translated into <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> messages.
     * 
     * When <b>TranslateAccelerator</b> returns a nonzero value and the message is translated, the application should not use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-translatemessage">TranslateMessage</a> function to process the message again.
     * 
     * An accelerator need not correspond to a menu command.
     * 
     * If the accelerator command corresponds to a menu item, the application is sent <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-initmenu">WM_INITMENU</a> and <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-initmenupopup">WM_INITMENUPOPUP</a> messages, as if the user were trying to display the menu. However, these messages are not sent if any of the following conditions exist:
     * 
     * <ul>
     * <li>The window is disabled.</li>
     * <li>The accelerator key combination does not correspond to an item on the <b>window</b> menu and the window is minimized.</li>
     * <li>A mouse capture is in effect. For information about mouse capture, see the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setcapture">SetCapture</a> function.</li>
     * </ul>
     * If the specified window is the active window and no window has the keyboard focus (which is generally the case if the window is minimized), <b>TranslateAccelerator</b> translates
     *         <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-syskeyup">WM_SYSKEYUP</a> and <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-syskeydown">WM_SYSKEYDOWN</a> messages instead of
     *         <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a> and <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a> messages.
     * 
     * If an accelerator keystroke occurs that corresponds to a menu item when the window that owns the menu is minimized, <b>TranslateAccelerator</b> does not send a <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> message. However, if an accelerator keystroke occurs that does not match any of the items in the window's menu or in the
     *         <b>window</b> menu, the function sends a <b>WM_COMMAND</b> message, even if the window is minimized.
     * @param {Integer} inEvtDispId 
     * @param {IHTMLEventObj} pIEventObj 
     * @returns {HRESULT} Type: <b>int</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-translateacceleratorw
     */
    TranslateAccelerator(inEvtDispId, pIEventObj) {
        result := ComCall(5, this, "int", inEvtDispId, "ptr", pIEventObj, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} inEvtDispId 
     * @param {IHTMLEventObj} pIEventObj 
     * @returns {HRESULT} 
     */
    PostEditorEventNotify(inEvtDispId, pIEventObj) {
        result := ComCall(6, this, "int", inEvtDispId, "ptr", pIEventObj, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
