#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointment2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointment2
     * @type {Guid}
     */
    static IID => Guid("{5e85983c-540f-3452-9b5c-0dd7ad4c65a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalId", "get_CalendarId", "get_RoamingId", "put_RoamingId", "get_OriginalStartTime", "get_IsResponseRequested", "put_IsResponseRequested", "get_AllowNewTimeProposal", "put_AllowNewTimeProposal", "get_OnlineMeetingLink", "put_OnlineMeetingLink", "get_ReplyTime", "put_ReplyTime", "get_UserResponse", "put_UserResponse", "get_HasInvitees", "get_IsCanceledMeeting", "put_IsCanceledMeeting", "get_IsOrganizedByUser", "put_IsOrganizedByUser"]

    /**
     * @type {HSTRING} 
     */
    LocalId {
        get => this.get_LocalId()
    }

    /**
     * @type {HSTRING} 
     */
    CalendarId {
        get => this.get_CalendarId()
    }

    /**
     * @type {HSTRING} 
     */
    RoamingId {
        get => this.get_RoamingId()
        set => this.put_RoamingId(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    OriginalStartTime {
        get => this.get_OriginalStartTime()
    }

    /**
     * @type {Boolean} 
     */
    IsResponseRequested {
        get => this.get_IsResponseRequested()
        set => this.put_IsResponseRequested(value)
    }

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
    OnlineMeetingLink {
        get => this.get_OnlineMeetingLink()
        set => this.put_OnlineMeetingLink(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    ReplyTime {
        get => this.get_ReplyTime()
        set => this.put_ReplyTime(value)
    }

    /**
     * @type {Integer} 
     */
    UserResponse {
        get => this.get_UserResponse()
        set => this.put_UserResponse(value)
    }

    /**
     * @type {Boolean} 
     */
    HasInvitees {
        get => this.get_HasInvitees()
    }

    /**
     * @type {Boolean} 
     */
    IsCanceledMeeting {
        get => this.get_IsCanceledMeeting()
        set => this.put_IsCanceledMeeting(value)
    }

    /**
     * @type {Boolean} 
     */
    IsOrganizedByUser {
        get => this.get_IsOrganizedByUser()
        set => this.put_IsOrganizedByUser(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalId() {
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
    get_CalendarId() {
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
    get_RoamingId() {
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
    put_RoamingId(value) {
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
    get_OriginalStartTime() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsResponseRequested() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowNewTimeProposal() {
        result := ComCall(13, this, "int*", &value := 0, "int")
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
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OnlineMeetingLink() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
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
    put_OnlineMeetingLink(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ReplyTime() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
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
    put_ReplyTime(value) {
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserResponse() {
        result := ComCall(19, this, "int*", &value := 0, "int")
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
    put_UserResponse(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasInvitees() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceledMeeting() {
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
    put_IsCanceledMeeting(value) {
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
    get_IsOrganizedByUser() {
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
    put_IsOrganizedByUser(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
