#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\Appointments\AppointmentRecurrence.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMeetingInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMeetingInfo
     * @type {Guid}
     */
    static IID => Guid("{31c03fa9-7933-415f-a275-d165ba07026b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowNewTimeProposal", "put_AllowNewTimeProposal", "get_AppointmentRoamingId", "put_AppointmentRoamingId", "get_AppointmentOriginalStartTime", "put_AppointmentOriginalStartTime", "get_Duration", "put_Duration", "get_IsAllDay", "put_IsAllDay", "get_IsResponseRequested", "put_IsResponseRequested", "get_Location", "put_Location", "get_ProposedStartTime", "put_ProposedStartTime", "get_ProposedDuration", "put_ProposedDuration", "get_RecurrenceStartTime", "put_RecurrenceStartTime", "get_Recurrence", "put_Recurrence", "get_RemoteChangeNumber", "put_RemoteChangeNumber", "get_StartTime", "put_StartTime"]

    /**
     * @type {Boolean} 
     */
    AllowNewTimeProposal {
        get => this.get_AllowNewTimeProposal()
        set => this.put_AllowNewTimeProposal(value)
    }

    /**
     * @type {HSTRING} 
     */
    AppointmentRoamingId {
        get => this.get_AppointmentRoamingId()
        set => this.put_AppointmentRoamingId(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    AppointmentOriginalStartTime {
        get => this.get_AppointmentOriginalStartTime()
        set => this.put_AppointmentOriginalStartTime(value)
    }

    /**
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAllDay {
        get => this.get_IsAllDay()
        set => this.put_IsAllDay(value)
    }

    /**
     * @type {Boolean} 
     */
    IsResponseRequested {
        get => this.get_IsResponseRequested()
        set => this.put_IsResponseRequested(value)
    }

    /**
     * @type {HSTRING} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    ProposedStartTime {
        get => this.get_ProposedStartTime()
        set => this.put_ProposedStartTime(value)
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    ProposedDuration {
        get => this.get_ProposedDuration()
        set => this.put_ProposedDuration(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    RecurrenceStartTime {
        get => this.get_RecurrenceStartTime()
        set => this.put_RecurrenceStartTime(value)
    }

    /**
     * @type {AppointmentRecurrence} 
     */
    Recurrence {
        get => this.get_Recurrence()
        set => this.put_Recurrence(value)
    }

    /**
     * @type {Integer} 
     */
    RemoteChangeNumber {
        get => this.get_RemoteChangeNumber()
        set => this.put_RemoteChangeNumber(value)
    }

    /**
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowNewTimeProposal() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_AllowNewTimeProposal(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppointmentRoamingId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_AppointmentRoamingId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_AppointmentOriginalStartTime() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_AppointmentOriginalStartTime(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        value := TimeSpan()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAllDay() {
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
    put_IsAllDay(value) {
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
    get_IsResponseRequested() {
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
    put_IsResponseRequested(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Location() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
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
    put_Location(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ProposedStartTime() {
        result := ComCall(20, this, "ptr*", &proposedStartTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), proposedStartTime)
    }

    /**
     * 
     * @param {IReference<DateTime>} proposedStartTime 
     * @returns {HRESULT} 
     */
    put_ProposedStartTime(proposedStartTime) {
        result := ComCall(21, this, "ptr", proposedStartTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_ProposedDuration() {
        result := ComCall(22, this, "ptr*", &duration_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), duration_)
    }

    /**
     * 
     * @param {IReference<TimeSpan>} duration_ 
     * @returns {HRESULT} 
     */
    put_ProposedDuration(duration_) {
        result := ComCall(23, this, "ptr", duration_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_RecurrenceStartTime() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_RecurrenceStartTime(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AppointmentRecurrence} 
     */
    get_Recurrence() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppointmentRecurrence(value)
    }

    /**
     * 
     * @param {AppointmentRecurrence} value 
     * @returns {HRESULT} 
     */
    put_Recurrence(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemoteChangeNumber() {
        result := ComCall(28, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RemoteChangeNumber(value) {
        result := ComCall(29, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        value := DateTime()
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
