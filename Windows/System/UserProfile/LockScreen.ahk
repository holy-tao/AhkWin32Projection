#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILockScreenStatics.ahk
#Include .\ILockScreenImageFeedStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties and methods to manage the full-screen image used as the lock screen background.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.lockscreen
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class LockScreen extends IInspectable {
;@region Static Properties
    /**
     * Gets the current lock screen image.
     * @remarks
     * This property retrieves only files. If the image was set through a stream, this call will return E_FILE_NOT_FOUND.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.lockscreen.originalimagefile
     * @type {Uri} 
     */
    static OriginalImageFile {
        get => LockScreen.get_OriginalImageFile()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Uri} 
     */
    static get_OriginalImageFile() {
        if (!LockScreen.HasProp("__ILockScreenStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.LockScreen")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILockScreenStatics.IID)
            LockScreen.__ILockScreenStatics := ILockScreenStatics(factoryPtr)
        }

        return LockScreen.__ILockScreenStatics.get_OriginalImageFile()
    }

    /**
     * Gets the current lock screen image as a data stream.
     * @remarks
     * This method can be called only by apps that have set the "Picture Library Access" capability in the package manifest or by the app that set this image on the lock screen.
     * @returns {IRandomAccessStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.lockscreen.getimagestream
     */
    static GetImageStream() {
        if (!LockScreen.HasProp("__ILockScreenStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.LockScreen")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILockScreenStatics.IID)
            LockScreen.__ILockScreenStatics := ILockScreenStatics(factoryPtr)
        }

        return LockScreen.__ILockScreenStatics.GetImageStream()
    }

    /**
     * Sets the lock screen image from a [StorageFile](../windows.storage/storagefile.md) object.
     * @remarks
     * The SetImageFileAsync API is not supported when called from x86 Console Apps on x64 machines.
     * @param {IStorageFile} value The [StorageFile](../windows.storage/storagefile.md) object that contains the new image for the lock screen.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.lockscreen.setimagefileasync
     */
    static SetImageFileAsync(value) {
        if (!LockScreen.HasProp("__ILockScreenStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.LockScreen")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILockScreenStatics.IID)
            LockScreen.__ILockScreenStatics := ILockScreenStatics(factoryPtr)
        }

        return LockScreen.__ILockScreenStatics.SetImageFileAsync(value)
    }

    /**
     * Sets the lock screen image from a data stream.
     * @param {IRandomAccessStream} value The stream that contains the image data.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.lockscreen.setimagestreamasync
     */
    static SetImageStreamAsync(value) {
        if (!LockScreen.HasProp("__ILockScreenStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.LockScreen")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILockScreenStatics.IID)
            LockScreen.__ILockScreenStatics := ILockScreenStatics(factoryPtr)
        }

        return LockScreen.__ILockScreenStatics.SetImageStreamAsync(value)
    }

    /**
     * Registers an RSS image feed to be used as a lock screen slideshow. (Windows 8.1 only)
     * @remarks
     * The slideshow can be stopped by calling [TryRemoveImageFeed](lockscreen_tryremoveimagefeed_1346761112.md).
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > Using a Really Simple Syndication (RSS) feed as a lock screen image source is not supported on Windows 10. The method returns an expected result, but the lock screen slide show does not work due to changes to the Really Simple Syndication (RSS) feature in Windows 10.
     * @param {Uri} syndicationFeedUri The Uniform Resource Identifier (URI) of the RSS image feed.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.lockscreen.requestsetimagefeedasync
     */
    static RequestSetImageFeedAsync(syndicationFeedUri) {
        if (!LockScreen.HasProp("__ILockScreenImageFeedStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.LockScreen")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILockScreenImageFeedStatics.IID)
            LockScreen.__ILockScreenImageFeedStatics := ILockScreenImageFeedStatics(factoryPtr)
        }

        return LockScreen.__ILockScreenImageFeedStatics.RequestSetImageFeedAsync(syndicationFeedUri)
    }

    /**
     * Unregisters the image feed being used in the lock screen slideshow, stopping the slideshow. (Windows 8.1 only)
     * @remarks
     * This image feed was registered through the [RequestSetImageFeedAsync](lockscreen_requestsetimagefeedasync_841630601.md) method.
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > Using a Really Simple Syndication (RSS) feed as a lock screen image source is not supported on Windows 10. The method returns an expected result, but the lock screen slide show does not work due to changes to the Really Simple Syndication (RSS) feature in Windows 10.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.lockscreen.tryremoveimagefeed
     */
    static TryRemoveImageFeed() {
        if (!LockScreen.HasProp("__ILockScreenImageFeedStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.LockScreen")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILockScreenImageFeedStatics.IID)
            LockScreen.__ILockScreenImageFeedStatics := ILockScreenImageFeedStatics(factoryPtr)
        }

        return LockScreen.__ILockScreenImageFeedStatics.TryRemoveImageFeed()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
