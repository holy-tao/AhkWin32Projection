#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAnimationVariable2.ahk
#Include .\IUIAnimationStoryboard2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines an animation manager, which provides a central interface for creating and managing animations in multiple dimensions.
 * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nn-uianimation-iuianimationmanager2
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
     * @remarks
     * The initial value of an animation variable is specified when the variable is created. After an animation variable is created, its value cannot be changed directly; it must be updated through the animation manager.
     * 
     * An animation variable is typically created to represent each visual characteristic that is to be animated. For example, an application might create three animation variables for the X, Y, and Z coordinates of an object that can move freely within a three-dimensional space.
     * @param {Pointer<Float>} initialValue A vector (of size <i>cDimension</i>) of  initial values for the animation variable.
     * @param {Integer} cDimension The number of dimensions that require animated values. This parameter specifies the number of values listed in <i>initialValue</i>.
     * @returns {IUIAnimationVariable2} The new animation variable.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-createanimationvectorvariable
     */
    CreateAnimationVectorVariable(initialValue, cDimension) {
        initialValueMarshal := initialValue is VarRef ? "double*" : "ptr"

        result := ComCall(3, this, initialValueMarshal, initialValue, "uint", cDimension, "ptr*", &variable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUIAnimationVariable2(variable)
    }

    /**
     * Creates a new animation variable. (IUIAnimationManager2.CreateAnimationVariable)
     * @remarks
     * The initial value of an animation variable is specified when the variable is created. After an animation variable is created, its value cannot be changed directly; it must be updated through the animation manager.
     * 
     * An animation variable is typically created to represent each visual characteristic that is to be animated. For example, an application might create two animation variables for the X and Y coordinates of an object that can move freely within a window.
     * @param {Float} initialValue The initial value for the animation variable.
     * @returns {IUIAnimationVariable2} The new animation variable.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-createanimationvariable
     */
    CreateAnimationVariable(initialValue) {
        result := ComCall(4, this, "double", initialValue, "ptr*", &variable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUIAnimationVariable2(variable)
    }

    /**
     * Creates and schedules a single-transition storyboard. (IUIAnimationManager2.ScheduleTransition)
     * @remarks
     * This method schedules a new storyboard by creating the storyboard, applying the specified transition to the specified variable, and then scheduling the storyboard.
     * @param {IUIAnimationVariable2} variable The animation variable.
     * @param {IUIAnimationTransition2} transition A transition to be applied to the animation variable.
     * @param {Float} timeNow The current system time.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-scheduletransition
     */
    ScheduleTransition(variable, transition, timeNow) {
        result := ComCall(5, this, "ptr", variable, "ptr", transition, "double", timeNow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a new storyboard. (IUIAnimationManager2.CreateStoryboard)
     * @returns {IUIAnimationStoryboard2} The new storyboard.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-createstoryboard
     */
    CreateStoryboard() {
        result := ComCall(6, this, "ptr*", &storyboard := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUIAnimationStoryboard2(storyboard)
    }

    /**
     * Finishes all active storyboards within the specified time interval. (IUIAnimationManager2.FinishAllStoryboards)
     * @remarks
     * Calling the <b>FinishAllStoryboards</b> method ensures that all active storyboards finish within the specified completion deadline. If a storyboard is scheduled to play past the deadline, it is compressed.
     * 
     * A storyboard is considered active if a call to the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard-getstatus">IUIAnimationStoryboard::GetStatus</a> method returns <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_storyboard_status">UI_ANIMATION_STORYBOARD_PLAYING</a> 
     *          or <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_storyboard_status">UI_ANIMATION_STORYBOARD_SCHEDULED</a>.
     * @param {Float} completionDeadline The maximum time interval during which all storyboards must be finished.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-finishallstoryboards
     */
    FinishAllStoryboards(completionDeadline) {
        result := ComCall(7, this, "double", completionDeadline, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Abandons all active storyboards. (IUIAnimationManager2.AbandonAllStoryboards)
     * @remarks
     * Calling this method is equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard-abandon">IUIAnimationStoryboard::Abandon</a> method for each active storyboard.
     *          
     *          
     * 
     * A storyboard is considered active if a call to the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard-getstatus">IUIAnimationStoryboard::GetStatus</a> method returns <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_storyboard_status">UI_ANIMATION_STORYBOARD_PLAYING</a> 
     *          or <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_storyboard_status">UI_ANIMATION_STORYBOARD_SCHEDULED</a>.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-abandonallstoryboards
     */
    AbandonAllStoryboards() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Updates the values of all animation variables. (IUIAnimationManager2.Update)
     * @remarks
     * Calling this method advances the animation manager to <i>timeNow</i>, changes the status of all storyboards as necessary, and updates any animation variables to appropriate interpolated values. If the animation manager is paused, no storyboards or variables are updated. If the animation  mode is <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_mode">UI_ANIMATION_MODE_DISABLED</a>, all scheduled storyboards finish playing immediately. If the values of any variables change during this call, the value of <i>updateResult</i> is <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_update_result">UI_ANIMATION_UPDATE_VARIABLES_CHANGED</a>; otherwise, it is <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_update_result">UI_ANIMATION_UPDATE_NO_CHANGE</a>.
     * @param {Float} timeNow The current system time. This parameter must be greater than or equal to 0.0.
     * @returns {Integer} The result of the update.
     *             You can omit this parameter from calls to this method.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-update
     */
    Update(timeNow) {
        result := ComCall(9, this, "double", timeNow, "int*", &updateResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return updateResult
    }

    /**
     * Gets the animation variable with the specified tag. (IUIAnimationManager2.GetVariableFromTag)
     * @remarks
     * A tag is a pairing of an integer identifier (<i>id</i>) with a COM object (<i>object</i>). An application can use tags to identify animation variables and storyboards. NULL is a valid object component of a tag; therefore, the <i>object</i> parameter can be NULL.
     * 
     * Tags are not necessarily unique; this method returns <b>UI_E_AMBIGUOUS_MATCH</b> if more than one animation variable exists with the specified tag.
     * @param {IUnknown} object_ The object portion of the tag.
     *             This parameter can be NULL.
     * @param {Integer} id The identifier portion of the tag.
     * @returns {IUIAnimationVariable2} The animation variable that matches the specified tag, or <b>NULL</b> if no match is found.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-getvariablefromtag
     */
    GetVariableFromTag(object_, id) {
        result := ComCall(10, this, "ptr", object_, "uint", id, "ptr*", &variable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUIAnimationVariable2(variable)
    }

    /**
     * Gets the storyboard with the specified tag. (IUIAnimationManager2.GetStoryboardFromTag)
     * @remarks
     * A tag is a pairing of an integer identifier (<i>id</i>) with a COM object (<i>object</i>). An application can use tags to identify animation variables and storyboards. NULL is a valid object component of a tag; therefore, the <i>object</i> parameter can be NULL.
     * 
     * Tags are not necessarily unique; this method returns UI_E_AMBIGUOUS_MATCH if more than one storyboard exists with the specified tag.
     * @param {IUnknown} object_ The object portion of the tag.
     *             This parameter can be NULL.
     * @param {Integer} id The identifier portion of the tag.
     * @returns {IUIAnimationStoryboard2} The storyboard that matches the specified tag, or <b>NULL</b> if no match is found.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-getstoryboardfromtag
     */
    GetStoryboardFromTag(object_, id) {
        result := ComCall(11, this, "ptr", object_, "uint", id, "ptr*", &storyboard := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUIAnimationStoryboard2(storyboard)
    }

    /**
     * Retrieves an estimate of the time interval before the next animation event.
     * @returns {Float} The estimated time, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime
     */
    EstimateNextEventTime() {
        result := ComCall(12, this, "double*", &seconds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return seconds
    }

    /**
     * Gets the status of the animation manager. (IUIAnimationManager2.GetStatus)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-getstatus
     */
    GetStatus() {
        result := ComCall(13, this, "int*", &status_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return status_
    }

    /**
     * Sets the animation mode. (IUIAnimationManager2.SetAnimationMode)
     * @remarks
     * Use this method to enable or disable animation globally. While animation is disabled, all storyboards finish immediately when they are scheduled. The default mode is <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_mode">UI_ANIMATION_MODE_SYSTEM_DEFAULT</a>, which lets Windows decide when to enable or disable animation in the application.
     * @param {Integer} mode_ The animation mode.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-setanimationmode
     */
    SetAnimationMode(mode_) {
        result := ComCall(14, this, "int", mode_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Pauses all animations. (IUIAnimationManager2.Pause)
     * @remarks
     * When an animation manager is paused, its status is set to <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_manager_status">UI_ANIMATION_MANAGER_IDLE</a>.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-pause
     */
    Pause() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resumes all animations. (IUIAnimationManager2.Resume)
     * @remarks
     * When an animation manager is resumed, and at least one animation is currently scheduled or playing, its status is set to <a href="https://docs.microsoft.com/windows/win32/api/uianimation/ne-uianimation-ui_animation_manager_status">UI_ANIMATION_MANAGER_BUSY</a>.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-resume
     */
    Resume() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies a handler for animation manager status updates. (IUIAnimationManager2.SetManagerEventHandler)
     * @remarks
     * Passing <b>NULL</b> for the <i>handler</i> parameter causes Windows Animation to release its reference to any handler object that you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-shutdown">IUIAnimationManager2::Shutdown</a> method.
     * @param {IUIAnimationManagerEventHandler2} handler The event handler to be called when the status of the animation manager changes.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationmanagereventhandler">IUIAnimationManagerEventHandler</a> interface or be <b>NULL</b>. See Remarks for more info.
     * @param {BOOL} fRegisterForNextAnimationEvent If <b>TRUE</b>, specifies that <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime">IUIAnimationManager2::EstimateNextEventTime</a> will incorporate <i>handler</i> into its estimate of the time interval until the next animation event. No default value.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-setmanagereventhandler
     */
    SetManagerEventHandler(handler, fRegisterForNextAnimationEvent) {
        result := ComCall(17, this, "ptr", handler, "int", fRegisterForNextAnimationEvent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the priority comparison handler that determines whether a scheduled storyboard can be canceled.
     * @remarks
     * Setting a priority comparison handler with this method enables the application to indicate when scheduling conflicts can be resolved by canceling storyboards.
     * 
     * A scheduled storyboard can be canceled only if it hasn't started playing and the priority comparison object registered with this method returns <b>S_OK</b>. Canceled storyboards are completely removed from the schedule.
     * 
     * Passing <b>NULL</b> for the <i>comparison</i> parameter causes Windows Animation to release its reference to any priority comparison handler object that you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-shutdown">IUIAnimationManager2::Shutdown</a> method.
     * @param {IUIAnimationPriorityComparison2} comparison The priority comparison handler for cancelation.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison2">IUIAnimationPriorityComparison2</a> interface or be <b>NULL</b>. See Remarks for more info.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-setcancelprioritycomparison
     */
    SetCancelPriorityComparison(comparison) {
        result := ComCall(18, this, "ptr", comparison, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the priority comparison handler that determines whether a scheduled storyboard can be trimmed.
     * @remarks
     * Setting a priority comparison handler with this method enables the application to indicate when  scheduling conflicts can be resolved by trimming the scheduled storyboard.
     * 
     * A scheduled storyboard can be trimmed only if the priority comparison object registered with this method returns <b>S_OK</b>. If the new storyboard trims the scheduled storyboard,  the scheduled storyboard can no longer affect a variable after the new storyboard begins to animate that variable.
     * 
     * Passing <b>NULL</b> for the <i>comparison</i> parameter causes Windows Animation to release its reference to any handler object that you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-shutdown">IUIAnimationManager2::Shutdown</a> method.
     * @param {IUIAnimationPriorityComparison2} comparison The priority comparison handler for trimming.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison">IUIAnimationPriorityComparison</a> interface or be <b>NULL</b>.
     * 
     * See Remarks for more info.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-settrimprioritycomparison
     */
    SetTrimPriorityComparison(comparison) {
        result := ComCall(19, this, "ptr", comparison, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the priority comparison handler that determines whether a scheduled storyboard can be compressed.
     * @remarks
     * Setting a priority comparison handler with this method enables the application to indicate when scheduling conflicts can be resolved by compressing  the scheduled storyboard and any other storyboards animating the same variables.
     * 
     * A storyboard can be compressed only if the priority comparison object registered with this method returns <b>S_OK</b> for all the other scheduled storyboards that will be affected by compression. When the storyboards are compressed, time is temporarily accelerated for affected storyboards, so they play faster.
     * 
     * Passing <b>NULL</b> for the <i>comparison</i> parameter causes Windows Animation to release its reference to any handler object that you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-shutdown">IUIAnimationManager2::Shutdown</a> method.
     * @param {IUIAnimationPriorityComparison2} comparison The priority comparison handler for compression.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison2">IUIAnimationPriorityComparison2</a> interface or be <b>NULL</b>. See Remarks for more info.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-setcompressprioritycomparison
     */
    SetCompressPriorityComparison(comparison) {
        result := ComCall(20, this, "ptr", comparison, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the priority comparison handler that determines whether a scheduled storyboard can be concluded.
     * @remarks
     * Setting a priority comparison handler with this method enables the application to indicate when scheduling conflicts can be resolved by concluding the scheduled storyboard.
     * 
     * A scheduled storyboard can be concluded only if it contains a loop with a repetition count of <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-repeat-indefinitely">UI_ANIMATION_REPEAT_INDEFINITELY</a> and the priority comparison object registered with this method returns <b>S_OK</b>. If the storyboard is concluded, the current repetition of the loop completes, and the rest of the storyboard then plays. 
     * 
     * Passing <b>NULL</b> for the <i>comparison</i> parameter causes Windows Animation to release its reference to any handler object that you passed in earlier. This technique can be essential for breaking reference cycles without having to call the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-shutdown">IUIAnimationManager2::Shutdown</a> method.
     * @param {IUIAnimationPriorityComparison2} comparison The priority comparison handler for conclusion. The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationprioritycomparison2">IUIAnimationPriorityComparison2</a> interface or be <b>NULL</b>.
     *             See Remarks for more info.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-setconcludeprioritycomparison
     */
    SetConcludePriorityComparison(comparison) {
        result := ComCall(21, this, "ptr", comparison, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the default acceptable animation delay. This is the length of time that may pass before storyboards begin. (IUIAnimationManager2.SetDefaultLongestAcceptableDelay)
     * @remarks
     * For Windows Animation to schedule a storyboard successfully, the storyboard must begin before the longest acceptable delay has elapsed. Windows Animation determines this delay in the following order: the delay value set by calling <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard-setlongestacceptabledelay">IUIAnimationStoryboard::SetLongestAcceptableDelay</a> for this specific storyboard, the delay value set by calling this method, or 0.0 if neither method has been called.
     * @param {Float} delay The default delay. This parameter can be a positive value, or <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/ui-animation-seconds-eventually">UI_ANIMATION_SECONDS_EVENTUALLY</a> (-1) to indicate that any finite delay is acceptable.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-setdefaultlongestacceptabledelay
     */
    SetDefaultLongestAcceptableDelay(delay) {
        result := ComCall(22, this, "double", delay, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Shuts down the animation manager and all its associated objects. (IUIAnimationManager2.Shutdown)
     * @remarks
     * Calling this method directs the animation manager, and all the objects it created, to 
     *          release all their pointers to other objects. After <b>IUIAnimationManager2::Shutdown</b> has been called, no other methods may be called on the animation manager or on any objects that it created. An application can call this method to clean up if there is any possibility that the application has introduced a reference cycle that includes some animation objects.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationmanager2-shutdown
     */
    Shutdown() {
        result := ComCall(23, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
