#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\PropertySet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The base interface for query results.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderqueryresult
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderQueryResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderQueryResult
     * @type {Guid}
     */
    static IID => Guid("{f1cd00ae-b4a9-5d20-a598-3eb4dd8ff8f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind", "put_Kind", "get_ResultId", "put_ResultId", "get_RemoteFileId", "put_RemoteFileId", "get_FilePath", "put_FilePath", "get_RequestedProperties"]

    /**
     * Gets or sets the kind of query result.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderqueryresult.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

    /**
     * Gets or sets a unique identifier for the query result that will be passed to the **ReportUsage** method.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderqueryresult.resultid
     * @type {HSTRING} 
     */
    ResultId {
        get => this.get_ResultId()
        set => this.put_ResultId(value)
    }

    /**
     * Gets or sets the remote file ID of the query result.
     * @remarks
     * This identifier is expected to be unique across all query results and items in the provider's sync root.
     * 
     * The cloud storage provider should set this property to the same value as the [System.StorageProviderFileIdentifier](/windows/desktop/properties/props-system-storageproviderfileidentifier) property for the item. This ensures a consistent file identifier across query results and items in the provider's sync root.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderqueryresult.remotefileid
     * @type {HSTRING} 
     */
    RemoteFileId {
        get => this.get_RemoteFileId()
        set => this.put_RemoteFileId(value)
    }

    /**
     * Gets or sets the local file path for the query result.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderqueryresult.filepath
     * @type {HSTRING} 
     */
    FilePath {
        get => this.get_FilePath()
        set => this.put_FilePath(value)
    }

    /**
     * Gets the additional properties that were requested for the query result.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderqueryresult.requestedproperties
     * @type {PropertySet} 
     */
    RequestedProperties {
        get => this.get_RequestedProperties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_Kind(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResultId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_ResultId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteFileId() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
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
    put_RemoteFileId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FilePath() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
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
    put_FilePath(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PropertySet} 
     */
    get_RequestedProperties() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertySet(value)
    }
}
