#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderItemProperty.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines a Cloud Storage Provider property for a storage item (like a file or folder).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovideritemproperty
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderItemProperty extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderItemProperty

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderItemProperty.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The Id for a storage item provided by the Cloud Storage Provider.
     * @remarks
     * This Id value must match the value provided for [StorageProviderItemPropertyDefinition.Id](storageprovideritempropertydefinition_id.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovideritemproperty.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Descriptive text for the state of a storage provider storage item.
     * @remarks
     * Values are intended to be used to describe the state of a storage item. For example, in addition to an icon, you might also want to create a string, such as "Large size alert" or "Shared with Bob"
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovideritemproperty.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * A reference to an icon resource for a Cloud Storage provider property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovideritemproperty.iconresource
     * @type {HSTRING} 
     */
    IconResource {
        get => this.get_IconResource()
        set => this.put_IconResource(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * A StorageProviderItemProperty default constructor.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderItemProperty")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IStorageProviderItemProperty")) {
            if ((queryResult := this.QueryInterface(IStorageProviderItemProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderItemProperty := IStorageProviderItemProperty(outPtr)
        }

        return this.__IStorageProviderItemProperty.put_Id(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IStorageProviderItemProperty")) {
            if ((queryResult := this.QueryInterface(IStorageProviderItemProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderItemProperty := IStorageProviderItemProperty(outPtr)
        }

        return this.__IStorageProviderItemProperty.get_Id()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IStorageProviderItemProperty")) {
            if ((queryResult := this.QueryInterface(IStorageProviderItemProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderItemProperty := IStorageProviderItemProperty(outPtr)
        }

        return this.__IStorageProviderItemProperty.put_Value(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IStorageProviderItemProperty")) {
            if ((queryResult := this.QueryInterface(IStorageProviderItemProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderItemProperty := IStorageProviderItemProperty(outPtr)
        }

        return this.__IStorageProviderItemProperty.get_Value()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_IconResource(value) {
        if (!this.HasProp("__IStorageProviderItemProperty")) {
            if ((queryResult := this.QueryInterface(IStorageProviderItemProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderItemProperty := IStorageProviderItemProperty(outPtr)
        }

        return this.__IStorageProviderItemProperty.put_IconResource(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IconResource() {
        if (!this.HasProp("__IStorageProviderItemProperty")) {
            if ((queryResult := this.QueryInterface(IStorageProviderItemProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderItemProperty := IStorageProviderItemProperty(outPtr)
        }

        return this.__IStorageProviderItemProperty.get_IconResource()
    }

;@endregion Instance Methods
}
