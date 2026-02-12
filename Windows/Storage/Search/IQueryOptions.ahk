#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IQueryOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQueryOptions
     * @type {Guid}
     */
    static IID => Guid("{1e5e46ee-0f45-4838-a8e9-d0479d446c30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FileTypeFilter", "get_FolderDepth", "put_FolderDepth", "get_ApplicationSearchFilter", "put_ApplicationSearchFilter", "get_UserSearchFilter", "put_UserSearchFilter", "get_Language", "put_Language", "get_IndexerOption", "put_IndexerOption", "get_SortOrder", "get_GroupPropertyName", "get_DateStackOption", "SaveToString", "LoadFromString", "SetThumbnailPrefetch", "SetPropertyPrefetch"]

    /**
     * @type {IVector<HSTRING>} 
     */
    FileTypeFilter {
        get => this.get_FileTypeFilter()
    }

    /**
     * @type {Integer} 
     */
    FolderDepth {
        get => this.get_FolderDepth()
        set => this.put_FolderDepth(value)
    }

    /**
     * @type {HSTRING} 
     */
    ApplicationSearchFilter {
        get => this.get_ApplicationSearchFilter()
        set => this.put_ApplicationSearchFilter(value)
    }

    /**
     * @type {HSTRING} 
     */
    UserSearchFilter {
        get => this.get_UserSearchFilter()
        set => this.put_UserSearchFilter(value)
    }

    /**
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * @type {Integer} 
     */
    IndexerOption {
        get => this.get_IndexerOption()
        set => this.put_IndexerOption(value)
    }

    /**
     * @type {IVector<SortEntry>} 
     */
    SortOrder {
        get => this.get_SortOrder()
    }

    /**
     * @type {HSTRING} 
     */
    GroupPropertyName {
        get => this.get_GroupPropertyName()
    }

    /**
     * @type {Integer} 
     */
    DateStackOption {
        get => this.get_DateStackOption()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_FileTypeFilter() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FolderDepth() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_FolderDepth(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ApplicationSearchFilter() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ApplicationSearchFilter(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserSearchFilter() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UserSearchFilter(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IndexerOption() {
        result := ComCall(15, this, "int*", &value := 0, "int")
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
    put_IndexerOption(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<SortEntry>} 
     */
    get_SortOrder() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetSortEntry(), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GroupPropertyName() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DateStackOption() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    SaveToString() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    LoadFromString(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} mode_ 
     * @param {Integer} requestedSize 
     * @param {Integer} options 
     * @returns {HRESULT} 
     */
    SetThumbnailPrefetch(mode_, requestedSize, options) {
        result := ComCall(22, this, "int", mode_, "uint", requestedSize, "uint", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @param {IIterable<HSTRING>} propertiesToRetrieve 
     * @returns {HRESULT} 
     */
    SetPropertyPrefetch(options, propertiesToRetrieve) {
        result := ComCall(23, this, "uint", options, "ptr", propertiesToRetrieve, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
