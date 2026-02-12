#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentInvitee.ahk
#Include .\IAppointmentParticipant.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a participant of an appointment in a calendar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentinvitee
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentInvitee extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentInvitee

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentInvitee.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a [AppointmentParticipantRole](appointmentparticipantrole.md)-typed value that indicates the role of a participant concerning an appointment invitation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentinvitee.role
     * @type {Integer} 
     */
    Role {
        get => this.get_Role()
        set => this.put_Role(value)
    }

    /**
     * Gets or sets a [AppointmentParticipantResponse](appointmentparticipantresponse.md)-typed value that indicates the response from a participant concerning an appointment invitation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentinvitee.response
     * @type {Integer} 
     */
    Response {
        get => this.get_Response()
        set => this.put_Response(value)
    }

    /**
     * Gets or sets a string that communicates the display name of a participant of an appointment. The display name is inherited from [IAppointmentParticipant](iappointmentparticipant.md), of type [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true), and a maximum of 256 characters in length.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentinvitee.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets a string that communicates the address of a participant of an appointment. The address is inherited from [IAppointmentParticipant](iappointmentparticipant.md) and is a Simple Mail Transfer Protocol (SMTP) e-mail address. It is also of type [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) and between 1 and 321 characters in length (non-empty).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentinvitee.address
     * @type {HSTRING} 
     */
    Address {
        get => this.get_Address()
        set => this.put_Address(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AppointmentInvitee](appointmentinvitee.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentInvitee")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Role() {
        if (!this.HasProp("__IAppointmentInvitee")) {
            if ((queryResult := this.QueryInterface(IAppointmentInvitee.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentInvitee := IAppointmentInvitee(outPtr)
        }

        return this.__IAppointmentInvitee.get_Role()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Role(value) {
        if (!this.HasProp("__IAppointmentInvitee")) {
            if ((queryResult := this.QueryInterface(IAppointmentInvitee.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentInvitee := IAppointmentInvitee(outPtr)
        }

        return this.__IAppointmentInvitee.put_Role(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Response() {
        if (!this.HasProp("__IAppointmentInvitee")) {
            if ((queryResult := this.QueryInterface(IAppointmentInvitee.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentInvitee := IAppointmentInvitee(outPtr)
        }

        return this.__IAppointmentInvitee.get_Response()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Response(value) {
        if (!this.HasProp("__IAppointmentInvitee")) {
            if ((queryResult := this.QueryInterface(IAppointmentInvitee.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentInvitee := IAppointmentInvitee(outPtr)
        }

        return this.__IAppointmentInvitee.put_Response(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IAppointmentParticipant")) {
            if ((queryResult := this.QueryInterface(IAppointmentParticipant.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentParticipant := IAppointmentParticipant(outPtr)
        }

        return this.__IAppointmentParticipant.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IAppointmentParticipant")) {
            if ((queryResult := this.QueryInterface(IAppointmentParticipant.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentParticipant := IAppointmentParticipant(outPtr)
        }

        return this.__IAppointmentParticipant.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Address() {
        if (!this.HasProp("__IAppointmentParticipant")) {
            if ((queryResult := this.QueryInterface(IAppointmentParticipant.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentParticipant := IAppointmentParticipant(outPtr)
        }

        return this.__IAppointmentParticipant.get_Address()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Address(value) {
        if (!this.HasProp("__IAppointmentParticipant")) {
            if ((queryResult := this.QueryInterface(IAppointmentParticipant.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentParticipant := IAppointmentParticipant(outPtr)
        }

        return this.__IAppointmentParticipant.put_Address(value)
    }

;@endregion Instance Methods
}
