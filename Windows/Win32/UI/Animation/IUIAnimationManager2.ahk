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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAnimationVectorVariable", "CreateAnimationVariable", "ScheduleTransition", "CreateStoryboard", "FinishAllStoryboards", "AbandonAllStoryboards", "Update", "GetVariableFromTag", "GetStoryboardFromTag", "EstimateNextEventTime", "GetStatus", "SetAnimationMode", "Pause", "Resume", "SetManagerEventHandler", "SetCancelPriorityComparison", "SetTrimPriorityComparison", "SetCompressPriorityComparison", "SetConcludePriorityComparison", "SetDefaultLongestAcceptableDelay", "Shutdown"]

    /**
     * 
     * @param {Pointer<Float>} initialValue 
     * @param {Integer} cDimension 
     * @param {Pointer<IUIAnimationVariable2>} variable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-createanimationvectorvariable
     */
    CreateAnimationVectorVariable(initialValue, cDimension, variable) {
        initialValueMarshal := initialValue is VarRef ? "double*" : "ptr"

        result := ComCall(3, this, initialValueMarshal, initialValue, "uint", cDimension, "ptr*", variable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} initialValue 
     * @param {Pointer<IUIAnimationVariable2>} variable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-createanimationvariable
     */
    CreateAnimationVariable(initialValue, variable) {
        result := ComCall(4, this, "double", initialValue, "ptr*", variable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationVariable2} variable 
     * @param {IUIAnimationTransition2} transition 
     * @param {Float} timeNow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-scheduletransition
     */
    ScheduleTransition(variable, transition, timeNow) {
        result := ComCall(5, this, "ptr", variable, "ptr", transition, "double", timeNow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationStoryboard2>} storyboard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-createstoryboard
     */
    CreateStoryboard(storyboard) {
        result := ComCall(6, this, "ptr*", storyboard, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} completionDeadline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-finishallstoryboards
     */
    FinishAllStoryboards(completionDeadline) {
        result := ComCall(7, this, "double", completionDeadline, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-abandonallstoryboards
     */
    AbandonAllStoryboards() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} timeNow 
     * @param {Pointer<Integer>} updateResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-update
     */
    Update(timeNow, updateResult) {
        updateResultMarshal := updateResult is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "double", timeNow, updateResultMarshal, updateResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} object 
     * @param {Integer} id 
     * @param {Pointer<IUIAnimationVariable2>} variable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-getvariablefromtag
     */
    GetVariableFromTag(object, id, variable) {
        result := ComCall(10, this, "ptr", object, "uint", id, "ptr*", variable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} object 
     * @param {Integer} id 
     * @param {Pointer<IUIAnimationStoryboard2>} storyboard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-getstoryboardfromtag
     */
    GetStoryboardFromTag(object, id, storyboard) {
        result := ComCall(11, this, "ptr", object, "uint", id, "ptr*", storyboard, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} seconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime
     */
    EstimateNextEventTime(seconds) {
        secondsMarshal := seconds is VarRef ? "double*" : "ptr"

        result := ComCall(12, this, secondsMarshal, seconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-getstatus
     */
    GetStatus(status) {
        statusMarshal := status is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, statusMarshal, status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-setanimationmode
     */
    SetAnimationMode(mode) {
        result := ComCall(14, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-pause
     */
    Pause() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-resume
     */
    Resume() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationManagerEventHandler2} handler 
     * @param {BOOL} fRegisterForNextAnimationEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-setmanagereventhandler
     */
    SetManagerEventHandler(handler, fRegisterForNextAnimationEvent) {
        result := ComCall(17, this, "ptr", handler, "int", fRegisterForNextAnimationEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationPriorityComparison2} comparison 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-setcancelprioritycomparison
     */
    SetCancelPriorityComparison(comparison) {
        result := ComCall(18, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationPriorityComparison2} comparison 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-settrimprioritycomparison
     */
    SetTrimPriorityComparison(comparison) {
        result := ComCall(19, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationPriorityComparison2} comparison 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-setcompressprioritycomparison
     */
    SetCompressPriorityComparison(comparison) {
        result := ComCall(20, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationPriorityComparison2} comparison 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-setconcludeprioritycomparison
     */
    SetConcludePriorityComparison(comparison) {
        result := ComCall(21, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-setdefaultlongestacceptabledelay
     */
    SetDefaultLongestAcceptableDelay(delay) {
        result := ComCall(22, this, "double", delay, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager2-shutdown
     */
    Shutdown() {
        result := ComCall(23, this, "HRESULT")
        return result
    }
}
