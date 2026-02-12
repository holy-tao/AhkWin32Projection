#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentPropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentPropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{25141fe9-68ae-3aae-855f-bc4441caa234}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Subject", "get_Location", "get_StartTime", "get_Duration", "get_Reminder", "get_BusyStatus", "get_Sensitivity", "get_OriginalStartTime", "get_IsResponseRequested", "get_AllowNewTimeProposal", "get_AllDay", "get_Details", "get_OnlineMeetingLink", "get_ReplyTime", "get_Organizer", "get_UserResponse", "get_HasInvitees", "get_IsCanceledMeeting", "get_IsOrganizedByUser", "get_Recurrence", "get_Uri", "get_Invitees", "get_DefaultProperties"]

    /**
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * @type {HSTRING} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * @type {HSTRING} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * @type {HSTRING} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * @type {HSTRING} 
     */
    Reminder {
        get => this.get_Reminder()
    }

    /**
     * @type {HSTRING} 
     */
    BusyStatus {
        get => this.get_BusyStatus()
    }

    /**
     * @type {HSTRING} 
     */
    Sensitivity {
        get => this.get_Sensitivity()
    }

    /**
     * @type {HSTRING} 
     */
    OriginalStartTime {
        get => this.get_OriginalStartTime()
    }

    /**
     * @type {HSTRING} 
     */
    IsResponseRequested {
        get => this.get_IsResponseRequested()
    }

    /**
     * @type {HSTRING} 
     */
    AllowNewTimeProposal {
        get => this.get_AllowNewTimeProposal()
    }

    /**
     * @type {HSTRING} 
     */
    AllDay {
        get => this.get_AllDay()
    }

    /**
     * @type {HSTRING} 
     */
    Details {
        get => this.get_Details()
    }

    /**
     * @type {HSTRING} 
     */
    OnlineMeetingLink {
        get => this.get_OnlineMeetingLink()
    }

    /**
     * @type {HSTRING} 
     */
    ReplyTime {
        get => this.get_ReplyTime()
    }

    /**
     * @type {HSTRING} 
     */
    Organizer {
        get => this.get_Organizer()
    }

    /**
     * @type {HSTRING} 
     */
    UserResponse {
        get => this.get_UserResponse()
    }

    /**
     * @type {HSTRING} 
     */
    HasInvitees {
        get => this.get_HasInvitees()
    }

    /**
     * @type {HSTRING} 
     */
    IsCanceledMeeting {
        get => this.get_IsCanceledMeeting()
    }

    /**
     * @type {HSTRING} 
     */
    IsOrganizedByUser {
        get => this.get_IsOrganizedByUser()
    }

    /**
     * @type {HSTRING} 
     */
    Recurrence {
        get => this.get_Recurrence()
    }

    /**
     * @type {HSTRING} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * @type {HSTRING} 
     */
    Invitees {
        get => this.get_Invitees()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    DefaultProperties {
        get => this.get_DefaultProperties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Location() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StartTime() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Duration() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Reminder() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BusyStatus() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Sensitivity() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OriginalStartTime() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IsResponseRequested() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AllowNewTimeProposal() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AllDay() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Details() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OnlineMeetingLink() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ReplyTime() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Organizer() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserResponse() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HasInvitees() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IsCanceledMeeting() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IsOrganizedByUser() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Recurrence() {
        value := HSTRING()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Uri() {
        value := HSTRING()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Invitees() {
        value := HSTRING()
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DefaultProperties() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
