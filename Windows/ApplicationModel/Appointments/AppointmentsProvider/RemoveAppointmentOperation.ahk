#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoveAppointmentOperation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the operation object associated with removing an appointment. Appointments provider apps use this info to perform the operation.
 * @remarks
 * This class is used as the value of the [RemoveAppointmentOperation](../windows.applicationmodel.activation/appointmentsproviderremoveappointmentactivatedeventargs_removeappointmentoperation.md) event data property from the [AppointmentsProviderRemoveAppointmentActivatedEventArgs](../windows.applicationmodel.activation/appointmentsproviderremoveappointmentactivatedeventargs.md) event data class. An appointments provider app typically goes through a series of casts and property checks starting from the [IActivatedEventArgs](../windows.applicationmodel.activation/iactivatedeventargs.md) event data of a general activation event handler. If the activation indicates that it's an **AppointmentsProvider** app activation kind with **Remove** as the verb, then it's appropriate to cast event data to [AppointmentsProviderRemoveAppointmentActivatedEventArgs](../windows.applicationmodel.activation/appointmentsproviderremoveappointmentactivatedeventargs.md).
 * 
 * Providers call methods of RemoveAppointmentOperation to indicate whether the operation was completed, was canceled, or when a provider error prevented the operation from being completed. Calling these methods influences the async results that the activating app gets back from its [ShowRemoveAppointmentAsync](/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showremoveappointmentasync) call. All of the reporting methods ([ReportCompleted](removeappointmentoperation_reportcompleted_1121471021.md), [ReportCanceled](removeappointmentoperation_reportcanceled_1921025216.md), [ReportError](removeappointmentoperation_reporterror_1034694985.md)) dismiss the Remove Appointment UI.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.removeappointmentoperation
 * @namespace Windows.ApplicationModel.Appointments.AppointmentsProvider
 * @version WindowsRuntime 1.4
 */
class RemoveAppointmentOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoveAppointmentOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoveAppointmentOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier of the appointment to remove.
     * @remarks
     * The identifier is usually a value the appointment provider app previously returned through an [AddAppointmentOperation.ReportCompleted](addappointmentoperation_reportcompleted_458863373.md) call. If the identifier doesn't correspond to any known appointment, the appointment doesn't exist in the user’s calendar. Because the user's intent was to remove the appointment, we recommend that you treat the operation as successful.
     * <!--and probably should not display UI? without an ID to lookup the info there would be nothing useful to display-->
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.removeappointmentoperation.appointmentid
     * @type {HSTRING} 
     */
    AppointmentId {
        get => this.get_AppointmentId()
    }

    /**
     * Gets the start date and time of the appointment instance to remove.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.removeappointmentoperation.instancestartdate
     * @type {IReference<DateTime>} 
     */
    InstanceStartDate {
        get => this.get_InstanceStartDate()
    }

    /**
     * Gets the package family name of the app that is requesting the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.removeappointmentoperation.sourcepackagefamilyname
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
     * @returns {HSTRING} 
     */
    get_AppointmentId() {
        if (!this.HasProp("__IRemoveAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IRemoveAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoveAppointmentOperation := IRemoveAppointmentOperation(outPtr)
        }

        return this.__IRemoveAppointmentOperation.get_AppointmentId()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_InstanceStartDate() {
        if (!this.HasProp("__IRemoveAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IRemoveAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoveAppointmentOperation := IRemoveAppointmentOperation(outPtr)
        }

        return this.__IRemoveAppointmentOperation.get_InstanceStartDate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourcePackageFamilyName() {
        if (!this.HasProp("__IRemoveAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IRemoveAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoveAppointmentOperation := IRemoveAppointmentOperation(outPtr)
        }

        return this.__IRemoveAppointmentOperation.get_SourcePackageFamilyName()
    }

    /**
     * Informs the activating app that the operation was completed successfully.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.removeappointmentoperation.reportcompleted
     */
    ReportCompleted() {
        if (!this.HasProp("__IRemoveAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IRemoveAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoveAppointmentOperation := IRemoveAppointmentOperation(outPtr)
        }

        return this.__IRemoveAppointmentOperation.ReportCompleted()
    }

    /**
     * Call this method to inform the activating app that the operation was canceled by the user.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.removeappointmentoperation.reportcanceled
     */
    ReportCanceled() {
        if (!this.HasProp("__IRemoveAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IRemoveAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoveAppointmentOperation := IRemoveAppointmentOperation(outPtr)
        }

        return this.__IRemoveAppointmentOperation.ReportCanceled()
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
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.removeappointmentoperation.reporterror
     */
    ReportError(value) {
        if (!this.HasProp("__IRemoveAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IRemoveAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoveAppointmentOperation := IRemoveAppointmentOperation(outPtr)
        }

        return this.__IRemoveAppointmentOperation.ReportError(value)
    }

    /**
     * Dismisses the UI for the operation that removes an appointment.
     * @remarks
     * A call to [DismissUI](addappointmentoperation_dismissui_451152495.md) is similar to when the user dismisses the appointment provider’s UI by tapping away from it. When the appointment provider’s UI is dismissed, the appointment provider app can continue to save the appointment in the background until the appointment provider app calls [ReportCompleted](addappointmentoperation_reportcompleted_458863373.md) or [ReportError](addappointmentoperation_reporterror_1034694985.md) or up to 15 seconds elapses, which causes the appointments provider app to stop running.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.removeappointmentoperation.dismissui
     */
    DismissUI() {
        if (!this.HasProp("__IRemoveAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IRemoveAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoveAppointmentOperation := IRemoveAppointmentOperation(outPtr)
        }

        return this.__IRemoveAppointmentOperation.DismissUI()
    }

;@endregion Instance Methods
}
