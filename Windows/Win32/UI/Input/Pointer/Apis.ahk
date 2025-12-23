#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class Pointer {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Gets pointer data before it has gone through touch prediction processing.
     * @remarks
     * By default, touch prediction is activated.
     * @returns {Integer} The screen location of the pointer input.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getunpredictedmessagepos
     * @since windows8.0
     */
    static GetUnpredictedMessagePos() {
        result := DllCall("USER32.dll\GetUnpredictedMessagePos", "uint")
        return result
    }

    /**
     * Configures the touch injection context for the calling application and initializes the maximum number of simultaneous contacts that the app can inject.
     * @remarks
     * If <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_touchinjection/constants">TOUCH_FEEDBACK_DEFAULT</a> is set, the injected touch feedback may get suppressed by the end-user settings in the <b>Pen and Touch</b> control panel. 
     * 
     * If <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_touchinjection/constants">TOUCH_FEEDBACK_INDIRECT</a> is set, the injected touch feedback overrides the end-user settings in the <b>Pen and Touch</b> control panel. 
     * 
     * If <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_touchinjection/constants">TOUCH_FEEDBACK_INDIRECT</a> or <b>TOUCH_FEEDBACK_NONE</b> are set,  touch feedback provided by applications and controls may not be affected.
     * @param {Integer} maxCount The maximum number of touch contacts. 
     * 
     * The <i>maxCount</i> parameter must be greater than 0 and less than or equal to MAX_TOUCH_COUNT (256) as  defined in winuser.h.
     * @param {Integer} dwMode The contact visualization mode. 
     * 
     * The <i>dwMode</i> parameter must be   <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_touchinjection/constants">TOUCH_FEEDBACK_DEFAULT</a>, <b>TOUCH_FEEDBACK_INDIRECT</b>, or <b>TOUCH_FEEDBACK_NONE</b>.
     * @returns {BOOL} If the function succeeds, the return value is TRUE.
     * 
     * If the function fails, the return value is FALSE. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-initializetouchinjection
     * @since windows8.0
     */
    static InitializeTouchInjection(maxCount, dwMode) {
        A_LastError := 0

        result := DllCall("USER32.dll\InitializeTouchInjection", "uint", maxCount, "uint", dwMode, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Simulates touch input.
     * @remarks
     * The injected input is sent to the desktop of the session where the injection process is running.
     * 
     * There are two input states for touch input injection (interactive and hover) that are indicated by the following combinations of <b>pointerFlags</b> in <i>contacts</i>:
     * 
     * <table>
     * <tr>
     * <th><b>pointerFlags (POINTER_FLAG_*)</b></th>
     * <th>Status</th>
     * </tr>
     * <tr>
     * <td>INRANGE | UPDATE</td>
     * <td>Touch hover starts or moves</td>
     * </tr>
     * <tr>
     * <td>INRANGE | INCONTACT | DOWN</td>
     * <td>Touch contact down</td>
     * </tr>
     * <tr>
     * <td>INRANGE | INCONTACT | UPDATE </td>
     * <td>Touch contact moves</td>
     * </tr>
     * <tr>
     * <td>INRANGE | UP</td>
     * <td>Touch contact up and transition to hover</td>
     * </tr>
     * <tr>
     * <td>UPDATE</td>
     * <td>Touch hover ends</td>
     * </tr>
     * <tr>
     * <td>UP</td>
     * <td>Touch ends</td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Interactive state represents a touch contact that is on-screen and able to interact with any touch-capable app. Hover state represents touch input that  is not  in contact with the screen and cannot interact with applications. Touch injection can start in hover or interactive state, but the state can only transition through INRANGE | INCONTACT | DOWN for hover to  interactive state, or through INRANGE | UP for interactive to hover state.</div>
     * <div> </div>
     * All touch injection sequences end with either UPDATE or UP.
     * 
     * The following diagram demonstrates a touch injection sequence that starts with a hover state, transitions to interactive, and concludes with hover. 
     * 
     * :::image type="content" source="./images/inputstates.png" border="false" alt-text="Diagram of a touch injection sequence showing the state transitions from hover to interactive to hover.":::
     * 
     * For press and hold gestures, multiple frames must be sent to ensure input is not cancelled. For a press and hold at point (x,y), send <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerdown">WM_POINTERDOWN</a> at point (x,y) followed by <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerupdate">WM_POINTERUPDATE</a> messages at point(x,y). 
     * 
     * Listen for <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-displaychange">WM_DISPLAYCHANGE</a> to handle changes to display resolution and orientation and manage screen coordinate updates. All active contacts are cancelled when a <b>WM_DISPLAYCHANGE</b> is received.
     * 
     * Cancel individual contacts by setting POINTER_FLAG_CANCELED with POINTER_FLAG_UP or POINTER_FLAG_UPDATE. Cancelling touch injection without POINTER_FLAG_UP or POINTER_FLAG_UPDATE invalidates the injection.
     * 
     * When POINTER_FLAG_UP is set, ptPixelLocation of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> should be the same as the value of the previous touch injection frame with POINTER_FLAG_UPDATE. Otherwise, the injection fails with ERROR_INVALID_PARAMETER and all active injection contacts are cancelled. The system modifies the ptPixelLocation of the <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerup">WM_POINTERUP</a> event as it cancels the injection. 
     * 
     * The input timestamp can be specified in either the dwTime or PerformanceCount field of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a>. The value cannot be more recent than the current tick count or <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> value of the injection thread. Once a frame is injected with a timestamp, all subsequent frames must include a timestamp until all contacts in the frame go to the UP state. The custom timestamp value must be provided for the first element in the contacts array. The timestamp values after the first element are ignored. The custom timestamp value must increment in every injection frame.
     * 
     * 
     * 
     * When a PerformanceCount field is specified, the timestamp is converted into current time in .1 millisecond resolution upon actual injection. If a custom PerformanceCount resulted in the same .1 millisecond window from previous injection, the API will return an error (ERROR_NOT_READY) and will not inject the data. While injection is not immediately invalidated by the error, next successful injection must have PerformanceCount value that is at least 0.1 milliseconds apart from the previously successful injection. Similarly a custom dwTime value must be at least 1 millisecond apart if the field was used.
     * 
     * 
     * 
     * If both dwTime and PerformanceCount are specified in the injection parameter, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-injecttouchinput">InjectTouchInput</a> fails with an Error Code (ERROR_INVALID_PARAMETER). Once the injection application starts with either a dwTime or PerformanceCount parameter, the timestamp field must be filled correctly. Injection cannot switch the custom timestamp field from one to another once the injection sequence  has started.
     * 
     * 
     * 
     * When neither dwTime or PerformanceCount values are specified, the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-injecttouchinput">InjectTouchInput</a> allocates the timestamp based on the timing of the API call. If the calls are less than 0.1 millisecond apart, the API may return an error (ERROR_NOT_READY). The error will not invalidate the input immediately, but the injection application needs to retry the same frame again to ensure  injection is successful.
     * @param {Integer} count The size of the array in <i>contacts</i>. 
     * 
     * The maximum value for <i>count</i> is specified by the <i>maxCount</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-initializetouchinjection">InitializeTouchInjection</a> function.
     * @param {Pointer<POINTER_TOUCH_INFO>} contacts Array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_touch_info">POINTER_TOUCH_INFO</a> structures that represents all contacts on the desktop. The  screen coordinates of each contact must be within the bounds of the desktop.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-injecttouchinput
     * @since windows8.0
     */
    static InjectTouchInput(count, contacts) {
        A_LastError := 0

        result := DllCall("USER32.dll\InjectTouchInput", "uint", count, "ptr", contacts, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the pointer type for a specified pointer.
     * @remarks
     * An application can use the <b>GetPointerType</b> function to determine the pointer type if it wishes to react differently to pointers of different types.
     * 
     * <div class="alert"><b>Note</b>  This function will never return with the generic <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_POINTER </a> type.</div>
     * <div> </div>
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve pointer type.
     * @param {Pointer<Integer>} pointerType An address of a <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">POINTER_INPUT_TYPE</a> type to receive a pointer input type.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointertype
     * @since windows8.0
     */
    static GetPointerType(pointerId, pointerType) {
        pointerTypeMarshal := pointerType is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerType", "uint", pointerId, pointerTypeMarshal, pointerType, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the cursor identifier associated with the specified pointer.
     * @remarks
     * Cursor objects represent pointing and selecting devices used with digitizer devices, most commonly tactile contacts on touch digitizers and tablet pens on pen digitizers. Physical pens may have multiple tips (such as normal and eraser ends), with each pen tip representing a different cursor object. Each cursor object has an associated cursor identifier.
     * 
     * For pointer types that derive from these cursor objects, an application can use the <b>GetPointerCursorId</b> function to retrieve the cursor identifier associated with a pointer.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve the cursor identifier.
     * @param {Pointer<Integer>} cursorId An address of a <b>UINT32</b> to receive the tablet cursor identifier, if any, associated with the specified pointer.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointercursorid
     * @since windows8.0
     */
    static GetPointerCursorId(pointerId, cursorId) {
        cursorIdMarshal := cursorId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerCursorId", "uint", pointerId, cursorIdMarshal, cursorId, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the information for the specified pointer associated with the current message.
     * @remarks
     * <b>GetPointerInfo</b> retrieves information for a single pointer associated with a pointer message. 
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a> to retrieve frame information associated with a message  for a set of pointers.
     * 
     * The information returned by <b>GetPointerInfo</b> is associated with the most recent pointer message retrieved by the calling thread. When the next message is retrieved by the calling thread, the information associated with the previous message may no longer be available.
     * 
     * If the application does not process pointer input messages as fast as they are generated, some messages may be coalesced into a <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerupdate">WM_POINTERUPDATE</a> message. Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfohistory">GetPointerInfoHistory</a> to retrieve the message history from the most recent <b>WM_POINTERUPDATE</b> message. 
     * 
     * If the information associated with the message is no longer available, this function fails with the last error set to <b>ERROR_NO_DATA</b>.
     * 
     * If the calling thread does not own the window to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>. Note that this may be the window to which the input was originally delivered or it may be a window to which the message was forwarded.
     * @param {Integer} pointerId The pointer identifier.
     * @param {Pointer<POINTER_INFO>} pointerInfo Address of a  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure that receives the pointer information.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerinfo
     * @since windows8.0
     */
    static GetPointerInfo(pointerId, pointerInfo) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerInfo", "uint", pointerId, "ptr", pointerInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the information associated with the individual inputs, if any, that were coalesced into the current message for the specified pointer.
     * @remarks
     * If the application does not process pointer input messages as fast as they are generated, some moves may be coalesced. When an application receives a coalescable pointer message, it can use the <b>GetPointerInfoHistory</b> function to retrieve information for all the individual inputs, if any, that were coalesced into the message. Note that the information retrieved is associated with the pointer message most recently retrieved by the calling thread. Once the calling thread retrieves its next message, the information associated with the previous message may no longer be available.
     * 
     * The information retrieved appears in reverse chronological order, with the most recent entry in the first row of the returned array. The most recent entry is the same as that returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a> function.
     * 
     * If the count of rows in the buffer provided is insufficient to hold all available history entries, this function succeeds with the buffer containing the most recent entries and <i>*entriesCount</i> containing the total count of entries available.
     * 
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds and returns only the information for the specified pointer.
     * 
     * If the information associated with the pointer frame is no longer available, this function fails with the last error set to <b>ERROR_NO_DATA</b>.
     * 
     * If the calling thread does not own the window (where the input was originally delivered or where the message was forwarded) to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Pointer<Integer>} entriesCount A pointer to a variable that specifies the count of structures in the buffer to which pointerInfo points. If <b>GetPointerInfoHistory</b> succeeds, <i>entriesCount</i>  is updated with the total count of structures available. The total count of structures available is the same as the <b>historyCount</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a>.
     * @param {Pointer<POINTER_INFO>} pointerInfo Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structures to receive the pointer information. This parameter can be NULL if <i>*entriesCount</i> is zero.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerinfohistory
     * @since windows8.0
     */
    static GetPointerInfoHistory(pointerId, entriesCount, pointerInfo) {
        entriesCountMarshal := entriesCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerInfoHistory", "uint", pointerId, entriesCountMarshal, entriesCount, "ptr", pointerInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the entire frame of information for the specified pointers associated with the current message.
     * @remarks
     * Parallel-mode devices may report pointer input in frames, that is, they may report the state and position of all pointers from that device in a single input report to the system. Ideally, applications should view the entire frame as a single input unless the application-specific requirements dictate otherwise. 
     * 
     * <b>GetPointerFrameInfo</b> retrieves the entire pointer input frame associated with a pointer message. Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a> to retrieve information for a single pointer associated with a pointer message.
     * 
     * The  frame contains only pointers that are currently owned by the same window as the specified pointer.
     * 
     * The information returned by <b>GetPointerFrameInfo</b> is associated with the most recent pointer message retrieved by the calling thread. When the next message is retrieved by the calling thread, the information associated with the previous message may no longer be available.
     * 
     * 
     * 
     * If the application does not process pointer input messages as fast as they are generated, some messages may be coalesced into a <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerupdate">WM_POINTERUPDATE</a> message. Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfohistory">GetPointerFrameInfoHistory</a> to retrieve the message history from the most recent <b>WM_POINTERUPDATE</b> message. 
     * 
     * Having retrieved the entire frame of information, the application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-skippointerframemessages">SkipPointerFrameMessages</a> function to skip remaining pointer messages associated with this frame that are pending retrieval. This saves the application the overhead of retrieving and processing the remaining messages one by one. However, the <b>SkipPointerFrameMessages</b> function should be used with care and only when the caller can be sure that no other entity on the caller’s thread is expecting to see the remaining pointer messages one by one as they are retrieved.
     * 
     * Note that the information retrieved is associated with the pointer frame most recently retrieved by the calling thread. Once the calling thread retrieves its next message, the information associated with the previous pointer frame may no longer be available.
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds and returns only the information for the specified pointer.
     * 
     * If the information associated with the pointer frame is no longer available, this function fails with the last error set to <b>ERROR_NO_DATA</b>.
     * 
     * If the calling thread does not own the window (where the input was originally delivered or where the message was forwarded) to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>. 
     * 
     * For apps that have  both client and non-client areas, the input frame can include both client and non-client data. To differentiate between client and non-client data, you must perform hit testing on the target window.
     * 
     * We recommend the following if you want to filter data from the input frame:
     * 
     * <ul>
     * <li>For each update that does not include a pointer contact (a <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UPDATE</a> without <b>POINTER_FLAG_INCONTACT</b>), hit test to determine if the input is client or non-client.</li>
     * <li>For each new contact (<a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_DOWN</a>), hit test to determine if the input is client or non-client and track this info.</li>
     * <li>For each update that includes a pointer contact (a <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UPDATE</a> with <b>POINTER_FLAG_INCONTACT</b>), use the tracking info to determine whether the input is client or non-client.</li>
     * <li>For each <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UP</a>, use the tracking info to determine whether the input is client or non-client and then clear this pointer from the tracking data.</li>
     * </ul>
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve frame information.
     * @param {Pointer<Integer>} pointerCount A pointer to a variable that specifies the count of structures in the buffer to which pointerInfo points. If <b>GetPointerFrameInfo</b> succeeds, <i>pointerCount</i> is updated with the total count of pointers in the frame.
     * @param {Pointer<POINTER_INFO>} pointerInfo Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structures to receive the pointer information. This parameter can be <b>NULL</b> if <i>*pointerCount</i> is zero.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerframeinfo
     * @since windows8.0
     */
    static GetPointerFrameInfo(pointerId, pointerCount, pointerInfo) {
        pointerCountMarshal := pointerCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerFrameInfo", "uint", pointerId, pointerCountMarshal, pointerCount, "ptr", pointerInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the entire frame of information (including coalesced input frames) for the specified pointers associated with the current message.
     * @remarks
     * Parallel-mode devices may report pointer input in frames, that is, they may report the state and position of all pointers from that device in a single input report to the system. Ideally, applications should view the entire frame as a single input unless the application-specific requirements dictate otherwise. 
     * 
     * The information returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a> is associated with the most recent pointer message retrieved by the calling thread. When the next message is retrieved by the calling thread, the information associated with the previous message may no longer be available.
     * 
     * If the application does not process pointer input messages as fast as they are generated, some messages may be coalesced into a <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerupdate">WM_POINTERUPDATE</a> message. Use <b>GetPointerFrameInfoHistory</b> to retrieve the message history (including coalesced input frames) from the most recent <b>WM_POINTERUPDATE</b> message. 
     * 
     * Having retrieved the entire frame of information, the application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-skippointerframemessages">SkipPointerFrameMessages</a> function to skip remaining pointer messages associated with this frame that are pending retrieval. This saves the application the overhead of retrieving and processing the remaining messages one by one. However, the <b>SkipPointerFrameMessages</b> function should be used with care and only when the caller can be sure that no other entity on the caller’s thread is expecting to see the remaining pointer messages one by one as they are retrieved.
     * 
     * The  frame contains only pointers that are currently owned by the same window as the specified pointer.
     * 
     * The information retrieved represents a two-dimensional array with one row for each history entry and one column for each pointer in the frame.
     * 
     * The information retrieved appears in reverse chronological order, with the most recent entry in the first row of the returned array. The most recent entry is the same as that returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a> function.
     * 
     * If the count of rows in the buffer provided is insufficient to hold all available history entries, this function succeeds with the buffer containing the most recent entries and <i>*entriesCount</i> containing the total count of entries available.
     * 
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds and returns only the information for the specified pointer.
     * 
     * If the information associated with the pointer frame is no longer available, this function fails with the last error set to <b>ERROR_NO_DATA</b>.
     * 
     * If the calling thread does not own the window (where the input was originally delivered or where the message was forwarded) to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>. 
     * 
     * For apps that have  both client and non-client areas, the input frame can include both client and non-client data. To differentiate between client and non-client data, you must perform hit testing on the target window.
     * 
     * We recommend the following if you want to filter data from the input frame:
     * 
     * <ul>
     * <li>For each update that does not include a pointer contact (a <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UPDATE</a> without <b>POINTER_FLAG_INCONTACT</b>), hit test to determine if the input is client or non-client.</li>
     * <li>For each new contact (<a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_DOWN</a>), hit test to determine if the input is client or non-client and track this info.</li>
     * <li>For each update that includes a pointer contact (a <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UPDATE</a> with <b>POINTER_FLAG_INCONTACT</b>), use the tracking info to determine whether the input is client or non-client.</li>
     * <li>For each <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UP</a>, use the tracking info to determine whether the input is client or non-client and then clear this pointer from the tracking data.</li>
     * </ul>
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve frame information.
     * @param {Pointer<Integer>} entriesCount A pointer to a variable that specifies the count of rows in the two-dimensional array to which pointerInfo points. If <b>GetPointerFrameInfoHistory</b> succeeds, <i>entriesCount</i> is updated with the total count of frames available in the history.
     * @param {Pointer<Integer>} pointerCount A pointer to a variable that specifies the count of columns in the two-dimensional array to which pointerInfo points. If <b>GetPointerFrameInfoHistory</b> succeeds, <i>pointerCount</i> is updated with the total count of pointers in each frame.
     * @param {Pointer<POINTER_INFO>} pointerInfo Address of a two-dimensional array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structures to receive the pointer information. This parameter can be NULL if <i>*entriesCount</i> and <i>*pointerCount</i> are both zero.
     * 
     * This array is interpreted as <c>POINTER_INFO[*entriesCount][*pointerCount]</c>.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerframeinfohistory
     * @since windows8.0
     */
    static GetPointerFrameInfoHistory(pointerId, entriesCount, pointerCount, pointerInfo) {
        entriesCountMarshal := entriesCount is VarRef ? "uint*" : "ptr"
        pointerCountMarshal := pointerCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerFrameInfoHistory", "uint", pointerId, entriesCountMarshal, entriesCount, pointerCountMarshal, pointerCount, "ptr", pointerInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the touch-based information for the specified pointer (of type PT_TOUCH) associated with the current message.
     * @remarks
     * <b>GetPointerTouchInfo</b> retrieves information for a single pointer (of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a>) associated with a pointer message. 
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframetouchinfo">GetPointerFrameTouchInfo</a> to retrieve frame information associated with a message  for a set of pointers.
     * 
     * The information returned by <b>GetPointerTouchInfo</b> is associated with the most recent pointer message retrieved by the calling thread. When the next message is retrieved by the calling thread, the information associated with the previous message may no longer be available.
     * 
     * If the application does not process pointer input messages as fast as they are generated, some messages may be coalesced into a <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerupdate">WM_POINTERUPDATE</a> message. Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointertouchinfohistory">GetPointerTouchInfoHistory</a> to retrieve the message history from the most recent <b>WM_POINTERUPDATE</b> message. 
     * 
     * If the information associated with the message is no longer available, this function fails with the last error set to <b>ERROR_NO_DATA</b>.
     * 
     * If the calling thread does not own the window to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>. Note that this may be the window to which the input was originally delivered or it may be a window to which the message was forwarded.
     * 
     * If the specified pointer is not of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a>, this function fails with the last error set to <b>ERROR_DATATYPE_MISMATCH</b>.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Pointer<POINTER_TOUCH_INFO>} touchInfo Address of a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_touch_info">POINTER_TOUCH_INFO</a> structure to receive the touch-specific pointer information.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointertouchinfo
     * @since windows8.0
     */
    static GetPointerTouchInfo(pointerId, touchInfo) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerTouchInfo", "uint", pointerId, "ptr", touchInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the touch-based information associated with the individual inputs, if any, that were coalesced into the current message for the specified pointer (of type PT_TOUCH).
     * @remarks
     * If the application does not process pointer input messages as fast as they are generated, some moves may be coalesced. When an application receives a coalescable pointer (of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a>) message, it can use the <b>GetPointerTouchInfoHistory</b> function to retrieve information for all the individual inputs, if any, that were coalesced into the message. Note that the information retrieved is associated with the pointer message most recently retrieved by the calling thread. Once the calling thread retrieves its next message, the information associated with the previous message may no longer be available.
     * 
     * The information retrieved appears in reverse chronological order, with the most recent entry in the first row of the returned array. The most recent entry is the same as that returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointertouchinfo">GetPointerTouchInfo</a> function.
     * 
     * If the count of rows in the buffer provided is insufficient to hold all available history entries, this function succeeds with the buffer containing the most recent entries and <i>*entriesCount</i> containing the total count of entries available.
     * 
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds and returns only the information for the specified pointer.
     * 
     * If the information associated with the pointer frame is no longer available, this function fails with the last error set to <b>ERROR_NO_DATA</b>.
     * 
     * If the calling thread does not own the window (where the input was originally delivered or where the message was forwarded) to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>. 
     * 
     * If the specified pointer is not of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a>, this function fails with the last error set to <b>ERROR_DATATYPE_MISMATCH</b>.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Pointer<Integer>} entriesCount A pointer to a variable that specifies the count of structures in the buffer to which touchInfo points. If <b>GetPointerTouchInfoHistory</b> succeeds, <i>entriesCount</i> is updated with the total count of structures available. The total count of structures available is the same as the <i>historyCount</i> field in the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointertouchinfo">GetPointerTouchInfo</a>.
     * @param {Pointer<POINTER_TOUCH_INFO>} touchInfo Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_touch_info">POINTER_TOUCH_INFO</a> structures to receive the pointer information. This parameter can be NULL if *entriesCount is zero.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointertouchinfohistory
     * @since windows8.0
     */
    static GetPointerTouchInfoHistory(pointerId, entriesCount, touchInfo) {
        entriesCountMarshal := entriesCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerTouchInfoHistory", "uint", pointerId, entriesCountMarshal, entriesCount, "ptr", touchInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the entire frame of touch-based information for the specified pointers (of type PT_TOUCH) associated with the current message.
     * @remarks
     * Parallel-mode devices may report pointer input in frames, that is, they may report the state and position of all pointers from that device in a single input report to the system. Ideally, applications should view the entire frame as a single input unless the application-specific requirements dictate otherwise.
     * 
     * <b>GetPointerFrameTouchInfo</b> retrieves the entire pointer input frame associated with a pointer (of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a>) message. Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointertouchinfo">GetPointerTouchInfo</a> to retrieve information for a single pointer associated with a pointer message.
     * 
     * The  frame contains only pointers that are currently owned by the same window as the specified pointer.
     * 
     * The information returned by <b>GetPointerFrameTouchInfo</b> is associated with the most recent pointer message retrieved by the calling thread. When the next message is retrieved by the calling thread, the information associated with the previous message may no longer be available.
     * 
     * 
     * 
     * If the application does not process pointer input messages as fast as they are generated, some messages may be coalesced into a <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerupdate">WM_POINTERUPDATE</a> message. Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframetouchinfohistory">GetPointerFrameTouchInfoHistory</a> to retrieve the message history from the most recent <b>WM_POINTERUPDATE</b> message. 
     * 
     * Having retrieved the entire frame of information, the application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-skippointerframemessages">SkipPointerFrameMessages</a> function to skip remaining pointer messages associated with this frame that are pending retrieval. This saves the application the overhead of retrieving and processing the remaining messages one by one. However, the <b>SkipPointerFrameMessages</b> function should be used with care and only when the caller can be sure that no other entity on the caller’s thread is expecting to see the remaining pointer messages one by one as they are retrieved.
     * 
     * Note that the information retrieved is associated with the pointer frame most recently retrieved by the calling thread. Once the calling thread retrieves its next message, the information associated with the previous pointer frame may no longer be available.
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds and returns only the information for the specified pointer.
     * 
     * If the information associated with the pointer frame is no longer available, this function fails with the last error set to <b>ERROR_NO_DATA</b>.
     * 
     * If the calling thread does not own the window to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
     * 
     * If the specified pointer is not of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a>, this function fails with the last error set to <b>ERROR_DATATYPE_MISMATCH</b>.
     * 
     * 
     * 
     * For apps that have  both client and non-client areas, the input frame can include both client and non-client data. To differentiate between client and non-client data, you must perform hit testing on the target window.
     * 
     * We recommend the following if you want to filter data from the input frame:
     * 
     * <ul>
     * <li>For each update that does not include a pointer contact (a <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UPDATE</a> without <b>POINTER_FLAG_INCONTACT</b>), hit test to determine if the input is client or non-client.</li>
     * <li>For each new contact (<a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_DOWN</a>), hit test to determine if the input is client or non-client and track this info.</li>
     * <li>For each update that includes a pointer contact (a <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UPDATE</a> with <b>POINTER_FLAG_INCONTACT</b>), use the tracking info to determine whether the input is client or non-client.</li>
     * <li>For each <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UP</a>, use the tracking info to determine whether the input is client or non-client and then clear this pointer from the tracking data.</li>
     * </ul>
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve frame information.
     * @param {Pointer<Integer>} pointerCount A pointer to a variable that specifies the count of structures in the buffer to which touchInfo points. If <b>GetPointerFrameTouchInfo</b> succeeds, <i>pointerCount</i> is updated with the total count of pointers in the frame.
     * @param {Pointer<POINTER_TOUCH_INFO>} touchInfo Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_touch_info">POINTER_TOUCH_INFO</a> structures to receive the pointer information. This parameter can be NULL if <i>*pointerCount</i> is zero.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerframetouchinfo
     * @since windows8.0
     */
    static GetPointerFrameTouchInfo(pointerId, pointerCount, touchInfo) {
        pointerCountMarshal := pointerCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerFrameTouchInfo", "uint", pointerId, pointerCountMarshal, pointerCount, "ptr", touchInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the entire frame of touch-based information (including coalesced input frames) for the specified pointers (of type PT_TOUCH) associated with the current message.
     * @remarks
     * Parallel-mode devices may report pointer input in frames, that is, they may report the state and position of all pointers from that device in a single input report to the system. Ideally, applications should view the entire frame as a single input unless the application-specific requirements dictate otherwise. 
     * 
     * The information returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframetouchinfo">GetPointerFrameTouchInfo</a> is associated with the most recent pointer (<a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a>) message retrieved by the calling thread. When the next message is retrieved by the calling thread, the information associated with the previous message may no longer be available.
     * 
     * If the application does not process pointer input messages as fast as they are generated, some messages may be coalesced into a <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerupdate">WM_POINTERUPDATE</a> message. Use <b>GetPointerFrameTouchInfoHistory</b> to retrieve the message history (including coalesced input frames) from the most recent <b>WM_POINTERUPDATE</b> message. 
     * 
     * Having retrieved the entire frame of information, the application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-skippointerframemessages">SkipPointerFrameMessages</a> function to skip remaining pointer messages associated with this frame that are pending retrieval. This saves the application the overhead of retrieving and processing the remaining messages one by one. However, the <b>SkipPointerFrameMessages</b> function should be used with care and only when the caller can be sure that no other entity on the caller’s thread is expecting to see the remaining pointer messages one by one as they are retrieved.
     * 
     * The  frame contains only pointers that are currently owned by the same window as the specified pointer.
     * 
     * The information retrieved represents a two-dimensional array with one row for each history entry and one column for each pointer in the frame.
     * 
     * The information retrieved appears in reverse chronological order, with the most recent entry in the first row of the returned array. The most recent entry is the same as that returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframetouchinfo">GetPointerFrameTouchInfo</a> function.
     * 
     * If the count of rows in the buffer provided is insufficient to hold all available history entries, this function succeeds with the buffer containing the most recent entries and <i>*entriesCount</i> containing the total count of entries available.
     * 
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds and returns only the information for the specified pointer.
     * 
     * If the information associated with the pointer frame is no longer available, this function fails with the last error set to <b>ERROR_NO_DATA</b>.
     * 
     * If the calling thread does not own the window (where the input was originally delivered or where the message was forwarded) to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>. 
     * 
     * If the specified pointer is not of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a>, this function fails with the last error set to <b>ERROR_DATATYPE_MISMATCH</b>.
     * 
     * 
     * 
     * For apps that have  both client and non-client areas, the input frame can include both client and non-client data. To differentiate between client and non-client data, you must perform hit testing on the target window.
     * 
     * We recommend the following if you want to filter data from the input frame:
     * 
     * <ul>
     * <li>For each update that does not include a pointer contact (a <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UPDATE</a> without <b>POINTER_FLAG_INCONTACT</b>), hit test to determine if the input is client or non-client.</li>
     * <li>For each new contact (<a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_DOWN</a>), hit test to determine if the input is client or non-client and track this info.</li>
     * <li>For each update that includes a pointer contact (a <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UPDATE</a> with <b>POINTER_FLAG_INCONTACT</b>), use the tracking info to determine whether the input is client or non-client.</li>
     * <li>For each <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UP</a>, use the tracking info to determine whether the input is client or non-client and then clear this pointer from the tracking data.</li>
     * </ul>
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve frame information.
     * @param {Pointer<Integer>} entriesCount A pointer to variable that specifies the count of rows in the two-dimensional array to which touchInfo points. If <b>GetPointerFrameTouchInfoHistory</b> succeeds,  <i>entriesCount</i> is updated with the total count of frames available in the history.
     * @param {Pointer<Integer>} pointerCount A pointer to a variable that specifies the count of columns in the two-dimensional array to which touchInfo points. If <b>GetPointerFrameTouchInfoHistory</b> succeeds, <i>pointerCount</i> is updated with the total count of pointers in each frame.
     * @param {Pointer<POINTER_TOUCH_INFO>} touchInfo Address of a two-dimensional array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_touch_info">POINTER_TOUCH_INFO</a> structures to receive the pointer information. This parameter can be NULL if <i>*entriesCount</i> and <i>*pointerCount</i> are both zero.
     * 
     * This array is interpreted as <c>POINTER_TOUCH_INFO[*entriesCount][*pointerCount]</c>.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerframetouchinfohistory
     * @since windows8.0
     */
    static GetPointerFrameTouchInfoHistory(pointerId, entriesCount, pointerCount, touchInfo) {
        entriesCountMarshal := entriesCount is VarRef ? "uint*" : "ptr"
        pointerCountMarshal := pointerCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerFrameTouchInfoHistory", "uint", pointerId, entriesCountMarshal, entriesCount, pointerCountMarshal, pointerCount, "ptr", touchInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the pen-based information for the specified pointer (of type PT_PEN) associated with the current message.
     * @remarks
     * <b>GetPointerPenInfo</b> retrieves information for a single pointer (of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_PEN</a>) associated with a pointer message. 
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframepeninfo">GetPointerFramePenInfo</a> to retrieve frame information associated with a message  for a set of pointers.
     * 
     * The information returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a> is associated with the most recent pointer message retrieved by the calling thread. When the next message is retrieved by the calling thread, the information associated with the previous message may no longer be available.
     * 
     * If the application does not process pointer input messages as fast as they are generated, some messages may be coalesced into a <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerupdate">WM_POINTERUPDATE</a> message. Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerpeninfohistory">GetPointerPenInfoHistory</a> to retrieve the message history from the most recent <b>WM_POINTERUPDATE</b> message. 
     * 
     * If the information associated with the message is no longer available, this function fails with the last error set to <b>ERROR_NO_DATA</b>.
     * 
     * If the calling thread does not own the window to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>. Note that this may be the window to which the input was originally delivered or it may be a window to which the message was forwarded.
     * 
     * If the specified pointer is not of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_PEN</a>, this function fails with the last error set to <b>ERROR_DATATYPE_MISMATCH</b>.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Pointer<POINTER_PEN_INFO>} penInfo Address of a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_pen_info">POINTER_PEN_INFO</a> structure to receive the pen-specific pointer information.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerpeninfo
     * @since windows8.0
     */
    static GetPointerPenInfo(pointerId, penInfo) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerPenInfo", "uint", pointerId, "ptr", penInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the pen-based information associated with the individual inputs, if any, that were coalesced into the current message for the specified pointer (of type PT_PEN).
     * @remarks
     * If the application does not process pointer input messages as fast as they are generated, some moves may be 
     *     coalesced. When an application receives a coalescable pointer (of type 
     *     <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_PEN</a>) message, it can use the 
     *     <b>GetPointerPenInfoHistory</b> function to 
     *     retrieve information for all the individual inputs, if any, that were coalesced into the message. Note that the 
     *     information retrieved is associated with the pointer message most recently retrieved by the calling thread. Once 
     *     the calling thread retrieves its next message, the information associated with the previous message may no longer 
     *     be available.
     * 
     * The information retrieved appears in reverse chronological order, with the most recent 
     *     entry in the first row of the returned array. The most recent entry is the same as that returned by the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerpeninfo">GetPointerPenInfo</a> function.
     * 
     * If the count of rows in the buffer provided is insufficient to hold all available history entries, this 
     *     function succeeds with the buffer containing the most recent entries and <i>*entriesCount</i> 
     *     containing the total count of entries available.
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds and 
     *     returns only the information for the specified pointer.
     * 
     * If the information associated with the pointer frame is no longer available, this function fails with the last 
     *     error set to <b>ERROR_NO_DATA</b>.
     * 
     * If the calling thread does not own the window (where the input was originally delivered or where the message 
     *     was forwarded) to which the pointer message has been delivered, this function fails with the last error set to 
     *     <b>ERROR_ACCESS_DENIED</b>.
     * 
     * If the specified pointer is not of type 
     *     <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_PEN</a>, this function fails with the last 
     *      error set to <b>ERROR_DATATYPE_MISMATCH</b>.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Pointer<Integer>} entriesCount A pointer to a variable that specifies the count of structures in the buffer to which 
     *        <i>penInfo</i> points. If 
     *        <b>GetPointerPenInfoHistory</b> succeeds, 
     *        <i>entriesCount</i> is updated with the total count of structures available. The total 
     *        count of structures available is the same as the <i>historyCount</i> field in the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_pen_info">POINTER_PEN_INFO</a> structure returned by a 
     *        call to  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerpeninfo">GetPointerPenInfo</a>.
     * @param {Pointer<POINTER_PEN_INFO>} penInfo Address of an array of 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_pen_info">POINTER_PEN_INFO</a> structures to receive 
     *        the pointer information. This parameter can be NULL if <i>*entriesCount</i> is zero.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerpeninfohistory
     * @since windows8.0
     */
    static GetPointerPenInfoHistory(pointerId, entriesCount, penInfo) {
        entriesCountMarshal := entriesCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerPenInfoHistory", "uint", pointerId, entriesCountMarshal, entriesCount, "ptr", penInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the entire frame of pen-based information for the specified pointers (of type PT_PEN) associated with the current message.
     * @remarks
     * Parallel-mode devices may report pointer input in frames, that is, they may report the state and position of all pointers from that device in a single input report to the system. Ideally, applications should view the entire frame as a single input unless the application-specific requirements dictate otherwise.
     * 
     * <b>GetPointerFramePenInfo</b> retrieves the entire pointer input frame associated with a pointer (of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_PEN</a>) message. Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerpeninfo">GetPointerPenInfo</a> to retrieve information for a single pointer associated with a pointer message.
     * 
     * The  frame contains only pointers that are currently owned by the same window as the specified pointer.
     * 
     * The information returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a> is associated with the most recent pointer message retrieved by the calling thread. When the next message is retrieved by the calling thread, the information associated with the previous message may no longer be available.
     * 
     * 
     * 
     * If the application does not process pointer input messages as fast as they are generated, some messages may be coalesced into a <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerupdate">WM_POINTERUPDATE</a> message. Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframepeninfohistory">GetPointerFramePenInfoHistory</a> to retrieve the message history from the most recent <b>WM_POINTERUPDATE</b> message. 
     * 
     * Having retrieved the entire frame of information, the application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-skippointerframemessages">SkipPointerFrameMessages</a> function to skip remaining pointer messages associated with this frame that are pending retrieval. This saves the application the overhead of retrieving and processing the remaining messages one by one. However, the <b>SkipPointerFrameMessages</b> function should be used with care and only when the caller can be sure that no other entity on the caller’s thread is expecting to see the remaining pointer messages one by one as they are retrieved.
     * 
     * Note that the information retrieved is associated with the pointer frame most recently retrieved by the calling thread. Once the calling thread retrieves its next message, the information associated with the previous pointer frame may no longer be available.
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds and returns only the information for the specified pointer.
     * 
     * If the information associated with the pointer frame is no longer available, this function fails with the last error set to <b>ERROR_NO_DATA</b>.
     * 
     * If the calling thread does not own the window to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
     * 
     * If the specified pointer is not of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_PEN</a>, this function fails with the last error set to <b>ERROR_DATATYPE_MISMATCH</b>.
     * 
     * 
     * 
     * For apps that have  both client and non-client areas, the input frame can include both client and non-client data. To differentiate between client and non-client data, you must perform hit testing on the target window.
     * 
     * We recommend the following if you want to filter data from the input frame:
     * 
     * <ul>
     * <li>For each update that does not include a pointer contact (a <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UPDATE</a> without <b>POINTER_FLAG_INCONTACT</b>), hit test to determine if the input is client or non-client.</li>
     * <li>For each new contact (<a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_DOWN</a>), hit test to determine if the input is client or non-client and track this info.</li>
     * <li>For each update that includes a pointer contact (a <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UPDATE</a> with <b>POINTER_FLAG_INCONTACT</b>), use the tracking info to determine whether the input is client or non-client.</li>
     * <li>For each <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UP</a>, use the tracking info to determine whether the input is client or non-client and then clear this pointer from the tracking data.</li>
     * </ul>
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve frame information.
     * @param {Pointer<Integer>} pointerCount A pointer to a variable that specifies the count of structures in the buffer to which penInfo points. If <b>GetPointerFramePenInfo</b> succeeds, <i>pointerCount</i>  is updated with the total count of pointers in the frame.
     * @param {Pointer<POINTER_PEN_INFO>} penInfo Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_pen_info">POINTER_PEN_INFO</a> structures to receive the pointer information. This parameter can be NULL if <i>*pointerCount</i> is zero.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerframepeninfo
     * @since windows8.0
     */
    static GetPointerFramePenInfo(pointerId, pointerCount, penInfo) {
        pointerCountMarshal := pointerCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerFramePenInfo", "uint", pointerId, pointerCountMarshal, pointerCount, "ptr", penInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the entire frame of pen-based information (including coalesced input frames) for the specified pointers (of type PT_PEN) associated with the current message.
     * @remarks
     * Parallel-mode devices may report pointer input in frames, that is, they may report the state and position of all pointers from that device in a single input report to the system. Ideally, applications should view the entire frame as a single input unless the application-specific requirements dictate otherwise. 
     * 
     * The information returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframepeninfo">GetPointerFramePenInfo</a> is associated with the most recent pointer (<a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_PEN</a>)  message retrieved by the calling thread. When the next message is retrieved by the calling thread, the information associated with the previous message may no longer be available.
     * 
     * If the application does not process pointer input messages as fast as they are generated, some messages may be coalesced into a <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerupdate">WM_POINTERUPDATE</a> message. Use <b>GetPointerFramePenInfoHistory</b> to retrieve the message history (including coalesced input frames) from the most recent <b>WM_POINTERUPDATE</b> message. 
     * 
     * Having retrieved the entire frame of information, the application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-skippointerframemessages">SkipPointerFrameMessages</a> function to skip remaining pointer messages associated with this frame that are pending retrieval. This saves the application the overhead of retrieving and processing the remaining messages one by one. However, the <b>SkipPointerFrameMessages</b> function should be used with care and only when the caller can be sure that no other entity on the caller’s thread is expecting to see the remaining pointer messages one by one as they are retrieved.
     * 
     * The  frame contains only pointers that are currently owned by the same window as the specified pointer.
     * 
     * The information retrieved represents a two-dimensional array with one row for each history entry and one column for each pointer in the frame.
     * 
     * The information retrieved appears in reverse chronological order, with the most recent entry in the first row of the returned array. The most recent entry is the same as that returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframepeninfo">GetPointerFramePenInfo</a> function.
     * 
     * If the count of rows in the buffer provided is insufficient to hold all available history entries, this function succeeds with the buffer containing the most recent entries and <i>*entriesCount</i> containing the total count of entries available.
     * 
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds and returns only the information for the specified pointer.
     * 
     * If the information associated with the pointer frame is no longer available, this function fails with the last error set to <b>ERROR_NO_DATA</b>.
     * 
     * If the calling thread does not own the window (where the input was originally delivered or where the message was forwarded) to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>. 
     * 
     * If the specified pointer is not of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_PEN</a>, this function fails with the last error set to <b>ERROR_DATATYPE_MISMATCH</b>.
     * 
     * 
     * 
     * For apps that have  both client and non-client areas, the input frame can include both client and non-client data. To differentiate between client and non-client data, you must perform hit testing on the target window.
     * 
     * We recommend the following if you want to filter data from the input frame:
     *      <ul>
     * <li>For each update that does not include a pointer contact (a <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UPDATE</a> without <b>POINTER_FLAG_INCONTACT</b>), hit test to determine if the input is client or non-client.</li>
     * <li>For each new contact (<a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_DOWN</a>), hit test to determine if the input is client or non-client and track this info.</li>
     * <li>For each update that includes a pointer contact (a <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UPDATE</a> with <b>POINTER_FLAG_INCONTACT</b>), use the tracking info to determine whether the input is client or non-client.</li>
     * <li>For each <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_UP</a>, use the tracking info to determine whether the input is client or non-client and then clear this pointer from the tracking data.</li>
     * </ul>
     * @param {Integer} pointerId The identifier of the pointer for which to retrieve frame information.
     * @param {Pointer<Integer>} entriesCount A pointer to a variable that specifies the count of rows in the two-dimensional array to which penInfo points. If <b>GetPointerFramePenInfoHistory</b> succeeds,  <i>entriesCount</i> is updated with the total count of frames available in the history.
     * @param {Pointer<Integer>} pointerCount A pointer to a variable that specifies the count of columns in the two-dimensional array to which penInfo points. If <b>GetPointerFramePenInfoHistory</b> succeeds, <i>pointerCount</i> is updated with  the total count of pointers in each frame.
     * @param {Pointer<POINTER_PEN_INFO>} penInfo Address of a two-dimensional array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_pen_info">POINTER_PEN_INFO</a> structures to receive the pointer information. This parameter can be NULL if *entriesCount and *pointerCount are both zero.
     * 
     * 
     * This array is interpreted as POINTER_PEN_INFO[*entriesCount][*pointerCount].
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerframepeninfohistory
     * @since windows8.0
     */
    static GetPointerFramePenInfoHistory(pointerId, entriesCount, pointerCount, penInfo) {
        entriesCountMarshal := entriesCount is VarRef ? "uint*" : "ptr"
        pointerCountMarshal := pointerCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerFramePenInfoHistory", "uint", pointerId, entriesCountMarshal, entriesCount, pointerCountMarshal, pointerCount, "ptr", penInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines which pointer input frame generated the most recently retrieved message for the specified pointer and discards any queued (unretrieved) pointer input messages generated from the same pointer input frame.
     * @remarks
     * Parallel-mode devices may report pointer input in frames, that is, they may report the state and position of all pointers from that device in a single input report to the system. Ideally, applications should view the entire frame as a single input unless the application-specific requirements dictate otherwise.
     * 
     * The <b>SkipPointerFrameMessages</b> function can be used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a> function (or one of its type-specific variants) to consume entire frames as a single input.
     * 
     * When an application sees a pointer message, it can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a> function to retrieve the entire pointer input frame to which the pointer message belongs, hence obtaining an updated view of all of the pointers currently owned by the window. Note that the returned frame contains only pointers that are currently owned by the same window as the specified pointer.
     * 
     * Having retrieved the entire frame of information, the application can then call the <b>SkipPointerFrameMessages</b> function to skip remaining pointer messages associated with this frame that are pending retrieval. This saves the application the overhead of retrieving and processing the remaining messages one by one.
     * 
     * <div class="alert"><b>Warning</b>  The <b>SkipPointerFrameMessages</b> function should be used only when the caller can be sure that no other entity on the caller’s thread (such as  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>) is expecting to retrieve pending pointer messages. For this reason, <b>SkipPointerFrameMessages</b> should not be used in conjunction with Direct Manipulation when processing multiple, simultaneous interactions.</div>
     * <div> </div>
     * Note that the information retrieved is associated with the pointer frame most recently retrieved by the calling thread. Once the calling thread retrieves its next message, the information associated with the previous pointer frame may no longer be available.
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds with no action.
     * 
     * If the calling thread does not own the window to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
     * @param {Integer} pointerId Identifier of the pointer. Pending messages will be skipped for the frame that includes the most recently retrieved input for this pointer.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-skippointerframemessages
     * @since windows8.0
     */
    static SkipPointerFrameMessages(pointerId) {
        A_LastError := 0

        result := DllCall("USER32.dll\SkipPointerFrameMessages", "uint", pointerId, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Simulates pointer input (pen or touch).
     * @param {HSYNTHETICPOINTERDEVICE} device A handle to the pointer injection device created by <a href="../winuser/nf-winuser-createsyntheticpointerdevice.md">CreateSyntheticPointerDevice</a>.
     * @param {Pointer<POINTER_TYPE_INFO>} pointerInfo An array of [POINTER_TYPE_INFO](ns-winuser-pointer_type_info.md) structures represneting the injected pointers.
     * 
     * The type must match the <i>pointerType</i> parameter of the <a href="../winuser/nf-winuser-createsyntheticpointerdevice.md">CreateSyntheticPointerDevice</a> call that created the injection device. 
     * 
     * 
     * The ptPixelLocation for each POINTER_TYPE_INFO is specified relative to top left of the virtual screen:
     * @param {Integer} count The number of contacts. 
     * 
     * 
     * For <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a> this value must be greater than 0 and less than or equal to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_touchinjection/constants">MAX_TOUCH_COUNT</a>. 
     * 
     * For <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_PEN</a> this value must be 1.
     * @returns {BOOL} If this function succeeds, it returns TRUE.
     *  
     * Otherwise, it returns FALSE. To retrieve extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-injectsyntheticpointerinput
     * @since windows10.0.17763
     */
    static InjectSyntheticPointerInput(device, pointerInfo, count) {
        device := device is Win32Handle ? NumGet(device, "ptr") : device

        A_LastError := 0

        result := DllCall("USER32.dll\InjectSyntheticPointerInput", "ptr", device, "ptr", pointerInfo, "uint", count, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Destroys the specified pointer injection device.
     * @param {HSYNTHETICPOINTERDEVICE} device A handle to the pointer injection device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-destroysyntheticpointerdevice
     * @since windows10.0.17763
     */
    static DestroySyntheticPointerDevice(device) {
        device := device is Win32Handle ? NumGet(device, "ptr") : device

        DllCall("USER32.dll\DestroySyntheticPointerDevice", "ptr", device)
    }

    /**
     * Enables the mouse to act as a pointer input device and send WM_POINTER messages.
     * @remarks
     * This function can be called only once in the context of a process lifetime.  Prior to the first call, Windows Store apps run with mouse-in-pointer enabled, as do any desktop applications that consume mshtml.dll.  All other desktop applications run with mouse-in-pointer disabled.
     * 
     * On the first call in the process lifetime, the state is changed as specified and the call succeeds.
     * 
     * On subsequent calls, the state will not change.  If the current state is not equal to the specified state, the call fails.
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-ismouseinpointerenabled">IsMouseInPointerEnabled</a> to verify the mouse-in-pointer state.
     * @param {BOOL} fEnable <b>TRUE</b> to turn on mouse input support in <a href="https://docs.microsoft.com/windows/win32/inputmsg/messages">WM_POINTER</a>.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-enablemouseinpointer
     * @since windows8.0
     */
    static EnableMouseInPointer(fEnable) {
        A_LastError := 0

        result := DllCall("USER32.dll\EnableMouseInPointer", "int", fEnable, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates whether EnableMouseInPointer is set for the mouse to act as a pointer input device and send WM_POINTER messages.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enablemouseinpointer">EnableMouseInPointer</a> can be called only once in the context of a process lifetime.  Prior to the first call, Windows Store apps run with mouse-in-pointer enabled, as do any desktop applications that consume mshtml.dll.  All other desktop applications run with mouse-in-pointer disabled.
     * 
     * On the first call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enablemouseinpointer">EnableMouseInPointer</a> in the process lifetime, the state is changed as specified and the call succeeds.
     * 
     * On subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enablemouseinpointer">EnableMouseInPointer</a>, the state will not change.  If the current state is not equal to the specified state, the call fails.
     * 
     * Call <b>IsMouseInPointerEnabled</b> to verify the mouse-in-pointer state.
     * @returns {BOOL} If <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enablemouseinpointer">EnableMouseInPointer</a> is set, the return value is nonzero.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enablemouseinpointer">EnableMouseInPointer</a> is not set, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-ismouseinpointerenabled
     * @since windows8.0
     */
    static IsMouseInPointerEnabled() {
        result := DllCall("USER32.dll\IsMouseInPointerEnabled", "int")
        return result
    }

    /**
     * Gets one or more transforms for the pointer information coordinates associated with the current message.
     * @remarks
     * A consumer of pointer input messages typically uses <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-screentoclient">ScreenToClient</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-mapwindowpoints">MapWindowPoints</a> to convert screen coordinates to client coordinates.
     * 
     * If a transform is applied on the message consumer, use <b>GetPointerInputTransform</b> to retrieve the transform on the message consumer at the time the input occurred. The inverse of this transform can then be used to convert pointer input coordinates from screen coordinates to the client coordinates of the message consumer.
     * 
     * If an input transform is not associated with the input, the <b>GetPointerInputTransform</b> function fails with the last error set to <b>ERROR_NO_DATA</b>. Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-screentoclient">ScreenToClient</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-mapwindowpoints">MapWindowPoints</a> instead.
     * 
     * The input transform does not respect any right-to-left layout setting on the input target. An application that requires adjusted coordinates for right-to-left layout must perform the right-to-left mirroring  or combine an appropriate mirroring transform with the input transform.
     * 
     * 
     * 
     * The information returned by <b>GetPointerInputTransform</b> is associated with the most recent pointer message retrieved by the calling thread. When the next message is retrieved by the calling thread, the information associated with the previous message might no longer be available.
     * 
     * If an application calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a>, it can call <b>GetPointerInputTransform</b> with the same pointer Id and a single <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-input_transform">INPUT_TRANSFORM</a> output buffer to get the input transform associated with the data.
     * 
     * If an application calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a>, it can call <b>GetPointerInputTransform</b> with the same pointer Id and a single <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-input_transform">INPUT_TRANSFORM</a> output buffer to get the input transform associated with the data. The same input transform applies to the entire frame.
     * 
     * If an application calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfohistory">GetPointerInfoHistory</a>, it can call <b>GetPointerInputTransform</b> with the same pointer Id and an output buffer to hold the entries retrieved using <b>GetPointerInfoHistory</b>. Each input transform in the returned array can be used with the corresponding entry in the array returned by <b>GetPointerInfoHistory</b>.
     * 
     * If an application calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfohistory">GetPointerFrameInfoHistory</a>, it can call <b>GetPointerInputTransform</b> with the same pointer Id and an output buffer to hold the entries retrieved using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfohistory">GetPointerInfoHistory</a>. Each input transform in the returned array can be used with the corresponding frame in the array returned by <b>GetPointerFrameInfoHistory</b>, with the same input transform being applied to the entire frame.
     * 
     * 
     * 
     * If the information associated with the message is no longer available, this function fails with the last error set to <b>ERROR_INVALID_PARAMETER</b>.
     * 
     * If <i>historyCount</i> contains a value larger than the <b>historyCount</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a> (or the first <b>POINTER_INFO</b> structure in the array returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfohistory">GetPointerInfoHistory</a>), the function fails with the last error set to <b>ERROR_INVALID_PARAMETER</b>.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Integer} historyCount The number of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-input_transform">INPUT_TRANSFORM</a> structures that <i>inputTransform</i> can point to.
     * 
     * This value must be no less than 1 and no greater than the value specified in <b>historyCount</b> of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointertouchinfo">GetPointerTouchInfo</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerpeninfo">GetPointerPenInfo</a> (for a single input transform) or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfohistory">GetPointerInfoHistory</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointertouchinfohistory">GetPointerTouchInfoHistory</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerpeninfohistory">GetPointerPenInfoHistory</a> (for an array of input transforms).
     * 
     * If <b>GetPointerInputTransform</b> succeeds, <i>inputTransform</i>  is updated with the total count of structures available. The total count of structures available is the same as the <b>historyCount</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure.
     * @param {Pointer<INPUT_TRANSFORM>} inputTransform Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-input_transform">INPUT_TRANSFORM</a> structures to receive the transform information. This parameter cannot be NULL.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerinputtransform
     * @since windows8.1
     */
    static GetPointerInputTransform(pointerId, historyCount, inputTransform) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerInputTransform", "uint", pointerId, "uint", historyCount, "ptr", inputTransform, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets information about the pointer devices attached to the system.
     * @remarks
     * Windows 8 supports the following:
     * 
     * <ul>
     * <li>256 contacts per pointer device.</li>
     * <li>2560 total contacts per system session, regardless of the number of attached devices. For example, 10 pointer devices with 256 contacts each, 20 pointer devices with 128 contacts each, and so on.</li>
     * </ul>
     * @param {Pointer<Integer>} deviceCount If <i>pointerDevices</i> is NULL, <i>deviceCount</i> returns the total number of attached pointer devices. Otherwise, <i>deviceCount</i> specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_device_info">POINTER_DEVICE_INFO</a> structures pointed to by <i>pointerDevices</i>.
     * @param {Pointer<POINTER_DEVICE_INFO>} pointerDevices Array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_device_info">POINTER_DEVICE_INFO</a> structures for the pointer devices attached to the system. If NULL, the total number of attached pointer devices is returned in <i>deviceCount</i>.
     * @returns {BOOL} If this function succeeds, it returns TRUE.
     *  
     * Otherwise, it returns FALSE. To retrieve extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerdevices
     * @since windows8.0
     */
    static GetPointerDevices(deviceCount, pointerDevices) {
        deviceCountMarshal := deviceCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerDevices", deviceCountMarshal, deviceCount, "ptr", pointerDevices, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets information about the pointer device.
     * @param {HANDLE} device The handle to the device.
     * @param {Pointer<POINTER_DEVICE_INFO>} pointerDevice A <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_device_info">POINTER_DEVICE_INFO</a> structure that contains information about the pointer device.
     * @returns {BOOL} If this function succeeds, it returns TRUE.
     *  
     * Otherwise, it returns FALSE. To retrieve extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerdevice
     * @since windows8.0
     */
    static GetPointerDevice(device, pointerDevice) {
        device := device is Win32Handle ? NumGet(device, "ptr") : device

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerDevice", "ptr", device, "ptr", pointerDevice, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets device properties that aren't included in the POINTER_DEVICE_INFO structure.
     * @param {HANDLE} device The pointer device to query properties from. 
     * 
     * A call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerdevices">GetPointerDevices</a> function returns this handle in the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_device_info">POINTER_DEVICE_INFO</a> structure.
     * @param {Pointer<Integer>} propertyCount The number  of properties. 
     * 
     * Returns the count that's written or needed if <i>pointerProperties</i> is NULL.
     * 
     * If this value is less than the number of properties that the pointer device supports and <i>pointerProperties</i> is not NULL, the function returns the actual number of properties in this variable and fails.
     * @param {Pointer<POINTER_DEVICE_PROPERTY>} pointerProperties The array of properties.
     * @returns {BOOL} TRUE if the function succeeds; otherwise, FALSE. If the function fails, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerdeviceproperties
     * @since windows8.0
     */
    static GetPointerDeviceProperties(device, propertyCount, pointerProperties) {
        device := device is Win32Handle ? NumGet(device, "ptr") : device

        propertyCountMarshal := propertyCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerDeviceProperties", "ptr", device, propertyCountMarshal, propertyCount, "ptr", pointerProperties, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the x and y range for the pointer device (in himetric) and the x and y range (current resolution) for the display that the pointer device is mapped to.
     * @param {HANDLE} device The handle to the pointer device.
     * @param {Pointer<RECT>} pointerDeviceRect The structure for retrieving the device's physical range data.
     * @param {Pointer<RECT>} displayRect The structure for retrieving the display resolution.
     * @returns {BOOL} TRUE if the function succeeds; otherwise, FALSE. If the function fails, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerdevicerects
     * @since windows8.0
     */
    static GetPointerDeviceRects(device, pointerDeviceRect, displayRect) {
        device := device is Win32Handle ? NumGet(device, "ptr") : device

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerDeviceRects", "ptr", device, "ptr", pointerDeviceRect, "ptr", displayRect, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the cursor IDs that are mapped to the cursors associated with a pointer device.
     * @param {HANDLE} device The device handle.
     * @param {Pointer<Integer>} cursorCount The number of cursors associated with the pointer device.
     * @param {Pointer<POINTER_DEVICE_CURSOR_INFO>} deviceCursors An array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_device_cursor_info">POINTER_DEVICE_CURSOR_INFO</a> structures that contain info about the cursors. If NULL, <i>cursorCount</i> returns the number of cursors associated with the pointer device.
     * @returns {BOOL} TRUE if the function succeeds; otherwise, FALSE. If the function fails, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpointerdevicecursors
     * @since windows8.0
     */
    static GetPointerDeviceCursors(device, cursorCount, deviceCursors) {
        device := device is Win32Handle ? NumGet(device, "ptr") : device

        cursorCountMarshal := cursorCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerDeviceCursors", "ptr", device, cursorCountMarshal, cursorCount, "ptr", deviceCursors, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the raw input data from the pointer device.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Integer} historyCount The pointer history.
     * @param {Integer} propertiesCount Number of properties to retrieve.
     * @param {Pointer<POINTER_DEVICE_PROPERTY>} pProperties Array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_device_property">POINTER_DEVICE_PROPERTY</a> structures that contain raw data reported by the device.
     * @param {Pointer<Integer>} pValues The values for <i>pProperties</i>.
     * @returns {BOOL} TRUE if the function succeeds; otherwise, FALSE. If the function fails, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getrawpointerdevicedata
     * @since windows8.0
     */
    static GetRawPointerDeviceData(pointerId, historyCount, propertiesCount, pProperties, pValues) {
        pValuesMarshal := pValues is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetRawPointerDeviceData", "uint", pointerId, "uint", historyCount, "uint", propertiesCount, "ptr", pProperties, pValuesMarshal, pValues, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
