#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Ole\IOleInPlaceActiveObject.ahk" { IOleInPlaceActiveObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Ole\IDropTarget.ahk" { IDropTarget }
#Import "..\..\System\Ole\IOleInPlaceFrame.ahk" { IOleInPlaceFrame }
#Import "..\..\System\Ole\IOleInPlaceUIWindow.ahk" { IOleInPlaceUIWindow }
#Import ".\DOCHOSTUIINFO.ahk" { DOCHOSTUIINFO }
#Import "..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\UI\WindowsAndMessaging\MSG.ahk" { MSG }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Ole\IOleCommandTarget.ahk" { IOleCommandTarget }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDocHostUIHandler extends IUnknown {
    /**
     * The interface identifier for IDocHostUIHandler
     * @type {Guid}
     */
    static IID := Guid("{bd3f23c0-d43e-11cf-893b-00aa00bdce1a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDocHostUIHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShowContextMenu       : IntPtr
        GetHostInfo           : IntPtr
        ShowUI                : IntPtr
        HideUI                : IntPtr
        UpdateUI              : IntPtr
        EnableModeless        : IntPtr
        OnDocWindowActivate   : IntPtr
        OnFrameWindowActivate : IntPtr
        ResizeBorder          : IntPtr
        TranslateAccelerator  : IntPtr
        GetOptionKeyPath      : IntPtr
        GetDropTarget         : IntPtr
        GetExternal           : IntPtr
        TranslateUrl          : IntPtr
        FilterDataObject      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDocHostUIHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwID 
     * @param {Pointer<POINT>} ppt 
     * @param {IUnknown} pcmdtReserved 
     * @param {IDispatch} pdispReserved 
     * @returns {HRESULT} 
     */
    ShowContextMenu(dwID, ppt, pcmdtReserved, pdispReserved) {
        result := ComCall(3, this, "uint", dwID, POINT.Ptr, ppt, "ptr", pcmdtReserved, "ptr", pdispReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DOCHOSTUIINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetHostInfo(pInfo) {
        result := ComCall(4, this, DOCHOSTUIINFO.Ptr, pInfo, "HRESULT")
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
        result := ComCall(8, this, BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fActivate 
     * @returns {HRESULT} 
     */
    OnDocWindowActivate(fActivate) {
        result := ComCall(9, this, BOOL, fActivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fActivate 
     * @returns {HRESULT} 
     */
    OnFrameWindowActivate(fActivate) {
        result := ComCall(10, this, BOOL, fActivate, "HRESULT")
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
        result := ComCall(11, this, RECT.Ptr, prcBorder, "ptr", pUIWindow, BOOL, fRameWindow, "HRESULT")
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
        result := ComCall(12, this, MSG.Ptr, lpMsg, Guid.Ptr, pguidCmdGroup, "uint", nCmdID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dw 
     * @returns {PWSTR} 
     */
    GetOptionKeyPath(dw) {
        result := ComCall(13, this, PWSTR.Ptr, &pchKey := 0, "uint", dw, "HRESULT")
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
     * 
     * @returns {IDispatch} 
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

        result := ComCall(16, this, "uint", dwTranslate, "ptr", pchURLIn, PWSTR.Ptr, &ppchURLOut := 0, "HRESULT")
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

    Query(iid) {
        if (IDocHostUIHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShowContextMenu := CallbackCreate(GetMethod(implObj, "ShowContextMenu"), flags, 5)
        this.vtbl.GetHostInfo := CallbackCreate(GetMethod(implObj, "GetHostInfo"), flags, 2)
        this.vtbl.ShowUI := CallbackCreate(GetMethod(implObj, "ShowUI"), flags, 6)
        this.vtbl.HideUI := CallbackCreate(GetMethod(implObj, "HideUI"), flags, 1)
        this.vtbl.UpdateUI := CallbackCreate(GetMethod(implObj, "UpdateUI"), flags, 1)
        this.vtbl.EnableModeless := CallbackCreate(GetMethod(implObj, "EnableModeless"), flags, 2)
        this.vtbl.OnDocWindowActivate := CallbackCreate(GetMethod(implObj, "OnDocWindowActivate"), flags, 2)
        this.vtbl.OnFrameWindowActivate := CallbackCreate(GetMethod(implObj, "OnFrameWindowActivate"), flags, 2)
        this.vtbl.ResizeBorder := CallbackCreate(GetMethod(implObj, "ResizeBorder"), flags, 4)
        this.vtbl.TranslateAccelerator := CallbackCreate(GetMethod(implObj, "TranslateAccelerator"), flags, 4)
        this.vtbl.GetOptionKeyPath := CallbackCreate(GetMethod(implObj, "GetOptionKeyPath"), flags, 3)
        this.vtbl.GetDropTarget := CallbackCreate(GetMethod(implObj, "GetDropTarget"), flags, 3)
        this.vtbl.GetExternal := CallbackCreate(GetMethod(implObj, "GetExternal"), flags, 2)
        this.vtbl.TranslateUrl := CallbackCreate(GetMethod(implObj, "TranslateUrl"), flags, 4)
        this.vtbl.FilterDataObject := CallbackCreate(GetMethod(implObj, "FilterDataObject"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShowContextMenu)
        CallbackFree(this.vtbl.GetHostInfo)
        CallbackFree(this.vtbl.ShowUI)
        CallbackFree(this.vtbl.HideUI)
        CallbackFree(this.vtbl.UpdateUI)
        CallbackFree(this.vtbl.EnableModeless)
        CallbackFree(this.vtbl.OnDocWindowActivate)
        CallbackFree(this.vtbl.OnFrameWindowActivate)
        CallbackFree(this.vtbl.ResizeBorder)
        CallbackFree(this.vtbl.TranslateAccelerator)
        CallbackFree(this.vtbl.GetOptionKeyPath)
        CallbackFree(this.vtbl.GetDropTarget)
        CallbackFree(this.vtbl.GetExternal)
        CallbackFree(this.vtbl.TranslateUrl)
        CallbackFree(this.vtbl.FilterDataObject)
    }
}
