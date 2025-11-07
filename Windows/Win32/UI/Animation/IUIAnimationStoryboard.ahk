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
     * 
     * @param {IUIAnimationVariable} variable 
     * @param {IUIAnimationTransition} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-addtransition
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
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-addkeyframeatoffset
     */
    AddKeyframeAtOffset(existingKeyframe, offset) {
        result := ComCall(4, this, "ptr", existingKeyframe, "double", offset, "ptr*", &keyframe := 0, "HRESULT")
        return keyframe
    }

    /**
     * 
     * @param {IUIAnimationTransition} transition 
     * @returns {UI_ANIMATION_KEYFRAME} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-addkeyframeaftertransition
     */
    AddKeyframeAfterTransition(transition) {
        result := ComCall(5, this, "ptr", transition, "ptr*", &keyframe := 0, "HRESULT")
        return keyframe
    }

    /**
     * 
     * @param {IUIAnimationVariable} variable 
     * @param {IUIAnimationTransition} transition 
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-addtransitionatkeyframe
     */
    AddTransitionAtKeyframe(variable, transition, startKeyframe) {
        result := ComCall(6, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationVariable} variable 
     * @param {IUIAnimationTransition} transition 
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe 
     * @param {UI_ANIMATION_KEYFRAME} endKeyframe 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-addtransitionbetweenkeyframes
     */
    AddTransitionBetweenKeyframes(variable, transition, startKeyframe, endKeyframe) {
        result := ComCall(7, this, "ptr", variable, "ptr", transition, "ptr", startKeyframe, "ptr", endKeyframe, "HRESULT")
        return result
    }

    /**
     * 
     * @param {UI_ANIMATION_KEYFRAME} startKeyframe 
     * @param {UI_ANIMATION_KEYFRAME} endKeyframe 
     * @param {Integer} repetitionCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-repeatbetweenkeyframes
     */
    RepeatBetweenKeyframes(startKeyframe, endKeyframe, repetitionCount) {
        result := ComCall(8, this, "ptr", startKeyframe, "ptr", endKeyframe, "int", repetitionCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationVariable} variable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-holdvariable
     */
    HoldVariable(variable) {
        result := ComCall(9, this, "ptr", variable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-setlongestacceptabledelay
     */
    SetLongestAcceptableDelay(delay) {
        result := ComCall(10, this, "double", delay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} timeNow 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-schedule
     */
    Schedule(timeNow) {
        result := ComCall(11, this, "double", timeNow, "int*", &schedulingResult := 0, "HRESULT")
        return schedulingResult
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-conclude
     */
    Conclude() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} completionDeadline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-finish
     */
    Finish(completionDeadline) {
        result := ComCall(13, this, "double", completionDeadline, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-abandon
     */
    Abandon() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} object 
     * @param {Integer} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-settag
     */
    SetTag(object, id) {
        result := ComCall(15, this, "ptr", object, "uint", id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Pointer<Integer>} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-gettag
     */
    GetTag(object, id) {
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr*", object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-getstatus
     */
    GetStatus() {
        result := ComCall(17, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-getelapsedtime
     */
    GetElapsedTime() {
        result := ComCall(18, this, "double*", &elapsedTime := 0, "HRESULT")
        return elapsedTime
    }

    /**
     * 
     * @param {IUIAnimationStoryboardEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboard-setstoryboardeventhandler
     */
    SetStoryboardEventHandler(handler) {
        result := ComCall(19, this, "ptr", handler, "HRESULT")
        return result
    }
}
