#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentParticipant.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the organizer of an appointment in a calendar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentorganizer
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentOrganizer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentParticipant

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentParticipant.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a string that communicates the display name of the organizer of an appointment. The display name is optional, inherited from [IAppointmentParticipant](iappointmentparticipant.md), of type [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true), and a maximum of 256 characters in length.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentorganizer.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets a string that communicates the address of the organizer of an appointment. The address is required, inherited from [IAppointmentParticipant](iappointmentparticipant.md), and a Simple Mail Transfer Protocol (SMTP) e-mail address. It is also of type [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) and between 1 and 321 characters in length (non-empty).
     * @remarks
     * When saving an appointment that has an [AppointmentOrganizer](appointmentorganizer.md) with an email address, if the address contains one of the characters listed in the table below, which are not allowed for this property, the address will be saved incorrectly and an exception won’t be thrown: ‘&lt;’, ‘&gt;’, ‘:’, ‘;’, ‘\’.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentorganizer.address
     * @type {HSTRING} 
     */
    Address {
        get => this.get_Address()
        set => this.put_Address(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AppointmentOrganizer](appointmentorganizer.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentOrganizer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
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
