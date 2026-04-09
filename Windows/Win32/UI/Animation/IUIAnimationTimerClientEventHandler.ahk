#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for handling events related to changes in timer client status.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationtimerclienteventhandler
 * @namespace Windows.Win32.UI.Animation
 */
class IUIAnimationTimerClientEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationTimerClientEventHandler
     * @type {Guid}
     */
    static IID => Guid("{bedb4db6-94fa-4bfb-a47f-ef2d9e408c25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnTimerClientStatusChanged"]

    /**
     * Handles events that occur when the status of the timer's client changes.
     * @param {UI_ANIMATION_TIMER_CLIENT_STATUS} newStatus The new status of the timer's client.
     * @param {UI_ANIMATION_TIMER_CLIENT_STATUS} previousStatus The previous status of the timer's client.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimerclienteventhandler-ontimerclientstatuschanged
     */
    OnTimerClientStatusChanged(newStatus, previousStatus) {
        result := ComCall(3, this, "int", newStatus, "int", previousStatus, "HRESULT")
        return result
    }
}
