#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include .\IStorageLibraryChangeTrackerTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a file change within a [StorageFolder](/uwp/api/windows.storage.storagefolder) that triggers a background task to run.
 * @remarks
 * The background task must be declared in the manifest before the registration can be successful.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.storagelibrarychangetrackertrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class StorageLibraryChangeTrackerTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new **StorageLibraryChangeTrackerTrigger** instance.
     * @remarks
     * You can get the change tracker for a **StorageLibrary** with **StorageFolder.TryGetChangeTracker()**.
     * @param {StorageLibraryChangeTracker} tracker The change tracker for the **StorageLibrary** that you want to monitor for changes.
     * @returns {StorageLibraryChangeTrackerTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.storagelibrarychangetrackertrigger.#ctor
     */
    static Create(tracker) {
        if (!StorageLibraryChangeTrackerTrigger.HasProp("__IStorageLibraryChangeTrackerTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.StorageLibraryChangeTrackerTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageLibraryChangeTrackerTriggerFactory.IID)
            StorageLibraryChangeTrackerTrigger.__IStorageLibraryChangeTrackerTriggerFactory := IStorageLibraryChangeTrackerTriggerFactory(factoryPtr)
        }

        return StorageLibraryChangeTrackerTrigger.__IStorageLibraryChangeTrackerTriggerFactory.Create(tracker)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
