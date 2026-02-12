#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentStoreChangeTracker.ahk
#Include .\IAppointmentStoreChangeTracker2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides APIs for managing change tracking for appointments.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangetracker
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentStoreChangeTracker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentStoreChangeTracker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentStoreChangeTracker.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a Boolean value indicating whether change tracking is active.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangetracker.istracking
     * @type {Boolean} 
     */
    IsTracking {
        get => this.get_IsTracking()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves an [AppointmentStoreChangeReader](appointmentstorechangereader.md) that enables the app to iterate through the list of changes and mark changes as accepted.
     * @returns {AppointmentStoreChangeReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangetracker.getchangereader
     */
    GetChangeReader() {
        if (!this.HasProp("__IAppointmentStoreChangeTracker")) {
            if ((queryResult := this.QueryInterface(IAppointmentStoreChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStoreChangeTracker := IAppointmentStoreChangeTracker(outPtr)
        }

        return this.__IAppointmentStoreChangeTracker.GetChangeReader()
    }

    /**
     * Enables change tracking for the appointment store.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangetracker.enable
     */
    Enable() {
        if (!this.HasProp("__IAppointmentStoreChangeTracker")) {
            if ((queryResult := this.QueryInterface(IAppointmentStoreChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStoreChangeTracker := IAppointmentStoreChangeTracker(outPtr)
        }

        return this.__IAppointmentStoreChangeTracker.Enable()
    }

    /**
     * Resets change tracking for the appointment store, deleting existing change tracking data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorechangetracker.reset
     */
    Reset() {
        if (!this.HasProp("__IAppointmentStoreChangeTracker")) {
            if ((queryResult := this.QueryInterface(IAppointmentStoreChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStoreChangeTracker := IAppointmentStoreChangeTracker(outPtr)
        }

        return this.__IAppointmentStoreChangeTracker.Reset()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTracking() {
        if (!this.HasProp("__IAppointmentStoreChangeTracker2")) {
            if ((queryResult := this.QueryInterface(IAppointmentStoreChangeTracker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentStoreChangeTracker2 := IAppointmentStoreChangeTracker2(outPtr)
        }

        return this.__IAppointmentStoreChangeTracker2.get_IsTracking()
    }

;@endregion Instance Methods
}
