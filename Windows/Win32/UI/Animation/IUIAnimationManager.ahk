#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAnimationVariable.ahk
#Include .\IUIAnimationStoryboard.ahk
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
     * Creates a new animation variable.
     * @param {Float} initialValue The initial value for the new animation variable.
     * @returns {IUIAnimationVariable} The new animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-createanimationvariable
     */
    CreateAnimationVariable(initialValue) {
        result := ComCall(3, this, "double", initialValue, "ptr*", &variable := 0, "HRESULT")
        return IUIAnimationVariable(variable)
    }

    /**
     * Creates and schedules a single-transition storyboard.
     * @param {IUIAnimationVariable} variable The animation variable.
     * @param {IUIAnimationTransition} transition A transition to be applied to the animation variable.
     * @param {Float} timeNow The current system time.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-scheduletransition
     */
    ScheduleTransition(variable, transition, timeNow) {
        result := ComCall(4, this, "ptr", variable, "ptr", transition, "double", timeNow, "HRESULT")
        return result
    }

    /**
     * Creates a new storyboard.
     * @returns {IUIAnimationStoryboard} The new storyboard.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-createstoryboard
     */
    CreateStoryboard() {
        result := ComCall(5, this, "ptr*", &storyboard := 0, "HRESULT")
        return IUIAnimationStoryboard(storyboard)
    }

    /**
     * Finishes all active storyboards within the specified time interval.
     * @param {Float} completionDeadline The maximum time interval during which all storyboards must be finished.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-finishallstoryboards
     */
    FinishAllStoryboards(completionDeadline) {
        result := ComCall(6, this, "double", completionDeadline, "HRESULT")
        return result
    }

    /**
     * Abandons all active storyboards.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-abandonallstoryboards
     */
    AbandonAllStoryboards() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Updates the values of all animation variables.
     * @param {Float} timeNow The current system time. This parameter must be greater than or equal to 0.0.
     * @returns {Integer} The result of the update.
     *             This parameter can be omitted from calls to this method.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-update
     */
    Update(timeNow) {
        result := ComCall(8, this, "double", timeNow, "int*", &updateResult := 0, "HRESULT")
        return updateResult
    }

    /**
     * Gets the animation variable with the specified tag.
     * @param {IUnknown} object The object portion of the tag.
     *             This parameter can be <b>NULL</b>.
     * @param {Integer} id The identifier portion of the tag.
     * @returns {IUIAnimationVariable} The animation variable that matches the specified tag, or <b>NULL</b> if no match is found.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-getvariablefromtag
     */
    GetVariableFromTag(object, id) {
        result := ComCall(9, this, "ptr", object, "uint", id, "ptr*", &variable := 0, "HRESULT")
        return IUIAnimationVariable(variable)
    }

    /**
     * Gets the storyboard with the specified tag.
     * @param {IUnknown} object The object portion of the tag.
     *             This parameter can be <b>NULL</b>.
     * @param {Integer} id The identifier portion of the tag.
     * @returns {IUIAnimationStoryboard} The storyboard that matches the specified tag, or <b>NULL</b> if no match is found.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-getstoryboardfromtag
     */
    GetStoryboardFromTag(object, id) {
        result := ComCall(10, this, "ptr", object, "uint", id, "ptr*", &storyboard := 0, "HRESULT")
        return IUIAnimationStoryboard(storyboard)
    }

    /**
     * Gets the status of the animation manager.
     * @returns {Integer} The status.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-getstatus
     */
    GetStatus() {
        result := ComCall(11, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * Sets the animation mode.
     * @param {Integer} mode The animation mode.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-setanimationmode
     */
    SetAnimationMode(mode) {
        result := ComCall(12, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * Pauses all animations.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-pause
     */
    Pause() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Resumes all animations.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-resume
     */
    Resume() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Specifies a handler for animation manager status updates.
     * @param {IUIAnimationManagerEventHandler} handler The event handler to be called when the status of the animation manager changes.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationmanagereventhandler">IUIAnimationManagerEventHandler</a> interface or be <b>NULL</b>.
     * 
     * See Remarks section for more information.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-setmanagereventhandler
     */
    SetManagerEventHandler(handler) {
        result := ComCall(15, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Sets the priority comparison handler to be called to determine whether a scheduled storyboard can be canceled.
     * @param {IUIAnimationPriorityComparison} comparison The priority comparison handler for cancelation.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison">IUIAnimationPriorityComparison</a> interface or be <b>NULL</b>.
     * 
     * See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-setcancelprioritycomparison
     */
    SetCancelPriorityComparison(comparison) {
        result := ComCall(16, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * Sets the priority comparison handler to be called to determine whether a scheduled storyboard can be trimmed.
     * @param {IUIAnimationPriorityComparison} comparison The priority comparison handler for trimming.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison">IUIAnimationPriorityComparison</a> interface or be <b>NULL</b>.
     * 
     * See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-settrimprioritycomparison
     */
    SetTrimPriorityComparison(comparison) {
        result := ComCall(17, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * Sets the priority comparison handler to be called to determine whether a scheduled storyboard can be compressed.
     * @param {IUIAnimationPriorityComparison} comparison The priority comparison handler for compression.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison">IUIAnimationPriorityComparison</a> interface or be <b>NULL</b>. See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-setcompressprioritycomparison
     */
    SetCompressPriorityComparison(comparison) {
        result := ComCall(18, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * Sets the priority comparison handler to be called to determine whether a scheduled storyboard can be concluded.
     * @param {IUIAnimationPriorityComparison} comparison The priority comparison handler for conclusion. The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison">IUIAnimationPriorityComparison</a> interface or be <b>NULL</b>.
     *             See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-setconcludeprioritycomparison
     */
    SetConcludePriorityComparison(comparison) {
        result := ComCall(19, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * Sets the default acceptable animation delay. This is the length of time that may pass before storyboards begin.
     * @param {Float} delay The default delay. This parameter can be a positive value, or <b>UI_ANIMATION_SECONDS_EVENTUALLY</b> (-1) to indicate that any finite delay is acceptable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.            
     *             See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-setdefaultlongestacceptabledelay
     */
    SetDefaultLongestAcceptableDelay(delay) {
        result := ComCall(20, this, "double", delay, "HRESULT")
        return result
    }

    /**
     * Shuts down the animation manager and all its associated objects.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager-shutdown
     */
    Shutdown() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}
