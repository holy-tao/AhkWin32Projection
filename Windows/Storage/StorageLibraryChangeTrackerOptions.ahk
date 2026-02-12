#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageLibraryChangeTrackerOptions.ahk
#Include ..\..\Guid.ahk

/**
 * Allows callers to call EnableWithOptions on the change tracker to choose to track all changes including last change id, or just the last change id.
 * @remarks
 * By default, enabling a change tracker on a specific library or folder will track all change details as well as keep track of the last change id. By setting StorageLibraryChangeTrackerOptions::TrackChangeDetails to false and using EnableWithOptions like the example below, the system will only keep track of the last change id which uses less system storage.
 * 
 * If your application doesn't need details about the changes, this is the recommended approach.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangetrackeroptions
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageLibraryChangeTrackerOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageLibraryChangeTrackerOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageLibraryChangeTrackerOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Used to determine if the system will track each individual change or just the last change id for a given change tracker.
     * @remarks
     * TrackChangeDetails is true by default for all change trackers. You can set this to false when passed to StorageLibraryChangeTracker::EnableWithOptions in order to save on system storage if the application is only concerned about the last change id, and not details about each individual change.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangetrackeroptions.trackchangedetails
     * @type {Boolean} 
     */
    TrackChangeDetails {
        get => this.get_TrackChangeDetails()
        set => this.put_TrackChangeDetails(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Constructor for the [StorageLibraryChangeTrackerOptions](storagelibrarychangetrackeroptions.md) to be used to setup the behavior of the change tracker for a StorageFolder or StorageLibrary.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageLibraryChangeTrackerOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TrackChangeDetails() {
        if (!this.HasProp("__IStorageLibraryChangeTrackerOptions")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChangeTrackerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChangeTrackerOptions := IStorageLibraryChangeTrackerOptions(outPtr)
        }

        return this.__IStorageLibraryChangeTrackerOptions.get_TrackChangeDetails()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_TrackChangeDetails(value) {
        if (!this.HasProp("__IStorageLibraryChangeTrackerOptions")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChangeTrackerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChangeTrackerOptions := IStorageLibraryChangeTrackerOptions(outPtr)
        }

        return this.__IStorageLibraryChangeTrackerOptions.put_TrackChangeDetails(value)
    }

;@endregion Instance Methods
}
