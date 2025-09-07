#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the status for a storyboard.
 * @remarks
 * Unless <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard-getstatus">IUIAnimationStoryboard::GetStatus</a> is called from a handler for <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler-onstoryboardstatuschanged">OnStoryboardStatusChanged</a> events, it returns only the following status values:
  * 
  * <ul>
  * <li>UI_ANIMATION_STORYBOARD_BUILDING</li>
  * <li>UI_ANIMATION_STORYBOARD_SCHEDULED</li>
  * <li>UI_ANIMATION_STORYBOARD_PLAYING</li>
  * <li>UI_ANIMATION_STORYBOARD_READY</li>
  * </ul>
  * All status values can be passed to  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler-onstoryboardstatuschanged">IUIAnimationStoryboardEventHandler::OnStoryboardStatusChanged</a>.
  * 
  * The following diagram illustrates the transitions between these states.
  * 
  * <img alt="Diagram that shows how the animation manager schedules the storyboard and manages the animation." src="images/StateDiagram.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_storyboard_status
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class UI_ANIMATION_STORYBOARD_STATUS{

    /**
     * The storyboard has never been scheduled.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_STORYBOARD_BUILDING => 0

    /**
     * The storyboard is scheduled to play.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_STORYBOARD_SCHEDULED => 1

    /**
     * The storyboard was canceled.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_STORYBOARD_CANCELLED => 2

    /**
     * The storyboard is currently playing.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_STORYBOARD_PLAYING => 3

    /**
     * The storyboard was truncated.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_STORYBOARD_TRUNCATED => 4

    /**
     * The storyboard has finished playing.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_STORYBOARD_FINISHED => 5

    /**
     * The storyboard is built and ready for scheduling.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_STORYBOARD_READY => 6

    /**
     * Scheduling the storyboard failed because a scheduling conflict occurred and the currently scheduled storyboard has higher priority.
     * @type {Integer (Int32)}
     */
    static UI_ANIMATION_STORYBOARD_INSUFFICIENT_PRIORITY => 7
}
