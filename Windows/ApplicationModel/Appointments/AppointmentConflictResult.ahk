#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentConflictResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a conflict between appointments.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentconflictresult
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentConflictResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentConflictResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentConflictResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the type of appointment conflict.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentconflictresult.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the date of the appointment conflict.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentconflictresult.date
     * @type {DateTime} 
     */
    Date {
        get => this.get_Date()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IAppointmentConflictResult")) {
            if ((queryResult := this.QueryInterface(IAppointmentConflictResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentConflictResult := IAppointmentConflictResult(outPtr)
        }

        return this.__IAppointmentConflictResult.get_Type()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Date() {
        if (!this.HasProp("__IAppointmentConflictResult")) {
            if ((queryResult := this.QueryInterface(IAppointmentConflictResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentConflictResult := IAppointmentConflictResult(outPtr)
        }

        return this.__IAppointmentConflictResult.get_Date()
    }

;@endregion Instance Methods
}
