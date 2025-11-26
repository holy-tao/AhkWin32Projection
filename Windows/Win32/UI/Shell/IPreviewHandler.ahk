#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for the display of rich previews.
 * @remarks
 * 
 * Preview handlers can be built in managed code. Typically, all preview handlers are hosted together in a surrogate process called prevhost.exe. There is one instance of this process for preview handlers running at normal integrity level, and another instance for preview handlers running at low integrity level. If you want to implement your handler in managed code, your handler should not run inside either of these shared processes. Instead, arrange for your handler to get a new instance of prevhost.exe by creating a new AppID entry in the registry (specifying prevhost.exe as the DllSurrogate value) and then setting that as the AppID value in the registry value for your handler's class ID. This will ensure that a unique prevhost.exe instance is created for your handler, instead of the common instances used by the other handlers.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ipreviewhandler
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
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * A handle to the parent window.
     * @param {Pointer<RECT>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <b>RECT</b> defining the area for the previewer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipreviewhandler-setwindow
     */
    SetWindow(hwnd, prc) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", hwnd, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Directs the preview handler to change the area within the parent hwnd that it draws into.
     * @param {Pointer<RECT>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <b>RECT</b> to be used for the preview.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipreviewhandler-setrect
     */
    SetRect(prc) {
        result := ComCall(4, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Directs the preview handler to load data from the source specified in an earlier Initialize method call, and to begin rendering to the previewer window.
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipreviewhandler-dopreview
     */
    DoPreview() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Directs the preview handler to cease rendering a preview and to release all resources that have been allocated based on the item passed in during the initialization.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipreviewhandler-unload
     */
    Unload() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Directs the preview handler to set focus to itself.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipreviewhandler-setfocus
     */
    SetFocus() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Directs the preview handler to return the HWND from calling the GetFocus Function.
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * When this method returns, contains a pointer to the HWND returned from calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getfocus">GetFocus Function</a> from the preview handler's foreground thread.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipreviewhandler-queryfocus
     */
    QueryFocus() {
        phwnd := HWND()
        result := ComCall(8, this, "ptr", phwnd, "HRESULT")
        return phwnd
    }

    /**
     * Directs the preview handler to handle a keystroke passed up from the message pump of the process in which the preview handler is running.
     * @param {Pointer<MSG>} pmsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a>*</b>
     * 
     * A pointer to a window message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the keystroke message can be processed by the preview handler, the handler will process it and return <b>S_OK</b>.  If the preview handler cannot process the keystroke message, it will offer it to the host using <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlerframe-translateaccelerator">TranslateAccelerator</a>.  If the host processes the message, this method will return <b>S_OK</b>.  If the host does not process the message, this method will return <b>S_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ipreviewhandler-translateaccelerator
     */
    TranslateAccelerator(pmsg) {
        result := ComCall(9, this, "ptr", pmsg, "HRESULT")
        return result
    }
}
