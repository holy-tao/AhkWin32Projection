#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderSearchQueryOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderSearchQueryOptions
     * @type {Guid}
     */
    static IID => Guid("{93d854eb-1007-563c-b213-cc44bd88fef2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserQuery", "get_Language", "get_SortOrder", "get_ProgrammaticQuery", "get_MaxResults", "get_FolderScope", "get_QueryId", "get_PropertiesToFetch"]

    /**
     * @type {HSTRING} 
     */
    UserQuery {
        get => this.get_UserQuery()
    }

    /**
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * @type {IVectorView<SortEntry>} 
     */
    SortOrder {
        get => this.get_SortOrder()
    }

    /**
     * @type {HSTRING} 
     */
    ProgrammaticQuery {
        get => this.get_ProgrammaticQuery()
    }

    /**
     * @type {Integer} 
     */
    MaxResults {
        get => this.get_MaxResults()
    }

    /**
     * @type {HSTRING} 
     */
    FolderScope {
        get => this.get_FolderScope()
    }

    /**
     * @type {HSTRING} 
     */
    QueryId {
        get => this.get_QueryId()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    PropertiesToFetch {
        get => this.get_PropertiesToFetch()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserQuery() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<SortEntry>} 
     */
    get_SortOrder() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetSortEntry(), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProgrammaticQuery() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxResults() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FolderScope() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryId() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_PropertiesToFetch() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
