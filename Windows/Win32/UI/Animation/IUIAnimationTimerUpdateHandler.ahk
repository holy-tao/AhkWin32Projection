#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for handling timing update events.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317019(v=vs.85)">UIAnimationManager</a> object implements this interface, so a client application can query the <b>UIAnimationManager</b> object for this interface and then pass the interface to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimer-settimerupdatehandler">IUIAnimationTimer::SetTimerUpdateHandler</a>.  It is not necessary to disconnect the <b>UIAnimationManager</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317021(v=vs.85)">UIAnimationTimer</a> objects; releasing them both is sufficient to clean up.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationtimerupdatehandler
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationTimerUpdateHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationTimerUpdateHandler
     * @type {Guid}
     */
    static IID => Guid("{195509b7-5d5e-4e3e-b278-ee3759b367ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUpdate", "SetTimerClientEventHandler", "ClearTimerClientEventHandler"]

    /**
     * 
     * @param {Float} timeNow 
     * @param {Pointer<Integer>} result 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimerupdatehandler-onupdate
     */
    OnUpdate(timeNow, result) {
        result := ComCall(3, this, "double", timeNow, "int*", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationTimerClientEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimerupdatehandler-settimerclienteventhandler
     */
    SetTimerClientEventHandler(handler) {
        result := ComCall(4, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimerupdatehandler-cleartimerclienteventhandler
     */
    ClearTimerClientEventHandler() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
