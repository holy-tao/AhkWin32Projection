#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-setwindow
     */
    SetWindow(hwnd, prc) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", hwnd, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * The SetRect function sets the coordinates of the specified rectangle. This is equivalent to assigning the left, top, right, and bottom arguments to the appropriate members of the RECT structure.
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setrect
     */
    SetRect(prc) {
        result := ComCall(4, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-dopreview
     */
    DoPreview() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-unload
     */
    Unload() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Sets the keyboard focus to the specified window. The window must be attached to the calling thread's message queue.
     * @returns {HRESULT} Type: **HWND**
     * 
     * If the function succeeds, the return value is the handle to the window that previously had the keyboard focus. If the *hWnd* parameter is invalid or the window is not attached to the calling thread's message queue, the return value is NULL. To get extended error information, call [GetLastError function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * Extended error ERROR_INVALID_PARAMETER (0x57) means that window is in disabled state.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setfocus
     */
    SetFocus() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-queryfocus
     */
    QueryFocus(phwnd) {
        result := ComCall(8, this, "ptr", phwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pmsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-translateaccelerator
     */
    TranslateAccelerator(pmsg) {
        result := ComCall(9, this, "ptr", pmsg, "HRESULT")
        return result
    }
}
