#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\StorageFolder.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\QueryOptions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides methods to access to and manage query results.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragequeryresultbase
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IStorageQueryResultBase extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageQueryResultBase
     * @type {Guid}
     */
    static IID => Guid("{c297d70d-7353-47ab-ba58-8c61425dc54b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemCountAsync", "get_Folder", "add_ContentsChanged", "remove_ContentsChanged", "add_OptionsChanged", "remove_OptionsChanged", "FindStartIndexAsync", "GetCurrentQueryOptions", "ApplyNewQueryOptions"]

    /**
     * Gets the folder originally used to create a [StorageFileQueryResult](storagefilequeryresult.md), [StorageFolderQueryResult](storagefolderqueryresult.md), or [StorageItemQueryResult](storageitemqueryresult.md) object. This folder represents the scope of the query.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragequeryresultbase.folder
     * @type {StorageFolder} 
     */
    Folder {
        get => this.get_Folder()
    }

    /**
     * Retrieves the number of items that match the query that created a [StorageFileQueryResult](storagefilequeryresult.md), [StorageFolderQueryResult](storagefolderqueryresult.md), or [StorageItemQueryResult](storageitemqueryresult.md) object.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragequeryresultbase.getitemcountasync
     */
    GetItemCountAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_Folder() {
        result := ComCall(7, this, "ptr*", &container := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(container)
    }

    /**
     * 
     * @param {TypedEventHandler<IStorageQueryResultBase, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContentsChanged(handler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_ContentsChanged(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(9, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IStorageQueryResultBase, IInspectable>} changedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_OptionsChanged(changedHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(10, this, "ptr", changedHandler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_OptionsChanged(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(11, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the index of the file from the query results that most closely matches the specified property value. The property that is matched is determined by the first [SortEntry](sortentry.md) of the [QueryOptions.SortOrder](queryoptions_sortorder.md) list.
     * @remarks
     * You can use this index in conjunction with Semantic Zoom to determine where the page should be zoomed in after the user selects the Semantic Zoom control.
     * @param {IInspectable} value The property value to match when searching the query results.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragequeryresultbase.findstartindexasync
     */
    FindStartIndexAsync(value) {
        result := ComCall(12, this, "ptr", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * Retrieves the query options used to create a [StorageFileQueryResult](storagefilequeryresult.md), [StorageFolderQueryResult](storagefolderqueryresult.md), or [StorageItemQueryResult](storageitemqueryresult.md) object.
     * @returns {QueryOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragequeryresultbase.getcurrentqueryoptions
     */
    GetCurrentQueryOptions() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return QueryOptions(value)
    }

    /**
     * Applies new query options to the results retrieved by the [StorageFileQueryResult](storagefilequeryresult.md), [StorageFolderQueryResult](storagefolderqueryresult.md), or [StorageItemQueryResult](storageitemqueryresult.md) object.
     * @remarks
     * When this method returns, the contents of the query and the count of items reflect the new query options.
     * 
     * This method causes the [OptionsChanged](istoragequeryresultbase_optionschanged.md) event to fire.
     * @param {QueryOptions} newQueryOptions The new query options.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.istoragequeryresultbase.applynewqueryoptions
     */
    ApplyNewQueryOptions(newQueryOptions) {
        result := ComCall(14, this, "ptr", newQueryOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
