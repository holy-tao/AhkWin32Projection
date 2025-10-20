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
     * 
     * @param {Pointer<IUIAnimationVariable>} variable 
     * @param {Pointer<IUIAnimationTransition>} transition 
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
     * @param {Pointer<IUIAnimationTransition>} transition 
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
     * @param {Pointer<IUIAnimationVariable>} variable 
     * @param {Pointer<IUIAnimationTransition>} transition 
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
     * @param {Pointer<IUIAnimationVariable>} variable 
     * @param {Pointer<IUIAnimationTransition>} transition 
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
     * @param {Integer} repetitionCount 
     * @returns {HRESULT} 
     */
    RepeatBetweenKeyframes(startKeyframe, endKeyframe, repetitionCount) {
        result := ComCall(8, this, "ptr", startKeyframe, "ptr", endKeyframe, "int", repetitionCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationVariable>} variable 
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
     * @param {Float} timeNow 
     * @param {Pointer<Int32>} schedulingResult 
     * @returns {HRESULT} 
     */
    Schedule(timeNow, schedulingResult) {
        result := ComCall(11, this, "double", timeNow, "int*", schedulingResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Conclude() {
        result := ComCall(12, this, "int")
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
        result := ComCall(13, this, "double", completionDeadline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abandon() {
        result := ComCall(14, this, "int")
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
        result := ComCall(15, this, "ptr", object, "uint", id, "int")
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
        result := ComCall(16, this, "ptr", object, "uint*", id, "int")
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
        result := ComCall(17, this, "int*", status, "int")
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
        result := ComCall(18, this, "double*", elapsedTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationStoryboardEventHandler>} handler 
     * @returns {HRESULT} 
     */
    SetStoryboardEventHandler(handler) {
        result := ComCall(19, this, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
