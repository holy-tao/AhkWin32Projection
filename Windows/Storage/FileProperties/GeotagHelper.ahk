#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeotagHelperStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods for setting and retrieving geographic metadata for a file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.geotaghelper
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class GeotagHelper extends IInspectable {
;@region Static Methods
    /**
     * Asynchronously retrieves a [Geopoint](../windows.devices.geolocation/geopoint.md) representing the geographic metadata of a file, if present.
     * @param {IStorageFile} file_ The file from which the geographic metadata is retrieved.
     * @returns {IAsyncOperation<Geopoint>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.geotaghelper.getgeotagasync
     */
    static GetGeotagAsync(file_) {
        if (!GeotagHelper.HasProp("__IGeotagHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileProperties.GeotagHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeotagHelperStatics.IID)
            GeotagHelper.__IGeotagHelperStatics := IGeotagHelperStatics(factoryPtr)
        }

        return GeotagHelper.__IGeotagHelperStatics.GetGeotagAsync(file_)
    }

    /**
     * Asynchronously sets the geographic metadata of a file to the device's current location using the provided Geolocator object.
     * @param {IStorageFile} file_ The file into which the geographic metadata is set.
     * @param {Geolocator} geolocator_ The Geolocator object that will be used to determine the device's current location.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.geotaghelper.setgeotagfromgeolocatorasync
     */
    static SetGeotagFromGeolocatorAsync(file_, geolocator_) {
        if (!GeotagHelper.HasProp("__IGeotagHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileProperties.GeotagHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeotagHelperStatics.IID)
            GeotagHelper.__IGeotagHelperStatics := IGeotagHelperStatics(factoryPtr)
        }

        return GeotagHelper.__IGeotagHelperStatics.SetGeotagFromGeolocatorAsync(file_, geolocator_)
    }

    /**
     * Asynchronously sets the geographic metadata of a file from the provided [Geopoint](../windows.devices.geolocation/geopoint.md).
     * @param {IStorageFile} file_ The file into which the geographic metadata is set.
     * @param {Geopoint} geopoint_ The [Geopoint](../windows.devices.geolocation/geopoint.md) representing the geographic metadata to be set.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.geotaghelper.setgeotagasync
     */
    static SetGeotagAsync(file_, geopoint_) {
        if (!GeotagHelper.HasProp("__IGeotagHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileProperties.GeotagHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeotagHelperStatics.IID)
            GeotagHelper.__IGeotagHelperStatics := IGeotagHelperStatics(factoryPtr)
        }

        return GeotagHelper.__IGeotagHelperStatics.SetGeotagAsync(file_, geopoint_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
