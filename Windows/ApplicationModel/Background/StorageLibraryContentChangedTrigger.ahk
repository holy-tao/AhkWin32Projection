#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageLibraryContentChangedTrigger.ahk
#Include .\IStorageLibraryContentChangedTriggerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates a trigger that will fire when a file is changed in a specified library.
 * @remarks
 * Once you create a trigger, register it with a background task
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.storagelibrarycontentchangedtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class StorageLibraryContentChangedTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageLibraryContentChangedTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageLibraryContentChangedTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a trigger that will fire when a file is changed in the specified library.
     * @remarks
     * For more details on how to use the trigger and a code sample, please see [File System Monitoring in Universal Windows Platform Apps](/archive/msdn-magazine/2016/december/universal-windows-platform-file-system-monitoring-in-universal-windows-platform-apps)
     * @param {StorageLibrary} storageLibrary_ The location that the trigger monitors such as the music library or documents library.
     * @returns {StorageLibraryContentChangedTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.storagelibrarycontentchangedtrigger.create
     */
    static Create(storageLibrary_) {
        if (!StorageLibraryContentChangedTrigger.HasProp("__IStorageLibraryContentChangedTriggerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.StorageLibraryContentChangedTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageLibraryContentChangedTriggerStatics.IID)
            StorageLibraryContentChangedTrigger.__IStorageLibraryContentChangedTriggerStatics := IStorageLibraryContentChangedTriggerStatics(factoryPtr)
        }

        return StorageLibraryContentChangedTrigger.__IStorageLibraryContentChangedTriggerStatics.Create(storageLibrary_)
    }

    /**
     * Creates a trigger that will fire when a file is changed in any of the specified libraries.
     * @param {IIterable<StorageLibrary>} storageLibraries The list of libraries that the trigger will monitor.
     * @returns {StorageLibraryContentChangedTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.storagelibrarycontentchangedtrigger.createfromlibraries
     */
    static CreateFromLibraries(storageLibraries) {
        if (!StorageLibraryContentChangedTrigger.HasProp("__IStorageLibraryContentChangedTriggerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.StorageLibraryContentChangedTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageLibraryContentChangedTriggerStatics.IID)
            StorageLibraryContentChangedTrigger.__IStorageLibraryContentChangedTriggerStatics := IStorageLibraryContentChangedTriggerStatics(factoryPtr)
        }

        return StorageLibraryContentChangedTrigger.__IStorageLibraryContentChangedTriggerStatics.CreateFromLibraries(storageLibraries)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
