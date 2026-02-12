#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactQueryOptions.ahk
#Include .\IContactQueryOptionsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to specify the query options when searching for contacts.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactqueryoptions
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactQueryOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactQueryOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactQueryOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [ContactQueryOptions](contactqueryoptions.md) class.
     * @param {HSTRING} text The text to match in the search operation.
     * @returns {ContactQueryOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactqueryoptions.#ctor
     */
    static CreateWithText(text) {
        if (!ContactQueryOptions.HasProp("__IContactQueryOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactQueryOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactQueryOptionsFactory.IID)
            ContactQueryOptions.__IContactQueryOptionsFactory := IContactQueryOptionsFactory(factoryPtr)
        }

        return ContactQueryOptions.__IContactQueryOptionsFactory.CreateWithText(text)
    }

    /**
     * Initializes a new instance of the [ContactQueryOptions](contactqueryoptions.md) class.
     * @param {HSTRING} text The text to match in the search operation.
     * @param {Integer} fields Specifies which contact fields to search for a match.
     * @returns {ContactQueryOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactqueryoptions.#ctor
     */
    static CreateWithTextAndFields(text, fields) {
        if (!ContactQueryOptions.HasProp("__IContactQueryOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactQueryOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactQueryOptionsFactory.IID)
            ContactQueryOptions.__IContactQueryOptionsFactory := IContactQueryOptionsFactory(factoryPtr)
        }

        return ContactQueryOptions.__IContactQueryOptionsFactory.CreateWithTextAndFields(text, fields)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a [ContactQueryTextSearch](contactquerytextsearch.md) object that can be used for text searches.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactqueryoptions.textsearch
     * @type {ContactQueryTextSearch} 
     */
    TextSearch {
        get => this.get_TextSearch()
    }

    /**
     * Gets a list to which you can add [ContactList.Id](contactlist_id.md) values for which to search.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactqueryoptions.contactlistids
     * @type {IVector<HSTRING>} 
     */
    ContactListIds {
        get => this.get_ContactListIds()
    }

    /**
     * Gets or sets a Boolean value that indicates whether the query results should include contacts from lists that are not shown in the user interface.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactqueryoptions.includecontactsfromhiddenlists
     * @type {Boolean} 
     */
    IncludeContactsFromHiddenLists {
        get => this.get_IncludeContactsFromHiddenLists()
        set => this.put_IncludeContactsFromHiddenLists(value)
    }

    /**
     * Gets or sets the desired fields a contact must have to match the query.
     * @remarks
     * You can specify multiple fields by using the OR operator to combine values from the [ContactQueryDesiredFields](contactquerydesiredfields.md) enum. The query results will return contacts that contain one or more of the desired fields.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactqueryoptions.desiredfields
     * @type {Integer} 
     */
    DesiredFields {
        get => this.get_DesiredFields()
        set => this.put_DesiredFields(value)
    }

    /**
     * Gets or sets the desired annotation operations a contact must have to match the query.
     * @remarks
     * You can specify multiple operations by using the OR operator to combine values from the [ContactAnnotationOperations](contactannotationoperations.md) enum. The query results will return contacts that contain one or more of the desired operations.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactqueryoptions.desiredoperations
     * @type {Integer} 
     */
    DesiredOperations {
        get => this.get_DesiredOperations()
        set => this.put_DesiredOperations(value)
    }

    /**
     * Gets a list to which you can add [ContactAnnotationList.Id](contactannotationlist_id.md) values for which to search.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactqueryoptions.annotationlistids
     * @type {IVector<HSTRING>} 
     */
    AnnotationListIds {
        get => this.get_AnnotationListIds()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ContactQueryOptions](contactqueryoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactQueryOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {ContactQueryTextSearch} 
     */
    get_TextSearch() {
        if (!this.HasProp("__IContactQueryOptions")) {
            if ((queryResult := this.QueryInterface(IContactQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryOptions := IContactQueryOptions(outPtr)
        }

        return this.__IContactQueryOptions.get_TextSearch()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ContactListIds() {
        if (!this.HasProp("__IContactQueryOptions")) {
            if ((queryResult := this.QueryInterface(IContactQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryOptions := IContactQueryOptions(outPtr)
        }

        return this.__IContactQueryOptions.get_ContactListIds()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeContactsFromHiddenLists() {
        if (!this.HasProp("__IContactQueryOptions")) {
            if ((queryResult := this.QueryInterface(IContactQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryOptions := IContactQueryOptions(outPtr)
        }

        return this.__IContactQueryOptions.get_IncludeContactsFromHiddenLists()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeContactsFromHiddenLists(value) {
        if (!this.HasProp("__IContactQueryOptions")) {
            if ((queryResult := this.QueryInterface(IContactQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryOptions := IContactQueryOptions(outPtr)
        }

        return this.__IContactQueryOptions.put_IncludeContactsFromHiddenLists(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredFields() {
        if (!this.HasProp("__IContactQueryOptions")) {
            if ((queryResult := this.QueryInterface(IContactQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryOptions := IContactQueryOptions(outPtr)
        }

        return this.__IContactQueryOptions.get_DesiredFields()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredFields(value) {
        if (!this.HasProp("__IContactQueryOptions")) {
            if ((queryResult := this.QueryInterface(IContactQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryOptions := IContactQueryOptions(outPtr)
        }

        return this.__IContactQueryOptions.put_DesiredFields(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredOperations() {
        if (!this.HasProp("__IContactQueryOptions")) {
            if ((queryResult := this.QueryInterface(IContactQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryOptions := IContactQueryOptions(outPtr)
        }

        return this.__IContactQueryOptions.get_DesiredOperations()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredOperations(value) {
        if (!this.HasProp("__IContactQueryOptions")) {
            if ((queryResult := this.QueryInterface(IContactQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryOptions := IContactQueryOptions(outPtr)
        }

        return this.__IContactQueryOptions.put_DesiredOperations(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_AnnotationListIds() {
        if (!this.HasProp("__IContactQueryOptions")) {
            if ((queryResult := this.QueryInterface(IContactQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryOptions := IContactQueryOptions(outPtr)
        }

        return this.__IContactQueryOptions.get_AnnotationListIds()
    }

;@endregion Instance Methods
}
