#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailQueryOptions.ahk
#Include .\IEmailQueryOptionsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the options selected for an email mailbox query.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailqueryoptions
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailQueryOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailQueryOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailQueryOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Instantiates a new instance of the  class.
     * @param {HSTRING} text The text for which to search.
     * @returns {EmailQueryOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailqueryoptions.#ctor
     */
    static CreateWithText(text) {
        if (!EmailQueryOptions.HasProp("__IEmailQueryOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailQueryOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEmailQueryOptionsFactory.IID)
            EmailQueryOptions.__IEmailQueryOptionsFactory := IEmailQueryOptionsFactory(factoryPtr)
        }

        return EmailQueryOptions.__IEmailQueryOptionsFactory.CreateWithText(text)
    }

    /**
     * Instantiates a new instance of the  class.
     * @param {HSTRING} text The text for which to search.
     * @param {Integer} fields The fields against which to search.
     * @returns {EmailQueryOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailqueryoptions.#ctor
     */
    static CreateWithTextAndFields(text, fields) {
        if (!EmailQueryOptions.HasProp("__IEmailQueryOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailQueryOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEmailQueryOptionsFactory.IID)
            EmailQueryOptions.__IEmailQueryOptionsFactory := IEmailQueryOptionsFactory(factoryPtr)
        }

        return EmailQueryOptions.__IEmailQueryOptionsFactory.CreateWithTextAndFields(text, fields)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the text to search for.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailqueryoptions.textsearch
     * @type {EmailQueryTextSearch} 
     */
    TextSearch {
        get => this.get_TextSearch()
    }

    /**
     * Gets or sets the direction of the sort for the query results.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailqueryoptions.sortdirection
     * @type {Integer} 
     */
    SortDirection {
        get => this.get_SortDirection()
        set => this.put_SortDirection(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether the query results should be sorted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailqueryoptions.sortproperty
     * @type {Integer} 
     */
    SortProperty {
        get => this.get_SortProperty()
        set => this.put_SortProperty(value)
    }

    /**
     * Gets or sets the kind of emails for which to query.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailqueryoptions.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

    /**
     * Gets the identifiers for the folders in which to search.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailqueryoptions.folderids
     * @type {IVector<HSTRING>} 
     */
    FolderIds {
        get => this.get_FolderIds()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Instantiates a new instance of the  class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailQueryOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {EmailQueryTextSearch} 
     */
    get_TextSearch() {
        if (!this.HasProp("__IEmailQueryOptions")) {
            if ((queryResult := this.QueryInterface(IEmailQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryOptions := IEmailQueryOptions(outPtr)
        }

        return this.__IEmailQueryOptions.get_TextSearch()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SortDirection() {
        if (!this.HasProp("__IEmailQueryOptions")) {
            if ((queryResult := this.QueryInterface(IEmailQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryOptions := IEmailQueryOptions(outPtr)
        }

        return this.__IEmailQueryOptions.get_SortDirection()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SortDirection(value) {
        if (!this.HasProp("__IEmailQueryOptions")) {
            if ((queryResult := this.QueryInterface(IEmailQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryOptions := IEmailQueryOptions(outPtr)
        }

        return this.__IEmailQueryOptions.put_SortDirection(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SortProperty() {
        if (!this.HasProp("__IEmailQueryOptions")) {
            if ((queryResult := this.QueryInterface(IEmailQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryOptions := IEmailQueryOptions(outPtr)
        }

        return this.__IEmailQueryOptions.get_SortProperty()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SortProperty(value) {
        if (!this.HasProp("__IEmailQueryOptions")) {
            if ((queryResult := this.QueryInterface(IEmailQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryOptions := IEmailQueryOptions(outPtr)
        }

        return this.__IEmailQueryOptions.put_SortProperty(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IEmailQueryOptions")) {
            if ((queryResult := this.QueryInterface(IEmailQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryOptions := IEmailQueryOptions(outPtr)
        }

        return this.__IEmailQueryOptions.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IEmailQueryOptions")) {
            if ((queryResult := this.QueryInterface(IEmailQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryOptions := IEmailQueryOptions(outPtr)
        }

        return this.__IEmailQueryOptions.put_Kind(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_FolderIds() {
        if (!this.HasProp("__IEmailQueryOptions")) {
            if ((queryResult := this.QueryInterface(IEmailQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryOptions := IEmailQueryOptions(outPtr)
        }

        return this.__IEmailQueryOptions.get_FolderIds()
    }

;@endregion Instance Methods
}
