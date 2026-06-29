#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\UI_ANIMATION_IDLE_BEHAVIOR.ahk" { UI_ANIMATION_IDLE_BEHAVIOR }
#Import ".\IUIAnimationTimerEventHandler.ahk" { IUIAnimationTimerEventHandler }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAnimationTimerUpdateHandler.ahk" { IUIAnimationTimerUpdateHandler }

/**
 * Defines an animation timer, which provides services for managing animation timing.
 * @remarks
 * A timer helps to manage animation rendering by automatically indicating the passage of a small unit of time, called a tick. In turn, ticks can trigger animation rendering or other animation events. Each animation timer provides timing for a single animation manager.
 * 
 * The timing system is designed to provide the necessary timing services needed to support animations and does not require applications to play an explicit role in generating the ticks. The animation timer can be set up to automatically update the animation manager for each tick without application-side handling.
 * 
 * An application may not need to use a timer with Windows Animation, depending on the graphics platform it is using. For example, an application drawing with Direct2D or Direct3D can synchronize to monitor's refresh rate, yielding very smooth animation. However, such applications may still find the <b>IUIAnimationTimer</b> interface useful for its <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimer-gettime">GetTime</a> method, which returns an accurate system time in <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-seconds">UI_ANIMATION_SECONDS</a>, the units used throughout the Windows Animation API.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationtimer
 * @namespace Windows.Win32.UI.Animation
 */
export default struct IUIAnimationTimer extends IUnknown {
    /**
     * The interface identifier for IUIAnimationTimer
     * @type {Guid}
     */
    static IID := Guid("{6b0efad1-a053-41d6-9085-33a689144665}")

    /**
     * The class identifier for UIAnimationTimer
     * @type {Guid}
     */
    static CLSID := Guid("{bfcd4a0c-06b6-4384-b768-0daa792c380e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAnimationTimer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetTimerUpdateHandler : IntPtr
        SetTimerEventHandler  : IntPtr
        Enable                : IntPtr
        Disable               : IntPtr
        IsEnabled             : IntPtr
        GetTime               : IntPtr
        SetFrameRateThreshold : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAnimationTimer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies a timer update handler.
     * @remarks
     * The timer update handler receives time updates (ticks) from the timer. The timer indicates an update by calling 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimerupdatehandler-onupdate">IUIAnimationTimerUpdateHandler::OnUpdate</a>      
     *       method on the specified handler.
     * 
     * Passing <b>NULL</b> for the <i>updateHandler</i> parameter causes Windows Animation to release its reference to any handler object you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager-shutdown">IUIAnimationManager::Shutdown</a> method.
     * @param {IUIAnimationTimerUpdateHandler} updateHandler A timer update handler, or <b>NULL</b> (see Remarks).  The specified object must implement the
     *                <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtimerupdatehandler">IUIAnimationTimerUpdateHandler</a> interface.
     * @param {UI_ANIMATION_IDLE_BEHAVIOR} idleBehavior A member of 
     *                <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_idle_behavior">UI_ANIMATION_IDLE_BEHAVIOR</a> 
     *                that specifies the behavior of the timer when it is idle.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If the update handler is already connected to a timer, this method returns <b>UI_E_TIMER_CLIENT_ALREADY_CONNECTED</b>. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-settimerupdatehandler
     */
    SetTimerUpdateHandler(updateHandler, idleBehavior) {
        result := ComCall(3, this, "ptr", updateHandler, UI_ANIMATION_IDLE_BEHAVIOR, idleBehavior, "HRESULT")
        return result
    }

    /**
     * Specifies a timer event handler.
     * @remarks
     * Timing events include the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onpreupdate">OnPreUpdate</a>,
     *        <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onpostupdate">OnPostUpdate</a>, and
     *        <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onrenderingtooslow">OnRenderingTooSlow</a> methods of the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtimereventhandler">IUIAnimationTimerEventHandler</a> interface.
     * 
     * Passing <b>NULL</b> for the <i>handler</i> parameter causes Windows Animation to release its reference to any handler object you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager-shutdown">IUIAnimationManager::Shutdown</a> method.
     * @param {IUIAnimationTimerEventHandler} handler A timer event handler.  The specified object must implement the
     *                <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtimereventhandler">IUIAnimationTimerEventHandler</a> interface or be <b>NULL</b>. See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-settimereventhandler
     */
    SetTimerEventHandler(handler) {
        result := ComCall(4, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Enables the animation timer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-enable
     */
    Enable() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Disables the animation timer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-disable
     */
    Disable() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Determines whether the timer is currently enabled.
     * @returns {HRESULT} Returns S_OK if the animation timer is enabled, S_FALSE if the animation timer is disabled, or an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-isenabled
     */
    IsEnabled() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Gets the current time.
     * @remarks
     * This method can be used in both the application-driven and timer-driven  configurations to retrieve the system time in <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-seconds">UI_ANIMATION_SECONDS</a>, the units used throughout the Windows Animation API.
     * @returns {Float} The current time, in <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-seconds">UI_ANIMATION_SECONDS</a>.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-gettime
     */
    GetTime() {
        result := ComCall(8, this, "double*", &seconds := 0, "HRESULT")
        return seconds
    }

    /**
     * Sets the frame rate below which the timer notifies the application that rendering is too slow.
     * @remarks
     * If the rendering frame rate for an animation falls below the specified frame rate, an 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onrenderingtooslow">IUIAnimationTimerEventHandler::OnRenderingTooSlow</a> event is raised.
     * @param {Integer} framesPerSecond The minimum desirable frame rate, in frames per second.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-setframeratethreshold
     */
    SetFrameRateThreshold(framesPerSecond) {
        result := ComCall(9, this, "uint", framesPerSecond, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAnimationTimer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTimerUpdateHandler := CallbackCreate(GetMethod(implObj, "SetTimerUpdateHandler"), flags, 3)
        this.vtbl.SetTimerEventHandler := CallbackCreate(GetMethod(implObj, "SetTimerEventHandler"), flags, 2)
        this.vtbl.Enable := CallbackCreate(GetMethod(implObj, "Enable"), flags, 1)
        this.vtbl.Disable := CallbackCreate(GetMethod(implObj, "Disable"), flags, 1)
        this.vtbl.IsEnabled := CallbackCreate(GetMethod(implObj, "IsEnabled"), flags, 1)
        this.vtbl.GetTime := CallbackCreate(GetMethod(implObj, "GetTime"), flags, 2)
        this.vtbl.SetFrameRateThreshold := CallbackCreate(GetMethod(implObj, "SetFrameRateThreshold"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTimerUpdateHandler)
        CallbackFree(this.vtbl.SetTimerEventHandler)
        CallbackFree(this.vtbl.Enable)
        CallbackFree(this.vtbl.Disable)
        CallbackFree(this.vtbl.IsEnabled)
        CallbackFree(this.vtbl.GetTime)
        CallbackFree(this.vtbl.SetFrameRateThreshold)
    }
}
