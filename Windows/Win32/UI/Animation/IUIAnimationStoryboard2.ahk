#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a storyboard, which contains a group of transitions that are synchronized relative to one another.In this sectionTopicDescriptionAbandon MethodTerminates the storyboard, releases all related animation variables, and removes the storyboard from the schedule.AddKeyframeAfterTransition MethodAdds a keyframe at the end of the specified transition.AddKeyframeAtOffset MethodAdds a keyframe at the specified offset from an existing keyframe.AddTransition MethodAdds a transition to the storyboard.AddTransitionAtKeyframe MethodAdds a transition that starts at the specified keyframe.AddTransitionBetweenKeyframes MethodAdds a transition between two keyframes.Conclude MethodCompletes the current iteration of a keyframe loop that is in progress (where the loop is set to UI_ANIMATION_REPEAT_INDEFINITELY), terminates the loop, and continues with the storyboard. Finish MethodFinishes the storyboard within the specified time, compressing the storyboard if necessary.GetElapsedTime MethodGets the time that has elapsed since the storyboard started playing.GetStatus MethodGets the status of the storyboard.GetTag MethodGets the tag for a storyboard.HoldVariable MethodDirects the storyboard to hold the specified animation variable at its final value until the storyboard ends.RepeatBetweenKeyframes MethodCreates a loop between two keyframes.Schedule MethodDirects the storyboard to schedule itself for play.SetSkipDuration MethodSpecifies an offset from the beginning of a storyboard at which to start animating.SetLongestAcceptableDelay MethodSets the longest acceptable delay before the scheduled storyboard begins.SetStoryboardEventHandler MethodSpecifies a handler for storyboard events.SetTag MethodSets the tag for the storyboard. .
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationstoryboard2
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
     * Adds a transition to the storyboard.
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
     * See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-addtransition
     */
    AddTransition(variable, transition) {
        result := ComCall(3, this, "ptr", variable, "ptr", transition, "HRESULT")
        return result
    }

    /**
     * Adds a keyframe at the specified offset from an existing keyframe.
     * @param {UI_ANIMATION_KEYFRAME} existingKeyframe The existing keyframe. To add a keyframe at an offset from the start of the storyboard, use the special keyframe <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd756780(v=vs.85)">UI_ANIMATION_KEYFRAME_STORYBOARD_START</a>.
     * @param {Float} offset The offset from the existing keyframe at which a new keyframe is to be added.
     * @returns {UI_ANIMATION_KEYFRAME} The keyframe to be added.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-addkeyframeatoffset
     */
    AddKeyframeAtOffset(existingKeyframe, offset) {
        result := ComCall(4, this, "ptr", existingKeyframe, "double", offset, "ptr*", &keyframe := 0, "HRESULT")
        return keyframe
    }

    /**
     * Adds a keyframe at the end of the specified transition.
     * @param {IUIAnimationTransition2} transition The transition after which a keyframe is to be added.
     * @returns {UI_ANIMATION_KEYFRAME} The keyframe to be added.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-addkeyframeaftertransition
     */
    AddKeyframeAfterTransition(transition) {
        result := ComCall(5, this, "ptr", transition, "ptr*", &keyframe := 0, "HRESULT")
        return keyframe
    }

    /**
     * Adds a transition that starts at the specified keyframe.
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
     * See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-addtransitionatkeyframe
     */
    AddTransitionAtKeyframe(variable, transition, startKeyframe) {
        result := ComCall(6, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "HRESULT")
        return result
    }

    /**
     * Adds a transition between two keyframes.
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
     * See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-addtransitionbetweenkeyframes
     */
    AddTransitionBetweenKeyframes(variable, transition, startKeyframe, endKeyframe) {
        result := ComCall(7, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "ptr", endKeyframe, "HRESULT")
        return result
    }

    /**
     * Creates a loop between two keyframes.
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
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-repeatbetweenkeyframes
     */
    RepeatBetweenKeyframes(startKeyframe, endKeyframe, cRepetition, repeatMode, pIterationChangeHandler, id, fRegisterForNextAnimationEvent) {
        result := ComCall(8, this, "ptr", startKeyframe, "ptr", endKeyframe, "double", cRepetition, "int", repeatMode, "ptr", pIterationChangeHandler, "ptr", id, "int", fRegisterForNextAnimationEvent, "HRESULT")
        return result
    }

    /**
     * Directs the storyboard to hold the specified animation variable at its final value until the storyboard ends.
     * @param {IUIAnimationVariable2} variable The animation variable.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-holdvariable
     */
    HoldVariable(variable) {
        result := ComCall(9, this, "ptr", variable, "HRESULT")
        return result
    }

    /**
     * Sets the longest acceptable delay before the scheduled storyboard begins.
     * @param {Float} delay The longest acceptable delay. This parameter can be a positive value, or <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-seconds-eventually">UI_ANIMATION_SECONDS_EVENTUALLY</a> (-1) to indicate that any finite delay is acceptable.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-setlongestacceptabledelay
     */
    SetLongestAcceptableDelay(delay) {
        result := ComCall(10, this, "double", delay, "HRESULT")
        return result
    }

    /**
     * Specifies an offset from the beginning of a storyboard at which to start animating.
     * @param {Float} secondsDuration The offset, or amount of time, to skip at the beginning of the storyboard.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-setskipduration
     */
    SetSkipDuration(secondsDuration) {
        result := ComCall(11, this, "double", secondsDuration, "HRESULT")
        return result
    }

    /**
     * Directs the storyboard to schedule itself for play.
     * @param {Float} timeNow The current time.
     * @returns {Integer} The result of the scheduling request.
     *             You can omit this parameter from calls to this method.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-schedule
     */
    Schedule(timeNow) {
        result := ComCall(12, this, "double", timeNow, "int*", &schedulingResult := 0, "HRESULT")
        return schedulingResult
    }

    /**
     * Completes the current iteration of a keyframe loop that is in progress (where the loop is set to UI_ANIMATION_REPEAT_INDEFINITELY), terminates the loop, and continues with the storyboard.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-conclude
     */
    Conclude() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Finishes the storyboard within the specified time, compressing the storyboard if necessary.
     * @param {Float} completionDeadline The maximum amount of time that the storyboard can use to finish playing.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-finish
     */
    Finish(completionDeadline) {
        result := ComCall(14, this, "double", completionDeadline, "HRESULT")
        return result
    }

    /**
     * Terminates the storyboard, releases all related animation variables, and removes the storyboard from the schedule.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-abandon
     */
    Abandon() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Sets the tag for the storyboard.
     * @param {IUnknown} object The object portion of the tag.        
     *             This parameter can be NULL.
     * @param {Integer} id The identifier portion of the tag.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-settag
     */
    SetTag(object, id) {
        result := ComCall(16, this, "ptr", object, "uint", id, "HRESULT")
        return result
    }

    /**
     * Gets the tag for a storyboard.
     * @param {Pointer<IUnknown>} object The object portion of the tag.
     * @param {Pointer<Integer>} id The identifier portion of the tag.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
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
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-gettag
     */
    GetTag(object, id) {
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "ptr*", object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * Gets the status of the storyboard.
     * @returns {Integer} The storyboard status.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-getstatus
     */
    GetStatus() {
        result := ComCall(18, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * Gets the time that has elapsed since the storyboard started playing.
     * @returns {Float} The elapsed time.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-getelapsedtime
     */
    GetElapsedTime() {
        result := ComCall(19, this, "double*", &elapsedTime := 0, "HRESULT")
        return elapsedTime
    }

    /**
     * Specifies a handler for storyboard events.
     * @param {IUIAnimationStoryboardEventHandler2} handler The handler that Windows Animation should call whenever storyboard status and update events occur.
     *             
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationstoryboardeventhandler2">IUIAnimationStoryboardEventHandler2</a> interface or be <b>NULL</b>. See Remarks for more info.
     * @param {BOOL} fRegisterStatusChangeForNextAnimationEvent If <b>TRUE</b>, registers the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler2-onstoryboardstatuschanged">OnStoryboardStatusChanged</a> event and includes those events in <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime">IUIAnimationManager2::EstimateNextEventTime</a>, which estimates the time interval until the next animation event. No default value.
     * @param {BOOL} fRegisterUpdateForNextAnimationEvent If <b>TRUE</b>, registers the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler2-onstoryboardupdated">OnStoryboardUpdated</a> event and includes those events in <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime">IUIAnimationManager2::EstimateNextEventTime</a>, which estimates the time interval until the next animation event. No default value.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard2-setstoryboardeventhandler
     */
    SetStoryboardEventHandler(handler, fRegisterStatusChangeForNextAnimationEvent, fRegisterUpdateForNextAnimationEvent) {
        result := ComCall(20, this, "ptr", handler, "int", fRegisterStatusChangeForNextAnimationEvent, "int", fRegisterUpdateForNextAnimationEvent, "HRESULT")
        return result
    }
}
