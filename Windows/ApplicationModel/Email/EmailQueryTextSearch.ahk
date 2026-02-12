#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailQueryTextSearch.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a text search query in an email mailbox.
 * @remarks
 * The **TextSearch** property provides access to an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailquerytextsearch
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailQueryTextSearch extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailQueryTextSearch

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailQueryTextSearch.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the fields for an email text search query.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailquerytextsearch.fields
     * @type {Integer} 
     */
    Fields {
        get => this.get_Fields()
        set => this.put_Fields(value)
    }

    /**
     * Gets or sets the scope for an email text search query.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailquerytextsearch.searchscope
     * @type {Integer} 
     */
    SearchScope {
        get => this.get_SearchScope()
        set => this.put_SearchScope(value)
    }

    /**
     * Gets or sets the text string for an email text search query.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailquerytextsearch.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Fields() {
        if (!this.HasProp("__IEmailQueryTextSearch")) {
            if ((queryResult := this.QueryInterface(IEmailQueryTextSearch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryTextSearch := IEmailQueryTextSearch(outPtr)
        }

        return this.__IEmailQueryTextSearch.get_Fields()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Fields(value) {
        if (!this.HasProp("__IEmailQueryTextSearch")) {
            if ((queryResult := this.QueryInterface(IEmailQueryTextSearch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryTextSearch := IEmailQueryTextSearch(outPtr)
        }

        return this.__IEmailQueryTextSearch.put_Fields(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchScope() {
        if (!this.HasProp("__IEmailQueryTextSearch")) {
            if ((queryResult := this.QueryInterface(IEmailQueryTextSearch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryTextSearch := IEmailQueryTextSearch(outPtr)
        }

        return this.__IEmailQueryTextSearch.get_SearchScope()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SearchScope(value) {
        if (!this.HasProp("__IEmailQueryTextSearch")) {
            if ((queryResult := this.QueryInterface(IEmailQueryTextSearch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryTextSearch := IEmailQueryTextSearch(outPtr)
        }

        return this.__IEmailQueryTextSearch.put_SearchScope(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IEmailQueryTextSearch")) {
            if ((queryResult := this.QueryInterface(IEmailQueryTextSearch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryTextSearch := IEmailQueryTextSearch(outPtr)
        }

        return this.__IEmailQueryTextSearch.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__IEmailQueryTextSearch")) {
            if ((queryResult := this.QueryInterface(IEmailQueryTextSearch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailQueryTextSearch := IEmailQueryTextSearch(outPtr)
        }

        return this.__IEmailQueryTextSearch.put_Text(value)
    }

;@endregion Instance Methods
}
