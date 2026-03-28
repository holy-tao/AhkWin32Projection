#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a storyboard, which contains a group of transitions that are synchronized relative to one another.
 * @remarks
 * <b>IUIAnimationStoryboard</b> is a primary component for building animations,
 *          along with 
 *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationvariable">IUIAnimationVariable</a> and 
 *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationstoryboard
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationStoryboard extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationStoryboard
     * @type {Guid}
     */
    static IID => Guid("{a8ff128f-9bf9-4af1-9e67-e5e410defb84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddTransition", "AddKeyframeAtOffset", "AddKeyframeAfterTransition", "AddTransitionAtKeyframe", "AddTransitionBetweenKeyframes", "RepeatBetweenKeyframes", "HoldVariable", "SetLongestAcceptableDelay", "Schedule", "Conclude", "Finish", "Abandon", "SetTag", "GetTag", "GetStatus", "GetElapsedTime", "SetStoryboardEventHandler"]

    /**
     * Adds a transition to the storyboard. (IUIAnimationStoryboard.AddTransition)
     * @remarks
     * The <b>AddTransition</b> method applies the specified transition to the specified variable in the storyboard. If this is the first transition applied to this variable in this storyboard, the transition begins at the start of the storyboard. Otherwise, the transition is appended to the transition that was most recently added to the variable.
     * @param {IUIAnimationVariable} variable The animation variable for which the transition is to be added.
     * @param {IUIAnimationTransition} transition The transition to be added.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-addtransition
     */
    AddTransition(variable, transition) {
        result := ComCall(3, this, "ptr", variable, "ptr", transition, "HRESULT")
        return result
    }

    /**
     * Adds a keyframe at the specified offset from an existing keyframe. (IUIAnimationStoryboard.AddKeyframeAtOffset)
     * @remarks
     * A keyframe represents a moment in time within a storyboard and can be used to specify the start and end times of transitions. Because keyframes can be added at the ends of transitions, their offsets from the start of the storyboard may not be known until the storyboard is playing.
     * @param {UI_ANIMATION_KEYFRAME} existingKeyframe The existing keyframe. To add a keyframe at an offset from the start of the storyboard, use the special keyframe <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd756780(v=vs.85)">UI_ANIMATION_KEYFRAME_STORYBOARD_START</a>.
     * @param {Float} offset The offset from the existing keyframe at which a new keyframe is to be added.
     * @returns {UI_ANIMATION_KEYFRAME} The keyframe to be added.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-addkeyframeatoffset
     */
    AddKeyframeAtOffset(existingKeyframe, offset) {
        result := ComCall(4, this, "ptr", existingKeyframe, "double", offset, "ptr*", &keyframe := 0, "HRESULT")
        return keyframe
    }

    /**
     * Adds a keyframe at the end of the specified transition. (IUIAnimationStoryboard.AddKeyframeAfterTransition)
     * @remarks
     * A keyframe represents a moment in time within a storyboard and can be used to specify the start and end times of transitions. Because keyframes can be added at the ends of transitions, their offsets from the start of the storyboard may not be known until the storyboard is playing.
     * @param {IUIAnimationTransition} transition The transition after which a keyframe is to be added.
     * @returns {UI_ANIMATION_KEYFRAME} The keyframe to be added.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-addkeyframeaftertransition
     */
    AddKeyframeAfterTransition(transition) {
        result := ComCall(5, this, "ptr", transition, "ptr*", &keyframe := 0, "HRESULT")
        return keyframe
    }

    /**
     * Adds a transition that starts at the specified keyframe. (IUIAnimationStoryboard.AddTransitionAtKeyframe)
     * @remarks
     * Transitions must be added in the order in which they will be played. A transition may begin playing before the preceding transition in the storyboard has finished, in which case the initial value and velocity seen by the new transition is determined by the state of the preceding one. A transition should not begin before the start of the preceding transition.
     * 
     * A keyframe represents a moment in time within a storyboard and can be used to specify the start and end times of transitions. Because keyframes can be added at the ends of transitions, their offsets from the start of the storyboard may not be known until the storyboard is playing.
     * @param {IUIAnimationVariable} variable The animation variable for which a transition is to be added.
     * @param {IUIAnimationTransition} transition The transition to be added.
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe The keyframe that specifies the beginning of the new transition.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-addtransitionatkeyframe
     */
    AddTransitionAtKeyframe(variable, transition, startKeyframe) {
        result := ComCall(6, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "HRESULT")
        return result
    }

    /**
     * Adds a transition between two keyframes. (IUIAnimationStoryboard.AddTransitionBetweenKeyframes)
     * @remarks
     * This method applies the specified transition to the specified variable in the storyboard, with the transition starting and ending at the specified keyframes.  If the transition was created with a duration parameter specified, that duration is overwritten with the duration of time between the start and end keyframes. Otherwise, Windows Animation speeds up or slows down the transition as necessary.
     * 
     * A keyframe represents a moment in time within a storyboard and can be used to specify the start and end times of transitions. Because keyframes can be added at the ends of transitions, their offsets from the start of the storyboard may not be known until the storyboard is playing.
     * 
     * Transitions must be added in the order in which they will be played. A transition may begin playing before the preceding transition in the storyboard has finished, in which case the initial value and velocity seen by the new transition will be determined by the state of the preceding one. It must not be possible for a transition to begin before the start of the preceding transition.
     * @param {IUIAnimationVariable} variable The animation variable for which the transition is to be added.
     * @param {IUIAnimationTransition} transition The transition to be added.
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe A keyframe that specifies the beginning of the new transition.
     * @param {UI_ANIMATION_KEYFRAME} endKeyframe A keyframe that specifies the end of the new transition. It must not be possible for <i>endKeyframe</i> to appear earlier in the storyboard than <i>startKeyframe</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-addtransitionbetweenkeyframes
     */
    AddTransitionBetweenKeyframes(variable, transition, startKeyframe, endKeyframe) {
        result := ComCall(7, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "ptr", endKeyframe, "HRESULT")
        return result
    }

    /**
     * Creates a loop between two specified keyframes.
     * @remarks
     * This method directs a storyboard to play the interval between the given keyframes repeatedly before playing the remainder of the storyboard. If a finite repetition count is specified, the loop always plays that number of times. If <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-repeat-indefinitely">UI_ANIMATION_REPEAT_INDEFINITELY</a> (-1) is specified, the loop repeats until the storyboard is concluded, in which case the current iteration of the loop completes and the remainder of the storyboard plays. A storyboard that loops indefinitely also ends if it is truncated.
     * 
     * Nested and overlapping loops are not supported.
     * 
     * A keyframe represents a moment in time within a storyboard and can be used to specify the start or end times of transitions.  Because keyframes can be added at the ends of transitions, their offsets from the start of the storyboard may not be known until the storyboard is playing.
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe The keyframe at which the loop is to begin.
     * @param {UI_ANIMATION_KEYFRAME} endKeyframe The keyframe at which the loop is to end. It must not be possible for <i>endKeyframe</i> to occur earlier in the storyboard than <i>startKeyframe</i>.
     * @param {Integer} repetitionCount The number of times the loop is to be repeated; this parameter must be 0 or a positive number.
     *                Use <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-repeat-indefinitely">UI_ANIMATION_REPEAT_INDEFINITELY</a> (-1) to repeat the loop indefinitely until the storyboard is trimmed or concluded.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_END_KEYFRAME_NOT_DETERMINED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * It might not be possible to determine the end keyframe time when the start keyframe is reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_LOOPS_OVERLAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Two repeated portions of a storyboard might overlap.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-repeatbetweenkeyframes
     */
    RepeatBetweenKeyframes(startKeyframe, endKeyframe, repetitionCount) {
        result := ComCall(8, this, "ptr", startKeyframe, "ptr", endKeyframe, "int", repetitionCount, "HRESULT")
        return result
    }

    /**
     * Directs the storyboard to hold the specified animation variable at its final value until the storyboard ends. (IUIAnimationStoryboard.HoldVariable)
     * @remarks
     * When a storyboard is playing, it has exclusive access to any variables it animates unless the storyboard is trimmed by a higher priority storyboard. Typically, this exclusive access is released  when the last transition in the storyboard for that variable finishes playing. Applications can call this method to maintain exclusive access to the animation variable and hold the variable, at the final value of the last transition, until the end of the storyboard.
     * @param {IUIAnimationVariable} variable The animation variable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-holdvariable
     */
    HoldVariable(variable) {
        result := ComCall(9, this, "ptr", variable, "HRESULT")
        return result
    }

    /**
     * Sets the longest acceptable delay before the scheduled storyboard begins. (IUIAnimationStoryboard.SetLongestAcceptableDelay)
     * @remarks
     * For a storyboard to be successfully scheduled, it must begin before the longest acceptable delay has elapsed. This delay is determined in the following order: the delay value set by calling this method, the delay value set by calling the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager-setdefaultlongestacceptabledelay">IUIAnimationManager::SetDefaultLongestAcceptableDelay</a> method, or 0.0 if neither of these methods has been called.
     * @param {Float} delay The longest acceptable delay. This parameter can be a positive value, or <b>UI_ANIMATION_SECONDS_EVENTUALLY</b> (-1) to indicate that any finite delay is acceptable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-setlongestacceptabledelay
     */
    SetLongestAcceptableDelay(delay) {
        result := ComCall(10, this, "double", delay, "HRESULT")
        return result
    }

    /**
     * Directs the storyboard to schedule itself for play. (IUIAnimationStoryboard.Schedule)
     * @remarks
     * This method directs a storyboard to attempt to add itself to the schedule of playing storyboards. The rules are as follows:
     * 
     * <ul>
     * <li>
     * If there are no playing storyboards animating any of the same animation variables, the attempt succeeds and the storyboard starts playing immediately.
     * 
     * </li>
     * <li>
     * If the storyboard has priority to cancel, trim, conclude, or compress conflicting storyboards, the attempt to schedule succeeds and the storyboard begins playing as soon as possible.
     * 
     * </li>
     * <li>
     * If the storyboard does not have priority, the attempt fails and the <i>schedulingResult</i> parameter is set to <b>UI_ANIMATION_SCHEDULING_INSUFFICIENT_PRIORITY</b>.
     * 
     * </li>
     * </ul>
     * If this method is called from a handler for <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler-onstoryboardstatuschanged">OnStoryboardStatusChanged</a> events, the <i>schedulingResult</i> parameter is set to <b>UI_ANIMATION_SCHEDULING_DEFERRED</b>.  The only way to determine whether the storyboard is successfully scheduled is to set a storyboard event handler and check whether the storyboard's status ever becomes <b>UI_ANIMATION_STORYBOARD_INSUFFICIENT_PRIORITY</b>.
     * 
     * It is possible reuse a storyboard by calling <b>Schedule</b> again after its status has reached <b>UI_ANIMATION_STORYBOARD_READY</b>.  An attempt to schedule a storyboard when it is in any state other than <b>UI_ANIMATION_STORYBOARD_BUILDING</b> or <b>UI_ANIMATION_STORYBOARD_READY</b> fails, and  <i>schedulingResult</i> is set to <b>UI_ANIMATION_SCHEDULING_ALREADY_SCHEDULED</b>.
     * @param {Float} timeNow The current time.
     * @returns {Integer} The result of the scheduling request.
     *             This parameter can be omitted from calls to this method.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-schedule
     */
    Schedule(timeNow) {
        result := ComCall(11, this, "double", timeNow, "int*", &schedulingResult := 0, "HRESULT")
        return schedulingResult
    }

    /**
     * Completes the current iteration of a keyframe loop that is in progress (where the loop is set to UI_ANIMATION_REPEAT_INDEFINITELY), terminates the loop, and continues with the storyboard. (IUIAnimationStoryboard.Conclude)
     * @remarks
     * This method specifies that any subsequent  keyframe loops that have a repetition count of <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-repeat-indefinitely">UI_ANIMATION_REPEAT_INDEFINITELY</a> (-1) will be skipped while the remainder of the storyboard is played.  
     * 
     * An iteration of a keyframe loop that is in progress will be completed before the remainder of the storyboard plays.
     * 
     * If this method is called  at the end  of a keyframe loop iteration, the loop is terminated and the loop value is set to the starting loop value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-conclude
     */
    Conclude() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Finishes the storyboard within the specified time, compressing the storyboard if necessary. (IUIAnimationStoryboard.Finish)
     * @remarks
     * This method has no effect on storyboard events. Events continue to be raised as expected while the storyboard plays.
     * @param {Float} completionDeadline The maximum amount of time that the storyboard can use to finish playing.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-finish
     */
    Finish(completionDeadline) {
        result := ComCall(13, this, "double", completionDeadline, "HRESULT")
        return result
    }

    /**
     * Terminates the storyboard, releases all related animation variables, and removes the storyboard from the schedule. (IUIAnimationStoryboard.Abandon)
     * @remarks
     * This method can be called before or after the storyboard starts playing.
     * 
     * This method does not trigger any storyboard events.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-abandon
     */
    Abandon() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Sets the tag for the storyboard. (IUIAnimationStoryboard.SetTag)
     * @remarks
     * A tag is a pairing of an integer identifier (<i>id</i>) with a COM object (<i>object</i>); it can be used by an application to identify a storyboard.
     * @param {IUnknown} _object 
     * @param {Integer} id The identifier portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_STORYBOARD_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The storyboard is currently in the schedule.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-settag
     */
    SetTag(_object, id) {
        result := ComCall(15, this, "ptr", _object, "uint", id, "HRESULT")
        return result
    }

    /**
     * Gets the tag for a storyboard. (IUIAnimationStoryboard.GetTag)
     * @remarks
     * A tag is a pairing of an integer identifier (<i>id</i>) with a COM object (<i>object</i>); it can be used by an application to identify a storyboard.
     * 
     * The parameters are optional so that the method can return both portions of the tag, or just the identifier or object portion.
     * @param {Pointer<IUnknown>} _object 
     * @param {Pointer<Integer>} id The identifier portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
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
     * The storyboard's tag was not set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-gettag
     */
    GetTag(_object, id) {
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr*", _object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * Gets the status of the storyboard. (IUIAnimationStoryboard.GetStatus)
     * @remarks
     * Unless this method is called from a handler for <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler-onstoryboardstatuschanged">OnStoryboardStatusChanged</a> events, the only values it returns are <b>UI_ANIMATION_STORYBOARD_BUILDING</b>, <b>UI_ANIMATION_STORYBOARD_SCHEDULED</b>,
     * <b>UI_ANIMATION_STORYBOARD_PLAYING</b>, and <b>UI_ANIMATION_STORYBOARD_READY</b>.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-getstatus
     */
    GetStatus() {
        result := ComCall(17, this, "int*", &_status := 0, "HRESULT")
        return _status
    }

    /**
     * Gets the time that has elapsed since the storyboard started playing. (IUIAnimationStoryboard.GetElapsedTime)
     * @returns {Float} The elapsed time.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-getelapsedtime
     */
    GetElapsedTime() {
        result := ComCall(18, this, "double*", &elapsedTime := 0, "HRESULT")
        return elapsedTime
    }

    /**
     * Specifies a handler for storyboard events. (IUIAnimationStoryboard.SetStoryboardEventHandler)
     * @remarks
     * Passing <b>NULL</b> for the <i>handler</i> parameter causes Windows Animation to release its reference to any handler object you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager-shutdown">IUIAnimationManager::Shutdown</a> method.
     * @param {IUIAnimationStoryboardEventHandler} handler The handler to be called whenever storyboard status and update events occur.
     *             
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationstoryboardeventhandler">IUIAnimationStoryboardEventHandler</a> interface or be <b>NULL</b>. See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-setstoryboardeventhandler
     */
    SetStoryboardEventHandler(handler) {
        result := ComCall(19, this, "ptr", handler, "HRESULT")
        return result
    }
}
