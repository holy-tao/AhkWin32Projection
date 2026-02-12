#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\DisplayTarget.ahk
#Include .\DisplayAdapter.ahk
#Include .\DisplayManagerResultWithState.ahk
#Include .\DisplayDevice.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayManager
     * @type {Guid}
     */
    static IID => Guid("{4ed9245b-15ec-56e2-9072-7fe5084a31a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentTargets", "GetCurrentAdapters", "TryAcquireTarget", "ReleaseTarget", "TryReadCurrentStateForAllTargets", "TryAcquireTargetsAndReadCurrentState", "TryAcquireTargetsAndCreateEmptyState", "TryAcquireTargetsAndCreateSubstate", "CreateDisplayDevice", "add_Enabled", "remove_Enabled", "add_Disabled", "remove_Disabled", "add_Changed", "remove_Changed", "add_PathsFailedOrInvalidated", "remove_PathsFailedOrInvalidated", "Start", "Stop"]

    /**
     * 
     * @returns {IVectorView<DisplayTarget>} 
     */
    GetCurrentTargets() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DisplayTarget, result_)
    }

    /**
     * 
     * @returns {IVectorView<DisplayAdapter>} 
     */
    GetCurrentAdapters() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DisplayAdapter, result_)
    }

    /**
     * 
     * @param {DisplayTarget} target 
     * @returns {Integer} 
     */
    TryAcquireTarget(target) {
        result := ComCall(8, this, "ptr", target, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DisplayTarget} target 
     * @returns {HRESULT} 
     */
    ReleaseTarget(target) {
        result := ComCall(9, this, "ptr", target, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DisplayManagerResultWithState} 
     */
    TryReadCurrentStateForAllTargets() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayManagerResultWithState(result_)
    }

    /**
     * 
     * @param {IIterable<DisplayTarget>} targets 
     * @returns {DisplayManagerResultWithState} 
     */
    TryAcquireTargetsAndReadCurrentState(targets) {
        result := ComCall(11, this, "ptr", targets, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayManagerResultWithState(result_)
    }

    /**
     * 
     * @param {IIterable<DisplayTarget>} targets 
     * @returns {DisplayManagerResultWithState} 
     */
    TryAcquireTargetsAndCreateEmptyState(targets) {
        result := ComCall(12, this, "ptr", targets, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayManagerResultWithState(result_)
    }

    /**
     * 
     * @param {DisplayState} existingState 
     * @param {IIterable<DisplayTarget>} targets 
     * @returns {DisplayManagerResultWithState} 
     */
    TryAcquireTargetsAndCreateSubstate(existingState, targets) {
        result := ComCall(13, this, "ptr", existingState, "ptr", targets, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayManagerResultWithState(result_)
    }

    /**
     * 
     * @param {DisplayAdapter} adapter_ 
     * @returns {DisplayDevice} 
     */
    CreateDisplayDevice(adapter_) {
        result := ComCall(14, this, "ptr", adapter_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayDevice(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayManager, DisplayManagerEnabledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Enabled(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Enabled(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayManager, DisplayManagerDisabledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Disabled(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Disabled(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayManager, DisplayManagerChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        token := EventRegistrationToken()
        result := ComCall(19, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(20, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayManager, DisplayManagerPathsFailedOrInvalidatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PathsFailedOrInvalidated(handler) {
        token := EventRegistrationToken()
        result := ComCall(21, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PathsFailedOrInvalidated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(22, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies the date and time when the trigger is activated.
     * @remarks
     * The **&lt;StartBoundary&gt;** element is a required element for time and calendar triggers ([**&lt;TimeTrigger&gt;**](taskschedulerschema-timetrigger-triggergroup-element.md) and [**&lt;CalendarTrigger&gt;**](taskschedulerschema-calendartrigger-triggergroup-element.md)).
     * 
     * For scripting development, the end boundary is specified using the [**Trigger.StartBoundary**](trigger-startboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::StartBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary) property that is inherited by the all trigger interfaces.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start() {
        result := ComCall(23, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop() {
        result := ComCall(24, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
