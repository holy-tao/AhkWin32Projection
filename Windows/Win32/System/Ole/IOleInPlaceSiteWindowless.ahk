#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleInPlaceSiteEx.ahk

/**
 * Extends the IOleInPlaceSiteEx interface.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ioleinplacesitewindowless
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceSiteWindowless extends IOleInPlaceSiteEx{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceSiteWindowless
     * @type {Guid}
     */
    static IID => Guid("{922eada0-3424-11cf-b670-00aa004cd6d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanWindowlessActivate", "GetCapture", "SetCapture", "GetFocus", "SetFocus", "GetDC", "ReleaseDC", "InvalidateRect", "InvalidateRgn", "ScrollRect", "AdjustRect", "OnDefWindowMessage"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-canwindowlessactivate
     */
    CanWindowlessActivate() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to the window (if any) that has captured the mouse. Only one window at a time can capture the mouse; this window receives mouse input whether or not the cursor is within its borders.
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * The return value is a handle to the capture window associated with the current thread. If no window in the thread has captured the mouse, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getcapture
     */
    GetCapture() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * Sets the mouse capture to the specified window belonging to the current thread.
     * @param {BOOL} fCapture 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * The return value is a handle to the window that had previously captured the mouse. If there is no such window, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setcapture
     */
    SetCapture(fCapture) {
        result := ComCall(20, this, "int", fCapture, "HRESULT")
        return result
    }

    /**
     * Retrieves the handle to the window that has the keyboard focus, if the window is attached to the calling thread's message queue.
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * The return value is the handle to the window with the keyboard focus. If the calling thread's message queue does not have an associated window with the keyboard focus, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getfocus
     */
    GetFocus() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Sets the keyboard focus to the specified window. The window must be attached to the calling thread's message queue.
     * @param {BOOL} fFocus 
     * @returns {HRESULT} Type: **HWND**
     * 
     * If the function succeeds, the return value is the handle to the window that previously had the keyboard focus. If the *hWnd* parameter is invalid or the window is not attached to the calling thread's message queue, the return value is NULL. To get extended error information, call [GetLastError function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * Extended error ERROR_INVALID_PARAMETER (0x57) means that window is in disabled state.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setfocus
     */
    SetFocus(fFocus) {
        result := ComCall(22, this, "int", fFocus, "HRESULT")
        return result
    }

    /**
     * The GetDC function retrieves a handle to a device context (DC) for the client area of a specified window or for the entire screen.
     * @param {Pointer<RECT>} pRect 
     * @param {Integer} grfFlags 
     * @param {Pointer<HDC>} phDC 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to the DC for the specified window's client area.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getdc
     */
    GetDC(pRect, grfFlags, phDC) {
        result := ComCall(23, this, "ptr", pRect, "uint", grfFlags, "ptr", phDC, "HRESULT")
        return result
    }

    /**
     * The ReleaseDC function releases a device context (DC), freeing it for use by other applications. The effect of the ReleaseDC function depends on the type of DC. It frees only common and window DCs. It has no effect on class or private DCs.
     * @param {HDC} hDC A handle to the DC to be released.
     * @returns {HRESULT} The return value indicates whether the DC was released. If the DC was released, the return value is 1.
     * 
     * If the DC was not released, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-releasedc
     */
    ReleaseDC(hDC) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := ComCall(24, this, "ptr", hDC, "HRESULT")
        return result
    }

    /**
     * The InvalidateRect function adds a rectangle to the specified window's update region. The update region represents the portion of the window's client area that must be redrawn.
     * @param {Pointer<RECT>} pRect 
     * @param {BOOL} fErase 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-invalidaterect
     */
    InvalidateRect(pRect, fErase) {
        result := ComCall(25, this, "ptr", pRect, "int", fErase, "HRESULT")
        return result
    }

    /**
     * The InvalidateRgn function invalidates the client area within the specified region by adding it to the current update region of a window.
     * @param {HRGN} hRGN 
     * @param {BOOL} fErase 
     * @returns {HRESULT} The return value is always nonzero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-invalidatergn
     */
    InvalidateRgn(hRGN, fErase) {
        hRGN := hRGN is Win32Handle ? NumGet(hRGN, "ptr") : hRGN

        result := ComCall(26, this, "ptr", hRGN, "int", fErase, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dx 
     * @param {Integer} dy 
     * @param {Pointer<RECT>} pRectScroll 
     * @param {Pointer<RECT>} pRectClip 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-scrollrect
     */
    ScrollRect(dx, dy, pRectScroll, pRectClip) {
        result := ComCall(27, this, "int", dx, "int", dy, "ptr", pRectScroll, "ptr", pRectClip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-adjustrect
     */
    AdjustRect(prc) {
        result := ComCall(28, this, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<LRESULT>} plResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplacesitewindowless-ondefwindowmessage
     */
    OnDefWindowMessage(msg, wParam, lParam, plResult) {
        result := ComCall(29, this, "uint", msg, "ptr", wParam, "ptr", lParam, "ptr", plResult, "HRESULT")
        return result
    }
}
