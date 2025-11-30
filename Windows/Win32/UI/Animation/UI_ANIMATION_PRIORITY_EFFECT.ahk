#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines potential effects on a storyboard if a priority comparison returns false.
 * @remarks
 * 
 * This enumeration is used as the <i>priorityEffect</i> parameter of  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationprioritycomparison-haspriority">IUIAnimationPriorityComparison::HasPriority</a>, informing the client of the potential effect on the storyboard to be scheduled when the return value is false (S_FALSE).  UI_ANIMATION_PRIORITY_EFFECT_FAILURE means that the  attempt to schedule the storyboard might fail if the return value is false.   UI_ANIMATION_PRIORITY_EFFECT_DELAY means that the attempt to schedule the storyboard will succeed, but if the return value is false, the storyboard could play later than it would otherwise.
 * 
 *   This enumeration can help an application decide how aggressive to be about reducing latency in the UI. For example, if the application returns true when the effect is UI_ANIMATION_PRIORITY_EFFECT_DELAY, then other animations might get canceled or compressed even though doing so was not strictly necessary to play a new animation within the application-specified longest acceptable delay.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/ne-uianimation-ui_animation_priority_effect
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class UI_ANIMATION_PRIORITY_EFFECT extends Win32Enum{

    /**
     * This storyboard might not be successfully scheduled.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_PRIORITY_EFFECT_FAILURE => 0

    /**
     * The storyboard will be scheduled, but might start playing later.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_PRIORITY_EFFECT_DELAY => 1
}
