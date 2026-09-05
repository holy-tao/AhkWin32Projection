#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

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
 */
class UI_ANIMATION_STORYBOARD_STATUS extends Win32Enum {

    /**
     * The storyboard has never been scheduled.
     * Native name: UI_ANIMATION_STORYBOARD_BUILDING
     * @type {Integer (Int32)}
     */
    static BUILDING => 0

    /**
     * The storyboard is scheduled to play.
     * Native name: UI_ANIMATION_STORYBOARD_SCHEDULED
     * @type {Integer (Int32)}
     */
    static SCHEDULED => 1

    /**
     * The storyboard was canceled.
     * Native name: UI_ANIMATION_STORYBOARD_CANCELLED
     * @type {Integer (Int32)}
     */
    static CANCELLED => 2

    /**
     * The storyboard is currently playing.
     * Native name: UI_ANIMATION_STORYBOARD_PLAYING
     * @type {Integer (Int32)}
     */
    static PLAYING => 3

    /**
     * The storyboard was truncated.
     * Native name: UI_ANIMATION_STORYBOARD_TRUNCATED
     * @type {Integer (Int32)}
     */
    static TRUNCATED => 4

    /**
     * The storyboard has finished playing.
     * Native name: UI_ANIMATION_STORYBOARD_FINISHED
     * @type {Integer (Int32)}
     */
    static FINISHED => 5

    /**
     * The storyboard is built and ready for scheduling.
     * Native name: UI_ANIMATION_STORYBOARD_READY
     * @type {Integer (Int32)}
     */
    static READY => 6

    /**
     * Scheduling the storyboard failed because a scheduling conflict occurred and the currently scheduled storyboard has higher priority.
     * Native name: UI_ANIMATION_STORYBOARD_INSUFFICIENT_PRIORITY
     * @type {Integer (Int32)}
     */
    static INSUFFICIENT_PRIORITY => 7
}
