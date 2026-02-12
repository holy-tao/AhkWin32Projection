#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentException.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an appointment instance that is an exception from the master appointment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentexception
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentException extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentException

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentException.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the appointment that is an exception from the master appointment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentexception.appointment
     * @type {Appointment} 
     */
    Appointment {
        get => this.get_Appointment()
    }

    /**
     * Gets a list of the names of the appointment properties for which an exception was found.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentexception.exceptionproperties
     * @type {IVectorView<HSTRING>} 
     */
    ExceptionProperties {
        get => this.get_ExceptionProperties()
    }

    /**
     * Gets a value indicating whether the exception is that the appointment instance has been deleted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentexception.isdeleted
     * @type {Boolean} 
     */
    IsDeleted {
        get => this.get_IsDeleted()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Appointment} 
     */
    get_Appointment() {
        if (!this.HasProp("__IAppointmentException")) {
            if ((queryResult := this.QueryInterface(IAppointmentException.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentException := IAppointmentException(outPtr)
        }

        return this.__IAppointmentException.get_Appointment()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_ExceptionProperties() {
        if (!this.HasProp("__IAppointmentException")) {
            if ((queryResult := this.QueryInterface(IAppointmentException.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentException := IAppointmentException(outPtr)
        }

        return this.__IAppointmentException.get_ExceptionProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDeleted() {
        if (!this.HasProp("__IAppointmentException")) {
            if ((queryResult := this.QueryInterface(IAppointmentException.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentException := IAppointmentException(outPtr)
        }

        return this.__IAppointmentException.get_IsDeleted()
    }

;@endregion Instance Methods
}
