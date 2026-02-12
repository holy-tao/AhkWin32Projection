#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageLibraryLastChangeId.ahk
#Include .\IStorageLibraryLastChangeIdStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Allows you to track changes based on a unique value representing the last change processed by the indexing service for the given StorageFolder or StorageLibrary.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarylastchangeid
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageLibraryLastChangeId extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageLibraryLastChangeId

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageLibraryLastChangeId.IID

    /**
     * Returned when the USN journal overflows and the service cannot keep up with changes or there is another reason the change id cannot be computed.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarylastchangeid.unknown
     * @type {Integer} 
     */
    static Unknown {
        get => StorageLibraryLastChangeId.get_Unknown()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Unknown() {
        if (!StorageLibraryLastChangeId.HasProp("__IStorageLibraryLastChangeIdStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageLibraryLastChangeId")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageLibraryLastChangeIdStatics.IID)
            StorageLibraryLastChangeId.__IStorageLibraryLastChangeIdStatics := IStorageLibraryLastChangeIdStatics(factoryPtr)
        }

        return StorageLibraryLastChangeId.__IStorageLibraryLastChangeIdStatics.get_Unknown()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
