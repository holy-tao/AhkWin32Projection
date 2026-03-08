#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAnimationVariable.ahk
#Include .\IUIAnimationStoryboard.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the animation manager, which provides a central interface for creating and managing animations.
 * @remarks
 * <b>IUIAnimationManager</b> defines a central control object for animations.
 *          
 * A single instance of <b>IUIAnimationManager</b> is typically used to compose, schedule, and manage all animations for a client application.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationvariable">IUIAnimationVariable</a>, <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationstoryboard">IUIAnimationStoryboard</a> are the primary components for building animations.
 *          
 * Use <b>IUIAnimationManager</b> to create and manage these components.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationmanager
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
     * Creates a new animation variable. (IUIAnimationManager.CreateAnimationVariable)
     * @remarks
     * The initial value of an animation variable is specified when the variable is created. After an animation variable is created, its value cannot be changed directly; it must be updated through the animation manager.
     * 
     * An animation variable is typically created to represent each visual characteristic that is to be animated. For example, an application might create two animation variables for the X and Y coordinates of an object that can move freely within a window.
     * @param {Float} initialValue The initial value for the new animation variable.
     * @returns {IUIAnimationVariable} The new animation variable.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-createanimationvariable
     */
    CreateAnimationVariable(initialValue) {
        result := ComCall(3, this, "double", initialValue, "ptr*", &variable := 0, "HRESULT")
        return IUIAnimationVariable(variable)
    }

    /**
     * Creates and schedules a single-transition storyboard. (IUIAnimationManager.ScheduleTransition)
     * @remarks
     * This method schedules a new storyboard by creating the storyboard, applying the specified transition to the specified variable, and then scheduling the storyboard.
     * @param {IUIAnimationVariable} variable The animation variable.
     * @param {IUIAnimationTransition} transition A transition to be applied to the animation variable.
     * @param {Float} timeNow The current system time.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-scheduletransition
     */
    ScheduleTransition(variable, transition, timeNow) {
        result := ComCall(4, this, "ptr", variable, "ptr", transition, "double", timeNow, "HRESULT")
        return result
    }

    /**
     * Creates a new storyboard. (IUIAnimationManager.CreateStoryboard)
     * @remarks
     * Storyboards can specify complex coordinated updates to many animation variables. These updates happen in sequence or in parallel, and they are guaranteed to remain synchronized within the storyboard. A storyboard is created, populated with transitions on animation variables, and then scheduled.
     * @returns {IUIAnimationStoryboard} The new storyboard.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-createstoryboard
     */
    CreateStoryboard() {
        result := ComCall(5, this, "ptr*", &storyboard := 0, "HRESULT")
        return IUIAnimationStoryboard(storyboard)
    }

    /**
     * Finishes all active storyboards within the specified time interval. (IUIAnimationManager.FinishAllStoryboards)
     * @remarks
     * Calling <b>FinishAllStoryboards</b> ensures that all active storyboards finish within the specified completion deadline. If a storyboard is scheduled to play past the deadline, it is compressed.
     *          
     * A storyboard is considered active if its status is <b>UI_ANIMATION_STORYBOARD_PLAYING</b> or <b>UI_ANIMATION_STORYBOARD_SCHEDULED</b>.
     * @param {Float} completionDeadline The maximum time interval during which all storyboards must be finished.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-finishallstoryboards
     */
    FinishAllStoryboards(completionDeadline) {
        result := ComCall(6, this, "double", completionDeadline, "HRESULT")
        return result
    }

    /**
     * Abandons all active storyboards. (IUIAnimationManager.AbandonAllStoryboards)
     * @remarks
     * Calling this method is equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard-abandon">IUIAnimationStoryboard::Abandon</a> method for each active storyboard.
     *          
     * A storyboard is considered active if its status is <b>UI_ANIMATION_STORYBOARD_PLAYING</b> or <b>UI_ANIMATION_STORYBOARD_SCHEDULED</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-abandonallstoryboards
     */
    AbandonAllStoryboards() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Updates the values of all animation variables. (IUIAnimationManager.Update)
     * @remarks
     * Calling this method advances the animation manager to <i>timeNow</i>, changing statuses of storyboards as necessary and updating any animation variables to appropriate interpolated values. If the animation manager is paused, no storyboards or variables are updated. If the animation  mode is <b>UI_ANIMATION_MODE_DISABLED</b>, all scheduled storyboards finish playing immediately. If the values of any variables change during this call, the value of <i>updateResult</i> is <b>UI_ANIMATION_UPDATE_VARIABLES_CHANGED</b>; otherwise, it is <b>UI_ANIMATION_UPDATE_NO_CHANGE</b>.
     * @param {Float} timeNow The current system time. This parameter must be greater than or equal to 0.0.
     * @returns {Integer} The result of the update.
     *             This parameter can be omitted from calls to this method.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-update
     */
    Update(timeNow) {
        result := ComCall(8, this, "double", timeNow, "int*", &updateResult := 0, "HRESULT")
        return updateResult
    }

    /**
     * Gets the animation variable with the specified tag. (IUIAnimationManager.GetVariableFromTag)
     * @remarks
     * A tag is a pairing of an integer identifier (<i>id</i>) with a COM object (<i>object</i>). An application can use tags to identify animation variables and storyboards. <b>NULL</b> is a valid object component of a tag; therefore, the <i>object</i> parameter can be <b>NULL</b>.
     * 
     * Tags are not necessarily unique; this method returns <b>UI_E_AMBIGUOUS_MATCH</b> if more than one animation variable exists with the specified tag.
     * @param {IUnknown} object_R 
     * @param {Integer} id The identifier portion of the tag.
     * @returns {IUIAnimationVariable} The animation variable that matches the specified tag, or <b>NULL</b> if no match is found.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-getvariablefromtag
     */
    GetVariableFromTag(object_R, id) {
        result := ComCall(9, this, "ptr", object_R, "uint", id, "ptr*", &variable := 0, "HRESULT")
        return IUIAnimationVariable(variable)
    }

    /**
     * Gets the storyboard with the specified tag. (IUIAnimationManager.GetStoryboardFromTag)
     * @remarks
     * A tag is a pairing of an integer identifier (<i>id</i>) with a COM object (<i>object</i>). An application can use tags to identify animation variables and storyboards. <b>NULL</b> is a valid object component of a tag; therefore, the <i>object</i> parameter can be <b>NULL</b>.
     * 
     * Tags are not necessarily unique; this method returns UI_E_AMBIGUOUS_MATCH if more than one storyboard exists with the specified tag.
     * @param {IUnknown} object_R 
     * @param {Integer} id The identifier portion of the tag.
     * @returns {IUIAnimationStoryboard} The storyboard that matches the specified tag, or <b>NULL</b> if no match is found.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-getstoryboardfromtag
     */
    GetStoryboardFromTag(object_R, id) {
        result := ComCall(10, this, "ptr", object_R, "uint", id, "ptr*", &storyboard := 0, "HRESULT")
        return IUIAnimationStoryboard(storyboard)
    }

    /**
     * Gets the status of the animation manager. (IUIAnimationManager.GetStatus)
     * @returns {Integer} The status.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-getstatus
     */
    GetStatus() {
        result := ComCall(11, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * Sets the animation mode. (IUIAnimationManager.SetAnimationMode)
     * @remarks
     * This method is used to enable or disable animation globally. While animation is disabled, all storyboards finish immediately when they are scheduled. The default mode is <b>UI_ANIMATION_MODE_SYSTEM_DEFAULT</b>, which lets Windows decide when to enable or disable animation in the application.
     * @param {Integer} mode The animation mode.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-setanimationmode
     */
    SetAnimationMode(mode) {
        result := ComCall(12, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * Pauses all animations. (IUIAnimationManager.Pause)
     * @remarks
     * When an animation manager is paused, its status is set to <b>UI_ANIMATION_MANAGER_IDLE</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-pause
     */
    Pause() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Resumes all animations. (IUIAnimationManager.Resume)
     * @remarks
     * When an animation manager is resumed, and at least one animation is currently scheduled or playing, its status is set to <b>UI_ANIMATION_MANAGER_BUSY</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-resume
     */
    Resume() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Specifies a handler for animation manager status updates. (IUIAnimationManager.SetManagerEventHandler)
     * @remarks
     * Passing <b>NULL</b> for the <i>handler</i> parameter causes Windows Animation to release its reference to any handler object that you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager-shutdown">IUIAnimationManager::Shutdown</a> method.
     * @param {IUIAnimationManagerEventHandler} handler The event handler to be called when the status of the animation manager changes.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationmanagereventhandler">IUIAnimationManagerEventHandler</a> interface or be <b>NULL</b>.
     * 
     * See Remarks section for more information.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-setmanagereventhandler
     */
    SetManagerEventHandler(handler) {
        result := ComCall(15, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Sets the priority comparison handler to be called to determine whether a scheduled storyboard can be canceled.
     * @remarks
     * Setting a priority comparison handler with this method
     *          enables the application to indicate when scheduling conflicts can be resolved by canceling storyboards.
     * 
     * A scheduled storyboard can be canceled only if it has not started playing and the priority comparison object registered with this method returns <b>S_OK</b>. Canceled storyboards are completely removed from the schedule.
     * 
     * Passing <b>NULL</b> for the <i>comparison</i> parameter causes Windows Animation to release its reference to any priority comparison handler object you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager-shutdown">IUIAnimationManager::Shutdown</a> method.
     * @param {IUIAnimationPriorityComparison} comparison The priority comparison handler for cancelation.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison">IUIAnimationPriorityComparison</a> interface or be <b>NULL</b>.
     * 
     * See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-setcancelprioritycomparison
     */
    SetCancelPriorityComparison(comparison) {
        result := ComCall(16, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * Sets the priority comparison handler to be called to determine whether a scheduled storyboard can be trimmed.
     * @remarks
     * Setting a priority comparison handler with this method enables the application to indicate when  scheduling conflicts can be resolved by trimming the scheduled storyboard.
     * 
     * A scheduled storyboard can be trimmed only if the priority comparison object registered with this method returns <b>S_OK</b>. If the new storyboard trims the scheduled storyboard,  the scheduled storyboard can no longer affect a variable once the new storyboard begins to animate that variable.
     * 
     * Passing <b>NULL</b> for the <i>comparison</i> parameter causes Windows Animation to release its reference to any handler object you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager-shutdown">IUIAnimationManager::Shutdown</a> method.
     * @param {IUIAnimationPriorityComparison} comparison The priority comparison handler for trimming.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison">IUIAnimationPriorityComparison</a> interface or be <b>NULL</b>.
     * 
     * See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-settrimprioritycomparison
     */
    SetTrimPriorityComparison(comparison) {
        result := ComCall(17, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * Sets the priority comparison handler to be called to determine whether a scheduled storyboard can be compressed.
     * @remarks
     * Setting a priority comparison handler with this method enables the application to indicate when the scheduling conflicts can be resolved by compressing  the scheduled storyboard and any other storyboards animating the same variables.
     * 
     * A storyboard can be compressed only if the priority comparison object registered with this method returns <b>S_OK</b> for all the other scheduled storyboards that will be affected by compression. When the storyboards are compressed, time is temporarily accelerated for affected storyboards, so they play faster.
     * 
     * Passing <b>NULL</b> for the <i>comparison</i> parameter causes Windows Animation to release its reference to any handler object you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager-shutdown">IUIAnimationManager::Shutdown</a> method.
     * @param {IUIAnimationPriorityComparison} comparison The priority comparison handler for compression.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison">IUIAnimationPriorityComparison</a> interface or be <b>NULL</b>. See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-setcompressprioritycomparison
     */
    SetCompressPriorityComparison(comparison) {
        result := ComCall(18, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * Sets the priority comparison handler to be called to determine whether a scheduled storyboard can be concluded.
     * @remarks
     * Setting a priority comparison handler with this method enables the application to indicate when scheduling conflicts can be resolved by concluding the scheduled storyboard.
     * 
     * A scheduled storyboard can be concluded only if it contains a loop with a repetition count of <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-repeat-indefinitely">UI_ANIMATION_REPEAT_INDEFINITELY</a> and the priority comparison object registered with this method returns <b>S_OK</b>. If the storyboard is concluded, the current repetition of the loop completes, and the reminder of the storyboard then plays. 
     * 
     * Passing <b>NULL</b> for the <i>comparison</i> parameter causes Windows Animation to release its reference to any handler object you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager-shutdown">IUIAnimationManager::Shutdown</a> method.
     * @param {IUIAnimationPriorityComparison} comparison The priority comparison handler for conclusion. The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison">IUIAnimationPriorityComparison</a> interface or be <b>NULL</b>.
     *             See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-setconcludeprioritycomparison
     */
    SetConcludePriorityComparison(comparison) {
        result := ComCall(19, this, "ptr", comparison, "HRESULT")
        return result
    }

    /**
     * Sets the default acceptable animation delay. This is the length of time that may pass before storyboards begin. (IUIAnimationManager.SetDefaultLongestAcceptableDelay)
     * @remarks
     * For a storyboard to be successfully scheduled, it must begin before the longest acceptable delay has elapsed. This delay is determined in the following order: the delay value set by calling <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard-setlongestacceptabledelay">IUIAnimationStoryboard::SetLongestAcceptableDelay</a> for this specific storyboard, the delay value set by calling this method, or 0.0 if neither method has been called.
     * @param {Float} delay The default delay. This parameter can be a positive value, or <b>UI_ANIMATION_SECONDS_EVENTUALLY</b> (-1) to indicate that any finite delay is acceptable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.            
     *             See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-setdefaultlongestacceptabledelay
     */
    SetDefaultLongestAcceptableDelay(delay) {
        result := ComCall(20, this, "double", delay, "HRESULT")
        return result
    }

    /**
     * Shuts down the animation manager and all its associated objects. (IUIAnimationManager.Shutdown)
     * @remarks
     * Calling this method directs the animation manager, and all the objects it created, to 
     *          release all their pointers to other objects. After <b>IUIAnimationManager::Shutdown</b> has been called, no other methods may be called on the animation manager or any objects that it created. An application can call this method to clean up if there is any possibility that the application has introduced a reference cycle that includes some animation objects.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanager-shutdown
     */
    Shutdown() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}
