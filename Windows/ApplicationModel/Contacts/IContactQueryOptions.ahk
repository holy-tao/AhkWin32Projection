#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ContactQueryTextSearch.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactQueryOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactQueryOptions
     * @type {Guid}
     */
    static IID => Guid("{4408cc9e-7d7c-42f0-8ac7-f50733ecdbc1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextSearch", "get_ContactListIds", "get_IncludeContactsFromHiddenLists", "put_IncludeContactsFromHiddenLists", "get_DesiredFields", "put_DesiredFields", "get_DesiredOperations", "put_DesiredOperations", "get_AnnotationListIds"]

    /**
     * @type {ContactQueryTextSearch} 
     */
    TextSearch {
        get => this.get_TextSearch()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    ContactListIds {
        get => this.get_ContactListIds()
    }

    /**
     * @type {Boolean} 
     */
    IncludeContactsFromHiddenLists {
        get => this.get_IncludeContactsFromHiddenLists()
        set => this.put_IncludeContactsFromHiddenLists(value)
    }

    /**
     * @type {Integer} 
     */
    DesiredFields {
        get => this.get_DesiredFields()
        set => this.put_DesiredFields(value)
    }

    /**
     * @type {Integer} 
     */
    DesiredOperations {
        get => this.get_DesiredOperations()
        set => this.put_DesiredOperations(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    AnnotationListIds {
        get => this.get_AnnotationListIds()
    }

    /**
     * 
     * @returns {ContactQueryTextSearch} 
     */
    get_TextSearch() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactQueryTextSearch(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ContactListIds() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeContactsFromHiddenLists() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeContactsFromHiddenLists(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredFields() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredFields(value) {
        result := ComCall(11, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredOperations() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredOperations(value) {
        result := ComCall(13, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_AnnotationListIds() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
