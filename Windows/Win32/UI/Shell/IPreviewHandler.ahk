#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for the display of rich previews.
 * @remarks
 * Preview handlers can be built in managed code. Typically, all preview handlers are hosted together in a surrogate process called prevhost.exe. There is one instance of this process for preview handlers running at normal integrity level, and another instance for preview handlers running at low integrity level. If you want to implement your handler in managed code, your handler should not run inside either of these shared processes. Instead, arrange for your handler to get a new instance of prevhost.exe by creating a new AppID entry in the registry (specifying prevhost.exe as the DllSurrogate value) and then setting that as the AppID value in the registry value for your handler's class ID. This will ensure that a unique prevhost.exe instance is created for your handler, instead of the common instances used by the other handlers.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipreviewhandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPreviewHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPreviewHandler
     * @type {Guid}
     */
    static IID => Guid("{8895b1c6-b41f-4c1c-a562-0d564250836f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetWindow", "SetRect", "DoPreview", "Unload", "SetFocus", "QueryFocus", "TranslateAccelerator"]

    /**
     * Sets the parent window of the previewer window, as well as the area within the parent to be used for the previewer window.
     * @remarks
     * The preview handler is responsible for painting the entire area defined by <i>prc</i>. If the previewer window has been created, the preview handler must associate the previewer window to the new parent <i>hwnd</i> and resize the previewer window to the area defined by <i>prc</i>. If the previewer window has not yet been created, the preview handler must remember this information for when the previewer window is created in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-dopreview">IPreviewHandler::DoPreview</a>.
     * 
     * <div class="alert"><b>Note</b>  It is preferred that this information be stored prior to calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-dopreview">IPreviewHandler::DoPreview</a>. Doing so increases performance at setup time for any cases where the preview does not start.</div>
     * <div> </div>
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * A handle to the parent window.
     * @param {Pointer<RECT>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <b>RECT</b> defining the area for the previewer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-setwindow
     */
    SetWindow(hwnd, prc) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", hwnd, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Directs the preview handler to change the area within the parent hwnd that it draws into.
     * @remarks
     * If called before the preview handler window has been created, the new <b>RECT</b>  replaces the <b>RECT</b> previously received in the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-setwindow">IPreviewHandler::SetWindow</a> call.
     * 
     * If called after the preview handler window has been created, the preview handler window must be resized.
     * 
     * If the preview handler is already rendering, then the preview must be resized without interrupting the render process.
     * @param {Pointer<RECT>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <b>RECT</b> to be used for the preview.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-setrect
     */
    SetRect(prc) {
        result := ComCall(4, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Directs the preview handler to load data from the source specified in an earlier Initialize method call, and to begin rendering to the previewer window.
     * @remarks
     * If the previewer window has not yet been created, then it must be created after this method has been called. The preview handler is responsible for painting the area specified in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-setwindow">IPreviewHandler::SetWindow</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-setrect">IPreviewHandler::SetRect</a>.  If these methods are called while the preview handler is rendering, the window must be reparented/resized without stopping or restarting the rendering of the item.
     * 
     * This method should be called only after <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-setwindow">IPreviewHandler::SetWindow</a> has been called.
     * 
     * Additionally, this method should be called only after <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iinitializewithitem-initialize">Initialize</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-iinitializewithstream-initialize">Initialize</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-iinitializewithfile-initialize">Initialize</a> has been called.
     *             
     * 
     * <div class="alert"><b>Note</b>  Do not actually create the previewer window until this method has been called.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PREVIEWHANDLER_DRM_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blocked by digital rights management.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PREVIEWHANDLER_NOAUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blocked by file permissions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PREVIEWHANDLER_NOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PREVIEWHANDLER_CORRUPT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item was corrupt.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-dopreview
     */
    DoPreview() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Directs the preview handler to cease rendering a preview and to release all resources that have been allocated based on the item passed in during the initialization.
     * @remarks
     * When called, the preview window will be destroyed.
     * 
     * This method should be called only after <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iinitializewithitem-initialize">Initialize</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-iinitializewithstream-initialize">Initialize</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-iinitializewithfile-initialize">Initialize</a> has been called. All resources associated with this initialization will be released. Prior to calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-dopreview">IPreviewHandler::DoPreview</a>, this preview handler will be re-initialized with a call to one of the initialization interfaces and a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-setwindow">IPreviewHandler::SetWindow</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-unload
     */
    Unload() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Directs the preview handler to set focus to itself.
     * @remarks
     * This method should query the state of the <b>SHIFT</b> key to decide whether to set focus to its first tab stop or its last tab stop. This is necessary because the <b>IPreviewHandler::SetFocus</b> can only succeed if the focus is being set to a window created by the calling thread.
     * 
     * This is the extent of accelerator keys coming down from the host to the preview handler; no other accelerators are passed down. <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-translateaccelerator">IPreviewHandler::TranslateAccelerator</a> is only used for messages from the preview handler's message pump up to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipreviewhandler">IPreviewHandler</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-setfocus
     */
    SetFocus() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Directs the preview handler to return the HWND from calling the GetFocus Function.
     * @remarks
     * This method is necessary because <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getfocus">GetFocus Function</a> can only succeed if the focus is on a window created by the calling thread. This method is used by the host to manage the tabbing order and to support tabbing into and out of the preview handler's windows.
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * When this method returns, contains a pointer to the HWND returned from calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getfocus">GetFocus Function</a> from the preview handler's foreground thread.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-queryfocus
     */
    QueryFocus() {
        phwnd := HWND()
        result := ComCall(8, this, "ptr", phwnd, "HRESULT")
        return phwnd
    }

    /**
     * Directs the preview handler to handle a keystroke passed up from the message pump of the process in which the preview handler is running.
     * @remarks
     * This function will only be called from the message pump of the process in which the preview handler is running. This function allows forwarding keystroke messages from the message pump to the host using <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlerframe-translateaccelerator">TranslateAccelerator</a>.
     * 
     * When the preview handler receives a message (a keystroke) from its message pump, it is responsible for forwarding it to its host.
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iobjectwithsite-setsite">IObjectWithSite::SetSite</a> is called on the preview handler, a reference to the preview handler's host is passed in.  The object should immediately <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> that site for <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipreviewhandlerframe">IPreviewHandlerFrame</a>, and store that pointer.
     * 
     * The preview handler then has the option to call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlerframe-getwindowcontext">GetWindowContext</a> to get an accelerator table to filter keystrokes. The preview can then compare keystrokes against that accelerator table using <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-isaccelerator">IsAccelerator</a> and only call <b>IPreviewHandler::TranslateAccelerator</b> for keystrokes that match.  This can cause a modest performance increase.  The preview handler must release the accelerator table using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroyacceleratortable">DestroyAcceleratorTable</a> function.
     * 
     * It is also acceptable for the preview handler to avoid using the table altogether and call <b>IPreviewHandler::TranslateAccelerator</b> for every keystroke. Note that all preview handlers running in low-integrity processes must use this method.
     * 
     * When a tab key is pressed, if a preview handler has more than one tab stop it is responsible for moving keyboard focus within those tab stops.  If the current keyboard focus is on one of those tab stops, and advancing the keyboard focus would move it to another previewer tab stop, the previewer should call SetFocus on the next tab stop.  Otherwise the tab key should be forwarded to the host to handle tabbing out of the previewer.
     * @param {Pointer<MSG>} pmsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a>*</b>
     * 
     * A pointer to a window message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the keystroke message can be processed by the preview handler, the handler will process it and return <b>S_OK</b>.  If the preview handler cannot process the keystroke message, it will offer it to the host using <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlerframe-translateaccelerator">TranslateAccelerator</a>.  If the host processes the message, this method will return <b>S_OK</b>.  If the host does not process the message, this method will return <b>S_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-translateaccelerator
     */
    TranslateAccelerator(pmsg) {
        result := ComCall(9, this, "ptr", pmsg, "HRESULT")
        return result
    }
}
