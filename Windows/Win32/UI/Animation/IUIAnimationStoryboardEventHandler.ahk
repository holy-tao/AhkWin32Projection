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
     * Handles events that occur when a storyboard's status changes.
     * @param {IUIAnimationStoryboard} storyboard The storyboard whose status has changed.
     * @param {Integer} newStatus The new status.
     * @param {Integer} previousStatus The previous status.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboardeventhandler-onstoryboardstatuschanged
     */
    OnStoryboardStatusChanged(storyboard, newStatus, previousStatus) {
        result := ComCall(3, this, "ptr", storyboard, "int", newStatus, "int", previousStatus, "HRESULT")
        return result
    }

    /**
     * Handles events that occur when a storyboard is updated.
     * @param {IUIAnimationStoryboard} storyboard The storyboard that has been updated.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboardeventhandler-onstoryboardupdated
     */
    OnStoryboardUpdated(storyboard) {
        result := ComCall(4, this, "ptr", storyboard, "HRESULT")
        return result
    }
}
