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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAnimationVariable", "ScheduleTransition", "CreateStoryboard", "FinishAllStoryboards", "AbandonAllStoryboards", "Update", "GetVariableFromTag", "GetStoryboardFromTag", "GetStatus", "SetAnimationMode", "Pause", "Resume", "SetManagerEventHandler", "SetCancelPriorityComparison", "SetTrimPriorityComparison", "SetCompressPriorityComparison", "SetConcludePriorityComparison", "SetDefaultLongestAcceptableDelay", "Shutdown"]

    /**
     * 
     * @param {Float} initialValue 
     * @param {Pointer<IUIAnimationVariable>} variable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-createanimationvariable
     */
    CreateAnimationVariable(initialValue, variable) {
        result := ComCall(3, this, "double", initialValue, "ptr*", variable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationVariable} variable 
     * @param {IUIAnimationTransition} transition 
     * @param {Float} timeNow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-scheduletransition
     */
    ScheduleTransition(variable, transition, timeNow) {
        result := ComCall(4, this, "ptr", variable, "ptr", transition, "double", timeNow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationStoryboard>} storyboard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-createstoryboard
     */
    CreateStoryboard(storyboard) {
        result := ComCall(5, this, "ptr*", storyboard, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} completionDeadline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-finishallstoryboards
     */
    FinishAllStoryboards(completionDeadline) {
        result := ComCall(6, this, "double", completionDeadline, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-abandonallstoryboards
     */
    AbandonAllStoryboards() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} timeNow 
     * @param {Pointer<Integer>} updateResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-update
     */
    Update(timeNow, updateResult) {
        updateResultMarshal := updateResult is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "double", timeNow, updateResultMarshal, updateResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} object 
     * @param {Integer} id 
     * @param {Pointer<IUIAnimationVariable>} variable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-getvariablefromtag
     */
    GetVariableFromTag(object, id, variable) {
        result := ComCall(9, this, "ptr", object, "uint", id, "ptr*", variable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} object 
     * @param {Integer} id 
     * @param {Pointer<IUIAnimationStoryboard>} storyboard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-getstoryboardfromtag
     */
    GetStoryboardFromTag(object, id, storyboard) {
        result := ComCall(10, this, "ptr", object, "uint", id, "ptr*", storyboard, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-getstatus
     */
    GetStatus(status) {
        statusMarshal := status is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, statusMarshal, status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-setanimationmode
     */
    SetAnimationMode(mode) {
        result := ComCall(12, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-pause
     */
    Pause() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-resume
     */
    Resume() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationManagerEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-setmanagereventhandler
     */
    SetManagerEventHandler(handler) {
        result := ComCall(15, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationPriorityComparison} comparison 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-setcancelprioritycomparison
     */
    SetCancelPriorityComparison(comparison) {
        result := ComCall(16, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationPriorityComparison} comparison 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-settrimprioritycomparison
     */
    SetTrimPriorityComparison(comparison) {
        result := ComCall(17, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationPriorityComparison} comparison 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-setcompressprioritycomparison
     */
    SetCompressPriorityComparison(comparison) {
        result := ComCall(18, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationPriorityComparison} comparison 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-setconcludeprioritycomparison
     */
    SetConcludePriorityComparison(comparison) {
        result := ComCall(19, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-setdefaultlongestacceptabledelay
     */
    SetDefaultLongestAcceptableDelay(delay) {
        result := ComCall(20, this, "double", delay, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-shutdown
     */
    Shutdown() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}
