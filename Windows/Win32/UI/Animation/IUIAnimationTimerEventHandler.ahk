#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for handling timing events.
 * @remarks
 * Use 
 *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimer-settimereventhandler">SetTimerEventHandler</a> to specify the timing events handler for an instance of
 *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtimer">IUIAnimationTimer</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationtimereventhandler
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationTimerEventHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationTimerEventHandler
     * @type {Guid}
     */
    static IID => Guid("{274a7dea-d771-4095-abbd-8df7abd23ce3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnPreUpdate", "OnPostUpdate", "OnRenderingTooSlow"]

    /**
     * Handles events that occur before an animation update begins.
     * @remarks
     * For each tick, a timer calls the following sequence of methods:
     * 
     * <ul>
     * <li><b>IUIAnimationTimerEventHandler::OnPreUpdate</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimerupdatehandler-onupdate">IUIAnimationTimerUpdateHandler::OnUpdate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onpostupdate">IUIAnimationTimerEventHandler::OnPostUpdate</a>
     * </li>
     * </ul>
     * <b>OnPreUpdate</b> and <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onpostupdate">OnPostUpdate</a> are called on the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtimereventhandler">IUIAnimationTimerEventHandler</a> registered with the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimer-settimereventhandler">IUIAnimationTimer::SetTimerEventHandler</a> method. <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimerupdatehandler-onupdate">OnUpdate</a> is called on the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtimerupdatehandler">IUIAnimationTimerUpdateHandler</a>  registered with the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimer-settimerupdatehandler">IUIAnimationTimer::SetTimerUpdateHandler</a> method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">UIAnimation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onpreupdate
     */
    OnPreUpdate() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Handles events that occur after an animation update is finished.
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317021(v=vs.85)">UIAnimationTimer</a> object calls this method only when calls to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimerupdatehandler-onupdate">IUIAnimationTimerUpdateHandler::OnUpdate</a> return a result of <b>UI_ANIMATION_UPDATE_VARIABLES_CHANGED</b>.
     * 
     * For each tick, a timer calls the following sequence of methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onpreupdate">IUIAnimationTimerEventHandler::OnPreUpdate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimerupdatehandler-onupdate">IUIAnimationTimerUpdateHandler::OnUpdate</a>
     * </li>
     * <li><b>IUIAnimationTimerEventHandler::OnPostUpdate</b></li>
     * </ul>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onpreupdate">OnPreUpdate</a> and <b>OnPostUpdate</b> are called on the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtimereventhandler">IUIAnimationTimerEventHandler</a> registered with <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimer-settimereventhandler">IUIAnimationTimer::SetTimerEventHandler</a>. <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimerupdatehandler-onupdate">OnUpdate</a> is called on the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtimerupdatehandler">IUIAnimationTimerUpdateHandler</a>  registered with <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimer-settimerupdatehandler">IUIAnimationTimer::SetTimerUpdateHandler</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">UIAnimation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onpostupdate
     */
    OnPostUpdate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Handles events that occur when the rendering frame rate for an animation falls below a minimum desirable frame rate.
     * @remarks
     * The minimum desirable frame rate is specified using the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimer-setframeratethreshold">IUIAnimationTimer::SetFrameRateThreshold</a> method.
     * @param {Integer} framesPerSecond The current frame rate, in frames per second.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">UIAnimation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onrenderingtooslow
     */
    OnRenderingTooSlow(framesPerSecond) {
        result := ComCall(5, this, "uint", framesPerSecond, "HRESULT")
        return result
    }
}
