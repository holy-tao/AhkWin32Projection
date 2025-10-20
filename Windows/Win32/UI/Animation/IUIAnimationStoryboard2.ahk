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
     * 
     * @param {Pointer<IUIAnimationVariable2>} variable 
     * @param {Pointer<IUIAnimationTransition2>} transition 
     * @returns {HRESULT} 
     */
    AddTransition(variable, transition) {
        result := ComCall(3, this, "ptr", variable, "ptr", transition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {UI_ANIMATION_KEYFRAME} existingKeyframe 
     * @param {Float} offset 
     * @param {Pointer<UI_ANIMATION_KEYFRAME>} keyframe 
     * @returns {HRESULT} 
     */
    AddKeyframeAtOffset(existingKeyframe, offset, keyframe) {
        result := ComCall(4, this, "ptr", existingKeyframe, "double", offset, "ptr", keyframe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationTransition2>} transition 
     * @param {Pointer<UI_ANIMATION_KEYFRAME>} keyframe 
     * @returns {HRESULT} 
     */
    AddKeyframeAfterTransition(transition, keyframe) {
        result := ComCall(5, this, "ptr", transition, "ptr", keyframe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationVariable2>} variable 
     * @param {Pointer<IUIAnimationTransition2>} transition 
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe 
     * @returns {HRESULT} 
     */
    AddTransitionAtKeyframe(variable, transition, startKeyframe) {
        result := ComCall(6, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationVariable2>} variable 
     * @param {Pointer<IUIAnimationTransition2>} transition 
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe 
     * @param {UI_ANIMATION_KEYFRAME} endKeyframe 
     * @returns {HRESULT} 
     */
    AddTransitionBetweenKeyframes(variable, transition, startKeyframe, endKeyframe) {
        result := ComCall(7, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "ptr", endKeyframe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe 
     * @param {UI_ANIMATION_KEYFRAME} endKeyframe 
     * @param {Float} cRepetition 
     * @param {Integer} repeatMode 
     * @param {Pointer<IUIAnimationLoopIterationChangeHandler2>} pIterationChangeHandler 
     * @param {Pointer} id 
     * @param {BOOL} fRegisterForNextAnimationEvent 
     * @returns {HRESULT} 
     */
    RepeatBetweenKeyframes(startKeyframe, endKeyframe, cRepetition, repeatMode, pIterationChangeHandler, id, fRegisterForNextAnimationEvent) {
        result := ComCall(8, this, "ptr", startKeyframe, "ptr", endKeyframe, "double", cRepetition, "int", repeatMode, "ptr", pIterationChangeHandler, "ptr", id, "int", fRegisterForNextAnimationEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationVariable2>} variable 
     * @returns {HRESULT} 
     */
    HoldVariable(variable) {
        result := ComCall(9, this, "ptr", variable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} delay 
     * @returns {HRESULT} 
     */
    SetLongestAcceptableDelay(delay) {
        result := ComCall(10, this, "double", delay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} secondsDuration 
     * @returns {HRESULT} 
     */
    SetSkipDuration(secondsDuration) {
        result := ComCall(11, this, "double", secondsDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} timeNow 
     * @param {Pointer<Int32>} schedulingResult 
     * @returns {HRESULT} 
     */
    Schedule(timeNow, schedulingResult) {
        result := ComCall(12, this, "double", timeNow, "int*", schedulingResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Conclude() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} completionDeadline 
     * @returns {HRESULT} 
     */
    Finish(completionDeadline) {
        result := ComCall(14, this, "double", completionDeadline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abandon() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    SetTag(object, id) {
        result := ComCall(16, this, "ptr", object, "uint", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Pointer<UInt32>} id 
     * @returns {HRESULT} 
     */
    GetTag(object, id) {
        result := ComCall(17, this, "ptr", object, "uint*", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} status 
     * @returns {HRESULT} 
     */
    GetStatus(status) {
        result := ComCall(18, this, "int*", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} elapsedTime 
     * @returns {HRESULT} 
     */
    GetElapsedTime(elapsedTime) {
        result := ComCall(19, this, "double*", elapsedTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationStoryboardEventHandler2>} handler 
     * @param {BOOL} fRegisterStatusChangeForNextAnimationEvent 
     * @param {BOOL} fRegisterUpdateForNextAnimationEvent 
     * @returns {HRESULT} 
     */
    SetStoryboardEventHandler(handler, fRegisterStatusChangeForNextAnimationEvent, fRegisterUpdateForNextAnimationEvent) {
        result := ComCall(20, this, "ptr", handler, "int", fRegisterStatusChangeForNextAnimationEvent, "int", fRegisterUpdateForNextAnimationEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
