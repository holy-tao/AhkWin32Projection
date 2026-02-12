#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactLaunchActionVerbsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data when an app is launched to perform an action to a contact.
 * @remarks
 * Use the ContactLaunchActionVerbs's properties to determine the value of the "Verb" property when your app is activated with [ActivationKind.Contact](../windows.applicationmodel.activation/activationkind.md). These properties represent all possible string values of the "Verb" property. For example, the [ContactMapActivatedEventArgs.Verb](../windows.applicationmodel.activation/contactmapactivatedeventargs_verb.md) property is set to the value of [Map](contactlaunchactionverbs_map.md).
 * 
 * For info about how to handle app activation through contact actions, see [Quickstart: Handling contact actions ](/previous-versions/windows/apps/dn518236(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlaunchactionverbs
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactLaunchActionVerbs extends IInspectable {
;@region Static Properties
    /**
     * Gets the call contact action.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlaunchactionverbs.call
     * @type {HSTRING} 
     */
    static Call {
        get => ContactLaunchActionVerbs.get_Call()
    }

    /**
     * Gets the send message to a contact action.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlaunchactionverbs.message
     * @type {HSTRING} 
     */
    static Message {
        get => ContactLaunchActionVerbs.get_Message()
    }

    /**
     * Gets the map contact action.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlaunchactionverbs.map
     * @type {HSTRING} 
     */
    static Map {
        get => ContactLaunchActionVerbs.get_Map()
    }

    /**
     * Gets the post to a contact action.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlaunchactionverbs.post
     * @type {HSTRING} 
     */
    static Post {
        get => ContactLaunchActionVerbs.get_Post()
    }

    /**
     * Gets the video call contact action.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlaunchactionverbs.videocall
     * @type {HSTRING} 
     */
    static VideoCall {
        get => ContactLaunchActionVerbs.get_VideoCall()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Call() {
        if (!ContactLaunchActionVerbs.HasProp("__IContactLaunchActionVerbsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactLaunchActionVerbs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactLaunchActionVerbsStatics.IID)
            ContactLaunchActionVerbs.__IContactLaunchActionVerbsStatics := IContactLaunchActionVerbsStatics(factoryPtr)
        }

        return ContactLaunchActionVerbs.__IContactLaunchActionVerbsStatics.get_Call()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Message() {
        if (!ContactLaunchActionVerbs.HasProp("__IContactLaunchActionVerbsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactLaunchActionVerbs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactLaunchActionVerbsStatics.IID)
            ContactLaunchActionVerbs.__IContactLaunchActionVerbsStatics := IContactLaunchActionVerbsStatics(factoryPtr)
        }

        return ContactLaunchActionVerbs.__IContactLaunchActionVerbsStatics.get_Message()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Map() {
        if (!ContactLaunchActionVerbs.HasProp("__IContactLaunchActionVerbsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactLaunchActionVerbs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactLaunchActionVerbsStatics.IID)
            ContactLaunchActionVerbs.__IContactLaunchActionVerbsStatics := IContactLaunchActionVerbsStatics(factoryPtr)
        }

        return ContactLaunchActionVerbs.__IContactLaunchActionVerbsStatics.get_Map()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Post() {
        if (!ContactLaunchActionVerbs.HasProp("__IContactLaunchActionVerbsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactLaunchActionVerbs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactLaunchActionVerbsStatics.IID)
            ContactLaunchActionVerbs.__IContactLaunchActionVerbsStatics := IContactLaunchActionVerbsStatics(factoryPtr)
        }

        return ContactLaunchActionVerbs.__IContactLaunchActionVerbsStatics.get_Post()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoCall() {
        if (!ContactLaunchActionVerbs.HasProp("__IContactLaunchActionVerbsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactLaunchActionVerbs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactLaunchActionVerbsStatics.IID)
            ContactLaunchActionVerbs.__IContactLaunchActionVerbsStatics := IContactLaunchActionVerbsStatics(factoryPtr)
        }

        return ContactLaunchActionVerbs.__IContactLaunchActionVerbsStatics.get_VideoCall()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
