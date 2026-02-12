#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentStoreChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a [StoreChanged](appointmentstore_storechanged.md) event.
 * @remarks
 * The system generates an instance of this class and passes it as an argument to the application's [StoreChanged](appointmentstore_storechanged.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangedeventargs
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentStoreChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentStoreChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentStoreChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the deferral object for the [StoreChanged](appointmentstore_storechanged.md) event.
     * @returns {AppointmentStoreChangedDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IAppointmentStoreChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentStoreChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStoreChangedEventArgs := IAppointmentStoreChangedEventArgs(outPtr)
        }

        return this.__IAppointmentStoreChangedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
