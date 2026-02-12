#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserProfilePersonalizationSettings.ahk
#Include .\IUserProfilePersonalizationSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties and methods to manage the user's desktop wallpaper and lock screen background image.
 * @remarks
 * To get an instance of this class, call the [Current](userprofilepersonalizationsettings_current.md) method.
 * 
 * 
 * 
 * > [!NOTE]
 * > When you set an image more than once, the new image file must have a different name than the previously set image. If you set a new image using a file with the same name as the previous image, it will fail.
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userprofilepersonalizationsettings
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class UserProfilePersonalizationSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserProfilePersonalizationSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserProfilePersonalizationSettings.IID

    /**
     * Gets the current instance of [UserProfilePersonalizationSettings](userprofilepersonalizationsettings.md).
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userprofilepersonalizationsettings.current
     * @type {UserProfilePersonalizationSettings} 
     */
    static Current {
        get => UserProfilePersonalizationSettings.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {UserProfilePersonalizationSettings} 
     */
    static get_Current() {
        if (!UserProfilePersonalizationSettings.HasProp("__IUserProfilePersonalizationSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserProfilePersonalizationSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserProfilePersonalizationSettingsStatics.IID)
            UserProfilePersonalizationSettings.__IUserProfilePersonalizationSettingsStatics := IUserProfilePersonalizationSettingsStatics(factoryPtr)
        }

        return UserProfilePersonalizationSettings.__IUserProfilePersonalizationSettingsStatics.get_Current()
    }

    /**
     * Gets a value that indicates whether changing the desktop and lock screen images is supported on the current device.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userprofilepersonalizationsettings.issupported
     */
    static IsSupported() {
        if (!UserProfilePersonalizationSettings.HasProp("__IUserProfilePersonalizationSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserProfilePersonalizationSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserProfilePersonalizationSettingsStatics.IID)
            UserProfilePersonalizationSettings.__IUserProfilePersonalizationSettingsStatics := IUserProfilePersonalizationSettingsStatics(factoryPtr)
        }

        return UserProfilePersonalizationSettings.__IUserProfilePersonalizationSettingsStatics.IsSupported()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Attempts to set the specified image file as the lock screen background image.
     * @remarks
     * > [!NOTE]
     * > For the mobile device family, you can only set a lock screen image that is smaller than 2 megabyte (MB). Attempting to set a lock screen image that is larger fails, even though the async operation returns **true**.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > When you set an image more than once, the new image file must have a different name than the previously set image. If you set a new image using a file with the same name as the previous image, it will fail.
     * @param {StorageFile} imageFile The image to set as the lock screen background.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userprofilepersonalizationsettings.trysetlockscreenimageasync
     */
    TrySetLockScreenImageAsync(imageFile) {
        if (!this.HasProp("__IUserProfilePersonalizationSettings")) {
            if ((queryResult := this.QueryInterface(IUserProfilePersonalizationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserProfilePersonalizationSettings := IUserProfilePersonalizationSettings(outPtr)
        }

        return this.__IUserProfilePersonalizationSettings.TrySetLockScreenImageAsync(imageFile)
    }

    /**
     * Attempts to set the specified image file as the desktop wallpaper image.
     * @remarks
     * > [!NOTE]
     * > When you set an image more than once, the new image file must have a different name than the previously set image. If you set a new image using a file with the same name as the previous image, it will fail.
     * @param {StorageFile} imageFile The image to set as the desktop background.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userprofilepersonalizationsettings.trysetwallpaperimageasync
     */
    TrySetWallpaperImageAsync(imageFile) {
        if (!this.HasProp("__IUserProfilePersonalizationSettings")) {
            if ((queryResult := this.QueryInterface(IUserProfilePersonalizationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserProfilePersonalizationSettings := IUserProfilePersonalizationSettings(outPtr)
        }

        return this.__IUserProfilePersonalizationSettings.TrySetWallpaperImageAsync(imageFile)
    }

;@endregion Instance Methods
}
