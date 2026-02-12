#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderQueryResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * The class that the cloud storage provider will use to return an individual suggestion result.
  * 
  * > [!IMPORTANT]
  * > The **Windows.Storage.Provider.StorageProviderSuggestionResult** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * This object will implement marshal by value to optimize RPC calls.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersuggestionresult
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderSuggestionResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderQueryResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderQueryResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the kind of the suggestion result.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.StorageProviderSuggestionResult** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersuggestionresult.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

    /**
     * Gets or sets a unique identifier for the suggestions query result that will be passed to the [ReportUsage](istorageprovidersuggestionshandler_reportusage_1684874227.md) method.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.StorageProviderSuggestionResult** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersuggestionresult.resultid
     * @type {HSTRING} 
     */
    ResultId {
        get => this.get_ResultId()
        set => this.put_ResultId(value)
    }

    /**
     * Gets or sets the remote file ID of the suggestion result.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.StorageProviderSuggestionResult** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * This identifier is expected to be unique across all query results and items in the provider's sync root.
     * 
     * The cloud storage provider should set this property to the same value as the [System.StorageProviderFileIdentifier](/windows/desktop/properties/props-system-storageproviderfileidentifier) property for the item. This ensures a consistent file identifier across query results and items in the provider's sync root.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersuggestionresult.remotefileid
     * @type {HSTRING} 
     */
    RemoteFileId {
        get => this.get_RemoteFileId()
        set => this.put_RemoteFileId(value)
    }

    /**
     * Gets or sets the local file path for the suggestion result.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.StorageProviderSuggestionResult** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * When available, the cloud storage provider should set this property to the absolute file path where the item is stored in the user's sync root. For example, "C:\Users\Admin\ContosoDrive\foo.txt".
     * 
     * This property may be omitted if the suggestion does not have a representation on disk. For example, a file from a different user's cloud storage accessible through a cloud provider service. To support this case, Windows will request the remote URL of the file, represented by the **System.ContentUri** property in [PropertiesToFetch](storageprovidersuggestionsqueryoptions_propertiestofetch.md), which should be returned by the cloud storage provider in the result's [RequestedProperties](storageprovidersuggestionresult_requestedproperties.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersuggestionresult.filepath
     * @type {HSTRING} 
     */
    FilePath {
        get => this.get_FilePath()
        set => this.put_FilePath(value)
    }

    /**
     * Gets the additional properties that were requested in [StorageProviderSuggestionsQueryOptions.PropertiesToFetch](storageprovidersuggestionsqueryoptions_propertiestofetch.md) for the suggestion result.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.StorageProviderSuggestionResult** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * The set of requested properties may vary depending on the [SuggestionKind](storageprovidersuggestionsqueryoptions_suggestionskind.md) assigned to the query, or the OS version. Unsupported or unrecognized properties should be ignored by the provider and omitted from the property set.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersuggestionresult.requestedproperties
     * @type {PropertySet} 
     */
    RequestedProperties {
        get => this.get_RequestedProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [StorageProviderSuggestionResult](storageprovidersuggestionresult.md) class.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.StorageProviderSuggestionResult** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderSuggestionResult")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.put_Kind(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResultId() {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.get_ResultId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ResultId(value) {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.put_ResultId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteFileId() {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.get_RemoteFileId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteFileId(value) {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.put_RemoteFileId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FilePath() {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.get_FilePath()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FilePath(value) {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.put_FilePath(value)
    }

    /**
     * 
     * @returns {PropertySet} 
     */
    get_RequestedProperties() {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.get_RequestedProperties()
    }

;@endregion Instance Methods
}
