#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAnimationVariable2.ahk
#Include .\IUIAnimationStoryboard2.ahk
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
     * Creates a new animation variable for each specified dimension.
     * @param {Pointer<Float>} initialValue A vector (of size <i>cDimension</i>) of  initial values for the animation variable.
     * @param {Integer} cDimension The number of dimensions that require animated values. This parameter specifies the number of values listed in <i>initialValue</i>.
     * @returns {IUIAnimationVariable2} The new animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-createanimationvectorvariable
     */
    CreateAnimationVectorVariable(initialValue, cDimension) {
        initialValueMarshal := initialValue is VarRef ? "double*" : "ptr"

        result := ComCall(3, this, initialValueMarshal, initialValue, "uint", cDimension, "ptr*", &variable := 0, "HRESULT")
        return IUIAnimationVariable2(variable)
    }

    /**
     * Creates a new animation variable.
     * @param {Float} initialValue The initial value for the animation variable.
     * @returns {IUIAnimationVariable2} The new animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-createanimationvariable
     */
    CreateAnimationVariable(initialValue) {
        result := ComCall(4, this, "double", initialValue, "ptr*", &variable := 0, "HRESULT")
        return IUIAnimationVariable2(variable)
    }

    /**
     * Creates and schedules a single-transition storyboard.
     * @param {IUIAnimationVariable2} variable The animation variable.
     * @param {IUIAnimationTransition2} transition A transition to be applied to the animation variable.
     * @param {Float} timeNow The current system time.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-scheduletransition
     */
    ScheduleTransition(variable, transition, timeNow) {
        result := ComCall(5, this, "ptr", variable, "ptr", transition, "double", timeNow, "HRESULT")
        return result
    }

    /**
     * Creates a new storyboard.
     * @returns {IUIAnimationStoryboard2} The new storyboard.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-createstoryboard
     */
    CreateStoryboard() {
        result := ComCall(6, this, "ptr*", &storyboard := 0, "HRESULT")
        return IUIAnimationStoryboard2(storyboard)
    }

    /**
     * Finishes all active storyboards within the specified time interval.
     * @param {Float} completionDeadline The maximum time interval during which all storyboards must be finished.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-finishallstoryboards
     */
    FinishAllStoryboards(completionDeadline) {
        result := ComCall(7, this, "double", completionDeadline, "HRESULT")
        return result
    }

    /**
     * Abandons all active storyboards.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-abandonallstoryboards
     */
    AbandonAllStoryboards() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Updates the values of all animation variables.
     * @param {Float} timeNow The current system time. This parameter must be greater than or equal to 0.0.
     * @returns {Integer} The result of the update.
     *             You can omit this parameter from calls to this method.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-update
     */
    Update(timeNow) {
        result := ComCall(9, this, "double", timeNow, "int*", &updateResult := 0, "HRESULT")
        return updateResult
    }

    /**
     * Gets the animation variable with the specified tag.
     * @param {IUnknown} object The object portion of the tag.
     *             This parameter can be NULL.
     * @param {Integer} id The identifier portion of the tag.
     * @returns {IUIAnimationVariable2} The animation variable that matches the specified tag, or <b>NULL</b> if no match is found.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-getvariablefromtag
     */
    GetVariableFromTag(object, id) {
        result := ComCall(10, this, "ptr", object, "uint", id, "ptr*", &variable := 0, "HRESULT")
        return IUIAnimationVariable2(variable)
    }

    /**
     * Gets the storyboard with the specified tag.
     * @param {IUnknown} object The object portion of the tag.
     *             This parameter can be NULL.
     * @param {Integer} id The identifier portion of the tag.
     * @returns {IUIAnimationStoryboard2} The storyboard that matches the specified tag, or <b>NULL</b> if no match is found.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-getstoryboardfromtag
     */
    GetStoryboardFromTag(object, id) {
        result := ComCall(11, this, "ptr", object, "uint", id, "ptr*", &storyboard := 0, "HRESULT")
        return IUIAnimationStoryboard2(storyboard)
    }

    /**
     * Retrieves an estimate of the time interval before the next animation event.
     * @returns {Float} The estimated time, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime
     */
    EstimateNextEventTime() {
        result := ComCall(12, this, "double*", &seconds := 0, "HRESULT")
        return seconds
    }

    /**
     * Gets the status of the animation manager.
     * @returns {Integer} The status of the animation manager.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-getstatus
     */
    GetStatus() {
        result := ComCall(13, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * Sets the animation mode.
     * @param {Integer} mode The animation mode.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-setanimationmode
     */
    SetAnimationMode(mode) {
        result := ComCall(14, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * Pauses all animations.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-pause
     */
    Pause() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Resumes all animations.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-resume
     */
    Resume() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Specifies a handler for animation manager status updates.
     * @param {IUIAnimationManagerEventHandler2} handler The event handler to be called when the status of the animation manager changes.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationmanagereventhandler">IUIAnimationManagerEventHandler</a> interface or be <b>NULL</b>. See Remarks for more info.
     * @param {BOOL} fRegisterForNextAnimationEvent If <b>TRUE</b>, specifies that <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime">IUIAnimationManager2::EstimateNextEventTime</a> will incorporate <i>handler</i> into its estimate of the time interval until the next animation event. No default value.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-setmanagereventhandler
     */
    SetManagerEventHandler(handler, fRegisterForNextAnimationEvent) {
        result := ComCall(17, this, "ptr", handler, "int", fRegisterForNextAnimationEvent, "HRESULT")
        return result
    }

    /**
     * Sets the priority comparison handler that determines whether a scheduled storyboard can be canceled.
     * @param {IUIAnimationPriorityComparison2} comparison The priority comparison handler for cancelation.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison2">IUIAnimationPriorityComparison2</a> interface or be <b>NULL</b>. See Remarks for more info.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-setcancelprioritycomparison
     */
    SetCancelPriorityComparison(comparison) {
        result := ComCall(18, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * Sets the priority comparison handler that determines whether a scheduled storyboard can be trimmed.
     * @param {IUIAnimationPriorityComparison2} comparison The priority comparison handler for trimming.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison">IUIAnimationPriorityComparison</a> interface or be <b>NULL</b>.
     * 
     * See Remarks for more info.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-settrimprioritycomparison
     */
    SetTrimPriorityComparison(comparison) {
        result := ComCall(19, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * Sets the priority comparison handler that determines whether a scheduled storyboard can be compressed.
     * @param {IUIAnimationPriorityComparison2} comparison The priority comparison handler for compression.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison2">IUIAnimationPriorityComparison2</a> interface or be <b>NULL</b>. See Remarks for more info.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-setcompressprioritycomparison
     */
    SetCompressPriorityComparison(comparison) {
        result := ComCall(20, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * Sets the priority comparison handler that determines whether a scheduled storyboard can be concluded.
     * @param {IUIAnimationPriorityComparison2} comparison The priority comparison handler for conclusion. The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison2">IUIAnimationPriorityComparison2</a> interface or be <b>NULL</b>.
     *             See Remarks for more info.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-setconcludeprioritycomparison
     */
    SetConcludePriorityComparison(comparison) {
        result := ComCall(21, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * Sets the default acceptable animation delay. This is the length of time that may pass before storyboards begin.
     * @param {Float} delay The default delay. This parameter can be a positive value, or <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-seconds-eventually">UI_ANIMATION_SECONDS_EVENTUALLY</a> (-1) to indicate that any finite delay is acceptable.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-setdefaultlongestacceptabledelay
     */
    SetDefaultLongestAcceptableDelay(delay) {
        result := ComCall(22, this, "double", delay, "HRESULT")
        return result
    }

    /**
     * Shuts down the animation manager and all its associated objects.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanager2-shutdown
     */
    Shutdown() {
        result := ComCall(23, this, "HRESULT")
        return result
    }
}
