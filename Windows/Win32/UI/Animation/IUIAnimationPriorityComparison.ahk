#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for priority comparison that the animation manager uses to resolve scheduling conflicts.
 * @remarks
 * 
 * A single animation variable can be included in multiple storyboards, but multiple storyboards cannot animate the same variable at the same time.
 *          
 * If a newly scheduled storyboard attempts to animate one or more variables that are currently scheduled for animation by  different storyboards, a scheduling conflict occurs.
 *          
 * To determine which storyboard has priority, the animation manager can call <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationprioritycomparison-haspriority">HasPriority</a> on one or more  priority comparison handlers provided by the application.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationprioritycomparison
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationPriorityComparison extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationPriorityComparison
     * @type {Guid}
     */
    static IID => Guid("{83fa9b74-5f86-4618-bc6a-a2fac19b3f44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HasPriority"]

    /**
     * 
     * @param {IUIAnimationStoryboard} scheduledStoryboard 
     * @param {IUIAnimationStoryboard} newStoryboard 
     * @param {Integer} priorityEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationprioritycomparison-haspriority
     */
    HasPriority(scheduledStoryboard, newStoryboard, priorityEffect) {
        result := ComCall(3, this, "ptr", scheduledStoryboard, "ptr", newStoryboard, "int", priorityEffect, "HRESULT")
        return result
    }
}
