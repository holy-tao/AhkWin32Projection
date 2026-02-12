#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderGetPathForContentUriResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods to get additional information about a content URI result.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidergetpathforcontenturiresult
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderGetPathForContentUriResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderGetPathForContentUriResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderGetPathForContentUriResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The status of a storage provider associated with the StorageProviderGetPathForContentUriResult.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidergetpathforcontenturiresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * Gets the path of the StorageProviderGetPathForContentUriResult object.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidergetpathforcontenturiresult.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * A StorageProviderGetPathForContentUriResult default constructor.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderGetPathForContentUriResult")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IStorageProviderGetPathForContentUriResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderGetPathForContentUriResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderGetPathForContentUriResult := IStorageProviderGetPathForContentUriResult(outPtr)
        }

        return this.__IStorageProviderGetPathForContentUriResult.get_Status()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IStorageProviderGetPathForContentUriResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderGetPathForContentUriResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderGetPathForContentUriResult := IStorageProviderGetPathForContentUriResult(outPtr)
        }

        return this.__IStorageProviderGetPathForContentUriResult.put_Status(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        if (!this.HasProp("__IStorageProviderGetPathForContentUriResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderGetPathForContentUriResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderGetPathForContentUriResult := IStorageProviderGetPathForContentUriResult(outPtr)
        }

        return this.__IStorageProviderGetPathForContentUriResult.get_Path()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Path(value) {
        if (!this.HasProp("__IStorageProviderGetPathForContentUriResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderGetPathForContentUriResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderGetPathForContentUriResult := IStorageProviderGetPathForContentUriResult(outPtr)
        }

        return this.__IStorageProviderGetPathForContentUriResult.put_Path(value)
    }

;@endregion Instance Methods
}
