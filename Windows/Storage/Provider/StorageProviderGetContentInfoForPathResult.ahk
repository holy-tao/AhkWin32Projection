#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderGetContentInfoForPathResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods to get additional information about a content URI path.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidergetcontentinfoforpathresult
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderGetContentInfoForPathResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderGetContentInfoForPathResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderGetContentInfoForPathResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The status of a storage provider associated with the StorageProviderGetContentInfoForPathResult.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidergetcontentinfoforpathresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * Gets or sets the content URI associated with the StorageProviderGetContentInfoForPathResult.
     * @remarks
     * The content URI is the URI based on the content URI ID.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidergetcontentinfoforpathresult.contenturi
     * @type {HSTRING} 
     */
    ContentUri {
        get => this.get_ContentUri()
        set => this.put_ContentUri(value)
    }

    /**
     * Gets or sets the content ID associated with the StorageProviderGetContentInfoForPathResult.
     * @remarks
     * The content ID is the path to the associated storage file object.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidergetcontentinfoforpathresult.contentid
     * @type {HSTRING} 
     */
    ContentId {
        get => this.get_ContentId()
        set => this.put_ContentId(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * A StorageProviderGetContentInfoForPathResult default constructor.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderGetContentInfoForPathResult")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IStorageProviderGetContentInfoForPathResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderGetContentInfoForPathResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderGetContentInfoForPathResult := IStorageProviderGetContentInfoForPathResult(outPtr)
        }

        return this.__IStorageProviderGetContentInfoForPathResult.get_Status()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IStorageProviderGetContentInfoForPathResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderGetContentInfoForPathResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderGetContentInfoForPathResult := IStorageProviderGetContentInfoForPathResult(outPtr)
        }

        return this.__IStorageProviderGetContentInfoForPathResult.put_Status(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentUri() {
        if (!this.HasProp("__IStorageProviderGetContentInfoForPathResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderGetContentInfoForPathResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderGetContentInfoForPathResult := IStorageProviderGetContentInfoForPathResult(outPtr)
        }

        return this.__IStorageProviderGetContentInfoForPathResult.get_ContentUri()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentUri(value) {
        if (!this.HasProp("__IStorageProviderGetContentInfoForPathResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderGetContentInfoForPathResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderGetContentInfoForPathResult := IStorageProviderGetContentInfoForPathResult(outPtr)
        }

        return this.__IStorageProviderGetContentInfoForPathResult.put_ContentUri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentId() {
        if (!this.HasProp("__IStorageProviderGetContentInfoForPathResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderGetContentInfoForPathResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderGetContentInfoForPathResult := IStorageProviderGetContentInfoForPathResult(outPtr)
        }

        return this.__IStorageProviderGetContentInfoForPathResult.get_ContentId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentId(value) {
        if (!this.HasProp("__IStorageProviderGetContentInfoForPathResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderGetContentInfoForPathResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderGetContentInfoForPathResult := IStorageProviderGetContentInfoForPathResult(outPtr)
        }

        return this.__IStorageProviderGetContentInfoForPathResult.put_ContentId(value)
    }

;@endregion Instance Methods
}
