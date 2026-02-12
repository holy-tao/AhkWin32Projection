#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppDataPaths.ahk
#Include .\IAppDataPathsStatics.ahk
#Include ..\..\Guid.ahk

/**
 * AppDataPaths returns paths to commonly used application folders based on the [KNOWNFOLDERID](/windows/desktop/shell/knownfolderid) naming pattern.
 * @remarks
 * This class returns paths that are always isolated per the caller’s context. For example, this will match expectations of cross-platform app developers who might have used “private” versions of documents in the past. There is no legacy COM interop interface for this type.
 * 
 * Requesting app-specific folder locations from an app without package identity (for example, [LocalAppData](appdatapaths_localappdata.md)) will fail. This ensures there are no migration issues if an app depends on the per-app locations being shared (Win32), or if the app paths change when using the Desktop Bridge.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.appdatapaths
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class AppDataPaths extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppDataPaths

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppDataPaths.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the paths to a user's various app data folders. Use this method in multi-user apps.
     * @param {User} user_ The user to retreive the paths for.
     * @returns {AppDataPaths} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.appdatapaths.getforuser
     */
    static GetForUser(user_) {
        if (!AppDataPaths.HasProp("__IAppDataPathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.AppDataPaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppDataPathsStatics.IID)
            AppDataPaths.__IAppDataPathsStatics := IAppDataPathsStatics(factoryPtr)
        }

        return AppDataPaths.__IAppDataPathsStatics.GetForUser(user_)
    }

    /**
     * Gets the paths to a user's various app data folders. Use this method in single user apps.
     * @returns {AppDataPaths} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.appdatapaths.getdefault
     */
    static GetDefault() {
        if (!AppDataPaths.HasProp("__IAppDataPathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.AppDataPaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppDataPathsStatics.IID)
            AppDataPaths.__IAppDataPathsStatics := IAppDataPathsStatics(factoryPtr)
        }

        return AppDataPaths.__IAppDataPathsStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the path to the app's cookies.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.appdatapaths.cookies
     * @type {HSTRING} 
     */
    Cookies {
        get => this.get_Cookies()
    }

    /**
     * Gets the path to the desktop folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.appdatapaths.desktop
     * @type {HSTRING} 
     */
    Desktop {
        get => this.get_Desktop()
    }

    /**
     * Gets a path to the documents folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.appdatapaths.documents
     * @type {HSTRING} 
     */
    Documents {
        get => this.get_Documents()
    }

    /**
     * Gets a path to the favorites folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.appdatapaths.favorites
     * @type {HSTRING} 
     */
    Favorites {
        get => this.get_Favorites()
    }

    /**
     * Gets a path to the history folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.appdatapaths.history
     * @type {HSTRING} 
     */
    History {
        get => this.get_History()
    }

    /**
     * Gets the path to the internet cache folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.appdatapaths.internetcache
     * @type {HSTRING} 
     */
    InternetCache {
        get => this.get_InternetCache()
    }

    /**
     * Gets the local application data folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.appdatapaths.localappdata
     * @type {HSTRING} 
     */
    LocalAppData {
        get => this.get_LocalAppData()
    }

    /**
     * Gets the program data folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.appdatapaths.programdata
     * @type {HSTRING} 
     */
    ProgramData {
        get => this.get_ProgramData()
    }

    /**
     * Gets the roaming application data folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.appdatapaths.roamingappdata
     * @type {HSTRING} 
     */
    RoamingAppData {
        get => this.get_RoamingAppData()
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
    get_Cookies() {
        if (!this.HasProp("__IAppDataPaths")) {
            if ((queryResult := this.QueryInterface(IAppDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDataPaths := IAppDataPaths(outPtr)
        }

        return this.__IAppDataPaths.get_Cookies()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Desktop() {
        if (!this.HasProp("__IAppDataPaths")) {
            if ((queryResult := this.QueryInterface(IAppDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDataPaths := IAppDataPaths(outPtr)
        }

        return this.__IAppDataPaths.get_Desktop()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Documents() {
        if (!this.HasProp("__IAppDataPaths")) {
            if ((queryResult := this.QueryInterface(IAppDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDataPaths := IAppDataPaths(outPtr)
        }

        return this.__IAppDataPaths.get_Documents()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Favorites() {
        if (!this.HasProp("__IAppDataPaths")) {
            if ((queryResult := this.QueryInterface(IAppDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDataPaths := IAppDataPaths(outPtr)
        }

        return this.__IAppDataPaths.get_Favorites()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_History() {
        if (!this.HasProp("__IAppDataPaths")) {
            if ((queryResult := this.QueryInterface(IAppDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDataPaths := IAppDataPaths(outPtr)
        }

        return this.__IAppDataPaths.get_History()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InternetCache() {
        if (!this.HasProp("__IAppDataPaths")) {
            if ((queryResult := this.QueryInterface(IAppDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDataPaths := IAppDataPaths(outPtr)
        }

        return this.__IAppDataPaths.get_InternetCache()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalAppData() {
        if (!this.HasProp("__IAppDataPaths")) {
            if ((queryResult := this.QueryInterface(IAppDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDataPaths := IAppDataPaths(outPtr)
        }

        return this.__IAppDataPaths.get_LocalAppData()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProgramData() {
        if (!this.HasProp("__IAppDataPaths")) {
            if ((queryResult := this.QueryInterface(IAppDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDataPaths := IAppDataPaths(outPtr)
        }

        return this.__IAppDataPaths.get_ProgramData()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RoamingAppData() {
        if (!this.HasProp("__IAppDataPaths")) {
            if ((queryResult := this.QueryInterface(IAppDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDataPaths := IAppDataPaths(outPtr)
        }

        return this.__IAppDataPaths.get_RoamingAppData()
    }

;@endregion Instance Methods
}
