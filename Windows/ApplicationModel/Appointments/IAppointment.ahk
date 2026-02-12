#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\AppointmentOrganizer.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\AppointmentInvitee.ahk
#Include .\AppointmentRecurrence.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides info about a participant of an appointment in a calendar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.iappointmentparticipant
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointment
     * @type {Guid}
     */
    static IID => Guid("{dd002f2f-2bdd-4076-90a3-22c275312965}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartTime", "put_StartTime", "get_Duration", "put_Duration", "get_Location", "put_Location", "get_Subject", "put_Subject", "get_Details", "put_Details", "get_Reminder", "put_Reminder", "get_Organizer", "put_Organizer", "get_Invitees", "get_Recurrence", "put_Recurrence", "get_BusyStatus", "put_BusyStatus", "get_AllDay", "put_AllDay", "get_Sensitivity", "put_Sensitivity", "get_Uri", "put_Uri"]

    /**
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * @type {HSTRING} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     * @type {HSTRING} 
     */
    Details {
        get => this.get_Details()
        set => this.put_Details(value)
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    Reminder {
        get => this.get_Reminder()
        set => this.put_Reminder(value)
    }

    /**
     * @type {AppointmentOrganizer} 
     */
    Organizer {
        get => this.get_Organizer()
        set => this.put_Organizer(value)
    }

    /**
     * @type {IVector<AppointmentInvitee>} 
     */
    Invitees {
        get => this.get_Invitees()
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
    BusyStatus {
        get => this.get_BusyStatus()
        set => this.put_BusyStatus(value)
    }

    /**
     * @type {Boolean} 
     */
    AllDay {
        get => this.get_AllDay()
        set => this.put_AllDay(value)
    }

    /**
     * @type {Integer} 
     */
    Sensitivity {
        get => this.get_Sensitivity()
        set => this.put_Sensitivity(value)
    }

    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
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
        result := ComCall(7, this, "ptr", value, "int")
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
        result := ComCall(8, this, "ptr", value, "int")
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
        result := ComCall(9, this, "ptr", value, "int")
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
        result := ComCall(10, this, "ptr", value, "int")
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

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
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
    put_Subject(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Details() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
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
    put_Details(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Reminder() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Reminder(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AppointmentOrganizer} 
     */
    get_Organizer() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppointmentOrganizer(value)
    }

    /**
     * 
     * @param {AppointmentOrganizer} value 
     * @returns {HRESULT} 
     */
    put_Organizer(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<AppointmentInvitee>} 
     */
    get_Invitees() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(AppointmentInvitee, value)
    }

    /**
     * 
     * @returns {AppointmentRecurrence} 
     */
    get_Recurrence() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
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
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BusyStatus() {
        result := ComCall(23, this, "int*", &value := 0, "int")
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
    put_BusyStatus(value) {
        result := ComCall(24, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllDay() {
        result := ComCall(25, this, "int*", &value := 0, "int")
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
    put_AllDay(value) {
        result := ComCall(26, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Sensitivity() {
        result := ComCall(27, this, "int*", &value := 0, "int")
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
    put_Sensitivity(value) {
        result := ComCall(28, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Uri(value) {
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
