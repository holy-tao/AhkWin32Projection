#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class IAppointmentDataProviderConnection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentDataProviderConnection
     * @type {Guid}
     */
    static IID => Guid("{f3dd9d83-3254-465f-abdb-928046552cf4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_SyncRequested", "remove_SyncRequested", "add_CreateOrUpdateAppointmentRequested", "remove_CreateOrUpdateAppointmentRequested", "add_CancelMeetingRequested", "remove_CancelMeetingRequested", "add_ForwardMeetingRequested", "remove_ForwardMeetingRequested", "add_ProposeNewTimeForMeetingRequested", "remove_ProposeNewTimeForMeetingRequested", "add_UpdateMeetingResponseRequested", "remove_UpdateMeetingResponseRequested", "Start"]

    /**
     * 
     * @param {TypedEventHandler<AppointmentDataProviderConnection, AppointmentCalendarSyncManagerSyncRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SyncRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_SyncRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentDataProviderConnection, AppointmentCalendarCreateOrUpdateAppointmentRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CreateOrUpdateAppointmentRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_CreateOrUpdateAppointmentRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentDataProviderConnection, AppointmentCalendarCancelMeetingRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CancelMeetingRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
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
    remove_CancelMeetingRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentDataProviderConnection, AppointmentCalendarForwardMeetingRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ForwardMeetingRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_ForwardMeetingRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentDataProviderConnection, AppointmentCalendarProposeNewTimeForMeetingRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProposeNewTimeForMeetingRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_ProposeNewTimeForMeetingRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppointmentDataProviderConnection, AppointmentCalendarUpdateMeetingResponseRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UpdateMeetingResponseRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
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
    remove_UpdateMeetingResponseRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
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
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
