#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderQueryResultSet.ahk
#Include .\IStorageProviderQueryResultSetFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * The class that the storage provider uses to return the set of query results.
 * @remarks
 * Any errors will be returned in the [Status](storageproviderqueryresultset_status.md) field.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderqueryresultset
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderQueryResultSet extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderQueryResultSet

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderQueryResultSet.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} results_length 
     * @param {Pointer<IStorageProviderQueryResult>} results 
     * @returns {StorageProviderQueryResultSet} 
     */
    static CreateInstance(results_length, results) {
        if (!StorageProviderQueryResultSet.HasProp("__IStorageProviderQueryResultSetFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderQueryResultSet")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageProviderQueryResultSetFactory.IID)
            StorageProviderQueryResultSet.__IStorageProviderQueryResultSetFactory := IStorageProviderQueryResultSetFactory(factoryPtr)
        }

        return StorageProviderQueryResultSet.__IStorageProviderQueryResultSetFactory.CreateInstance(results_length, results)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the unique identifier for the query result. This is a telemetry ID provided by the caller that allows the request to be tracked across the client and service for reliability purposes.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderqueryresultset.queryresultid
     * @type {HSTRING} 
     */
    QueryResultId {
        get => this.get_QueryResultId()
        set => this.put_QueryResultId(value)
    }

    /**
     * The status of the query operation.
     * @remarks
     * Any errors will be returned by this property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderqueryresultset.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns the query results as an array of [IStorageProviderQueryResult](istorageproviderqueryresult.md) objects.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [IStorageProviderQueryResult](istorageproviderqueryresult.md) objects that represent the query results.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderqueryresultset.getresults
     */
    GetResults(result_) {
        if (!this.HasProp("__IStorageProviderQueryResultSet")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResultSet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResultSet := IStorageProviderQueryResultSet(outPtr)
        }

        return this.__IStorageProviderQueryResultSet.GetResults(result_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryResultId() {
        if (!this.HasProp("__IStorageProviderQueryResultSet")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResultSet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResultSet := IStorageProviderQueryResultSet(outPtr)
        }

        return this.__IStorageProviderQueryResultSet.get_QueryResultId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_QueryResultId(value) {
        if (!this.HasProp("__IStorageProviderQueryResultSet")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResultSet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResultSet := IStorageProviderQueryResultSet(outPtr)
        }

        return this.__IStorageProviderQueryResultSet.put_QueryResultId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IStorageProviderQueryResultSet")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResultSet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResultSet := IStorageProviderQueryResultSet(outPtr)
        }

        return this.__IStorageProviderQueryResultSet.get_Status()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IStorageProviderQueryResultSet")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResultSet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResultSet := IStorageProviderQueryResultSet(outPtr)
        }

        return this.__IStorageProviderQueryResultSet.put_Status(value)
    }

;@endregion Instance Methods
}
