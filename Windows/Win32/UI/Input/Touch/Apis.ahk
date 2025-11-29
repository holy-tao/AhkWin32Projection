#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.UI.Input.Touch
 * @version v4.0.30319
 */
class Touch {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Retrieves detailed information about touch inputs associated with a particular touch input handle.
     * @param {HTOUCHINPUT} hTouchInput The touch input handle received in the <b>LPARAM</b> of a touch message. The function fails with <b>ERROR_INVALID_HANDLE</b> if this handle is not valid. Note that the handle is not valid after it has been used in a successful call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-closetouchinputhandle">CloseTouchInputHandle</a> or after it has been passed to <a href="https://docs.microsoft.com/windows/desktop/wintouch/sendmessage--postmessage--and-related-functions">DefWindowProc, PostMessage, SendMessage</a> or one of their variants.
     * @param {Integer} cInputs The number of structures in the <i>pInputs</i> array. This should ideally be at least equal to the number of touch points associated with the message as indicated in the message <b>WPARAM</b>. If <i>cInputs</i> is less than the number of touch points, the function will still succeed and populate the <i>pInputs</i> buffer with information about <i>cInputs</i> touch points.
     * @param {Pointer<TOUCHINPUT>} pInputs A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touchinput">TOUCHINPUT</a> structures to receive information about the touch points associated with the specified touch input handle.
     * @param {Integer} cbSize The size, in bytes, of a single <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touchinput">TOUCHINPUT</a> structure. If <i>cbSize</i> is not the size of a single <b>TOUCHINPUT</b> structure, the function fails with <b>ERROR_INVALID_PARAMETER</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * If the function fails, the return value is zero. To get extended error information, use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-gettouchinputinfo
     * @since windows6.1
     */
    static GetTouchInputInfo(hTouchInput, cInputs, pInputs, cbSize) {
        hTouchInput := hTouchInput is Win32Handle ? NumGet(hTouchInput, "ptr") : hTouchInput

        A_LastError := 0

        result := DllCall("USER32.dll\GetTouchInputInfo", "ptr", hTouchInput, "uint", cInputs, "ptr", pInputs, "int", cbSize, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Closes a touch input handle, frees process memory associated with it, and invalidates the handle.
     * @param {HTOUCHINPUT} hTouchInput The touch input handle received in the <b>LPARAM</b> of a touch message. The function fails with <b>ERROR_INVALID_HANDLE</b> if this handle is not valid. Note that the handle is not valid after it has been used in a successful call to <b>CloseTouchInputHandle</b> or after it has been passed to <a href="https://docs.microsoft.com/windows/desktop/wintouch/sendmessage--postmessage--and-related-functions">DefWindowProc, PostMessage, SendMessage</a> or one of their variants.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-closetouchinputhandle
     * @since windows6.1
     */
    static CloseTouchInputHandle(hTouchInput) {
        hTouchInput := hTouchInput is Win32Handle ? NumGet(hTouchInput, "ptr") : hTouchInput

        A_LastError := 0

        result := DllCall("USER32.dll\CloseTouchInputHandle", "ptr", hTouchInput, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a window as being touch-capable.
     * @param {HWND} hwnd The handle of the window being registered. The function fails with <b>ERROR_ACCESS_DENIED</b> if the calling thread does not own the specified window.
     * @param {Integer} ulFlags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-registertouchwindow
     * @since windows6.1
     */
    static RegisterTouchWindow(hwnd, ulFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        A_LastError := 0

        result := DllCall("USER32.dll\RegisterTouchWindow", "ptr", hwnd, "uint", ulFlags, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a window as no longer being touch-capable.
     * @param {HWND} hwnd The handle of the window. The function fails with <b>ERROR_ACCESS_DENIED</b> if the calling thread does not own the specified window.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-unregistertouchwindow
     * @since windows6.1
     */
    static UnregisterTouchWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        A_LastError := 0

        result := DllCall("USER32.dll\UnregisterTouchWindow", "ptr", hwnd, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Checks whether a specified window is touch-capable and, optionally, retrieves the modifier flags set for the window's touch capability.
     * @param {HWND} hwnd The handle of the window. The function fails with <b>ERROR_ACCESS_DENIED</b> if the calling thread is not on the same desktop as the specified window.
     * @param {Pointer<Integer>} pulFlags The address of the <b>ULONG</b> variable to receive the modifier flags for the specified window's touch capability.
     * @returns {BOOL} Returns <b>TRUE</b> if the window supports Windows Touch; returns <b>FALSE</b> if the window does not support Windows Touch.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-istouchwindow
     * @since windows6.1
     */
    static IsTouchWindow(hwnd, pulFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pulFlagsMarshal := pulFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("USER32.dll\IsTouchWindow", "ptr", hwnd, pulFlagsMarshal, pulFlags, "int")
        return result
    }

    /**
     * Retrieves a GESTUREINFO structure given a handle to the gesture information.
     * @param {HGESTUREINFO} hGestureInfo The gesture information handle.
     * @param {Pointer<GESTUREINFO>} pGestureInfo A pointer to the gesture information structure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getgestureinfo
     * @since windows6.1
     */
    static GetGestureInfo(hGestureInfo, pGestureInfo) {
        hGestureInfo := hGestureInfo is Win32Handle ? NumGet(hGestureInfo, "ptr") : hGestureInfo

        A_LastError := 0

        result := DllCall("USER32.dll\GetGestureInfo", "ptr", hGestureInfo, "ptr", pGestureInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves additional information about a gesture from its GESTUREINFO handle.
     * @param {HGESTUREINFO} hGestureInfo The handle to the gesture information that is passed in the <i>lParam</i> of a <a href="https://docs.microsoft.com/windows/desktop/wintouch/wm-gesture">WM_GESTURE</a> message.
     * @param {Integer} cbExtraArgs A count of the bytes of data stored in the extra arguments.
     * @param {Pointer} pExtraArgs A pointer to the extra argument information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getgestureextraargs
     * @since windows6.1
     */
    static GetGestureExtraArgs(hGestureInfo, cbExtraArgs, pExtraArgs) {
        hGestureInfo := hGestureInfo is Win32Handle ? NumGet(hGestureInfo, "ptr") : hGestureInfo

        A_LastError := 0

        result := DllCall("USER32.dll\GetGestureExtraArgs", "ptr", hGestureInfo, "uint", cbExtraArgs, "ptr", pExtraArgs, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Closes resources associated with a gesture information handle.
     * @param {HGESTUREINFO} hGestureInfo The gesture information handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-closegestureinfohandle
     * @since windows6.1
     */
    static CloseGestureInfoHandle(hGestureInfo) {
        hGestureInfo := hGestureInfo is Win32Handle ? NumGet(hGestureInfo, "ptr") : hGestureInfo

        A_LastError := 0

        result := DllCall("USER32.dll\CloseGestureInfoHandle", "ptr", hGestureInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Configures the messages that are sent from a window for Windows Touch gestures.
     * @param {HWND} hwnd A handle to the window to set the gesture configuration on.
     * @param {Integer} dwReserved This value is reserved and must be set to 0.
     * @param {Integer} cIDs A count of the gesture configuration structures that are being passed.
     * @param {Pointer<GESTURECONFIG>} pGestureConfig An array of gesture configuration structures that specify the gesture configuration.
     * @param {Integer} cbSize The size of the gesture configuration (<a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-gestureconfig">GESTURECONFIG</a>) structure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setgestureconfig
     * @since windows6.1
     */
    static SetGestureConfig(hwnd, dwReserved, cIDs, pGestureConfig, cbSize) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        A_LastError := 0

        result := DllCall("USER32.dll\SetGestureConfig", "ptr", hwnd, "uint", dwReserved, "uint", cIDs, "ptr", pGestureConfig, "uint", cbSize, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the configuration for which Windows Touch gesture messages are sent from a window.
     * @param {HWND} hwnd A handle to the window to get the gesture configuration from.
     * @param {Integer} dwReserved This value is reserved and must be set to 0.
     * @param {Integer} dwFlags A gesture command flag value indicating options for retrieving the gesture configuration.  See Remarks for additional information and supported values.
     * @param {Pointer<Integer>} pcIDs The size, in number of gesture configuration structures, that is in the <i>pGestureConfig</i> buffer.
     * @param {Pointer<GESTURECONFIG>} pGestureConfig An array of gesture configuration structures that specify the gesture configuration.
     * @param {Integer} cbSize The size of the gesture configuration (<a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-gestureconfig">GESTURECONFIG</a>) structure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getgestureconfig
     * @since windows6.1
     */
    static GetGestureConfig(hwnd, dwReserved, dwFlags, pcIDs, pGestureConfig, cbSize) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pcIDsMarshal := pcIDs is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetGestureConfig", "ptr", hwnd, "uint", dwReserved, "uint", dwFlags, pcIDsMarshal, pcIDs, "ptr", pGestureConfig, "uint", cbSize, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
