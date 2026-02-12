#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderFileTypeInfo.ahk
#Include .\IStorageProviderFileTypeInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > Scenarios for this API are not supported.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderfiletypeinfo
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderFileTypeInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderFileTypeInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderFileTypeInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!NOTE]
     * > Scenarios for this API are not supported.
     * @param {HSTRING} fileExtension 
     * @param {HSTRING} iconResource 
     * @returns {StorageProviderFileTypeInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderfiletypeinfo.#ctor
     */
    static CreateInstance(fileExtension, iconResource) {
        if (!StorageProviderFileTypeInfo.HasProp("__IStorageProviderFileTypeInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderFileTypeInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageProviderFileTypeInfoFactory.IID)
            StorageProviderFileTypeInfo.__IStorageProviderFileTypeInfoFactory := IStorageProviderFileTypeInfoFactory(factoryPtr)
        }

        return StorageProviderFileTypeInfo.__IStorageProviderFileTypeInfoFactory.CreateInstance(fileExtension, iconResource)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!NOTE]
     * > Scenarios for this API are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderfiletypeinfo.fileextension
     * @type {HSTRING} 
     */
    FileExtension {
        get => this.get_FileExtension()
    }

    /**
     * > [!NOTE]
     * > Scenarios for this API are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderfiletypeinfo.iconresource
     * @type {HSTRING} 
     */
    IconResource {
        get => this.get_IconResource()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FileExtension() {
        if (!this.HasProp("__IStorageProviderFileTypeInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderFileTypeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderFileTypeInfo := IStorageProviderFileTypeInfo(outPtr)
        }

        return this.__IStorageProviderFileTypeInfo.get_FileExtension()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IconResource() {
        if (!this.HasProp("__IStorageProviderFileTypeInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderFileTypeInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderFileTypeInfo := IStorageProviderFileTypeInfo(outPtr)
        }

        return this.__IStorageProviderFileTypeInfo.get_IconResource()
    }

;@endregion Instance Methods
}
