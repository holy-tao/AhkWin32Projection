#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for handling storyboard events.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationstoryboardeventhandler2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationStoryboardEventHandler2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationStoryboardEventHandler2
     * @type {Guid}
     */
    static IID => Guid("{bac5f55a-ba7c-414c-b599-fbf850f553c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStoryboardStatusChanged", "OnStoryboardUpdated"]

    /**
     * 
     * @param {IUIAnimationStoryboard2} storyboard 
     * @param {Integer} newStatus 
     * @param {Integer} previousStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler2-onstoryboardstatuschanged
     */
    OnStoryboardStatusChanged(storyboard, newStatus, previousStatus) {
        result := ComCall(3, this, "ptr", storyboard, "int", newStatus, "int", previousStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationStoryboard2} storyboard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler2-onstoryboardupdated
     */
    OnStoryboardUpdated(storyboard) {
        result := ComCall(4, this, "ptr", storyboard, "HRESULT")
        return result
    }
}
