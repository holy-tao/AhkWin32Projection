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
     * 
     * @param {Pointer<IUIAnimationTimerUpdateHandler>} updateHandler 
     * @param {Integer} idleBehavior 
     * @returns {HRESULT} 
     */
    SetTimerUpdateHandler(updateHandler, idleBehavior) {
        result := ComCall(3, this, "ptr", updateHandler, "int", idleBehavior, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationTimerEventHandler>} handler 
     * @returns {HRESULT} 
     */
    SetTimerEventHandler(handler) {
        result := ComCall(4, this, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Enable() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disable() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsEnabled() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} seconds 
     * @returns {HRESULT} 
     */
    GetTime(seconds) {
        result := ComCall(8, this, "double*", seconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} framesPerSecond 
     * @returns {HRESULT} 
     */
    SetFrameRateThreshold(framesPerSecond) {
        result := ComCall(9, this, "uint", framesPerSecond, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
