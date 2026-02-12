#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAddAppointmentOperation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the operation object associated with adding a new appointment. Appointments provider apps use this info to perform the operation.
 * @remarks
 * This class is used as the value of the [AddAppointmentOperation](../windows.applicationmodel.activation/appointmentsprovideraddappointmentactivatedeventargs_addappointmentoperation.md) event data property from the [AppointmentsProviderAddAppointmentActivatedEventArgs](../windows.applicationmodel.activation/appointmentsprovideraddappointmentactivatedeventargs.md) event data class. An appointments provider app typically goes through a series of casts and property checks starting from the [IActivatedEventArgs](../windows.applicationmodel.activation/iactivatedeventargs.md) event data of a general activation event handler. If the activation indicates that it's an **AppointmentsProvider** app activation kind with **Add** as the verb, then it's appropriate to cast event data to [AppointmentsProviderAddAppointmentActivatedEventArgs](../windows.applicationmodel.activation/appointmentsprovideraddappointmentactivatedeventargs.md).
 * 
 * Providers call methods of AddAppointmentOperation to indicate whether the operation was completed, was canceled, or when a provider error prevented the operation from being completed. Calling these methods influences the async results that the activating app gets back from its [ShowAddAppointmentAsync](/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showaddappointmentasync) call. All of the reporting methods ([ReportCompleted](addappointmentoperation_reportcompleted_458863373.md), [ReportCanceled](addappointmentoperation_reportcanceled_1921025216.md), [ReportError](addappointmentoperation_reporterror_1034694985.md)) dismiss the Add Appointment UI.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.addappointmentoperation
 * @namespace Windows.ApplicationModel.Appointments.AppointmentsProvider
 * @version WindowsRuntime 1.4
 */
class AddAppointmentOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAddAppointmentOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAddAppointmentOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [Appointment](../windows.applicationmodel.appointments/appointment.md) info from the activation request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.addappointmentoperation.appointmentinformation
     * @type {Appointment} 
     */
    AppointmentInformation {
        get => this.get_AppointmentInformation()
    }

    /**
     * Gets the package family name of the app that is requesting the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.addappointmentoperation.sourcepackagefamilyname
     * @type {HSTRING} 
     */
    SourcePackageFamilyName {
        get => this.get_SourcePackageFamilyName()
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
    get_AppointmentInformation() {
        if (!this.HasProp("__IAddAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IAddAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddAppointmentOperation := IAddAppointmentOperation(outPtr)
        }

        return this.__IAddAppointmentOperation.get_AppointmentInformation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourcePackageFamilyName() {
        if (!this.HasProp("__IAddAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IAddAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddAppointmentOperation := IAddAppointmentOperation(outPtr)
        }

        return this.__IAddAppointmentOperation.get_SourcePackageFamilyName()
    }

    /**
     * Call this method to inform the activating app that the operation was completed successfully. Provide a unique appointment ID as the *itemID* parameter.
     * @param {HSTRING} itemId A unique appointment ID that the activating app can later use to remove this appointment if necessary.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.addappointmentoperation.reportcompleted
     */
    ReportCompleted(itemId) {
        if (!this.HasProp("__IAddAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IAddAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddAppointmentOperation := IAddAppointmentOperation(outPtr)
        }

        return this.__IAddAppointmentOperation.ReportCompleted(itemId)
    }

    /**
     * Call this method to inform the activating app that the operation was canceled by the user.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.addappointmentoperation.reportcanceled
     */
    ReportCanceled() {
        if (!this.HasProp("__IAddAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IAddAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddAppointmentOperation := IAddAppointmentOperation(outPtr)
        }

        return this.__IAddAppointmentOperation.ReportCanceled()
    }

    /**
     * Informs the activating app that the operation couldn't be completed because of a provider error.
     * @remarks
     * This method logs messages about event tracing for Windows (ETW) events. To view these messages, see: ```
     * 
     * Event Viewer\Applications and Services Logs\Microsoft\Windows\Apps\Microsoft-Windows-TWinUI\Operational
     * ```
     * @param {HSTRING} value A string that contains info about the error.
     * <!--Where does this come out again? Detectable in the IAsyncResult? Should also note in Remarks whether this returns empty string to the ID value of the original async caller.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.addappointmentoperation.reporterror
     */
    ReportError(value) {
        if (!this.HasProp("__IAddAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IAddAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddAppointmentOperation := IAddAppointmentOperation(outPtr)
        }

        return this.__IAddAppointmentOperation.ReportError(value)
    }

    /**
     * Dismisses the UI for the operation that adds a new appointment.
     * @remarks
     * A call to DismissUI is similar to when the user dismisses the appointment provider’s UI by tapping away from it. When the appointment provider’s UI is dismissed, the appointment provider app can continue to save the appointment in the background until the appointment provider app calls [ReportCompleted](addappointmentoperation_reportcompleted_458863373.md) or [ReportError](addappointmentoperation_reporterror_1034694985.md) or up to 15 seconds elapses, which causes the appointments provider app to stop running.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.addappointmentoperation.dismissui
     */
    DismissUI() {
        if (!this.HasProp("__IAddAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IAddAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAddAppointmentOperation := IAddAppointmentOperation(outPtr)
        }

        return this.__IAddAppointmentOperation.DismissUI()
    }

;@endregion Instance Methods
}
