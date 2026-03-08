#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a storyboard, which contains a group of transitions that are synchronized relative to one another.In this sectionTopicDescriptionAbandon MethodTerminates the storyboard, releases all related animation variables, and removes the storyboard from the schedule.AddKeyframeAfterTransition MethodAdds a keyframe at the end of the specified transition.AddKeyframeAtOffset MethodAdds a keyframe at the specified offset from an existing keyframe.AddTransition MethodAdds a transition to the storyboard.AddTransitionAtKeyframe MethodAdds a transition that starts at the specified keyframe.AddTransitionBetweenKeyframes MethodAdds a transition between two keyframes.Conclude MethodCompletes the current iteration of a keyframe loop that is in progress (where the loop is set to UI_ANIMATION_REPEAT_INDEFINITELY), terminates the loop, and continues with the storyboard. Finish MethodFinishes the storyboard within the specified time, compressing the storyboard if necessary.GetElapsedTime MethodGets the time that has elapsed since the storyboard started playing.GetStatus MethodGets the status of the storyboard.GetTag MethodGets the tag for a storyboard.HoldVariable MethodDirects the storyboard to hold the specified animation variable at its final value until the storyboard ends.RepeatBetweenKeyframes MethodCreates a loop between two keyframes.Schedule MethodDirects the storyboard to schedule itself for play.SetSkipDuration MethodSpecifies an offset from the beginning of a storyboard at which to start animating.SetLongestAcceptableDelay MethodSets the longest acceptable delay before the scheduled storyboard begins.SetStoryboardEventHandler MethodSpecifies a handler for storyboard events.SetTag MethodSets the tag for the storyboard. .
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationstoryboard2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationStoryboard2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationStoryboard2
     * @type {Guid}
     */
    static IID => Guid("{ae289cd2-12d4-4945-9419-9e41be034df2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddTransition", "AddKeyframeAtOffset", "AddKeyframeAfterTransition", "AddTransitionAtKeyframe", "AddTransitionBetweenKeyframes", "RepeatBetweenKeyframes", "HoldVariable", "SetLongestAcceptableDelay", "SetSkipDuration", "Schedule", "Conclude", "Finish", "Abandon", "SetTag", "GetTag", "GetStatus", "GetElapsedTime", "SetStoryboardEventHandler"]

    /**
     * Adds a transition to the storyboard. (IUIAnimationStoryboard2.AddTransition)
     * @remarks
     * The <b>AddTransition</b> method applies the specified transition to the specified variable in the storyboard. If this is the first transition applied to this variable in this storyboard, the transition begins at the start of the storyboard. Otherwise, the transition is appended to the transition that was most recently added to the variable.
     * @param {IUIAnimationVariable2} variable The animation variable for which the transition is to be added.
     * @param {IUIAnimationTransition2} transition The transition to be added.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_TRANSITION_ALREADY_USED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This transition has already been added to a storyboard.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-addtransition
     */
    AddTransition(variable, transition) {
        result := ComCall(3, this, "ptr", variable, "ptr", transition, "HRESULT")
        return result
    }

    /**
     * Adds a keyframe at the specified offset from an existing keyframe. (IUIAnimationStoryboard2.AddKeyframeAtOffset)
     * @remarks
     * A keyframe represents a moment in time within a storyboard and can be used to specify the start and end times of transitions. Because keyframes can be added at the ends of transitions, their offsets from the start of the storyboard may not be known until the storyboard is playing.
     * @param {UI_ANIMATION_KEYFRAME} existingKeyframe The existing keyframe. To add a keyframe at an offset from the start of the storyboard, use the special keyframe <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd756780(v=vs.85)">UI_ANIMATION_KEYFRAME_STORYBOARD_START</a>.
     * @param {Float} offset The offset from the existing keyframe at which a new keyframe is to be added.
     * @returns {UI_ANIMATION_KEYFRAME} The keyframe to be added.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-addkeyframeatoffset
     */
    AddKeyframeAtOffset(existingKeyframe, offset) {
        result := ComCall(4, this, "ptr", existingKeyframe, "double", offset, "ptr*", &keyframe := 0, "HRESULT")
        return keyframe
    }

    /**
     * Adds a keyframe at the end of the specified transition. (IUIAnimationStoryboard2.AddKeyframeAfterTransition)
     * @remarks
     * A keyframe represents a moment in time within a storyboard and can be used to specify the start and end times of transitions. Because keyframes can be added at the ends of transitions, their offsets from the start of the storyboard may not be known until the storyboard is playing.
     * @param {IUIAnimationTransition2} transition The transition after which a keyframe is to be added.
     * @returns {UI_ANIMATION_KEYFRAME} The keyframe to be added.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-addkeyframeaftertransition
     */
    AddKeyframeAfterTransition(transition) {
        result := ComCall(5, this, "ptr", transition, "ptr*", &keyframe := 0, "HRESULT")
        return keyframe
    }

    /**
     * Adds a transition that starts at the specified keyframe. (IUIAnimationStoryboard2.AddTransitionAtKeyframe)
     * @remarks
     * Transitions must be added in the order in which they will be played. A transition may begin playing before the preceding transition in the storyboard has finished, in which case the initial value and velocity seen by the new transition is determined by the state of the preceding one. A transition should not begin before the start of the preceding transition.
     * 
     * A keyframe represents a moment in time within a storyboard and can be used to specify the start and end times of transitions. Because keyframes can be added at the ends of transitions, their offsets from the start of the storyboard may not be known until the storyboard is playing.
     * @param {IUIAnimationVariable2} variable The animation variable for which a transition is to be added.
     * @param {IUIAnimationTransition2} transition The transition to be added.
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe The keyframe that specifies the beginning of the new transition.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_TRANSITION_ALREADY_USED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This transition has already been added to a storyboard or has been added to a storyboard that has finished playing and been released.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_TRANSITION_ECLIPSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transition might eclipse the beginning of another transition in the storyboard.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-addtransitionatkeyframe
     */
    AddTransitionAtKeyframe(variable, transition, startKeyframe) {
        result := ComCall(6, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "HRESULT")
        return result
    }

    /**
     * Adds a transition between two keyframes. (IUIAnimationStoryboard2.AddTransitionBetweenKeyframes)
     * @remarks
     * This method applies the specified transition to the specified variable in the storyboard, with the transition starting and ending at the specified keyframes.  If the transition was created with a duration parameter specified, that duration is overwritten with the duration of time between the start and end keyframes. Otherwise, Windows Animation speeds up or slows down the transition as necessary.
     * 
     * A keyframe represents a moment in time within a storyboard and can be used to specify the start and end times of transitions. Because keyframes can be added at the ends of transitions, their offsets from the start of the storyboard may not be known until the storyboard is playing.
     * 
     * Transitions must be added in the order in which they will be played. A transition may begin playing before the preceding transition in the storyboard has finished, in which case the initial value and velocity seen by the new transition will be determined by the state of the preceding one. It must not be possible for a transition to begin before the start of the preceding transition.
     * @param {IUIAnimationVariable2} variable The animation variable for which the transition is to be added.
     * @param {IUIAnimationTransition2} transition The transition to be added.
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe A keyframe that specifies the beginning of the new transition.
     * @param {UI_ANIMATION_KEYFRAME} endKeyframe A keyframe that specifies the end of the new transition. It must not be possible for <i>endKeyframe</i> to appear earlier in the storyboard than <i>startKeyframe</i>.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_TRANSITION_ALREADY_USED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This transition has already been added to a storyboard or has been added to a storyboard that has finished playing and been released.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_TRANSITION_ECLIPSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transition might eclipse the beginning of another transition in the storyboard.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_START_KEYFRAME_AFTER_END</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The start keyframe might occur after the end keyframe.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-addtransitionbetweenkeyframes
     */
    AddTransitionBetweenKeyframes(variable, transition, startKeyframe, endKeyframe) {
        result := ComCall(7, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "ptr", endKeyframe, "HRESULT")
        return result
    }

    /**
     * Creates a loop between two keyframes.
     * @remarks
     * This method directs a storyboard to play the interval between the given keyframes repeatedly before playing the remainder of the storyboard. If a finite repetition count is specified, the loop always plays that number of times. If <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-repeat-indefinitely">UI_ANIMATION_REPEAT_INDEFINITELY</a> (-1) is specified, the loop repeats until the storyboard is concluded, in which case the current iteration of the loop completes and the remainder of the storyboard plays. A storyboard that loops indefinitely also ends if it is truncated.
     * 
     * Nested and overlapping loops are not supported.
     * 
     * A keyframe represents a moment in time within a storyboard and can be used to specify the start or end times of transitions.  Because keyframes can be added at the ends of transitions, their offsets from the start of the storyboard may not be known until the storyboard is playing.
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe The keyframe at which the loop is to begin.
     * @param {UI_ANIMATION_KEYFRAME} endKeyframe The keyframe at which the loop is to end. <i>endKeyframe</i> must not occur earlier in the storyboard than <i>startKeyframe</i>.
     * @param {Float} cRepetition The number of times the loop is to be repeated; the last iteration of a loop can terminate fractionally between keyframes. A value of  zero indicates that the specified portion of a storyboard will not be played.  A value of <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-repeat-indefinitely">UI_ANIMATION_REPEAT_INDEFINITELY</a> (-1) indicates that the loop will repeat indefinitely until the storyboard is trimmed or concluded.
     * @param {Integer} repeatMode The pattern for the loop iteration. 
     * 
     * A value of <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_repeat_mode">UI_ANIMATION_REPEAT_MODE_ALTERNATE</a> (1) specifies that the  start of the loop must alternate between keyframes (k1-&gt;k2, k2-&gt;k1, k1-&gt;k2, and so on).
     * 
     * A value of <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_repeat_mode">UI_ANIMATION_REPEAT_MODE_NORMAL</a> (0) specifies that the start of the  loop must begin with the first keyframe (k1-&gt;k2, k1-&gt;k2, k1-&gt;k2, and so on).
     * 
     * <div class="alert"><b>Note</b>  If <i>repeatMode</i> has a value of <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_repeat_mode">UI_ANIMATION_REPEAT_MODE_ALTERNATE</a> (1) and <i>cRepetition</i> has a value of <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-repeat-indefinitely">UI_ANIMATION_REPEAT_INDEFINITELY</a> (-1), the loop terminates on the end keyframe.
     * </div>
     * <div> </div>
     * @param {IUIAnimationLoopIterationChangeHandler2} pIterationChangeHandler The handler for each loop iteration event. The default value is 0.
     * @param {Pointer} id The loop ID to pass to <i>pIterationChangeHandler</i>. The default value is 0.
     * @param {BOOL} fRegisterForNextAnimationEvent If true, specifies that <i>pIterationChangeHandler</i> will be incorporated into the estimate of the time interval until the next animation event that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime">IUIAnimationManager2::EstimateNextEventTime</a> method. The default value is 0, or false.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-repeatbetweenkeyframes
     */
    RepeatBetweenKeyframes(startKeyframe, endKeyframe, cRepetition, repeatMode, pIterationChangeHandler, id, fRegisterForNextAnimationEvent) {
        result := ComCall(8, this, "ptr", startKeyframe, "ptr", endKeyframe, "double", cRepetition, "int", repeatMode, "ptr", pIterationChangeHandler, "ptr", id, "int", fRegisterForNextAnimationEvent, "HRESULT")
        return result
    }

    /**
     * Directs the storyboard to hold the specified animation variable at its final value until the storyboard ends. (IUIAnimationStoryboard2.HoldVariable)
     * @remarks
     * When a storyboard is playing, it has exclusive access to any variables it animates unless the storyboard is trimmed by a higher-priority storyboard. Typically, this exclusive access is released  when the last transition in the storyboard for that variable finishes playing. Applications can call this method to maintain exclusive access to the animation variable and hold the variable, at the final value of the last transition, until the end of the storyboard.
     * @param {IUIAnimationVariable2} variable The animation variable.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-holdvariable
     */
    HoldVariable(variable) {
        result := ComCall(9, this, "ptr", variable, "HRESULT")
        return result
    }

    /**
     * Sets the longest acceptable delay before the scheduled storyboard begins. (IUIAnimationStoryboard2.SetLongestAcceptableDelay)
     * @remarks
     * For Windows Animation to schedule a storyboard successfully, the storyboard must begin before the longest acceptable delay has elapsed. Windows Animation determines this delay in the following order: the delay value set by calling this method, the delay value set by calling the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-setdefaultlongestacceptabledelay">IUIAnimationManager2::SetDefaultLongestAcceptableDelay</a> method, or 0.0 if neither of these methods has been called.
     * 
     *  Use <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-setskipduration">IUIAnimationStoryboard2::SetSkipDuration</a> to start a storyboard animation at a specified offset instead of delaying the start of a storyboard.
     * @param {Float} delay The longest acceptable delay. This parameter can be a positive value, or <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-seconds-eventually">UI_ANIMATION_SECONDS_EVENTUALLY</a> (-1) to indicate that any finite delay is acceptable.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-setlongestacceptabledelay
     */
    SetLongestAcceptableDelay(delay) {
        result := ComCall(10, this, "double", delay, "HRESULT")
        return result
    }

    /**
     * Specifies an offset from the beginning of a storyboard at which to start animating.
     * @remarks
     * Calls to <b>SetSkipDuration</b> fail if the storyboard has been scheduled.
     * 
     * <b>SetSkipDuration</b> does not delay the start of a scheduled storyboard. See <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-setlongestacceptabledelay">IUIAnimationStoryboard2::SetLongestAcceptableDelay</a> for more info on how to set a delay for a scheduled storyboard.
     * 
     * This diagram shows a skip duration, or offset, for a storyboard. 
     * 
     * <img alt="Illustration of a storyboard offset" src="Images/SetSkipDuration.png"/>
     * @param {Float} secondsDuration The offset, or amount of time, to skip at the beginning of the storyboard.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-setskipduration
     */
    SetSkipDuration(secondsDuration) {
        result := ComCall(11, this, "double", secondsDuration, "HRESULT")
        return result
    }

    /**
     * Directs the storyboard to schedule itself for play. (IUIAnimationStoryboard2.Schedule)
     * @remarks
     * This method directs a storyboard to try to add itself to the schedule of playing storyboards, using these rules:
     * 
     * <ul>
     * <li>
     * If there are no playing storyboards animating any of the same animation variables, the attempt succeeds and the storyboard starts playing immediately.
     * 
     * </li>
     * <li>
     * If the storyboard has priority to cancel, trim, conclude, or compress conflicting storyboards, the attempt to schedule succeeds and the storyboard starts playing as soon as possible.
     * 
     * </li>
     * <li>
     * If the storyboard does not have priority, the attempt fails and the <i>schedulingResult</i> parameter is set to <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_scheduling_result">UI_ANIMATION_SCHEDULING_INSUFFICIENT_PRIORITY</a>.
     * 
     * </li>
     * </ul>
     * If this method is called from a handler for <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler-onstoryboardstatuschanged">OnStoryboardStatusChanged</a> events, the <i>schedulingResult</i> parameter is set to <b>UI_ANIMATION_SCHEDULING_DEFERRED</b>.  The only way to determine whether the storyboard is successfully scheduled is to set a storyboard event handler and check whether the storyboard's status ever becomes <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_scheduling_result">UI_ANIMATION_SCHEDULING_INSUFFICIENT_PRIORITY</a>.
     * 
     * It is possible to reuse a storyboard by calling <b>Schedule</b> again after its status has reached <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_storyboard_status">UI_ANIMATION_STORYBOARD_READY</a>.  An attempt to schedule a storyboard when it is in any state other than <b>UI_ANIMATION_STORYBOARD_BUILDING</b> or <b>UI_ANIMATION_STORYBOARD_READY</b> fails, and  <i>schedulingResult</i> is set to <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_scheduling_result">UI_ANIMATION_SCHEDULING_ALREADY_SCHEDULED</a>.
     * @param {Float} timeNow The current time.
     * @returns {Integer} The result of the scheduling request.
     *             You can omit this parameter from calls to this method.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-schedule
     */
    Schedule(timeNow) {
        result := ComCall(12, this, "double", timeNow, "int*", &schedulingResult := 0, "HRESULT")
        return schedulingResult
    }

    /**
     * Completes the current iteration of a keyframe loop that is in progress (where the loop is set to UI_ANIMATION_REPEAT_INDEFINITELY), terminates the loop, and continues with the storyboard. (IUIAnimationStoryboard2.Conclude)
     * @remarks
     * This method specifies that any subsequent  keyframe loops that have a repetition count of <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-repeat-indefinitely">UI_ANIMATION_REPEAT_INDEFINITELY</a> (-1) will be skipped while the remainder of the storyboard is played.  
     * 
     * An iteration of a keyframe loop that is in progress will be completed before the remainder of the storyboard plays.
     * 
     * If this method is called at the end of an alternating keyframe loop iteration, the loop is terminated with the  loop value set to the ending loop value.
     * 
     *  If this method is called at the end of a non-alternating keyframe loop iteration, where  "loop wrapping" results in the loop value being set to the starting value of the next iteration, the loop is executed once more in order for the loop value to be set to the ending loop value.
     * 
     * For alternating keyframe loops, each iteration has a starting value that is equivalent to the ending value of the preceding loop. In this case, "loop wrapping" is not an issue.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-conclude
     */
    Conclude() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Finishes the storyboard within the specified time, compressing the storyboard if necessary. (IUIAnimationStoryboard2.Finish)
     * @remarks
     * This method has no effect on storyboard events. Events continue to be raised as expected while the storyboard plays.
     * @param {Float} completionDeadline The maximum amount of time that the storyboard can use to finish playing.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-finish
     */
    Finish(completionDeadline) {
        result := ComCall(14, this, "double", completionDeadline, "HRESULT")
        return result
    }

    /**
     * Terminates the storyboard, releases all related animation variables, and removes the storyboard from the schedule. (IUIAnimationStoryboard2.Abandon)
     * @remarks
     * This method can be called before or after the storyboard starts playing.
     * 
     * This method does not trigger any storyboard events.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-abandon
     */
    Abandon() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Sets the tag for the storyboard. (IUIAnimationStoryboard2.SetTag)
     * @remarks
     * A tag is a pairing of an integer identifier (<i>id</i>) with a COM object (<i>object</i>). It can be used by an application to identify a storyboard.
     * @param {IUnknown} object_R 
     * @param {Integer} id The identifier portion of the tag.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-settag
     */
    SetTag(object_R, id) {
        result := ComCall(16, this, "ptr", object_R, "uint", id, "HRESULT")
        return result
    }

    /**
     * Gets the tag for a storyboard. (IUIAnimationStoryboard2.GetTag)
     * @remarks
     * A tag is a pairing of an integer identifier (<i>id</i>) with a COM object (<i>object</i>); it can be used by an application to identify a storyboard.
     * 
     * This method can return the identifier, the object, or both portions of the tag.
     * @param {Pointer<IUnknown>} object_R 
     * @param {Pointer<Integer>} id The identifier portion of the tag.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_VALUE_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The storyboard tag was not set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-gettag
     */
    GetTag(object_R, id) {
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "ptr*", object_R, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * Gets the status of the storyboard. (IUIAnimationStoryboard2.GetStatus)
     * @remarks
     * Unless this method is called from a handler for <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler2-onstoryboardstatuschanged">OnStoryboardStatusChanged</a> events, the only values it returns are <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_storyboard_status">UI_ANIMATION_STORYBOARD_BUILDING</a>, <b>UI_ANIMATION_STORYBOARD_SCHEDULED</b>,
     * <b>UI_ANIMATION_STORYBOARD_PLAYING</b>, and <b>UI_ANIMATION_STORYBOARD_READY</b>.
     * @returns {Integer} The storyboard status.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-getstatus
     */
    GetStatus() {
        result := ComCall(18, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * Gets the time that has elapsed since the storyboard started playing. (IUIAnimationStoryboard2.GetElapsedTime)
     * @returns {Float} The elapsed time.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-getelapsedtime
     */
    GetElapsedTime() {
        result := ComCall(19, this, "double*", &elapsedTime := 0, "HRESULT")
        return elapsedTime
    }

    /**
     * Specifies a handler for storyboard events. (IUIAnimationStoryboard2.SetStoryboardEventHandler)
     * @remarks
     * Passing <b>NULL</b> for the <i>handler</i> parameter causes Windows Animation to release its reference to any handler object that you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-shutdown">IUIAnimationManager2::Shutdown</a> method.
     * @param {IUIAnimationStoryboardEventHandler2} handler The handler that Windows Animation should call whenever storyboard status and update events occur.
     *             
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationstoryboardeventhandler2">IUIAnimationStoryboardEventHandler2</a> interface or be <b>NULL</b>. See Remarks for more info.
     * @param {BOOL} fRegisterStatusChangeForNextAnimationEvent If <b>TRUE</b>, registers the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler2-onstoryboardstatuschanged">OnStoryboardStatusChanged</a> event and includes those events in <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime">IUIAnimationManager2::EstimateNextEventTime</a>, which estimates the time interval until the next animation event. No default value.
     * @param {BOOL} fRegisterUpdateForNextAnimationEvent If <b>TRUE</b>, registers the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler2-onstoryboardupdated">OnStoryboardUpdated</a> event and includes those events in <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime">IUIAnimationManager2::EstimateNextEventTime</a>, which estimates the time interval until the next animation event. No default value.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-setstoryboardeventhandler
     */
    SetStoryboardEventHandler(handler, fRegisterStatusChangeForNextAnimationEvent, fRegisterUpdateForNextAnimationEvent) {
        result := ComCall(20, this, "ptr", handler, "int", fRegisterStatusChangeForNextAnimationEvent, "int", fRegisterUpdateForNextAnimationEvent, "HRESULT")
        return result
    }
}
