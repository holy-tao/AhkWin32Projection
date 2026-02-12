#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class IInputInjector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputInjector
     * @type {Guid}
     */
    static IID => Guid("{8ec26f84-0b02-4bd2-ad7a-3d4658be3e18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InjectKeyboardInput", "InjectMouseInput", "InitializeTouchInjection", "InjectTouchInput", "UninitializeTouchInjection", "InitializePenInjection", "InjectPenInput", "UninitializePenInjection", "InjectShortcut"]

    /**
     * 
     * @param {IIterable<InjectedInputKeyboardInfo>} input_ 
     * @returns {HRESULT} 
     */
    InjectKeyboardInput(input_) {
        result := ComCall(6, this, "ptr", input_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<InjectedInputMouseInfo>} input_ 
     * @returns {HRESULT} 
     */
    InjectMouseInput(input_) {
        result := ComCall(7, this, "ptr", input_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @param {Integer} visualMode 
     * @returns {HRESULT} If the function succeeds, the return value is TRUE.
     * 
     * If the function fails, the return value is FALSE. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-initializetouchinjection
     */
    InitializeTouchInjection(visualMode) {
        result := ComCall(8, this, "int", visualMode, "int")
        if(result != 0) {
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
     * @param {IIterable<InjectedInputTouchInfo>} input_ 
     * @returns {HRESULT} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-injecttouchinput
     */
    InjectTouchInput(input_) {
        result := ComCall(9, this, "ptr", input_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UninitializeTouchInjection() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} visualMode 
     * @returns {HRESULT} 
     */
    InitializePenInjection(visualMode) {
        result := ComCall(11, this, "int", visualMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {InjectedInputPenInfo} input_ 
     * @returns {HRESULT} 
     */
    InjectPenInput(input_) {
        result := ComCall(12, this, "ptr", input_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UninitializePenInjection() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} shortcut 
     * @returns {HRESULT} 
     */
    InjectShortcut(shortcut) {
        result := ComCall(14, this, "int", shortcut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
