#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentsProviderLaunchActionVerbsStatics2.ahk
#Include .\IAppointmentsProviderLaunchActionVerbsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the object associated with retrieving the operation of the appointments provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.appointmentsproviderlaunchactionverbs
 * @namespace Windows.ApplicationModel.Appointments.AppointmentsProvider
 * @version WindowsRuntime 1.4
 */
class AppointmentsProviderLaunchActionVerbs extends IInspectable {
;@region Static Properties
    /**
     * Gets the show-appointment-details action that the appointments provider performs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.appointmentsproviderlaunchactionverbs.showappointmentdetails
     * @type {HSTRING} 
     */
    static ShowAppointmentDetails {
        get => AppointmentsProviderLaunchActionVerbs.get_ShowAppointmentDetails()
    }

    /**
     * Gets the add-appointment action that the appointments provider performs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.appointmentsproviderlaunchactionverbs.addappointment
     * @type {HSTRING} 
     */
    static AddAppointment {
        get => AppointmentsProviderLaunchActionVerbs.get_AddAppointment()
    }

    /**
     * Gets the replace-appointment action that the appointments provider performs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.appointmentsproviderlaunchactionverbs.replaceappointment
     * @type {HSTRING} 
     */
    static ReplaceAppointment {
        get => AppointmentsProviderLaunchActionVerbs.get_ReplaceAppointment()
    }

    /**
     * Gets the remove-appointment action that the appointments provider performs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.appointmentsproviderlaunchactionverbs.removeappointment
     * @type {HSTRING} 
     */
    static RemoveAppointment {
        get => AppointmentsProviderLaunchActionVerbs.get_RemoveAppointment()
    }

    /**
     * Gets the show-time-frame action of an appointment that the appointments provider performs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.appointmentsproviderlaunchactionverbs.showtimeframe
     * @type {HSTRING} 
     */
    static ShowTimeFrame {
        get => AppointmentsProviderLaunchActionVerbs.get_ShowTimeFrame()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ShowAppointmentDetails() {
        if (!AppointmentsProviderLaunchActionVerbs.HasProp("__IAppointmentsProviderLaunchActionVerbsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentsProvider.AppointmentsProviderLaunchActionVerbs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentsProviderLaunchActionVerbsStatics2.IID)
            AppointmentsProviderLaunchActionVerbs.__IAppointmentsProviderLaunchActionVerbsStatics2 := IAppointmentsProviderLaunchActionVerbsStatics2(factoryPtr)
        }

        return AppointmentsProviderLaunchActionVerbs.__IAppointmentsProviderLaunchActionVerbsStatics2.get_ShowAppointmentDetails()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AddAppointment() {
        if (!AppointmentsProviderLaunchActionVerbs.HasProp("__IAppointmentsProviderLaunchActionVerbsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentsProvider.AppointmentsProviderLaunchActionVerbs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentsProviderLaunchActionVerbsStatics.IID)
            AppointmentsProviderLaunchActionVerbs.__IAppointmentsProviderLaunchActionVerbsStatics := IAppointmentsProviderLaunchActionVerbsStatics(factoryPtr)
        }

        return AppointmentsProviderLaunchActionVerbs.__IAppointmentsProviderLaunchActionVerbsStatics.get_AddAppointment()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ReplaceAppointment() {
        if (!AppointmentsProviderLaunchActionVerbs.HasProp("__IAppointmentsProviderLaunchActionVerbsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentsProvider.AppointmentsProviderLaunchActionVerbs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentsProviderLaunchActionVerbsStatics.IID)
            AppointmentsProviderLaunchActionVerbs.__IAppointmentsProviderLaunchActionVerbsStatics := IAppointmentsProviderLaunchActionVerbsStatics(factoryPtr)
        }

        return AppointmentsProviderLaunchActionVerbs.__IAppointmentsProviderLaunchActionVerbsStatics.get_ReplaceAppointment()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RemoveAppointment() {
        if (!AppointmentsProviderLaunchActionVerbs.HasProp("__IAppointmentsProviderLaunchActionVerbsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentsProvider.AppointmentsProviderLaunchActionVerbs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentsProviderLaunchActionVerbsStatics.IID)
            AppointmentsProviderLaunchActionVerbs.__IAppointmentsProviderLaunchActionVerbsStatics := IAppointmentsProviderLaunchActionVerbsStatics(factoryPtr)
        }

        return AppointmentsProviderLaunchActionVerbs.__IAppointmentsProviderLaunchActionVerbsStatics.get_RemoveAppointment()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ShowTimeFrame() {
        if (!AppointmentsProviderLaunchActionVerbs.HasProp("__IAppointmentsProviderLaunchActionVerbsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Appointments.AppointmentsProvider.AppointmentsProviderLaunchActionVerbs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppointmentsProviderLaunchActionVerbsStatics.IID)
            AppointmentsProviderLaunchActionVerbs.__IAppointmentsProviderLaunchActionVerbsStatics := IAppointmentsProviderLaunchActionVerbsStatics(factoryPtr)
        }

        return AppointmentsProviderLaunchActionVerbs.__IAppointmentsProviderLaunchActionVerbsStatics.get_ShowTimeFrame()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
