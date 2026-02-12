#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppointmentCalendarSyncManager.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentCalendar2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentCalendar2
     * @type {Guid}
     */
    static IID => Guid("{18e7e422-2467-4e1c-a459-d8a29303d092}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SyncManager", "get_RemoteId", "put_RemoteId", "put_DisplayColor", "put_IsHidden", "get_UserDataAccountId", "get_CanCreateOrUpdateAppointments", "put_CanCreateOrUpdateAppointments", "get_CanCancelMeetings", "put_CanCancelMeetings", "get_CanForwardMeetings", "put_CanForwardMeetings", "get_CanProposeNewTimeForMeetings", "put_CanProposeNewTimeForMeetings", "get_CanUpdateMeetingResponses", "put_CanUpdateMeetingResponses", "get_CanNotifyInvitees", "put_CanNotifyInvitees", "get_MustNofityInvitees", "put_MustNofityInvitees", "TryCreateOrUpdateAppointmentAsync", "TryCancelMeetingAsync", "TryForwardMeetingAsync", "TryProposeNewTimeForMeetingAsync", "TryUpdateMeetingResponseAsync"]

    /**
     * @type {AppointmentCalendarSyncManager} 
     */
    SyncManager {
        get => this.get_SyncManager()
    }

    /**
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * @type {HRESULT} 
     */
    DisplayColor {
        set => this.put_DisplayColor(value)
    }

    /**
     * @type {HRESULT} 
     */
    IsHidden {
        set => this.put_IsHidden(value)
    }

    /**
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

    /**
     * @type {Boolean} 
     */
    CanCreateOrUpdateAppointments {
        get => this.get_CanCreateOrUpdateAppointments()
        set => this.put_CanCreateOrUpdateAppointments(value)
    }

    /**
     * @type {Boolean} 
     */
    CanCancelMeetings {
        get => this.get_CanCancelMeetings()
        set => this.put_CanCancelMeetings(value)
    }

    /**
     * @type {Boolean} 
     */
    CanForwardMeetings {
        get => this.get_CanForwardMeetings()
        set => this.put_CanForwardMeetings(value)
    }

    /**
     * @type {Boolean} 
     */
    CanProposeNewTimeForMeetings {
        get => this.get_CanProposeNewTimeForMeetings()
        set => this.put_CanProposeNewTimeForMeetings(value)
    }

    /**
     * @type {Boolean} 
     */
    CanUpdateMeetingResponses {
        get => this.get_CanUpdateMeetingResponses()
        set => this.put_CanUpdateMeetingResponses(value)
    }

    /**
     * @type {Boolean} 
     */
    CanNotifyInvitees {
        get => this.get_CanNotifyInvitees()
        set => this.put_CanNotifyInvitees(value)
    }

    /**
     * @type {Boolean} 
     */
    MustNofityInvitees {
        get => this.get_MustNofityInvitees()
        set => this.put_MustNofityInvitees(value)
    }

    /**
     * 
     * @returns {AppointmentCalendarSyncManager} 
     */
    get_SyncManager() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppointmentCalendarSyncManager(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_DisplayColor(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHidden(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDataAccountId() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCreateOrUpdateAppointments() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanCreateOrUpdateAppointments(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCancelMeetings() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanCancelMeetings(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanForwardMeetings() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanForwardMeetings(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanProposeNewTimeForMeetings() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanProposeNewTimeForMeetings(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanUpdateMeetingResponses() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanUpdateMeetingResponses(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanNotifyInvitees() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanNotifyInvitees(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MustNofityInvitees() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MustNofityInvitees(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Appointment} appointment_ 
     * @param {Boolean} notifyInvitees 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryCreateOrUpdateAppointmentAsync(appointment_, notifyInvitees) {
        result := ComCall(26, this, "ptr", appointment_, "int", notifyInvitees, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {Appointment} meeting 
     * @param {HSTRING} subject 
     * @param {HSTRING} comment 
     * @param {Boolean} notifyInvitees 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryCancelMeetingAsync(meeting, subject, comment, notifyInvitees) {
        if(subject is String) {
            pin := HSTRING.Create(subject)
            subject := pin.Value
        }
        subject := subject is Win32Handle ? NumGet(subject, "ptr") : subject
        if(comment is String) {
            pin := HSTRING.Create(comment)
            comment := pin.Value
        }
        comment := comment is Win32Handle ? NumGet(comment, "ptr") : comment

        result := ComCall(27, this, "ptr", meeting, "ptr", subject, "ptr", comment, "int", notifyInvitees, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {Appointment} meeting 
     * @param {IIterable<AppointmentInvitee>} invitees 
     * @param {HSTRING} subject 
     * @param {HSTRING} forwardHeader 
     * @param {HSTRING} comment 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryForwardMeetingAsync(meeting, invitees, subject, forwardHeader, comment) {
        if(subject is String) {
            pin := HSTRING.Create(subject)
            subject := pin.Value
        }
        subject := subject is Win32Handle ? NumGet(subject, "ptr") : subject
        if(forwardHeader is String) {
            pin := HSTRING.Create(forwardHeader)
            forwardHeader := pin.Value
        }
        forwardHeader := forwardHeader is Win32Handle ? NumGet(forwardHeader, "ptr") : forwardHeader
        if(comment is String) {
            pin := HSTRING.Create(comment)
            comment := pin.Value
        }
        comment := comment is Win32Handle ? NumGet(comment, "ptr") : comment

        result := ComCall(28, this, "ptr", meeting, "ptr", invitees, "ptr", subject, "ptr", forwardHeader, "ptr", comment, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {Appointment} meeting 
     * @param {DateTime} newStartTime 
     * @param {TimeSpan} newDuration 
     * @param {HSTRING} subject 
     * @param {HSTRING} comment 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryProposeNewTimeForMeetingAsync(meeting, newStartTime, newDuration, subject, comment) {
        if(subject is String) {
            pin := HSTRING.Create(subject)
            subject := pin.Value
        }
        subject := subject is Win32Handle ? NumGet(subject, "ptr") : subject
        if(comment is String) {
            pin := HSTRING.Create(comment)
            comment := pin.Value
        }
        comment := comment is Win32Handle ? NumGet(comment, "ptr") : comment

        result := ComCall(29, this, "ptr", meeting, "ptr", newStartTime, "ptr", newDuration, "ptr", subject, "ptr", comment, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {Appointment} meeting 
     * @param {Integer} response 
     * @param {HSTRING} subject 
     * @param {HSTRING} comment 
     * @param {Boolean} sendUpdate 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryUpdateMeetingResponseAsync(meeting, response, subject, comment, sendUpdate) {
        if(subject is String) {
            pin := HSTRING.Create(subject)
            subject := pin.Value
        }
        subject := subject is Win32Handle ? NumGet(subject, "ptr") : subject
        if(comment is String) {
            pin := HSTRING.Create(comment)
            comment := pin.Value
        }
        comment := comment is Win32Handle ? NumGet(comment, "ptr") : comment

        result := ComCall(30, this, "ptr", meeting, "int", response, "ptr", subject, "ptr", comment, "int", sendUpdate, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }
}
