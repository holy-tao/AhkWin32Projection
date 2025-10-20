#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the animation manager, which provides a central interface for creating and managing animations.
 * @remarks
 * 
  * <b>IUIAnimationManager</b> defines a central control object for animations.
  *          
  * A single instance of <b>IUIAnimationManager</b> is typically used to compose, schedule, and manage all animations for a client application.
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationvariable">IUIAnimationVariable</a>, <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationstoryboard">IUIAnimationStoryboard</a>are the primary components for building animations.
  *          
  * Use <b>IUIAnimationManager</b> to create and manage these components.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationmanager
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationManager extends IUnknown{
    /**
     * The interface identifier for IUIAnimationManager
     * @type {Guid}
     */
    static IID => Guid("{9169896c-ac8d-4e7d-94e5-67fa4dc2f2e8}")

    /**
     * The class identifier for UIAnimationManager
     * @type {Guid}
     */
    static CLSID => Guid("{4c1fc63a-695c-47e8-a339-1a194be3d0b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Float} initialValue 
     * @param {Pointer<IUIAnimationVariable>} variable 
     * @returns {HRESULT} 
     */
    CreateAnimationVariable(initialValue, variable) {
        result := ComCall(3, this, "double", initialValue, "ptr", variable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationVariable>} variable 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @param {Float} timeNow 
     * @returns {HRESULT} 
     */
    ScheduleTransition(variable, transition, timeNow) {
        result := ComCall(4, this, "ptr", variable, "ptr", transition, "double", timeNow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationStoryboard>} storyboard 
     * @returns {HRESULT} 
     */
    CreateStoryboard(storyboard) {
        result := ComCall(5, this, "ptr", storyboard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} completionDeadline 
     * @returns {HRESULT} 
     */
    FinishAllStoryboards(completionDeadline) {
        result := ComCall(6, this, "double", completionDeadline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AbandonAllStoryboards() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} timeNow 
     * @param {Pointer<Int32>} updateResult 
     * @returns {HRESULT} 
     */
    Update(timeNow, updateResult) {
        result := ComCall(8, this, "double", timeNow, "int*", updateResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Integer} id 
     * @param {Pointer<IUIAnimationVariable>} variable 
     * @returns {HRESULT} 
     */
    GetVariableFromTag(object, id, variable) {
        result := ComCall(9, this, "ptr", object, "uint", id, "ptr", variable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Integer} id 
     * @param {Pointer<IUIAnimationStoryboard>} storyboard 
     * @returns {HRESULT} 
     */
    GetStoryboardFromTag(object, id, storyboard) {
        result := ComCall(10, this, "ptr", object, "uint", id, "ptr", storyboard, "int")
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
        result := ComCall(11, this, "int*", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    SetAnimationMode(mode) {
        result := ComCall(12, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationManagerEventHandler>} handler 
     * @returns {HRESULT} 
     */
    SetManagerEventHandler(handler) {
        result := ComCall(15, this, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationPriorityComparison>} comparison 
     * @returns {HRESULT} 
     */
    SetCancelPriorityComparison(comparison) {
        result := ComCall(16, this, "ptr", comparison, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationPriorityComparison>} comparison 
     * @returns {HRESULT} 
     */
    SetTrimPriorityComparison(comparison) {
        result := ComCall(17, this, "ptr", comparison, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationPriorityComparison>} comparison 
     * @returns {HRESULT} 
     */
    SetCompressPriorityComparison(comparison) {
        result := ComCall(18, this, "ptr", comparison, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationPriorityComparison>} comparison 
     * @returns {HRESULT} 
     */
    SetConcludePriorityComparison(comparison) {
        result := ComCall(19, this, "ptr", comparison, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} delay 
     * @returns {HRESULT} 
     */
    SetDefaultLongestAcceptableDelay(delay) {
        result := ComCall(20, this, "double", delay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
