#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactMapActivatedEventArgs.ahk
#Include .\IContactActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data when an app is activated to map a contact.
  * 
  * > **JavaScript**
  * > This type appears as [WebUIContactMapActivatedEventArgs](../windows.ui.webui/webuicontactmapactivatedeventargs.md).
 * @remarks
 * Windows 8.1 allows users to map their contacts' locations from the [Contact Card](../windows.applicationmodel.contacts/contactmanager_showcontactcard_1968125937.md) or Windows Search experience. By implementing the contact map activation contract, Windows can launch your app to map locations for the user.
 * 
 * To receive map activations, your app must register for the "windows.contact" extension category in its manifest. Under this extension, you must include a "LaunchAction" element with the "Verb" attribute equal to "map."
 * 
 * If multiple apps have registered for this contract, the user can choose one of them as their default for handling mapping.
 * 
 * Here is an example for manifest registration.
 * 
 * ```xml
 * <m2:Extension Category="windows.contact" xmlns:m2="http://schemas.microsoft.com/appx/2013/manifest">
 *   <m2:Contact>
 *     <m2:ContactLaunchActions>
 *       <m2:LaunchAction Verb="map" DesiredView="useHalf"/>
 *     </m2:ContactLaunchActions>
 *   </m2:Contact>
 * </m2:Extension>
 * ```
 * 
 * After you register in your manifest, your app can be activated for the contact map contract. When your app is activated, you can use the event information to identify the map activation and extract the parameters that help you complete the mapping scenario for the user.
 * 
 * For info about how to handle app activation through contact actions, see [Quickstart: Handling contact actions ](/previous-versions/windows/apps/dn518236(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactmapactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ContactMapActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactMapActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactMapActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the address of a contact for the mapping operation.
     * @remarks
     * For info about how to handle app activation through contact actions, see [Quickstart: Handling contact actions ](/previous-versions/windows/apps/dn518236(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactmapactivatedeventargs.address
     * @type {ContactAddress} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * Gets the contact for the mapping operation.
     * @remarks
     * Use the Contact property to collect additional info about the contact that is being mapped. The contact can have a name and thumbnail that can be used to represent it in your app’s UI. Or, the contact can have alternative addresses that can be used.
     * 
     * 
     * Here are possible [Contact](../windows.applicationmodel.contacts/contact.md) properties that can be populated during a map activation:
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
     * + [Addresses](../windows.applicationmodel.contacts/contact_addresses.md)
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactmapactivatedeventargs.contact
     * @type {Contact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * Gets the action to be performed.
     * @remarks
     * Use the Verb property to determine the action to perform when your app is activated with [ActivationKind.Contact](activationkind.md). For map activations, the Verb property is set to the value of [Windows.ApplicationModel.Contacts.ContactLaunchActionVerbs.Map](../windows.applicationmodel.contacts/contactlaunchactionverbs_map.md).
     * 
     * For info about how to handle app activation through contact actions, see [Quickstart: Handling contact actions ](/previous-versions/windows/apps/dn518236(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactmapactivatedeventargs.verb
     * @type {HSTRING} 
     */
    Verb {
        get => this.get_Verb()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactmapactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactmapactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object, which provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactmapactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ContactAddress} 
     */
    get_Address() {
        if (!this.HasProp("__IContactMapActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactMapActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactMapActivatedEventArgs := IContactMapActivatedEventArgs(outPtr)
        }

        return this.__IContactMapActivatedEventArgs.get_Address()
    }

    /**
     * 
     * @returns {Contact} 
     */
    get_Contact() {
        if (!this.HasProp("__IContactMapActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactMapActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactMapActivatedEventArgs := IContactMapActivatedEventArgs(outPtr)
        }

        return this.__IContactMapActivatedEventArgs.get_Contact()
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

;@endregion Instance Methods
}
