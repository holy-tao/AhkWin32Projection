#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IReplaceAppointmentOperation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the operation object associated with replacing an appointment. Appointments provider apps use this info to perform the operation.
 * @remarks
 * This class is used as the value of the ReplaceAppointmentOperation event data property from the [AppointmentsProviderRemoveAppointmentActivatedEventArgs](../windows.applicationmodel.activation/appointmentsproviderremoveappointmentactivatedeventargs.md) event data class. An appointments provider app typically goes through a series of casts and property checks starting from the [IActivatedEventArgs](../windows.applicationmodel.activation/iactivatedeventargs.md) event data of a general activation event handler. If the activation indicates that it's an **AppointmentsProvider** app activation kind with **Remove** as the verb, then it's appropriate to cast event data to [AppointmentsProviderRemoveAppointmentActivatedEventArgs](../windows.applicationmodel.activation/appointmentsproviderremoveappointmentactivatedeventargs.md).
 * 
 * Providers call methods of ReplaceAppointmentOperation to indicate whether the operation was completed, was canceled, or when a provider error prevented the operation from being completed. Calling these methods influences the async results that the activating app gets back from one of its [ShowReplaceAppointmentAsync](/uwp/api/windows.applicationmodel.appointments.appointmentmanager.showreplaceappointmentasync) calls. All of the reporting methods ([ReportCompleted](replaceappointmentoperation_reportcompleted_458863373.md), [ReportCanceled](replaceappointmentoperation_reportcanceled_1921025216.md), [ReportError](replaceappointmentoperation_reporterror_1034694985.md)) dismiss the Replace Appointment UI.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.replaceappointmentoperation
 * @namespace Windows.ApplicationModel.Appointments.AppointmentsProvider
 * @version WindowsRuntime 1.4
 */
class ReplaceAppointmentOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IReplaceAppointmentOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IReplaceAppointmentOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier of the appointment to replace.
     * @remarks
     * The identifier is typically a value that the appointments provider app previously returned through an [AddAppointmentOperation.ReportCompleted](addappointmentoperation_reportcompleted_458863373.md) call. If the identifier doesn't correspond to any known appointment, the appointment doesn't exist in the user’s calendar. Because the user's intent was to replace the original appointment, we recommend that the appointment provider app create a new appointment and add it to the calendar.
     * <!--and probably should not display UI? without an ID to lookup the info there would be nothing useful to display-->
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.replaceappointmentoperation.appointmentid
     * @type {HSTRING} 
     */
    AppointmentId {
        get => this.get_AppointmentId()
    }

    /**
     * Gets the [Appointment](../windows.applicationmodel.appointments/appointment.md) info from the activation request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.replaceappointmentoperation.appointmentinformation
     * @type {Appointment} 
     */
    AppointmentInformation {
        get => this.get_AppointmentInformation()
    }

    /**
     * Gets the start date and time of the appointment instance to replace.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.replaceappointmentoperation.instancestartdate
     * @type {IReference<DateTime>} 
     */
    InstanceStartDate {
        get => this.get_InstanceStartDate()
    }

    /**
     * Gets the package family name of the app that is requesting the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.replaceappointmentoperation.sourcepackagefamilyname
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
        if (!this.HasProp("__IReplaceAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IReplaceAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReplaceAppointmentOperation := IReplaceAppointmentOperation(outPtr)
        }

        return this.__IReplaceAppointmentOperation.get_AppointmentId()
    }

    /**
     * 
     * @returns {Appointment} 
     */
    get_AppointmentInformation() {
        if (!this.HasProp("__IReplaceAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IReplaceAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReplaceAppointmentOperation := IReplaceAppointmentOperation(outPtr)
        }

        return this.__IReplaceAppointmentOperation.get_AppointmentInformation()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_InstanceStartDate() {
        if (!this.HasProp("__IReplaceAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IReplaceAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReplaceAppointmentOperation := IReplaceAppointmentOperation(outPtr)
        }

        return this.__IReplaceAppointmentOperation.get_InstanceStartDate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourcePackageFamilyName() {
        if (!this.HasProp("__IReplaceAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IReplaceAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReplaceAppointmentOperation := IReplaceAppointmentOperation(outPtr)
        }

        return this.__IReplaceAppointmentOperation.get_SourcePackageFamilyName()
    }

    /**
     * Informs the activating app that the operation was completed successfully.
     * @param {HSTRING} itemId A unique appointment ID that the activating app can later use to remove this appointment if necessary or to replace it again.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.replaceappointmentoperation.reportcompleted
     */
    ReportCompleted(itemId) {
        if (!this.HasProp("__IReplaceAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IReplaceAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReplaceAppointmentOperation := IReplaceAppointmentOperation(outPtr)
        }

        return this.__IReplaceAppointmentOperation.ReportCompleted(itemId)
    }

    /**
     * Informs the activating app that the operation was canceled by the user.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.replaceappointmentoperation.reportcanceled
     */
    ReportCanceled() {
        if (!this.HasProp("__IReplaceAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IReplaceAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReplaceAppointmentOperation := IReplaceAppointmentOperation(outPtr)
        }

        return this.__IReplaceAppointmentOperation.ReportCanceled()
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
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.replaceappointmentoperation.reporterror
     */
    ReportError(value) {
        if (!this.HasProp("__IReplaceAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IReplaceAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReplaceAppointmentOperation := IReplaceAppointmentOperation(outPtr)
        }

        return this.__IReplaceAppointmentOperation.ReportError(value)
    }

    /**
     * Dismisses the UI for the operation that replaces an appointment.
     * @remarks
     * A call to [DismissUI](addappointmentoperation_dismissui_451152495.md) is similar to when the user dismisses the appointment provider’s UI by tapping away from it. When the appointment provider’s UI is dismissed, the appointment provider app can continue to save the appointment in the background until the appointment provider app calls [ReportCompleted](addappointmentoperation_reportcompleted_458863373.md) or [ReportError](addappointmentoperation_reporterror_1034694985.md) or up to 15 seconds elapses, which causes the appointments provider app to stop running.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.appointmentsprovider.replaceappointmentoperation.dismissui
     */
    DismissUI() {
        if (!this.HasProp("__IReplaceAppointmentOperation")) {
            if ((queryResult := this.QueryInterface(IReplaceAppointmentOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReplaceAppointmentOperation := IReplaceAppointmentOperation(outPtr)
        }

        return this.__IReplaceAppointmentOperation.DismissUI()
    }

;@endregion Instance Methods
}
