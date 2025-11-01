#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for handling status and update events for a storyboard.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationstoryboardeventhandler
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationStoryboardEventHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationStoryboardEventHandler
     * @type {Guid}
     */
    static IID => Guid("{3d5c9008-ec7c-4364-9f8a-9af3c58cbae6}")

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
     * @param {IUIAnimationStoryboard} storyboard 
     * @param {Integer} newStatus 
     * @param {Integer} previousStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler-onstoryboardstatuschanged
     */
    OnStoryboardStatusChanged(storyboard, newStatus, previousStatus) {
        result := ComCall(3, this, "ptr", storyboard, "int", newStatus, "int", previousStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationStoryboard} storyboard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler-onstoryboardupdated
     */
    OnStoryboardUpdated(storyboard) {
        result := ComCall(4, this, "ptr", storyboard, "HRESULT")
        return result
    }
}
