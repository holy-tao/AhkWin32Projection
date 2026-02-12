#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppointmentsProviderReplaceAppointmentActivatedEventArgs.ahk
#Include .\IAppointmentsProviderActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data when an app is activated to replace an appointment in the user’s calendar.
  * 
  * 
  * 
  * > **JavaScript**
  * > This type appears as [WebUIAppointmentsProviderReplaceAppointmentActivatedEventArgs](../windows.ui.webui/webuiappointmentsproviderreplaceappointmentactivatedeventargs.md).
 * @remarks
 * This object is accessed when you override the [OnActivated](../windows.ui.xaml/application_onactivated_603737819.md) method, [IActivatedEventArgs.Kind](iactivatedeventargs_kind.md) is **AppointmentsProvider**, and [IAppointmentsProviderActivatedEventArgs.Verb](iappointmentsprovideractivatedeventargs_verb.md) is equal to the value of the [AppointmentsProviderLaunchActionVerbs.ReplaceAppointment](../windows.applicationmodel.appointments.appointmentsprovider/appointmentsproviderlaunchactionverbs_replaceappointment.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.appointmentsproviderreplaceappointmentactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class AppointmentsProviderReplaceAppointmentActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppointmentsProviderReplaceAppointmentActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppointmentsProviderReplaceAppointmentActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the appointment that is provided to the app when the user tries to replace it.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.appointmentsproviderreplaceappointmentactivatedeventargs.replaceappointmentoperation
     * @type {ReplaceAppointmentOperation} 
     */
    ReplaceAppointmentOperation {
        get => this.get_ReplaceAppointmentOperation()
    }

    /**
     * Gets the action to be performed by the appointments provider.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.appointmentsproviderreplaceappointmentactivatedeventargs.verb
     * @type {HSTRING} 
     */
    Verb {
        get => this.get_Verb()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.appointmentsproviderreplaceappointmentactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.appointmentsproviderreplaceappointmentactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object, which provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.appointmentsproviderreplaceappointmentactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the user that the app was activated for.
     * @remarks
     * This property returns the logged-in user on platforms that only support single-user sessions. For platforms that support multiple users in a session, this property returns the logged-in user that the app was activated for.
     * 
     * This property returns **null** when a multi-user application is activated with no specific user context.
     * 
     * Multi-user apps can use this property to allow or restrict app behavior. For example, you might restrict access to content or features based on the user’s credentials.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.appointmentsproviderreplaceappointmentactivatedeventargs.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ReplaceAppointmentOperation} 
     */
    get_ReplaceAppointmentOperation() {
        if (!this.HasProp("__IAppointmentsProviderReplaceAppointmentActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentsProviderReplaceAppointmentActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentsProviderReplaceAppointmentActivatedEventArgs := IAppointmentsProviderReplaceAppointmentActivatedEventArgs(outPtr)
        }

        return this.__IAppointmentsProviderReplaceAppointmentActivatedEventArgs.get_ReplaceAppointmentOperation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Verb() {
        if (!this.HasProp("__IAppointmentsProviderActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppointmentsProviderActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppointmentsProviderActivatedEventArgs := IAppointmentsProviderActivatedEventArgs(outPtr)
        }

        return this.__IAppointmentsProviderActivatedEventArgs.get_Verb()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreviousExecutionState() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_PreviousExecutionState()
    }

    /**
     * 
     * @returns {SplashScreen} 
     */
    get_SplashScreen() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_SplashScreen()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IActivatedEventArgsWithUser")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgsWithUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgsWithUser := IActivatedEventArgsWithUser(outPtr)
        }

        return this.__IActivatedEventArgsWithUser.get_User()
    }

;@endregion Instance Methods
}
