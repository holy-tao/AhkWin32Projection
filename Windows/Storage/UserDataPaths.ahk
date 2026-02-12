#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataPaths.ahk
#Include .\IUserDataPathsStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Returns full paths for common user data folders. User data folders are based on the [KNOWNFOLDERID](/windows/desktop/shell/knownfolderid) naming pattern.
 * @remarks
 * This class contains methods and properties that return paths consistent with those that a Desktop app would use.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class UserDataPaths extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataPaths

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataPaths.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the paths to a user's various data folders. Use this method for multi-user machines.
     * @param {User} user_ The user to retreive the paths for.
     * @returns {UserDataPaths} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.getforuser
     */
    static GetForUser(user_) {
        if (!UserDataPaths.HasProp("__IUserDataPathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.UserDataPaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataPathsStatics.IID)
            UserDataPaths.__IUserDataPathsStatics := IUserDataPathsStatics(factoryPtr)
        }

        return UserDataPaths.__IUserDataPathsStatics.GetForUser(user_)
    }

    /**
     * Gets the paths to a user's various data folders. Use this method for single user machines.
     * @returns {UserDataPaths} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.getdefault
     */
    static GetDefault() {
        if (!UserDataPaths.HasProp("__IUserDataPathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.UserDataPaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataPathsStatics.IID)
            UserDataPaths.__IUserDataPathsStatics := IUserDataPathsStatics(factoryPtr)
        }

        return UserDataPaths.__IUserDataPathsStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the path to a user's Camera Roll folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.cameraroll
     * @type {HSTRING} 
     */
    CameraRoll {
        get => this.get_CameraRoll()
    }

    /**
     * Gets the path to a user's Cookies app data folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.cookies
     * @type {HSTRING} 
     */
    Cookies {
        get => this.get_Cookies()
    }

    /**
     * Gets the path to a user's Desktop folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.desktop
     * @type {HSTRING} 
     */
    Desktop {
        get => this.get_Desktop()
    }

    /**
     * Gets the path to a user's Documents folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.documents
     * @type {HSTRING} 
     */
    Documents {
        get => this.get_Documents()
    }

    /**
     * Gets the path to a user's Downloads folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.downloads
     * @type {HSTRING} 
     */
    Downloads {
        get => this.get_Downloads()
    }

    /**
     * Gets the path to a user's Favorites folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.favorites
     * @type {HSTRING} 
     */
    Favorites {
        get => this.get_Favorites()
    }

    /**
     * Gets the path to a user's History folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.history
     * @type {HSTRING} 
     */
    History {
        get => this.get_History()
    }

    /**
     * Gets the path to a user's Temporary Internet Files folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.internetcache
     * @type {HSTRING} 
     */
    InternetCache {
        get => this.get_InternetCache()
    }

    /**
     * Gets the path to a user's Local app data folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.localappdata
     * @type {HSTRING} 
     */
    LocalAppData {
        get => this.get_LocalAppData()
    }

    /**
     * Gets the path to a user's LocalLow app data folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.localappdatalow
     * @type {HSTRING} 
     */
    LocalAppDataLow {
        get => this.get_LocalAppDataLow()
    }

    /**
     * Gets the path to a user's Music folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.music
     * @type {HSTRING} 
     */
    Music {
        get => this.get_Music()
    }

    /**
     * Gets the path to a user's Pictures folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.pictures
     * @type {HSTRING} 
     */
    Pictures {
        get => this.get_Pictures()
    }

    /**
     * Gets the path to a user's profile on the machine.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.profile
     * @type {HSTRING} 
     */
    Profile {
        get => this.get_Profile()
    }

    /**
     * Gets the path to a user's Recent Items folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.recent
     * @type {HSTRING} 
     */
    Recent {
        get => this.get_Recent()
    }

    /**
     * Gets the path to a user's Roaming app data folder.
     * @remarks
     * The Roaming app data folder contains roaming app data for all of the apps associated with the user.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.roamingappdata
     * @type {HSTRING} 
     */
    RoamingAppData {
        get => this.get_RoamingAppData()
    }

    /**
     * Gets the path to a user's Saved Pictures folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.savedpictures
     * @type {HSTRING} 
     */
    SavedPictures {
        get => this.get_SavedPictures()
    }

    /**
     * Gets the path to a user's Screenshots folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.screenshots
     * @type {HSTRING} 
     */
    Screenshots {
        get => this.get_Screenshots()
    }

    /**
     * Gets the path to a user's Common Templates folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.templates
     * @type {HSTRING} 
     */
    Templates {
        get => this.get_Templates()
    }

    /**
     * Gets the path to a user's Videos folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.userdatapaths.videos
     * @type {HSTRING} 
     */
    Videos {
        get => this.get_Videos()
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
    get_CameraRoll() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_CameraRoll()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Cookies() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_Cookies()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Desktop() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_Desktop()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Documents() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_Documents()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Downloads() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_Downloads()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Favorites() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_Favorites()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_History() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_History()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InternetCache() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_InternetCache()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalAppData() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_LocalAppData()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalAppDataLow() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_LocalAppDataLow()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Music() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_Music()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Pictures() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_Pictures()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Profile() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_Profile()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Recent() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_Recent()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RoamingAppData() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_RoamingAppData()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SavedPictures() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_SavedPictures()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Screenshots() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_Screenshots()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Templates() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_Templates()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Videos() {
        if (!this.HasProp("__IUserDataPaths")) {
            if ((queryResult := this.QueryInterface(IUserDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataPaths := IUserDataPaths(outPtr)
        }

        return this.__IUserDataPaths.get_Videos()
    }

;@endregion Instance Methods
}
