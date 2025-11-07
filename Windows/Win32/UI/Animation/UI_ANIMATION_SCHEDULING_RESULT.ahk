#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines results for storyboard scheduling.
 * @remarks
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard-schedule">IUIAnimationStoryboard::Schedule</a> returns UI_ANIMATION_SCHEDULING_DEFERRED only if the application attempts to schedule a storyboard during a callback to <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler-onstoryboardstatuschanged">IUIAnimationStoryboardEventHandler::OnStoryboardStatusChanged</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/ne-uianimation-ui_animation_scheduling_result
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class UI_ANIMATION_SCHEDULING_RESULT{

    /**
     * Scheduling failed for an unexpected reason.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_SCHEDULING_UNEXPECTED_FAILURE => 0

    /**
     * Scheduling failed because
     *                a scheduling conflict occurred and the currently scheduled storyboard has higher priority.
     *                
     *                For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationprioritycomparison-haspriority">IUIAnimationPriorityComparison::HasPriority</a>.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_SCHEDULING_INSUFFICIENT_PRIORITY => 1

    /**
     * Scheduling failed because 
     *                the storyboard is already scheduled.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_SCHEDULING_ALREADY_SCHEDULED => 2

    /**
     * Scheduling succeeded.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_SCHEDULING_SUCCEEDED => 3

    /**
     * Scheduling is deferred and will be attempted when the current callback completes.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_SCHEDULING_DEFERRED => 4
}
