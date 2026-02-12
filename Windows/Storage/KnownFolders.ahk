#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownFoldersStatics4.ahk
#Include .\IKnownFoldersStatics3.ahk
#Include .\IKnownFoldersSavedPicturesStatics.ahk
#Include .\IKnownFoldersStatics.ahk
#Include .\IKnownFoldersStatics2.ahk
#Include .\IKnownFoldersCameraRollStatics.ahk
#Include .\IKnownFoldersPlaylistsStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Provides access to common locations that contain user content. This includes content from a user's local libraries (such as Documents, Pictures, Music, and Videos), HomeGroup, removable devices, and media server devices.
 * @remarks
 * This class is static and cannot be instantiated. Access its properties directly, as shown in the following example.
 * 
 * + `StorageFolder storageFolder = KnownFolders.PicturesLibrary;`
 * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class KnownFolders extends IInspectable {
;@region Static Properties
    /**
     * Gets the Saved Pictures folder.
     * @remarks
     * To access the Saved Pictures folder, in the app manifest, specify the **Pictures Library** capability.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.savedpictures
     * @type {StorageFolder} 
     */
    static SavedPictures {
        get => KnownFolders.get_SavedPictures()
    }

    /**
     * Gets the Music library.
     * @remarks
     * To access the Music library, in the app manifest, specify the **Music Library** capability. For info about accessing the Music, Pictures, or Videos library in a Universal Windows app, see [Files and folders in the Music, Pictures, and Videos libraries](/windows/uwp/files/quickstart-managing-folders-in-the-music-pictures-and-videos-libraries).
     * 
     * > The Music Library typically has the following path.
     * 
     * + `%USERPROFILE%\Music`
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.musiclibrary
     * @type {StorageFolder} 
     */
    static MusicLibrary {
        get => KnownFolders.get_MusicLibrary()
    }

    /**
     * Gets the Pictures library.
     * @remarks
     * To access the Pictures library, in the app manifest, specify the **Pictures Library** capability.
     * 
     * > The Pictures Library typically has the following path.
     * 
     * + `%USERPROFILE%\Pictures`
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.pictureslibrary
     * @type {StorageFolder} 
     */
    static PicturesLibrary {
        get => KnownFolders.get_PicturesLibrary()
    }

    /**
     * Gets the Videos library.
     * @remarks
     * To access the Videos library, in the app manifest, specify the **Videos Library** capability.
     * 
     * The Videos Library typically has the following path.
     * 
     * + `%USERPROFILE%\Videos`
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.videoslibrary
     * @type {StorageFolder} 
     */
    static VideosLibrary {
        get => KnownFolders.get_VideosLibrary()
    }

    /**
     * Gets the Documents library. The Documents library is not intended for general use.
     * @remarks
     * > > [!IMPORTANT]
     * > The Documents library is not intended for general use. For more info, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * 
     * If your app has to create and update files that only your app uses, consider using the app's [LocalCache](applicationdata_localcachefolder.md) folder. For more information on which folders you should use for your app's data, see [ApplicationData](applicationdata.md) class.
     * 
     * Alternatively, let the user select the file location by using a file picker. For more info, see [Open files and folders with a picker](/windows/uwp/files/quickstart-using-file-and-folder-pickers) and in particular the [`SuggestedStartLocation` property](/uwp/api/windows.storage.pickers.fileopenpicker.suggestedstartlocation?view=winrt-19041) which can be set to [`DocumentsLibrary`](/uwp/api/windows.storage.pickers.pickerlocationid?view=winrt-19041). If the user selects the Documents Library from within the picker, you **do not** need to use this property nor do you need the **documentsLibrary** capability.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.documentslibrary
     * @type {StorageFolder} 
     */
    static DocumentsLibrary {
        get => KnownFolders.get_DocumentsLibrary()
    }

    /**
     * Gets the HomeGroup folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.homegroup
     * @type {StorageFolder} 
     */
    static HomeGroup {
        get => KnownFolders.get_HomeGroup()
    }

    /**
     * Gets the removable devices folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.removabledevices
     * @type {StorageFolder} 
     */
    static RemovableDevices {
        get => KnownFolders.get_RemovableDevices()
    }

    /**
     * Gets the folder of media server (Digital Living Network Alliance (DLNA)) devices.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.mediaserverdevices
     * @type {StorageFolder} 
     */
    static MediaServerDevices {
        get => KnownFolders.get_MediaServerDevices()
    }

    /**
     * Gets the Objects 3D folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.objects3d
     * @type {StorageFolder} 
     */
    static Objects3D {
        get => KnownFolders.get_Objects3D()
    }

    /**
     * Gets the App Captures folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.appcaptures
     * @type {StorageFolder} 
     */
    static AppCaptures {
        get => KnownFolders.get_AppCaptures()
    }

    /**
     * Gets the recorded calls folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.recordedcalls
     * @type {StorageFolder} 
     */
    static RecordedCalls {
        get => KnownFolders.get_RecordedCalls()
    }

    /**
     * Gets the Camera Roll folder.
     * @remarks
     * To access the Camera Roll folder, in the app manifest, specify the **Pictures Library** capability.
     * 
     * UWP app only. If the Camera Roll folder doesn't exist, reading the value of this property creates it. It does not raise an exception. The Camera Roll folder is typically a subfolder in the Pictures library that has the following path.
     * 
     * + `%USERPROFILE%\Pictures\Camera Roll`
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.cameraroll
     * @type {StorageFolder} 
     */
    static CameraRoll {
        get => KnownFolders.get_CameraRoll()
    }

    /**
     * Gets the play lists folder.
     * @remarks
     * To access the play lists folder, in the app manifest, specify the **Music Library** capability.
     * 
     * > The play lists folder is typically a subfolder in the Music library that has the following path.
     * 
     * + `%USERPROFILE%\Music\Playlists`
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.playlists
     * @type {StorageFolder} 
     */
    static Playlists {
        get => KnownFolders.get_Playlists()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Requests access for the capability controlling access to the folder.
     * @remarks
     * If the folder is controlled by a capability and is further controlled by privacy consent, this may present a prompt to the user for consent. Therefore, it should be called on the UI thread. (If not, and a prompt is required, then the result is a status indicating the prompt is needed and otherwise denied access.
     * @param {Integer} folderId The Id of the folder to be returned.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.requestaccessasync
     */
    static RequestAccessAsync(folderId) {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics4.IID)
            KnownFolders.__IKnownFoldersStatics4 := IKnownFoldersStatics4(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics4.RequestAccessAsync(folderId)
    }

    /**
     * Requests access for the user and folderId.
     * @remarks
     * This method is Multi-User Aware (MUA).
     * 
     * Providing a null User will result in an Invalid argument exception as MUA apps should always provide a valid non-null User.
     * @param {User} user_ The user property.
     * @param {Integer} folderId The Id of the folder to be returned.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.requestaccessforuserasync
     */
    static RequestAccessForUserAsync(user_, folderId) {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics4.IID)
            KnownFolders.__IKnownFoldersStatics4 := IKnownFoldersStatics4(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics4.RequestAccessForUserAsync(user_, folderId)
    }

    /**
     * Retrieves the folder for the folderId specified.
     * @remarks
     * This is a Single User Aware (SUA) method.
     * 
     * If the app does not have access because it isn’t manifested with the required capability, the user denied access from a prompt or the settings page, or a system administrator has disabled access, then this call will fail with access denied.
     * @param {Integer} folderId The Id of the folder to be returned.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.getfolderasync
     */
    static GetFolderAsync(folderId) {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics4.IID)
            KnownFolders.__IKnownFoldersStatics4 := IKnownFoldersStatics4(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics4.GetFolderAsync(folderId)
    }

    /**
     * Static method that returns a specified known folder for a [User](../windows.system/user.md).
     * @param {User} user_ The [User](../windows.system/user.md) for which the folder is returned.
     * @param {Integer} folderId The ID of the folder to be returned.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfolders.getfolderforuserasync
     */
    static GetFolderForUserAsync(user_, folderId) {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics3.IID)
            KnownFolders.__IKnownFoldersStatics3 := IKnownFoldersStatics3(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics3.GetFolderForUserAsync(user_, folderId)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_SavedPictures() {
        if (!KnownFolders.HasProp("__IKnownFoldersSavedPicturesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersSavedPicturesStatics.IID)
            KnownFolders.__IKnownFoldersSavedPicturesStatics := IKnownFoldersSavedPicturesStatics(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersSavedPicturesStatics.get_SavedPictures()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_MusicLibrary() {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics.IID)
            KnownFolders.__IKnownFoldersStatics := IKnownFoldersStatics(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics.get_MusicLibrary()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_PicturesLibrary() {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics.IID)
            KnownFolders.__IKnownFoldersStatics := IKnownFoldersStatics(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics.get_PicturesLibrary()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_VideosLibrary() {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics.IID)
            KnownFolders.__IKnownFoldersStatics := IKnownFoldersStatics(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics.get_VideosLibrary()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_DocumentsLibrary() {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics.IID)
            KnownFolders.__IKnownFoldersStatics := IKnownFoldersStatics(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics.get_DocumentsLibrary()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_HomeGroup() {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics.IID)
            KnownFolders.__IKnownFoldersStatics := IKnownFoldersStatics(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics.get_HomeGroup()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_RemovableDevices() {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics.IID)
            KnownFolders.__IKnownFoldersStatics := IKnownFoldersStatics(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics.get_RemovableDevices()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_MediaServerDevices() {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics.IID)
            KnownFolders.__IKnownFoldersStatics := IKnownFoldersStatics(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics.get_MediaServerDevices()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_Objects3D() {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics2.IID)
            KnownFolders.__IKnownFoldersStatics2 := IKnownFoldersStatics2(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics2.get_Objects3D()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_AppCaptures() {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics2.IID)
            KnownFolders.__IKnownFoldersStatics2 := IKnownFoldersStatics2(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics2.get_AppCaptures()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_RecordedCalls() {
        if (!KnownFolders.HasProp("__IKnownFoldersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersStatics2.IID)
            KnownFolders.__IKnownFoldersStatics2 := IKnownFoldersStatics2(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersStatics2.get_RecordedCalls()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_CameraRoll() {
        if (!KnownFolders.HasProp("__IKnownFoldersCameraRollStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersCameraRollStatics.IID)
            KnownFolders.__IKnownFoldersCameraRollStatics := IKnownFoldersCameraRollStatics(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersCameraRollStatics.get_CameraRoll()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    static get_Playlists() {
        if (!KnownFolders.HasProp("__IKnownFoldersPlaylistsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.KnownFolders")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownFoldersPlaylistsStatics.IID)
            KnownFolders.__IKnownFoldersPlaylistsStatics := IKnownFoldersPlaylistsStatics(factoryPtr)
        }

        return KnownFolders.__IKnownFoldersPlaylistsStatics.get_Playlists()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
