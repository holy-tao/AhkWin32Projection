#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Ole\IDropTarget.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Com\IDataObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDocHostUIHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDocHostUIHandler
     * @type {Guid}
     */
    static IID => Guid("{bd3f23c0-d43e-11cf-893b-00aa00bdce1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowContextMenu", "GetHostInfo", "ShowUI", "HideUI", "UpdateUI", "EnableModeless", "OnDocWindowActivate", "OnFrameWindowActivate", "ResizeBorder", "TranslateAccelerator", "GetOptionKeyPath", "GetDropTarget", "GetExternal", "TranslateUrl", "FilterDataObject"]

    /**
     * 
     * @param {Integer} dwID 
     * @param {Pointer<POINT>} ppt 
     * @param {IUnknown} pcmdtReserved 
     * @param {IDispatch} pdispReserved 
     * @returns {HRESULT} 
     */
    ShowContextMenu(dwID, ppt, pcmdtReserved, pdispReserved) {
        result := ComCall(3, this, "uint", dwID, "ptr", ppt, "ptr", pcmdtReserved, "ptr", pdispReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DOCHOSTUIINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetHostInfo(pInfo) {
        result := ComCall(4, this, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwID 
     * @param {IOleInPlaceActiveObject} pActiveObject 
     * @param {IOleCommandTarget} pCommandTarget 
     * @param {IOleInPlaceFrame} pFrame 
     * @param {IOleInPlaceUIWindow} pDoc 
     * @returns {HRESULT} 
     */
    ShowUI(dwID, pActiveObject, pCommandTarget, pFrame, pDoc) {
        result := ComCall(5, this, "uint", dwID, "ptr", pActiveObject, "ptr", pCommandTarget, "ptr", pFrame, "ptr", pDoc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    HideUI() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateUI() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableModeless(fEnable) {
        result := ComCall(8, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fActivate 
     * @returns {HRESULT} 
     */
    OnDocWindowActivate(fActivate) {
        result := ComCall(9, this, "int", fActivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fActivate 
     * @returns {HRESULT} 
     */
    OnFrameWindowActivate(fActivate) {
        result := ComCall(10, this, "int", fActivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcBorder 
     * @param {IOleInPlaceUIWindow} pUIWindow 
     * @param {BOOL} fRameWindow 
     * @returns {HRESULT} 
     */
    ResizeBorder(prcBorder, pUIWindow, fRameWindow) {
        result := ComCall(11, this, "ptr", prcBorder, "ptr", pUIWindow, "int", fRameWindow, "HRESULT")
        return result
    }

    /**
     * Processes accelerator keys for menu commands. (ANSI)
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
     * @param {Pointer<MSG>} lpMsg Type: <b>LPMSG</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that contains message information retrieved from the calling thread's message queue using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmessage">GetMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> function.
     * @param {Pointer<Guid>} pguidCmdGroup 
     * @param {Integer} nCmdID 
     * @returns {HRESULT} Type: <b>int</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-translateacceleratora
     */
    TranslateAccelerator(lpMsg, pguidCmdGroup, nCmdID) {
        result := ComCall(12, this, "ptr", lpMsg, "ptr", pguidCmdGroup, "uint", nCmdID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dw 
     * @returns {PWSTR} 
     */
    GetOptionKeyPath(dw) {
        result := ComCall(13, this, "ptr*", &pchKey := 0, "uint", dw, "HRESULT")
        return pchKey
    }

    /**
     * 
     * @param {IDropTarget} pDropTarget 
     * @returns {IDropTarget} 
     */
    GetDropTarget(pDropTarget) {
        result := ComCall(14, this, "ptr", pDropTarget, "ptr*", &ppDropTarget := 0, "HRESULT")
        return IDropTarget(ppDropTarget)
    }

    /**
     * Returns the name of the file that contains the external key.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/SecProv/getexternalkeyfilename-win32-encryptablevolume
     */
    GetExternal() {
        result := ComCall(15, this, "ptr*", &ppDispatch := 0, "HRESULT")
        return IDispatch(ppDispatch)
    }

    /**
     * 
     * @param {Integer} dwTranslate 
     * @param {PWSTR} pchURLIn 
     * @returns {PWSTR} 
     */
    TranslateUrl(dwTranslate, pchURLIn) {
        pchURLIn := pchURLIn is String ? StrPtr(pchURLIn) : pchURLIn

        result := ComCall(16, this, "uint", dwTranslate, "ptr", pchURLIn, "ptr*", &ppchURLOut := 0, "HRESULT")
        return ppchURLOut
    }

    /**
     * 
     * @param {IDataObject} pDO 
     * @returns {IDataObject} 
     */
    FilterDataObject(pDO) {
        result := ComCall(17, this, "ptr", pDO, "ptr*", &ppDORet := 0, "HRESULT")
        return IDataObject(ppDORet)
    }
}
