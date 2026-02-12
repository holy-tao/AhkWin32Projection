#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactAnnotation.ahk
#Include .\IContactAnnotation2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a way to tag existing user contacts with additional information, specifying that your app can perform some [SupportedOperations](contactannotation_supportedoperations.md) for this particular contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotation
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactAnnotation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactAnnotation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactAnnotation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID for this [ContactAnnotation](contactannotation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotation.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the ID for the parent [ContactAnnotationList](contactannotationlist.md) that this [ContactAnnotation](contactannotation.md) is contained within.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotation.annotationlistid
     * @type {HSTRING} 
     */
    AnnotationListId {
        get => this.get_AnnotationListId()
    }

    /**
     * Gets or set the ID for the [Contact](contact.md) to which this [ContactAnnotation](contactannotation.md) applies.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotation.contactid
     * @type {HSTRING} 
     */
    ContactId {
        get => this.get_ContactId()
        set => this.put_ContactId(value)
    }

    /**
     * Gets or sets an ID that can be used by a service provider to access the corresponding entity in their remote system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotation.remoteid
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * Gets or sets the group of [ContactAnnotationOperations](contactannotationoperations.md) supported by this [ContactAnnotation](contactannotation.md).
     * @remarks
     * [ContactAnnotationOperations](contactannotationoperations.md) values can be combined into a single value by using the OR operator to make a list of supported operations.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotation.supportedoperations
     * @type {Integer} 
     */
    SupportedOperations {
        get => this.get_SupportedOperations()
        set => this.put_SupportedOperations(value)
    }

    /**
     * Gets a Boolean value that indicates whether this [ContactAnnotation](contactannotation.md) has been disabled by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotation.isdisabled
     * @type {Boolean} 
     */
    IsDisabled {
        get => this.get_IsDisabled()
    }

    /**
     * Provides a place to store data to be used by the app when interacting with a service provider.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotation.providerproperties
     * @type {ValueSet} 
     */
    ProviderProperties {
        get => this.get_ProviderProperties()
    }

    /**
     * Gets or sets the [ContactList](contactlist.md) to which this [ContactAnnotation](contactannotation.md) applies.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotation.contactlistid
     * @type {HSTRING} 
     */
    ContactListId {
        get => this.get_ContactListId()
        set => this.put_ContactListId(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ContactAnnotation](contactannotation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactAnnotation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IContactAnnotation")) {
            if ((queryResult := this.QueryInterface(IContactAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotation := IContactAnnotation(outPtr)
        }

        return this.__IContactAnnotation.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AnnotationListId() {
        if (!this.HasProp("__IContactAnnotation")) {
            if ((queryResult := this.QueryInterface(IContactAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotation := IContactAnnotation(outPtr)
        }

        return this.__IContactAnnotation.get_AnnotationListId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactId() {
        if (!this.HasProp("__IContactAnnotation")) {
            if ((queryResult := this.QueryInterface(IContactAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotation := IContactAnnotation(outPtr)
        }

        return this.__IContactAnnotation.get_ContactId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContactId(value) {
        if (!this.HasProp("__IContactAnnotation")) {
            if ((queryResult := this.QueryInterface(IContactAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotation := IContactAnnotation(outPtr)
        }

        return this.__IContactAnnotation.put_ContactId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        if (!this.HasProp("__IContactAnnotation")) {
            if ((queryResult := this.QueryInterface(IContactAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotation := IContactAnnotation(outPtr)
        }

        return this.__IContactAnnotation.get_RemoteId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if (!this.HasProp("__IContactAnnotation")) {
            if ((queryResult := this.QueryInterface(IContactAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotation := IContactAnnotation(outPtr)
        }

        return this.__IContactAnnotation.put_RemoteId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedOperations() {
        if (!this.HasProp("__IContactAnnotation")) {
            if ((queryResult := this.QueryInterface(IContactAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotation := IContactAnnotation(outPtr)
        }

        return this.__IContactAnnotation.get_SupportedOperations()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SupportedOperations(value) {
        if (!this.HasProp("__IContactAnnotation")) {
            if ((queryResult := this.QueryInterface(IContactAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotation := IContactAnnotation(outPtr)
        }

        return this.__IContactAnnotation.put_SupportedOperations(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabled() {
        if (!this.HasProp("__IContactAnnotation")) {
            if ((queryResult := this.QueryInterface(IContactAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotation := IContactAnnotation(outPtr)
        }

        return this.__IContactAnnotation.get_IsDisabled()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_ProviderProperties() {
        if (!this.HasProp("__IContactAnnotation")) {
            if ((queryResult := this.QueryInterface(IContactAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotation := IContactAnnotation(outPtr)
        }

        return this.__IContactAnnotation.get_ProviderProperties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactListId() {
        if (!this.HasProp("__IContactAnnotation2")) {
            if ((queryResult := this.QueryInterface(IContactAnnotation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotation2 := IContactAnnotation2(outPtr)
        }

        return this.__IContactAnnotation2.get_ContactListId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContactListId(value) {
        if (!this.HasProp("__IContactAnnotation2")) {
            if ((queryResult := this.QueryInterface(IContactAnnotation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotation2 := IContactAnnotation2(outPtr)
        }

        return this.__IContactAnnotation2.put_ContactListId(value)
    }

;@endregion Instance Methods
}
