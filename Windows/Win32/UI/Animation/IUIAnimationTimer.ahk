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
     * 
     * @param {IUIAnimationTimerUpdateHandler} updateHandler 
     * @param {Integer} idleBehavior 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-settimerupdatehandler
     */
    SetTimerUpdateHandler(updateHandler, idleBehavior) {
        result := ComCall(3, this, "ptr", updateHandler, "int", idleBehavior, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationTimerEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-settimereventhandler
     */
    SetTimerEventHandler(handler) {
        result := ComCall(4, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-enable
     */
    Enable() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-disable
     */
    Disable() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-isenabled
     */
    IsEnabled() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-gettime
     */
    GetTime() {
        result := ComCall(8, this, "double*", &seconds := 0, "HRESULT")
        return seconds
    }

    /**
     * 
     * @param {Integer} framesPerSecond 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimer-setframeratethreshold
     */
    SetFrameRateThreshold(framesPerSecond) {
        result := ComCall(9, this, "uint", framesPerSecond, "HRESULT")
        return result
    }
}
