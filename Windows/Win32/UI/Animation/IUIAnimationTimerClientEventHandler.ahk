#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for handling events related to changes in timer client status.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationtimerclienteventhandler
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationTimerClientEventHandler extends IUnknown{

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
     * 
     * @param {Integer} newStatus 
     * @param {Integer} previousStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtimerclienteventhandler-ontimerclientstatuschanged
     */
    OnTimerClientStatusChanged(newStatus, previousStatus) {
        result := ComCall(3, this, "int", newStatus, "int", previousStatus, "HRESULT")
        return result
    }
}
