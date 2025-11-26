#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines an animation timer, which provides services for managing animation timing.
 * @remarks
 * 
 * A timer helps to manage animation rendering by automatically indicating the passage of a small unit of time, called a tick. In turn, ticks can trigger animation rendering or other animation events. Each animation timer provides timing for a single animation manager.
 * 
 * The timing system is designed to provide the necessary timing services needed to support animations and does not require applications to play an explicit role in generating the ticks. The animation timer can be set up to automatically update the animation manager for each tick without application-side handling.
 * 
 * An application may not need to use a timer with Windows Animation, depending on the graphics platform it is using. For example, an application drawing with Direct2D or Direct3D can synchronize to monitor's refresh rate, yielding very smooth animation. However, such applications may still find the <b>IUIAnimationTimer</b> interface useful for its <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimer-gettime">GetTime</a> method, which returns an accurate system time in <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-seconds">UI_ANIMATION_SECONDS</a>, the units used throughout the Windows Animation API.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationtimer
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationTimer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationTimer
     * @type {Guid}
     */
    static IID => Guid("{6b0efad1-a053-41d6-9085-33a689144665}")

    /**
     * The class identifier for UIAnimationTimer
     * @type {Guid}
     */
    static CLSID => Guid("{bfcd4a0c-06b6-4384-b768-0daa792c380e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTimerUpdateHandler", "SetTimerEventHandler", "Enable", "Disable", "IsEnabled", "GetTime", "SetFrameRateThreshold"]

    /**
     * Specifies a timer update handler.
     * @param {IUIAnimationTimerUpdateHandler} updateHandler A timer update handler, or <b>NULL</b> (see Remarks).  The specified object must implement the
     *                <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtimerupdatehandler">IUIAnimationTimerUpdateHandler</a> interface.
     * @param {Integer} idleBehavior A member of 
     *                <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_idle_behavior">UI_ANIMATION_IDLE_BEHAVIOR</a> 
     *                that specifies the behavior of the timer when it is idle.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If the update handler is already connected to a timer, this method returns <b>UI_E_TIMER_CLIENT_ALREADY_CONNECTED</b>. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationtimer-settimerupdatehandler
     */
    SetTimerUpdateHandler(updateHandler, idleBehavior) {
        result := ComCall(3, this, "ptr", updateHandler, "int", idleBehavior, "HRESULT")
        return result
    }

    /**
     * Specifies a timer event handler.
     * @param {IUIAnimationTimerEventHandler} handler A timer event handler.  The specified object must implement the
     *                <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtimereventhandler">IUIAnimationTimerEventHandler</a> interface or be <b>NULL</b>. See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationtimer-settimereventhandler
     */
    SetTimerEventHandler(handler) {
        result := ComCall(4, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Enables the animation timer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationtimer-enable
     */
    Enable() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Disables the animation timer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationtimer-disable
     */
    Disable() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Determines whether the timer is currently enabled.
     * @returns {HRESULT} Returns S_OK if the animation timer is enabled, S_FALSE if the animation timer is disabled, or an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationtimer-isenabled
     */
    IsEnabled() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Gets the current time.
     * @returns {Float} The current time, in <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-seconds">UI_ANIMATION_SECONDS</a>.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationtimer-gettime
     */
    GetTime() {
        result := ComCall(8, this, "double*", &seconds := 0, "HRESULT")
        return seconds
    }

    /**
     * Sets the frame rate below which the timer notifies the application that rendering is too slow.
     * @param {Integer} framesPerSecond The minimum desirable frame rate, in frames per second.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationtimer-setframeratethreshold
     */
    SetFrameRateThreshold(framesPerSecond) {
        result := ComCall(9, this, "uint", framesPerSecond, "HRESULT")
        return result
    }
}
