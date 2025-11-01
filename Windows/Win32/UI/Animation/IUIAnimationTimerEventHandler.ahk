#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for handling timing events.
 * @remarks
 * 
  * Use 
  *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtimer-settimereventhandler">SetTimerEventHandler</a>to specify the timing events handler for an instance of
  *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtimer">IUIAnimationTimer</a>. 
  *       
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationtimereventhandler
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onpreupdate
     */
    OnPreUpdate() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onpostupdate
     */
    OnPostUpdate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} framesPerSecond 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimereventhandler-onrenderingtooslow
     */
    OnRenderingTooSlow(framesPerSecond) {
        result := ComCall(5, this, "uint", framesPerSecond, "HRESULT")
        return result
    }
}
