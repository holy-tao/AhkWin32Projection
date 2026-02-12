#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentStoreNotificationTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Passed to a background task to indicate that the task was invoked by an [AppointmentStore](appointmentstore.md).
 * @remarks
 * This object is received as an argument to an [IBackgroundTask.Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentstorenotificationtriggerdetails
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class AppointmentStoreNotificationTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentStoreNotificationTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentStoreNotificationTriggerDetails.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
