#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a storyboard, which contains a group of transitions that are synchronized relative to one another.
 * @remarks
 * 
 * <b>IUIAnimationStoryboard</b> is a primary component for building animations,
 *          along with 
 *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationvariable">IUIAnimationVariable</a> and 
 *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationstoryboard
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
     * Adds a transition to the storyboard.
     * @param {IUIAnimationVariable} variable The animation variable for which the transition is to be added.
     * @param {IUIAnimationTransition} transition The transition to be added.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
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
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-addtransition
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
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-addkeyframeatoffset
     */
    AddKeyframeAtOffset(existingKeyframe, offset) {
        result := ComCall(4, this, "ptr", existingKeyframe, "double", offset, "ptr*", &keyframe := 0, "HRESULT")
        return keyframe
    }

    /**
     * Adds a keyframe at the end of the specified transition.
     * @param {IUIAnimationTransition} transition The transition after which a keyframe is to be added.
     * @returns {UI_ANIMATION_KEYFRAME} The keyframe to be added.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-addkeyframeaftertransition
     */
    AddKeyframeAfterTransition(transition) {
        result := ComCall(5, this, "ptr", transition, "ptr*", &keyframe := 0, "HRESULT")
        return keyframe
    }

    /**
     * Adds a transition that starts at the specified keyframe.
     * @param {IUIAnimationVariable} variable The animation variable for which a transition is to be added.
     * @param {IUIAnimationTransition} transition The transition to be added.
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe The keyframe that specifies the beginning of the new transition.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
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
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-addtransitionatkeyframe
     */
    AddTransitionAtKeyframe(variable, transition, startKeyframe) {
        result := ComCall(6, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "HRESULT")
        return result
    }

    /**
     * Adds a transition between two keyframes.
     * @param {IUIAnimationVariable} variable The animation variable for which the transition is to be added.
     * @param {IUIAnimationTransition} transition The transition to be added.
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe A keyframe that specifies the beginning of the new transition.
     * @param {UI_ANIMATION_KEYFRAME} endKeyframe A keyframe that specifies the end of the new transition. It must not be possible for <i>endKeyframe</i> to appear earlier in the storyboard than <i>startKeyframe</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
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
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-addtransitionbetweenkeyframes
     */
    AddTransitionBetweenKeyframes(variable, transition, startKeyframe, endKeyframe) {
        result := ComCall(7, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "ptr", endKeyframe, "HRESULT")
        return result
    }

    /**
     * Creates a loop between two specified keyframes.
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe The keyframe at which the loop is to begin.
     * @param {UI_ANIMATION_KEYFRAME} endKeyframe The keyframe at which the loop is to end. It must not be posssible for <i>endKeyframe</i> to occur earlier in the storyboard than <i>startKeyframe</i>.
     * @param {Integer} repetitionCount The number of times the loop is to be repeated; this parameter must be 0 or a positive number.
     *                Use <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-repeat-indefinitely">UI_ANIMATION_REPEAT_INDEFINITELY</a> (-1) to repeat the loop indefinitely until the storyboard is trimmed or concluded.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
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
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-repeatbetweenkeyframes
     */
    RepeatBetweenKeyframes(startKeyframe, endKeyframe, repetitionCount) {
        result := ComCall(8, this, "ptr", startKeyframe, "ptr", endKeyframe, "int", repetitionCount, "HRESULT")
        return result
    }

    /**
     * Directs the storyboard to hold the specified animation variable at its final value until the storyboard ends.
     * @param {IUIAnimationVariable} variable The animation variable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-holdvariable
     */
    HoldVariable(variable) {
        result := ComCall(9, this, "ptr", variable, "HRESULT")
        return result
    }

    /**
     * Sets the longest acceptable delay before the scheduled storyboard begins.
     * @param {Float} delay The longest acceptable delay. This parameter can be a positive value, or <b>UI_ANIMATION_SECONDS_EVENTUALLY</b> (-1) to indicate that any finite delay is acceptable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-setlongestacceptabledelay
     */
    SetLongestAcceptableDelay(delay) {
        result := ComCall(10, this, "double", delay, "HRESULT")
        return result
    }

    /**
     * Directs the storyboard to schedule itself for play.
     * @param {Float} timeNow The current time.
     * @returns {Integer} The result of the scheduling request.
     *             This parameter can be omitted from calls to this method.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-schedule
     */
    Schedule(timeNow) {
        result := ComCall(11, this, "double", timeNow, "int*", &schedulingResult := 0, "HRESULT")
        return schedulingResult
    }

    /**
     * Completes the current iteration of a keyframe loop that is in progress (where the loop is set to UI_ANIMATION_REPEAT_INDEFINITELY), terminates the loop, and continues with the storyboard.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-conclude
     */
    Conclude() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Finishes the storyboard within the specified time, compressing the storyboard if necessary.
     * @param {Float} completionDeadline The maximum amount of time that the storyboard can use to finish playing.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-finish
     */
    Finish(completionDeadline) {
        result := ComCall(13, this, "double", completionDeadline, "HRESULT")
        return result
    }

    /**
     * Terminates the storyboard, releases all related animation variables, and removes the storyboard from the schedule.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-abandon
     */
    Abandon() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Sets the tag for the storyboard.
     * @param {IUnknown} object The object portion of the tag.        
     *             This parameter can be <b>NULL</b>.
     * @param {Integer} id The identifier portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
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
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-settag
     */
    SetTag(object, id) {
        result := ComCall(15, this, "ptr", object, "uint", id, "HRESULT")
        return result
    }

    /**
     * Gets the tag for a storyboard.
     * @param {Pointer<IUnknown>} object The object portion of the tag.
     * @param {Pointer<Integer>} id The identifier portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
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
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-gettag
     */
    GetTag(object, id) {
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr*", object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * Gets the status of the storyboard.
     * @returns {Integer} The storyboard status.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-getstatus
     */
    GetStatus() {
        result := ComCall(17, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * Gets the time that has elapsed since the storyboard started playing.
     * @returns {Float} The elapsed time.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-getelapsedtime
     */
    GetElapsedTime() {
        result := ComCall(18, this, "double*", &elapsedTime := 0, "HRESULT")
        return elapsedTime
    }

    /**
     * Specifies a handler for storyboard events.
     * @param {IUIAnimationStoryboardEventHandler} handler The handler to be called whenever storyboard status and update events occur.
     *             
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationstoryboardeventhandler">IUIAnimationStoryboardEventHandler</a> interface or be <b>NULL</b>. See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationstoryboard-setstoryboardeventhandler
     */
    SetStoryboardEventHandler(handler) {
        result := ComCall(19, this, "ptr", handler, "HRESULT")
        return result
    }
}
