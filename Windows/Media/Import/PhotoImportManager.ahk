#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoImportManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides APIs for determining if photo import is supported on the current device, finding sources from which to import photos, and getting references to any pending photo import operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportmanager
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportManager extends IInspectable {
;@region Static Methods
    /**
     * Gets a value indicating if photo import is supported on the current device.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportmanager.issupportedasync
     */
    static IsSupportedAsync() {
        if (!PhotoImportManager.HasProp("__IPhotoImportManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Import.PhotoImportManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhotoImportManagerStatics.IID)
            PhotoImportManager.__IPhotoImportManagerStatics := IPhotoImportManagerStatics(factoryPtr)
        }

        return PhotoImportManager.__IPhotoImportManagerStatics.IsSupportedAsync()
    }

    /**
     * Finds all currently available sources from which photos can be imported.
     * @returns {IAsyncOperation<IVectorView<PhotoImportSource>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportmanager.findallsourcesasync
     */
    static FindAllSourcesAsync() {
        if (!PhotoImportManager.HasProp("__IPhotoImportManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Import.PhotoImportManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhotoImportManagerStatics.IID)
            PhotoImportManager.__IPhotoImportManagerStatics := IPhotoImportManagerStatics(factoryPtr)
        }

        return PhotoImportManager.__IPhotoImportManagerStatics.FindAllSourcesAsync()
    }

    /**
     * Gets the list of all pending photo import operations.
     * @returns {IVectorView<PhotoImportOperation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportmanager.getpendingoperations
     */
    static GetPendingOperations() {
        if (!PhotoImportManager.HasProp("__IPhotoImportManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Import.PhotoImportManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhotoImportManagerStatics.IID)
            PhotoImportManager.__IPhotoImportManagerStatics := IPhotoImportManagerStatics(factoryPtr)
        }

        return PhotoImportManager.__IPhotoImportManagerStatics.GetPendingOperations()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
