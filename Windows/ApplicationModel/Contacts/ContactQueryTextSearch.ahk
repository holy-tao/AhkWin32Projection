#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactQueryTextSearch.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies parameters to use in a text search of [Contact](contact.md) objects.
 * @remarks
 * Use [TextSearch](contactqueryoptions_textsearch.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactquerytextsearch
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactQueryTextSearch extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactQueryTextSearch

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactQueryTextSearch.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets which contact fields to search for a text match.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactquerytextsearch.fields
     * @type {Integer} 
     */
    Fields {
        get => this.get_Fields()
        set => this.put_Fields(value)
    }

    /**
     * Gets or sets the text for which to search.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactquerytextsearch.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets a value that specifies either a local or server search.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactquerytextsearch.searchscope
     * @type {Integer} 
     */
    SearchScope {
        get => this.get_SearchScope()
        set => this.put_SearchScope(value)
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
        if (!this.HasProp("__IContactQueryTextSearch")) {
            if ((queryResult := this.QueryInterface(IContactQueryTextSearch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryTextSearch := IContactQueryTextSearch(outPtr)
        }

        return this.__IContactQueryTextSearch.get_Fields()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Fields(value) {
        if (!this.HasProp("__IContactQueryTextSearch")) {
            if ((queryResult := this.QueryInterface(IContactQueryTextSearch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryTextSearch := IContactQueryTextSearch(outPtr)
        }

        return this.__IContactQueryTextSearch.put_Fields(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IContactQueryTextSearch")) {
            if ((queryResult := this.QueryInterface(IContactQueryTextSearch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryTextSearch := IContactQueryTextSearch(outPtr)
        }

        return this.__IContactQueryTextSearch.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__IContactQueryTextSearch")) {
            if ((queryResult := this.QueryInterface(IContactQueryTextSearch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryTextSearch := IContactQueryTextSearch(outPtr)
        }

        return this.__IContactQueryTextSearch.put_Text(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchScope() {
        if (!this.HasProp("__IContactQueryTextSearch")) {
            if ((queryResult := this.QueryInterface(IContactQueryTextSearch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryTextSearch := IContactQueryTextSearch(outPtr)
        }

        return this.__IContactQueryTextSearch.get_SearchScope()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SearchScope(value) {
        if (!this.HasProp("__IContactQueryTextSearch")) {
            if ((queryResult := this.QueryInterface(IContactQueryTextSearch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactQueryTextSearch := IContactQueryTextSearch(outPtr)
        }

        return this.__IContactQueryTextSearch.put_SearchScope(value)
    }

;@endregion Instance Methods
}
