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
     * @returns {Integer} The screen location of the pointer input.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getunpredictedmessagepos
     * @since windows8.0
     */
    static GetUnpredictedMessagePos() {
        result := DllCall("USER32.dll\GetUnpredictedMessagePos", "uint")
        return result
    }

    /**
     * Configures the touch injection context for the calling application and initializes the maximum number of simultaneous contacts that the app can inject.
     * @param {Integer} maxCount The maximum number of touch contacts. 
     * 
     * The <i>maxCount</i> parameter must be greater than 0 and less than or equal to MAX_TOUCH_COUNT (256) as  defined in winuser.h.
     * @param {Integer} dwMode The contact visualization mode. 
     * 
     * The <i>dwMode</i> parameter must be   <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_touchinjection/constants">TOUCH_FEEDBACK_DEFAULT</a>, <b>TOUCH_FEEDBACK_INDIRECT</b>, or <b>TOUCH_FEEDBACK_NONE</b>.
     * @returns {BOOL} If the function succeeds, the return value is TRUE.
     * 
     * If the function fails, the return value is FALSE. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-initializetouchinjection
     * @since windows8.0
     */
    static InitializeTouchInjection(maxCount, dwMode) {
        A_LastError := 0

        result := DllCall("USER32.dll\InitializeTouchInjection", "uint", maxCount, "uint", dwMode, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Simulates touch input.
     * @param {Integer} count The size of the array in <i>contacts</i>. 
     * 
     * The maximum value for <i>count</i> is specified by the <i>maxCount</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-initializetouchinjection">InitializeTouchInjection</a> function.
     * @param {Pointer<POINTER_TOUCH_INFO>} contacts Array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_touch_info">POINTER_TOUCH_INFO</a> structures that represents all contacts on the desktop. The  screen coordinates of each contact must be within the bounds of the desktop.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-injecttouchinput
     * @since windows8.0
     */
    static InjectTouchInput(count, contacts) {
        A_LastError := 0

        result := DllCall("USER32.dll\InjectTouchInput", "uint", count, "ptr", contacts, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the pointer type for a specified pointer.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve pointer type.
     * @param {Pointer<Integer>} pointerType An address of a <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">POINTER_INPUT_TYPE</a> type to receive a pointer input type.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointertype
     * @since windows8.0
     */
    static GetPointerType(pointerId, pointerType) {
        pointerTypeMarshal := pointerType is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerType", "uint", pointerId, pointerTypeMarshal, pointerType, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the cursor identifier associated with the specified pointer.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve the cursor identifier.
     * @param {Pointer<Integer>} cursorId An address of a <b>UINT32</b> to receive the tablet cursor identifier, if any, associated with the specified pointer.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointercursorid
     * @since windows8.0
     */
    static GetPointerCursorId(pointerId, cursorId) {
        cursorIdMarshal := cursorId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerCursorId", "uint", pointerId, cursorIdMarshal, cursorId, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the information for the specified pointer associated with the current message.
     * @param {Integer} pointerId The pointer identifier.
     * @param {Pointer<POINTER_INFO>} pointerInfo Address of a  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure that receives the pointer information.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerinfo
     * @since windows8.0
     */
    static GetPointerInfo(pointerId, pointerInfo) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerInfo", "uint", pointerId, "ptr", pointerInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the information associated with the individual inputs, if any, that were coalesced into the current message for the specified pointer.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Pointer<Integer>} entriesCount A pointer to a variable that specifies the count of structures in the buffer to which pointerInfo points. If <b>GetPointerInfoHistory</b> succceeds, <i>entriesCount</i>  is updated with the total count of structures available. The total count of structures available is the same as the <b>historyCount</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a>.
     * @param {Pointer<POINTER_INFO>} pointerInfo Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structures to receive the pointer information. This parameter can be NULL if <i>*entriesCount</i> is zero.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerinfohistory
     * @since windows8.0
     */
    static GetPointerInfoHistory(pointerId, entriesCount, pointerInfo) {
        entriesCountMarshal := entriesCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerInfoHistory", "uint", pointerId, entriesCountMarshal, entriesCount, "ptr", pointerInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the entire frame of information for the specified pointers associated with the current message.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve frame information.
     * @param {Pointer<Integer>} pointerCount A pointer to a variable that specifies the count of structures in the buffer to which pointerInfo points. If <b>GetPointerFrameInfo</b> succeeds, <i>pointerCount</i> is updated with the total count of pointers in the frame.
     * @param {Pointer<POINTER_INFO>} pointerInfo Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structures to receive the pointer information. This parameter can be <b>NULL</b> if <i>*pointerCount</i> is zero.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerframeinfo
     * @since windows8.0
     */
    static GetPointerFrameInfo(pointerId, pointerCount, pointerInfo) {
        pointerCountMarshal := pointerCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerFrameInfo", "uint", pointerId, pointerCountMarshal, pointerCount, "ptr", pointerInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the entire frame of information (including coalesced input frames) for the specified pointers associated with the current message.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve frame information.
     * @param {Pointer<Integer>} entriesCount A pointer to a variable that specifies the count of rows in the two-dimensional array to which pointerInfo points. If <b>GetPointerFrameInfoHistory</b> succeeds, <i>entriesCount</i> is updated with the total count of frames available in the history.
     * @param {Pointer<Integer>} pointerCount A pointer to a variable that specifies the count of columns in the two-dimensional array to which pointerInfo points. If <b>GetPointerFrameInfoHistory</b> succeeds, <i>pointerCount</i> is updated with the total count of pointers in each frame.
     * @param {Pointer<POINTER_INFO>} pointerInfo Address of a two-dimensional array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structures to receive the pointer information. This parameter can be NULL if <i>*entriesCount</i> and <i>*pointerCount</i> are both zero.
     * 
     * This array is interpreted as <c>POINTER_INFO[*entriesCount][*pointerCount]</c>.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerframeinfohistory
     * @since windows8.0
     */
    static GetPointerFrameInfoHistory(pointerId, entriesCount, pointerCount, pointerInfo) {
        entriesCountMarshal := entriesCount is VarRef ? "uint*" : "ptr"
        pointerCountMarshal := pointerCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerFrameInfoHistory", "uint", pointerId, entriesCountMarshal, entriesCount, pointerCountMarshal, pointerCount, "ptr", pointerInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the touch-based information for the specified pointer (of type PT_TOUCH) associated with the current message.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Pointer<POINTER_TOUCH_INFO>} touchInfo Address of a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_touch_info">POINTER_TOUCH_INFO</a> structure to receive the touch-specific pointer information.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointertouchinfo
     * @since windows8.0
     */
    static GetPointerTouchInfo(pointerId, touchInfo) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerTouchInfo", "uint", pointerId, "ptr", touchInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the touch-based information associated with the individual inputs, if any, that were coalesced into the current message for the specified pointer (of type PT_TOUCH).
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Pointer<Integer>} entriesCount A pointer to a variable that specifies the count of structures in the buffer to which touchInfo points. If <b>GetPointerTouchInfoHistory</b> succeeds, <i>entriesCount</i> is updated with the total count of structures available. The total count of structures available is the same as the <i>historyCount</i> field in the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointertouchinfo">GetPointerTouchInfo</a>.
     * @param {Pointer<POINTER_TOUCH_INFO>} touchInfo Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_touch_info">POINTER_TOUCH_INFO</a> structures to receive the pointer information. This parameter can be NULL if *entriesCount is zero.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointertouchinfohistory
     * @since windows8.0
     */
    static GetPointerTouchInfoHistory(pointerId, entriesCount, touchInfo) {
        entriesCountMarshal := entriesCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerTouchInfoHistory", "uint", pointerId, entriesCountMarshal, entriesCount, "ptr", touchInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the entire frame of touch-based information for the specified pointers (of type PT_TOUCH) associated with the current message.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve frame information.
     * @param {Pointer<Integer>} pointerCount A pointer to a variable that specifies the count of structures in the buffer to which touchInfo points. If <b>GetPointerFrameTouchInfo</b> succeeds, <i>pointerCount</i> is updated with the total count of pointers in the frame.
     * @param {Pointer<POINTER_TOUCH_INFO>} touchInfo Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_touch_info">POINTER_TOUCH_INFO</a> structures to receive the pointer information. This parameter can be NULL if <i>*pointerCount</i> is zero.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerframetouchinfo
     * @since windows8.0
     */
    static GetPointerFrameTouchInfo(pointerId, pointerCount, touchInfo) {
        pointerCountMarshal := pointerCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerFrameTouchInfo", "uint", pointerId, pointerCountMarshal, pointerCount, "ptr", touchInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the entire frame of touch-based information (including coalesced input frames) for the specified pointers (of type PT_TOUCH) associated with the current message.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve frame information.
     * @param {Pointer<Integer>} entriesCount A pointer to variable that specifies the count of rows in the two-dimensional array to which touchInfo points. If <b>GetPointerFrameTouchInfoHistory</b> succeeds,  <i>entriesCount</i> is updated with the total count of frames available in the history.
     * @param {Pointer<Integer>} pointerCount A pointer to a variable that specifies the count of columns in the two-dimensional array to which touchInfo points. If <b>GetPointerFrameTouchInfoHistory</b> succeeds, <i>pointerCount</i> is updated with the total count of pointers in each frame.
     * @param {Pointer<POINTER_TOUCH_INFO>} touchInfo Address of a two-dimensional array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_touch_info">POINTER_TOUCH_INFO</a> structures to receive the pointer information. This parameter can be NULL if <i>*entriesCount</i> and <i>*pointerCount</i> are both zero.
     * 
     * This array is interpreted as <c>POINTER_TOUCH_INFO[*entriesCount][*pointerCount]</c>.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerframetouchinfohistory
     * @since windows8.0
     */
    static GetPointerFrameTouchInfoHistory(pointerId, entriesCount, pointerCount, touchInfo) {
        entriesCountMarshal := entriesCount is VarRef ? "uint*" : "ptr"
        pointerCountMarshal := pointerCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerFrameTouchInfoHistory", "uint", pointerId, entriesCountMarshal, entriesCount, pointerCountMarshal, pointerCount, "ptr", touchInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the pen-based information for the specified pointer (of type PT_PEN) associated with the current message.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Pointer<POINTER_PEN_INFO>} penInfo Address of a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_pen_info">POINTER_PEN_INFO</a> structure to receive the pen-specific pointer information.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerpeninfo
     * @since windows8.0
     */
    static GetPointerPenInfo(pointerId, penInfo) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerPenInfo", "uint", pointerId, "ptr", penInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the pen-based information associated with the individual inputs, if any, that were coalesced into the current message for the specified pointer (of type PT_PEN).
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
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerpeninfohistory
     * @since windows8.0
     */
    static GetPointerPenInfoHistory(pointerId, entriesCount, penInfo) {
        entriesCountMarshal := entriesCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerPenInfoHistory", "uint", pointerId, entriesCountMarshal, entriesCount, "ptr", penInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the entire frame of pen-based information for the specified pointers (of type PT_PEN) associated with the current message.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve frame information.
     * @param {Pointer<Integer>} pointerCount A pointer to a variable that specifies the count of structures in the buffer to which penInfo points. If <b>GetPointerFramePenInfo</b> succeeds, <i>pointerCount</i>  is updated with the total count of pointers in the frame.
     * @param {Pointer<POINTER_PEN_INFO>} penInfo Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_pen_info">POINTER_PEN_INFO</a> structures to receive the pointer information. This parameter can be NULL if <i>*pointerCount</i> is zero.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerframepeninfo
     * @since windows8.0
     */
    static GetPointerFramePenInfo(pointerId, pointerCount, penInfo) {
        pointerCountMarshal := pointerCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerFramePenInfo", "uint", pointerId, pointerCountMarshal, pointerCount, "ptr", penInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the entire frame of pen-based information (including coalesced input frames) for the specified pointers (of type PT_PEN) associated with the current message.
     * @param {Integer} pointerId The identifier of the pointer for which to retrieve frame information.
     * @param {Pointer<Integer>} entriesCount A pointer to a variable that specifies the count of rows in the two-dimensional array to which penInfo points. If <b>GetPointerFramePenInfoHistory</b> succeeds,  <i>entriesCount</i> is updated with the total count of frames available in the history.
     * @param {Pointer<Integer>} pointerCount A pointer to a variaable that specifies the count of columns in the two-dimensional array to which penInfo points. If <b>GetPointerFramePenInfoHistory</b> succeeds, <i>pointerCount</i> is updated with  the total count of pointers in each frame.
     * @param {Pointer<POINTER_PEN_INFO>} penInfo Address of a two-dimensional array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_pen_info">POINTER_PEN_INFO</a> structures to receive the pointer information. This parameter can be NULL if *entriesCount and *pointerCount are both zero.
     * 
     * 
     * This array is interpreted as POINTER_PEN_INFO[*entriesCount][*pointerCount].
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerframepeninfohistory
     * @since windows8.0
     */
    static GetPointerFramePenInfoHistory(pointerId, entriesCount, pointerCount, penInfo) {
        entriesCountMarshal := entriesCount is VarRef ? "uint*" : "ptr"
        pointerCountMarshal := pointerCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerFramePenInfoHistory", "uint", pointerId, entriesCountMarshal, entriesCount, pointerCountMarshal, pointerCount, "ptr", penInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines which pointer input frame generated the most recently retrieved message for the specified pointer and discards any queued (unretrieved) pointer input messages generated from the same pointer input frame.
     * @param {Integer} pointerId Identifier of the pointer. Pending messages will be skipped for the frame that includes the most recently retrieved input for this pointer.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-skippointerframemessages
     * @since windows8.0
     */
    static SkipPointerFrameMessages(pointerId) {
        A_LastError := 0

        result := DllCall("USER32.dll\SkipPointerFrameMessages", "uint", pointerId, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Simulates pointer input (pen or touch).
     * @param {HSYNTHETICPOINTERDEVICE} device A handle to the pointer injection device created by <a href="../winuser/nf-winuser-createsyntheticpointerdevice.md">CreateSyntheticPointerDevice</a>.
     * @param {Pointer<POINTER_TYPE_INFO>} pointerInfo Array of injected pointers.
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
     * Otherwise, it returns FALSE. To retrieve extended error information, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-injectsyntheticpointerinput
     * @since windows10.0.17763
     */
    static InjectSyntheticPointerInput(device, pointerInfo, count) {
        device := device is Win32Handle ? NumGet(device, "ptr") : device

        A_LastError := 0

        result := DllCall("USER32.dll\InjectSyntheticPointerInput", "ptr", device, "ptr", pointerInfo, "uint", count, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Destroys the specified pointer injection device.
     * @param {HSYNTHETICPOINTERDEVICE} device A handle to the pointer injection device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-destroysyntheticpointerdevice
     * @since windows10.0.17763
     */
    static DestroySyntheticPointerDevice(device) {
        device := device is Win32Handle ? NumGet(device, "ptr") : device

        DllCall("USER32.dll\DestroySyntheticPointerDevice", "ptr", device)
    }

    /**
     * Enables the mouse to act as a pointer input device and send WM_POINTER messages.
     * @param {BOOL} fEnable <b>TRUE</b> to turn on mouse input support in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/messages">WM_POINTER</a>.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enablemouseinpointer
     * @since windows8.0
     */
    static EnableMouseInPointer(fEnable) {
        A_LastError := 0

        result := DllCall("USER32.dll\EnableMouseInPointer", "int", fEnable, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Indicates whether EnableMouseInPointer is set for the mouse to act as a pointer input device and send WM_POINTER messages.
     * @returns {BOOL} If <a href="/windows/desktop/api/winuser/nf-winuser-enablemouseinpointer">EnableMouseInPointer</a> is set, the return value is nonzero.
     * 
     * If <a href="/windows/desktop/api/winuser/nf-winuser-enablemouseinpointer">EnableMouseInPointer</a> is not set, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-ismouseinpointerenabled
     * @since windows8.0
     */
    static IsMouseInPointerEnabled() {
        result := DllCall("USER32.dll\IsMouseInPointerEnabled", "int")
        return result
    }

    /**
     * Gets one or more transforms for the pointer information coordinates associated with the current message.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Integer} historyCount The number of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-input_transform">INPUT_TRANSFORM</a> structures that <i>inputTransform</i> can point to.
     * 
     * This value must be no less than 1 and no greater than the value specified in <b>historyCount</b> of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfo">GetPointerInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointertouchinfo">GetPointerTouchInfo</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerpeninfo">GetPointerPenInfo</a> (for a single input transform) or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfohistory">GetPointerInfoHistory</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointertouchinfohistory">GetPointerTouchInfoHistory</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerpeninfohistory">GetPointerPenInfoHistory</a> (for an array of input transforms).
     * 
     * If <b>GetPointerInputTransform</b> succeeds, <i>inputTransform</i>  is updated with the total count of structures available. The total count of structures available is the same as the <b>historyCount</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure.
     * @param {Pointer<INPUT_TRANSFORM>} inputTransform Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-input_transform">INPUT_TRANSFORM</a> structures to receive the transform information. This parameter cannot be NULL.
     * @returns {BOOL} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerinputtransform
     * @since windows8.1
     */
    static GetPointerInputTransform(pointerId, historyCount, inputTransform) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerInputTransform", "uint", pointerId, "uint", historyCount, "ptr", inputTransform, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets information about the pointer devices attached to the system.
     * @param {Pointer<Integer>} deviceCount If <i>pointerDevices</i> is NULL, <i>deviceCount</i> returns the total number of attached pointer devices. Otherwise, <i>deviceCount</i> specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_device_info">POINTER_DEVICE_INFO</a> structures pointed to by <i>pointerDevices</i>.
     * @param {Pointer<POINTER_DEVICE_INFO>} pointerDevices Array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_device_info">POINTER_DEVICE_INFO</a> structures for the pointer devices attached to the system. If NULL, the total number of attached pointer devices is returned in <i>deviceCount</i>.
     * @returns {BOOL} If this function succeeds, it returns TRUE.
     *  
     * Otherwise, it returns FALSE. To retrieve extended error information, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerdevices
     * @since windows8.0
     */
    static GetPointerDevices(deviceCount, pointerDevices) {
        deviceCountMarshal := deviceCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerDevices", deviceCountMarshal, deviceCount, "ptr", pointerDevices, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets information about the pointer device.
     * @param {HANDLE} device The handle to the device.
     * @param {Pointer<POINTER_DEVICE_INFO>} pointerDevice A <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_device_info">POINTER_DEVICE_INFO</a> structure that contains information about the pointer device.
     * @returns {BOOL} If this function succeeds, it returns TRUE.
     *  
     * Otherwise, it returns FALSE. To retrieve extended error information, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerdevice
     * @since windows8.0
     */
    static GetPointerDevice(device, pointerDevice) {
        device := device is Win32Handle ? NumGet(device, "ptr") : device

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerDevice", "ptr", device, "ptr", pointerDevice, "int")
        if(!result && A_LastError)
            throw OSError()

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
     * @returns {BOOL} TRUE if the function succeeds; otherwise, FALSE. If the function fails, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerdeviceproperties
     * @since windows8.0
     */
    static GetPointerDeviceProperties(device, propertyCount, pointerProperties) {
        device := device is Win32Handle ? NumGet(device, "ptr") : device

        propertyCountMarshal := propertyCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerDeviceProperties", "ptr", device, propertyCountMarshal, propertyCount, "ptr", pointerProperties, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the x and y range for the pointer device (in himetric) and the x and y range (current resolution) for the display that the pointer device is mapped to.
     * @param {HANDLE} device The handle to the pointer device.
     * @param {Pointer<RECT>} pointerDeviceRect The structure for retrieving the device's physical range data.
     * @param {Pointer<RECT>} displayRect The structure for retrieving the display resolution.
     * @returns {BOOL} TRUE if the function succeeds; otherwise, FALSE. If the function fails, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerdevicerects
     * @since windows8.0
     */
    static GetPointerDeviceRects(device, pointerDeviceRect, displayRect) {
        device := device is Win32Handle ? NumGet(device, "ptr") : device

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerDeviceRects", "ptr", device, "ptr", pointerDeviceRect, "ptr", displayRect, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the cursor IDs that are mapped to the cursors associated with a pointer device.
     * @param {HANDLE} device The device handle.
     * @param {Pointer<Integer>} cursorCount The number of cursors associated with the pointer device.
     * @param {Pointer<POINTER_DEVICE_CURSOR_INFO>} deviceCursors An array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_device_cursor_info">POINTER_DEVICE_CURSOR_INFO</a> structures that contain info about the cursors. If NULL, <i>cursorCount</i> returns the number of cursors associated with the pointer device.
     * @returns {BOOL} TRUE if the function succeeds; otherwise, FALSE. If the function fails, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpointerdevicecursors
     * @since windows8.0
     */
    static GetPointerDeviceCursors(device, cursorCount, deviceCursors) {
        device := device is Win32Handle ? NumGet(device, "ptr") : device

        cursorCountMarshal := cursorCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetPointerDeviceCursors", "ptr", device, cursorCountMarshal, cursorCount, "ptr", deviceCursors, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the raw input data from the pointer device.
     * @param {Integer} pointerId An identifier of the pointer for which to retrieve information.
     * @param {Integer} historyCount The pointer history.
     * @param {Integer} propertiesCount Number of properties to retrieve.
     * @param {Pointer<POINTER_DEVICE_PROPERTY>} pProperties Array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_device_property">POINTER_DEVICE_PROPERTY</a> structures that contain raw data reported by the device.
     * @param {Pointer<Integer>} pValues The values for <i>pProperties</i>.
     * @returns {BOOL} TRUE if the function succeeds; otherwise, FALSE. If the function fails, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getrawpointerdevicedata
     * @since windows8.0
     */
    static GetRawPointerDeviceData(pointerId, historyCount, propertiesCount, pProperties, pValues) {
        pValuesMarshal := pValues is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetRawPointerDeviceData", "uint", pointerId, "uint", historyCount, "uint", propertiesCount, "ptr", pProperties, pValuesMarshal, pValues, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
