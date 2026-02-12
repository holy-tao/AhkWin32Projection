#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\ApplicationModel\Activation\IContactVideoCallActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IContactActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include .\IActivatedEventArgsDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data when an app is activated to video call a contact.
 * @remarks
 * This object is accessed when you implement an event handler for the [WinJS.Application.Onactivated](/previous-versions/windows/apps/br212679(v=win.10)) or the [Windows.UI.WebUI.WebUIApplication.activated](webuiapplication_activated.md) events when [ActivationKind](../windows.applicationmodel.activation/activationkind.md) is **contact**.
 * 
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * 
 * Windows 8.1 allows users to video call their contacts from the [Contact Card](../windows.applicationmodel.contacts/contactmanager_showcontactcard_1968125937.md) or Windows Search experience. By implementing the contact video call activation contract, Windows can launch your app to make video calls for the user.
 * 
 * To receive video call activations, your app must register for the "windows.contact" extension category in its manifest. Under this extension, you must include a "LaunchAction" element with the "Verb" attribute equal to "videoCall." You can then specify the "ServiceId" element to specify the domain name of the service that your app can video call over, for example "skype.com."
 * 
 * If multiple apps have registered for this contract, the user can choose one of them as their default for handling video calls.
 * 
 * 
 * 
 * Here is an example for manifest registration:
 * 
 * ```xml
 * 
 * <m2:Extension Category="windows.contact" xmlns:m2="http://schemas.microsoft.com/appx/2013/manifest">
 *   <m2:Contact>
 *     <m2:ContactLaunchActions>
 *       <m2:LaunchAction Verb="videoCall" DesiredView="useHalf">
 *         <m2:ServiceId>skype.com</m2:ServiceId>
 *       </m2:LaunchAction>
 *     </m2:ContactLaunchActions>
 *   </m2:Contact>
 * </m2:Extension>
 * 
 * ```
 * 
 * 
 * 
 * After you register in your manifest, your app can be activated for the contact video call contract. When your app is activated, you can use the event information to identify the video call activation and extract the parameters that help you complete the video call for the user.
 * 
 * Here is an example of the code you need to handle contact video call activations for Skype Ids:
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuicontactvideocallactivatedeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUIContactVideoCallActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactVideoCallActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactVideoCallActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier of the service used for the video call.
     * @remarks
     * Your app will only receive video call activations for ServiceIds that match the "ServiceId" elements that your app has registered in its manifest.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuicontactvideocallactivatedeventargs.serviceid
     * @type {HSTRING} 
     */
    ServiceId {
        get => this.get_ServiceId()
    }

    /**
     * Gets the user identifier of the service used for the video call.
     * @remarks
     * The ServiceUserId property is set to the contact’s user id for the service that is being video called over.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuicontactvideocallactivatedeventargs.serviceuserid
     * @type {HSTRING} 
     */
    ServiceUserId {
        get => this.get_ServiceUserId()
    }

    /**
     * Gets the contact for the video call.
     * @remarks
     * Use the Contact property to collect additional info about the contact that is being video called. The contact can have a name and thumbnail that can be used to represent it in your app’s UI. Or, the contact can have alternative user ids that can be used in case the primary user id is unavailable. The [ConnectedServiceAccounts](../windows.applicationmodel.contacts/contact_connectedserviceaccounts.md) property contains a list of all services available for the contact. You can use the [ContactConnectedServiceAccount.ServiceName](../windows.applicationmodel.contacts/contactconnectedserviceaccount_servicename.md) and [ContactConnectedServiceAccount.Id](../windows.applicationmodel.contacts/contactconnectedserviceaccount_id.md) properties on each service to retrieve alternative services and user ids respectively.
     * 
     * 
     * Here are possible [Contact](../windows.applicationmodel.contacts/contact.md) properties that can be populated during a video call activation:
     * 
     * + [DisplayName](../windows.applicationmodel.contacts/contact_displayname.md)
     * + [FirstName](../windows.applicationmodel.contacts/contact_firstname.md)
     * + [LastName](../windows.applicationmodel.contacts/contact_lastname.md)
     * + [MiddleName](../windows.applicationmodel.contacts/contact_middlename.md)
     * + [HonorificNamePrefix](../windows.applicationmodel.contacts/contact_honorificnameprefix.md)
     * + [HonorificNameSuffix](../windows.applicationmodel.contacts/contact_honorificnamesuffix.md)
     * + [YomiDisplayName](../windows.applicationmodel.contacts/contact_yomidisplayname.md)
     * + [YomiFamilyName](../windows.applicationmodel.contacts/contact_yomifamilyname.md)
     * + [YomiGivenName](../windows.applicationmodel.contacts/contact_yomigivenname.md)
     * + [Thumbnail](../windows.applicationmodel.contacts/contact_thumbnail.md)
     * + [ConnectedServiceAccounts](../windows.applicationmodel.contacts/contact_connectedserviceaccounts.md)
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuicontactvideocallactivatedeventargs.contact
     * @type {Contact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * Gets the action to be performed.
     * @remarks
     * Use the Verb property to determine the action to perform when your app is activated with [ActivationKind.Contact](../windows.applicationmodel.activation/activationkind.md). For video call activations, the Verb property is set to the value of [Windows.ApplicationModel.Contacts.ContactLaunchActionVerbs.VideoCall](../windows.applicationmodel.contacts/contactlaunchactionverbs_videocall.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuicontactvideocallactivatedeventargs.verb
     * @type {HSTRING} 
     */
    Verb {
        get => this.get_Verb()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuicontactvideocallactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuicontactvideocallactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object, which provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuicontactvideocallactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the app activated operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuicontactvideocallactivatedeventargs.activatedoperation
     * @type {ActivatedOperation} 
     */
    ActivatedOperation {
        get => this.get_ActivatedOperation()
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
    get_ServiceId() {
        if (!this.HasProp("__IContactVideoCallActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactVideoCallActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactVideoCallActivatedEventArgs := IContactVideoCallActivatedEventArgs(outPtr)
        }

        return this.__IContactVideoCallActivatedEventArgs.get_ServiceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceUserId() {
        if (!this.HasProp("__IContactVideoCallActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactVideoCallActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactVideoCallActivatedEventArgs := IContactVideoCallActivatedEventArgs(outPtr)
        }

        return this.__IContactVideoCallActivatedEventArgs.get_ServiceUserId()
    }

    /**
     * 
     * @returns {Contact} 
     */
    get_Contact() {
        if (!this.HasProp("__IContactVideoCallActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactVideoCallActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactVideoCallActivatedEventArgs := IContactVideoCallActivatedEventArgs(outPtr)
        }

        return this.__IContactVideoCallActivatedEventArgs.get_Contact()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Verb() {
        if (!this.HasProp("__IContactActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactActivatedEventArgs := IContactActivatedEventArgs(outPtr)
        }

        return this.__IContactActivatedEventArgs.get_Verb()
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
     * @returns {ActivatedOperation} 
     */
    get_ActivatedOperation() {
        if (!this.HasProp("__IActivatedEventArgsDeferral")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgsDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgsDeferral := IActivatedEventArgsDeferral(outPtr)
        }

        return this.__IActivatedEventArgsDeferral.get_ActivatedOperation()
    }

;@endregion Instance Methods
}
