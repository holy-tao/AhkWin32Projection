#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderItemPropertyDefinition.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines the properties of an item from a Cloud Storage Provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovideritempropertydefinition
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderItemPropertyDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderItemPropertyDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderItemPropertyDefinition.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * An Id for a storage item provided by the Cloud Storage Provider when the sync root is registered.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovideritempropertydefinition.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Gets or sets the display name of a Cloud Storage Provider state.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovideritempropertydefinition.displaynameresource
     * @type {HSTRING} 
     */
    DisplayNameResource {
        get => this.get_DisplayNameResource()
        set => this.put_DisplayNameResource(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * A StorageProviderItemPropertyDefinition default constructor.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderItemPropertyDefinition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IStorageProviderItemPropertyDefinition")) {
            if ((queryResult := this.QueryInterface(IStorageProviderItemPropertyDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderItemPropertyDefinition := IStorageProviderItemPropertyDefinition(outPtr)
        }

        return this.__IStorageProviderItemPropertyDefinition.get_Id()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IStorageProviderItemPropertyDefinition")) {
            if ((queryResult := this.QueryInterface(IStorageProviderItemPropertyDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderItemPropertyDefinition := IStorageProviderItemPropertyDefinition(outPtr)
        }

        return this.__IStorageProviderItemPropertyDefinition.put_Id(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayNameResource() {
        if (!this.HasProp("__IStorageProviderItemPropertyDefinition")) {
            if ((queryResult := this.QueryInterface(IStorageProviderItemPropertyDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderItemPropertyDefinition := IStorageProviderItemPropertyDefinition(outPtr)
        }

        return this.__IStorageProviderItemPropertyDefinition.get_DisplayNameResource()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayNameResource(value) {
        if (!this.HasProp("__IStorageProviderItemPropertyDefinition")) {
            if ((queryResult := this.QueryInterface(IStorageProviderItemPropertyDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderItemPropertyDefinition := IStorageProviderItemPropertyDefinition(outPtr)
        }

        return this.__IStorageProviderItemPropertyDefinition.put_DisplayNameResource(value)
    }

;@endregion Instance Methods
}
