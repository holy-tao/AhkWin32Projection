#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines an animation manager, which provides a central interface for creating and managing animations in multiple dimensions.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationmanager2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationManager2 extends IUnknown{
    /**
     * The interface identifier for IUIAnimationManager2
     * @type {Guid}
     */
    static IID => Guid("{d8b6f7d4-4109-4d3f-acee-879926968cb1}")

    /**
     * The class identifier for UIAnimationManager2
     * @type {Guid}
     */
    static CLSID => Guid("{d25d8842-8884-4a4a-b321-091314379bdd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Double>} initialValue 
     * @param {Integer} cDimension 
     * @param {Pointer<IUIAnimationVariable2>} variable 
     * @returns {HRESULT} 
     */
    CreateAnimationVectorVariable(initialValue, cDimension, variable) {
        result := ComCall(3, this, "double*", initialValue, "uint", cDimension, "ptr", variable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} initialValue 
     * @param {Pointer<IUIAnimationVariable2>} variable 
     * @returns {HRESULT} 
     */
    CreateAnimationVariable(initialValue, variable) {
        result := ComCall(4, this, "double", initialValue, "ptr", variable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationVariable2>} variable 
     * @param {Pointer<IUIAnimationTransition2>} transition 
     * @param {Float} timeNow 
     * @returns {HRESULT} 
     */
    ScheduleTransition(variable, transition, timeNow) {
        result := ComCall(5, this, "ptr", variable, "ptr", transition, "double", timeNow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationStoryboard2>} storyboard 
     * @returns {HRESULT} 
     */
    CreateStoryboard(storyboard) {
        result := ComCall(6, this, "ptr", storyboard, "int")
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
        result := ComCall(7, this, "double", completionDeadline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AbandonAllStoryboards() {
        result := ComCall(8, this, "int")
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
        result := ComCall(9, this, "double", timeNow, "int*", updateResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Integer} id 
     * @param {Pointer<IUIAnimationVariable2>} variable 
     * @returns {HRESULT} 
     */
    GetVariableFromTag(object, id, variable) {
        result := ComCall(10, this, "ptr", object, "uint", id, "ptr", variable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Integer} id 
     * @param {Pointer<IUIAnimationStoryboard2>} storyboard 
     * @returns {HRESULT} 
     */
    GetStoryboardFromTag(object, id, storyboard) {
        result := ComCall(11, this, "ptr", object, "uint", id, "ptr", storyboard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} seconds 
     * @returns {HRESULT} 
     */
    EstimateNextEventTime(seconds) {
        result := ComCall(12, this, "double*", seconds, "int")
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
        result := ComCall(13, this, "int*", status, "int")
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
        result := ComCall(14, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationManagerEventHandler2>} handler 
     * @param {BOOL} fRegisterForNextAnimationEvent 
     * @returns {HRESULT} 
     */
    SetManagerEventHandler(handler, fRegisterForNextAnimationEvent) {
        result := ComCall(17, this, "ptr", handler, "int", fRegisterForNextAnimationEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationPriorityComparison2>} comparison 
     * @returns {HRESULT} 
     */
    SetCancelPriorityComparison(comparison) {
        result := ComCall(18, this, "ptr", comparison, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationPriorityComparison2>} comparison 
     * @returns {HRESULT} 
     */
    SetTrimPriorityComparison(comparison) {
        result := ComCall(19, this, "ptr", comparison, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationPriorityComparison2>} comparison 
     * @returns {HRESULT} 
     */
    SetCompressPriorityComparison(comparison) {
        result := ComCall(20, this, "ptr", comparison, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationPriorityComparison2>} comparison 
     * @returns {HRESULT} 
     */
    SetConcludePriorityComparison(comparison) {
        result := ComCall(21, this, "ptr", comparison, "int")
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
        result := ComCall(22, this, "double", delay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
