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
     * 
     * @param {IUIAnimationVariable2} variable 
     * @param {IUIAnimationTransition2} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-addtransition
     */
    AddTransition(variable, transition) {
        result := ComCall(3, this, "ptr", variable, "ptr", transition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {UI_ANIMATION_KEYFRAME} existingKeyframe 
     * @param {Float} offset 
     * @returns {UI_ANIMATION_KEYFRAME} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-addkeyframeatoffset
     */
    AddKeyframeAtOffset(existingKeyframe, offset) {
        result := ComCall(4, this, "ptr", existingKeyframe, "double", offset, "ptr*", &keyframe := 0, "HRESULT")
        return keyframe
    }

    /**
     * 
     * @param {IUIAnimationTransition2} transition 
     * @returns {UI_ANIMATION_KEYFRAME} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-addkeyframeaftertransition
     */
    AddKeyframeAfterTransition(transition) {
        result := ComCall(5, this, "ptr", transition, "ptr*", &keyframe := 0, "HRESULT")
        return keyframe
    }

    /**
     * 
     * @param {IUIAnimationVariable2} variable 
     * @param {IUIAnimationTransition2} transition 
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-addtransitionatkeyframe
     */
    AddTransitionAtKeyframe(variable, transition, startKeyframe) {
        result := ComCall(6, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationVariable2} variable 
     * @param {IUIAnimationTransition2} transition 
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe 
     * @param {UI_ANIMATION_KEYFRAME} endKeyframe 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-addtransitionbetweenkeyframes
     */
    AddTransitionBetweenKeyframes(variable, transition, startKeyframe, endKeyframe) {
        result := ComCall(7, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "ptr", endKeyframe, "HRESULT")
        return result
    }

    /**
     * 
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe 
     * @param {UI_ANIMATION_KEYFRAME} endKeyframe 
     * @param {Float} cRepetition 
     * @param {Integer} repeatMode 
     * @param {IUIAnimationLoopIterationChangeHandler2} pIterationChangeHandler 
     * @param {Pointer} id 
     * @param {BOOL} fRegisterForNextAnimationEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-repeatbetweenkeyframes
     */
    RepeatBetweenKeyframes(startKeyframe, endKeyframe, cRepetition, repeatMode, pIterationChangeHandler, id, fRegisterForNextAnimationEvent) {
        result := ComCall(8, this, "ptr", startKeyframe, "ptr", endKeyframe, "double", cRepetition, "int", repeatMode, "ptr", pIterationChangeHandler, "ptr", id, "int", fRegisterForNextAnimationEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationVariable2} variable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-holdvariable
     */
    HoldVariable(variable) {
        result := ComCall(9, this, "ptr", variable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-setlongestacceptabledelay
     */
    SetLongestAcceptableDelay(delay) {
        result := ComCall(10, this, "double", delay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} secondsDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-setskipduration
     */
    SetSkipDuration(secondsDuration) {
        result := ComCall(11, this, "double", secondsDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} timeNow 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-schedule
     */
    Schedule(timeNow) {
        result := ComCall(12, this, "double", timeNow, "int*", &schedulingResult := 0, "HRESULT")
        return schedulingResult
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-conclude
     */
    Conclude() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} completionDeadline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-finish
     */
    Finish(completionDeadline) {
        result := ComCall(14, this, "double", completionDeadline, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-abandon
     */
    Abandon() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} object 
     * @param {Integer} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-settag
     */
    SetTag(object, id) {
        result := ComCall(16, this, "ptr", object, "uint", id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Pointer<Integer>} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-gettag
     */
    GetTag(object, id) {
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "ptr*", object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-getstatus
     */
    GetStatus() {
        result := ComCall(18, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-getelapsedtime
     */
    GetElapsedTime() {
        result := ComCall(19, this, "double*", &elapsedTime := 0, "HRESULT")
        return elapsedTime
    }

    /**
     * 
     * @param {IUIAnimationStoryboardEventHandler2} handler 
     * @param {BOOL} fRegisterStatusChangeForNextAnimationEvent 
     * @param {BOOL} fRegisterUpdateForNextAnimationEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard2-setstoryboardeventhandler
     */
    SetStoryboardEventHandler(handler, fRegisterStatusChangeForNextAnimationEvent, fRegisterUpdateForNextAnimationEvent) {
        result := ComCall(20, this, "ptr", handler, "int", fRegisterStatusChangeForNextAnimationEvent, "int", fRegisterUpdateForNextAnimationEvent, "HRESULT")
        return result
    }
}
