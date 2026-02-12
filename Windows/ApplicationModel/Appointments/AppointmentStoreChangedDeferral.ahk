#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentStoreChangedDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a background task deferral returned by the [AppointmentStoreChangedEventArgs.GetDeferral](appointmentstorechangedeventargs_getdeferral_254836512.md) method.
 * @remarks
 * Returned by the [AppointmentStoreChangedEventArgs.GetDeferral](appointmentstorechangedeventargs_getdeferral_254836512.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangeddeferral
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentStoreChangedDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentStoreChangedDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentStoreChangedDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Informs the system that an asynchronous operation associated with an [AppointmentStore](appointmentstore.md) has finished.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangeddeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IAppointmentStoreChangedDeferral")) {
            if ((queryResult := this.QueryInterface(IAppointmentStoreChangedDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStoreChangedDeferral := IAppointmentStoreChangedDeferral(outPtr)
        }

        return this.__IAppointmentStoreChangedDeferral.Complete()
    }

;@endregion Instance Methods
}
