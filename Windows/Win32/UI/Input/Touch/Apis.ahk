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
     * @remarks
     * Calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-closetouchinputhandle">CloseTouchInputHandle</a> will not free memory associated with values retrieved in a call to <b>GetTouchInputInfo</b>.  Values in structures passed to <b>GetTouchInputInfo</b>  will be valid until you delete them.
     * @param {HTOUCHINPUT} hTouchInput The touch input handle received in the <b>LPARAM</b> of a touch message. The function fails with <b>ERROR_INVALID_HANDLE</b> if this handle is not valid. Note that the handle is not valid after it has been used in a successful call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-closetouchinputhandle">CloseTouchInputHandle</a> or after it has been passed to <a href="https://docs.microsoft.com/windows/desktop/wintouch/sendmessage--postmessage--and-related-functions">DefWindowProc, PostMessage, SendMessage</a> or one of their variants.
     * @param {Integer} cInputs The number of structures in the <i>pInputs</i> array. This should ideally be at least equal to the number of touch points associated with the message as indicated in the message <b>WPARAM</b>. If <i>cInputs</i> is less than the number of touch points, the function will still succeed and populate the <i>pInputs</i> buffer with information about <i>cInputs</i> touch points.
     * @param {Pointer<TOUCHINPUT>} pInputs A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touchinput">TOUCHINPUT</a> structures to receive information about the touch points associated with the specified touch input handle.
     * @param {Integer} cbSize The size, in bytes, of a single <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touchinput">TOUCHINPUT</a> structure. If <i>cbSize</i> is not the size of a single <b>TOUCHINPUT</b> structure, the function fails with <b>ERROR_INVALID_PARAMETER</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * If the function fails, the return value is zero. To get extended error information, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-gettouchinputinfo
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
     * @remarks
     * Calling <b>CloseTouchInputHandle</b> will not free memory associated with values retrieved in a call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-gettouchinputinfo">GetTouchInputInfo</a>. Values in structures passed to <b>GetTouchInputInfo</b>  will be valid until you delete them.
     * @param {HTOUCHINPUT} hTouchInput The touch input handle received in the <b>LPARAM</b> of a touch message. The function fails with <b>ERROR_INVALID_HANDLE</b> if this handle is not valid. Note that the handle is not valid after it has been used in a successful call to <b>CloseTouchInputHandle</b> or after it has been passed to <a href="https://docs.microsoft.com/windows/desktop/wintouch/sendmessage--postmessage--and-related-functions">DefWindowProc, PostMessage, SendMessage</a> or one of their variants.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-closetouchinputhandle
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
     * @remarks
     * <div class="alert"><b>Note</b>  <b>RegisterTouchWindow</b> must be called on every window that will be used for touch input.  This means that if you have an application that has multiple windows within it, <b>RegisterTouchWindow</b> must be called on every window in that application that uses touch features. Also, an application can call <b>RegisterTouchWindow</b> any number of times for the same window if it desires to change the modifier flags. A window can be marked as no longer requiring touch input using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-unregistertouchwindow">UnregisterTouchWindow</a> function.
     *   </div>
     * <div> </div>
     * If <b>TWF_WANTPALM</b> is enabled, packets from touch input are not buffered and palm detection is not performed before the packets are sent to your application. Enabling <b>TWF_WANTPALM</b> is most useful if you want minimal latencies when processing <a href="https://docs.microsoft.com/windows/desktop/wintouch/wm-touchdown">WM_TOUCH</a> messages.
     * @param {HWND} hwnd The handle of the window being registered. The function fails with <b>ERROR_ACCESS_DENIED</b> if the calling thread does not own the specified window.
     * @param {Integer} ulFlags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-registertouchwindow
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
     * @remarks
     * The <b>UnregisterTouchWindow</b>  function succeeds even if the specified window was not previously registered as being touch-capable.
     * @param {HWND} hwnd The handle of the window. The function fails with <b>ERROR_ACCESS_DENIED</b> if the calling thread does not own the specified window.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-unregistertouchwindow
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
     * @remarks
     * The following table lists the values for the <i>pulFlags</i> output parameter.
     * 		
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>TWF_FINETOUCH</b></td>
     * <td>Specifies that <i>hWnd</i> prefers noncoalesced touch input.</td>
     * </tr>
     * <tr>
     * <td><b>TWF_WANTPALM</b></td>
     * <td>
     * Clearing this flag disables palm rejection which reduces delays for getting <a href="https://docs.microsoft.com/windows/desktop/wintouch/wm-touchdown">WM_TOUCH</a> messages. 
     * 						     This is useful if you want as quick of a response as possible when a user touches your application.
     * 						  
     * 
     * Setting this flag enables palm detection and will prevent some <a href="https://docs.microsoft.com/windows/desktop/wintouch/wm-touchdown">WM_TOUCH</a> messages from being sent 
     * 						     to your application.  This is useful if you do not want to receive <b>WM_TOUCH</b> messages that are from palm contact.
     *                     
     * 
     * </td>
     * </tr>
     * </table>
     * @param {HWND} hwnd The handle of the window. The function fails with <b>ERROR_ACCESS_DENIED</b> if the calling thread is not on the same desktop as the specified window.
     * @param {Pointer<Integer>} pulFlags The address of the <b>ULONG</b> variable to receive the modifier flags for the specified window's touch capability.
     * @returns {BOOL} Returns <b>TRUE</b> if the window supports Windows Touch; returns <b>FALSE</b> if the window does not support Windows Touch.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-istouchwindow
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
     * @remarks
     * The <b>cbSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-gestureinfo">GESTUREINFO</a> structure passed in to the function must be set
     *     before the function is called.  Otherwise, calls to <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_INVALID_PARAMETER</b> (87 in decimal).
     *    If an application processes a <a href="https://docs.microsoft.com/windows/desktop/wintouch/wm-gesture">WM_GESTURE</a> message, it is responsible for
     *    closing the handle using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-closegestureinfohandle">CloseGestureInfoHandle</a>. Failure to do so may result in
     *    process memory leaks.
     *   
     * 
     * If the message is passed to <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-defwindowproca">DefWindowProc</a>, or is forwarded using
     *    one of the PostMessage or SendMessage classes of API functions, the handle
     *    is transferred with the message and need not be closed by the application.
     * @param {HGESTUREINFO} hGestureInfo The gesture information handle.
     * @param {Pointer<GESTUREINFO>} pGestureInfo A pointer to the gesture information structure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getgestureinfo
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
     * @remarks
     * This function is reserved for future use and should only be used for testing. Windows 7 gestures do not use extra arguments.
     * @param {HGESTUREINFO} hGestureInfo The handle to the gesture information that is passed in the <i>lParam</i> of a <a href="https://docs.microsoft.com/windows/desktop/wintouch/wm-gesture">WM_GESTURE</a> message.
     * @param {Integer} cbExtraArgs A count of the bytes of data stored in the extra arguments.
     * @param {Pointer} pExtraArgs A pointer to the extra argument information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getgestureextraargs
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
     * @remarks
     * If an application processes a <a href="https://docs.microsoft.com/windows/desktop/wintouch/wm-gesture">WM_GESTURE</a> message, it is responsible for
     *    closing the handle using this function. Failure to do so may result in
     *    process memory leaks.
     *   
     * 
     * If the message is passed to <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-defwindowproca">DefWindowProc</a>, or is forwarded using
     *    one of the PostMessage or SendMessage classes of API functions, the handle
     *    is transferred with the message and need not be closed by the application.
     * @param {HGESTUREINFO} hGestureInfo The gesture information handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *      
     * 
     * 
     * 
     * If the function fails, the return value is zero. To get extended error information, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-closegestureinfohandle
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
     * @remarks
     * If you don't expect to change the gesture configuration, call <b>SetGestureConfig</b> at window creation time.
     * 	 If you want to dynamically change the gesture configuration, call <b>SetGestureConfig</b> in response to <a href="https://docs.microsoft.com/windows/desktop/wintouch/wm-gesturenotify">WM_GESTURENOTIFY</a> messages.
     * 	 
     * 
     * The following table shows the identifiers for gestures that are
     *   supported by the <i>dwID</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-gestureconfig">GESTURECONFIG</a> structure.  Note that setting
     *   <i>dwID</i> to 0 indicates that global gesture configuration flags are set.
     *   
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>GID_ZOOM</b></td>
     * <td>3</td>
     * <td>Configuration settings for the zoom gesture.</td>
     * </tr>
     * <tr>
     * <td><b>GID_PAN</b></td>
     * <td>4</td>
     * <td>The pan gesture.</td>
     * </tr>
     * <tr>
     * <td><b>GID_ROTATE</b></td>
     * <td>5</td>
     * <td>The rotation gesture.</td>
     * </tr>
     * <tr>
     * <td><b>GID_TWOFINGERTAP</b></td>
     * <td>6</td>
     * <td>The two-finger tap gesture.</td>
     * </tr>
     * <tr>
     * <td><b>GID_PRESSANDTAP</b></td>
     * <td>7</td>
     * <td>The press and tap gesture.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following flags are used when <i>dwID</i> is set to zero.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>GC_ALLGESTURES</b></td>
     * <td>0x00000001</td>
     * <td>All of the gestures.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following flags are used when <i>dwID</i> is set to GID_ZOOM.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>GC_ZOOM</b></td>
     * <td>0x00000001</td>
     * <td>The zoom gesture.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following flags are used when <i>dwID</i> is set to GID_PAN.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>GC_PAN</b></td>
     * <td>0x00000001</td>
     * <td>All pan gestures.</td>
     * </tr>
     * <tr>
     * <td><b>GC_PAN_WITH_SINGLE_FINGER_VERTICALLY</b></td>
     * <td>0x00000002</td>
     * <td>Vertical pans with one finger.</td>
     * </tr>
     * <tr>
     * <td><b>GC_PAN_WITH_SINGLE_FINGER_HORIZONTALLY</b></td>
     * <td>0x00000004</td>
     * <td>Horizontal pans with one finger.</td>
     * </tr>
     * <tr>
     * <td><b>GC_PAN_WITH_GUTTER</b></td>
     * <td>0x00000008</td>
     * <td>Panning with a gutter boundary around the edges of pannable region.  The gutter boundary limits perpendicular movement to a primary direction until a threshold is reached to break out of the gutter.</td>
     * </tr>
     * <tr>
     * <td><b>GC_PAN_WITH_INTERTIA</b></td>
     * <td>0x00000010</td>
     * <td>Panning with inertia to smoothly slow when pan gestures stop.</td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Pan gestures can be used in conjunction with each other to control behavior. 
     *     For example, setting the <b>dwWant</b> bits to panning with single-finger horizontal
     *     and setting the <b>dwBlock</b> bits to single-finger vertical will restrict panning to horizontal pans. Changing the
     *     <b>dwWant</b> bit to have <c>GC_PAN_WITH_SINGLE_FINGER_VERTICALLY | GC_PAN_WITH_SINGLE_FINGER_HORIZONTALLY</c> and removing single-finger vertical pan from the <b>dwBlock</b> bit will enable both vertical and horizontal panning.    
     *     </div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  By default, panning has inertia enabled.
     *     </div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  A single call to <b>SetGestureConfig</b> cannot include other GIDs along with 0.	 
     * 	 </div>
     * <div> </div>
     * The following flags are used when <i>dwID</i> is set to GID_ROTATE.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>GC_ROTATE</b></td>
     * <td>0x00000001</td>
     * <td>The rotation gesture.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following flags are used when <i>dwID</i> is set to <b>GID_TWOFINGERTAP</b>.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>GC_TWOFINGERTAP</b></td>
     * <td>0x00000001</td>
     * <td>The two-finger tap gesture.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following flags are used when <i>dwID</i> is set to <b>GID_PRESSANDTAP</b>.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>GC_PRESSANDTAP</b></td>
     * <td>0x00000001</td>
     * <td>The press and tap gesture.</td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Calling <b>SetGestureConfig</b> will change the gesture configuration for the lifetime of the Window, not just for the next gesture.
     * 	 </div>
     * <div> </div>
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
     * If the function fails, the return value is zero. To get extended error information, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setgestureconfig
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
     * @remarks
     * Passing a value other than <c>sizeof(GESTURECONFIG)</c> for the 
     *       <i>cbSize</i> parameter will cause calls to this function to fail and 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will 
     *       return <b>ERROR_INVALID_PARAMETER</b> (87 in decimal).    
     *       
     * 
     * The following table lists the gesture configuration values:
     *   
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>GCF_INCLUDE_ANCESTORS</b></td>
     * <td>0x00000001</td>
     * <td>If specified, <b>GetGestureConfig</b> returns consolidated configuration for the specified window and its parent window chain.</td>
     * </tr>
     * </table>
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
     * If the function fails, the return value is zero. To get extended error information, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getgestureconfig
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
