#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameListEntry.ahk
#Include .\IGameListEntry2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a game's display info such as its display info, launch parameters, and game mode configuration, category and a method to launch the game.
 * @remarks
 * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class GameListEntry extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameListEntry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameListEntry.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.displayinfo
     * @type {AppDisplayInfo} 
     */
    DisplayInfo {
        get => this.get_DisplayInfo()
    }

    /**
     * The current [GameListCategory](gamelistcategory.md) value for the associated [IGameListEntry](igamelistentry.md).
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.category
     * @type {Integer} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * Gets a collection of all properties that pertain to the [IGameListEntry](igamelistentry.md) object.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * The game’s current [GameListEntryLaunchableState](gamelistentrylaunchablestate.md)
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.launchablestate
     * @type {Integer} 
     */
    LaunchableState {
        get => this.get_LaunchableState()
    }

    /**
     * The path to the game’s executable.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.launcherexecutable
     * @type {IStorageFile} 
     */
    LauncherExecutable {
        get => this.get_LauncherExecutable()
    }

    /**
     * The game’s current launch parameters.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.launchparameters
     * @type {HSTRING} 
     */
    LaunchParameters {
        get => this.get_LaunchParameters()
    }

    /**
     * The game’s TitleId this could come back with an empty string
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.titleid
     * @type {HSTRING} 
     */
    TitleId {
        get => this.get_TitleId()
    }

    /**
     * The game’s current [GameModeConfiguration](gamemodeconfiguration.md) settings
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.gamemodeconfiguration
     * @type {GameModeConfiguration} 
     */
    GameModeConfiguration {
        get => this.get_GameModeConfiguration()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppDisplayInfo} 
     */
    get_DisplayInfo() {
        if (!this.HasProp("__IGameListEntry")) {
            if ((queryResult := this.QueryInterface(IGameListEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry := IGameListEntry(outPtr)
        }

        return this.__IGameListEntry.get_DisplayInfo()
    }

    /**
     * Launch the associated game.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.launchasync
     */
    LaunchAsync() {
        if (!this.HasProp("__IGameListEntry")) {
            if ((queryResult := this.QueryInterface(IGameListEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry := IGameListEntry(outPtr)
        }

        return this.__IGameListEntry.LaunchAsync()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Category() {
        if (!this.HasProp("__IGameListEntry")) {
            if ((queryResult := this.QueryInterface(IGameListEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry := IGameListEntry(outPtr)
        }

        return this.__IGameListEntry.get_Category()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IGameListEntry")) {
            if ((queryResult := this.QueryInterface(IGameListEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry := IGameListEntry(outPtr)
        }

        return this.__IGameListEntry.get_Properties()
    }

    /**
     * Sets the [GameListCategory](gamelistcategory.md).
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {Integer} value 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.setcategoryasync
     */
    SetCategoryAsync(value) {
        if (!this.HasProp("__IGameListEntry")) {
            if ((queryResult := this.QueryInterface(IGameListEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry := IGameListEntry(outPtr)
        }

        return this.__IGameListEntry.SetCategoryAsync(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LaunchableState() {
        if (!this.HasProp("__IGameListEntry2")) {
            if ((queryResult := this.QueryInterface(IGameListEntry2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry2 := IGameListEntry2(outPtr)
        }

        return this.__IGameListEntry2.get_LaunchableState()
    }

    /**
     * 
     * @returns {IStorageFile} 
     */
    get_LauncherExecutable() {
        if (!this.HasProp("__IGameListEntry2")) {
            if ((queryResult := this.QueryInterface(IGameListEntry2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry2 := IGameListEntry2(outPtr)
        }

        return this.__IGameListEntry2.get_LauncherExecutable()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LaunchParameters() {
        if (!this.HasProp("__IGameListEntry2")) {
            if ((queryResult := this.QueryInterface(IGameListEntry2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry2 := IGameListEntry2(outPtr)
        }

        return this.__IGameListEntry2.get_LaunchParameters()
    }

    /**
     * Sets the launch path for the game’s executable. This can fail if the [LaunchableState](gamelistentry_launchablestate.md) is set to [ByTitle](gamelistentrylaunchablestate.md).
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {IStorageFile} executableFile 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.setlauncherexecutablefileasync
     */
    SetLauncherExecutableFileAsync(executableFile) {
        if (!this.HasProp("__IGameListEntry2")) {
            if ((queryResult := this.QueryInterface(IGameListEntry2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry2 := IGameListEntry2(outPtr)
        }

        return this.__IGameListEntry2.SetLauncherExecutableFileAsync(executableFile)
    }

    /**
     * Sets the launch path for the game’s executable and launch parameters. This can fail if the [LaunchableState](gamelistentry_launchablestate.md) is set to [ByTitle](gamelistentrylaunchablestate.md).
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {IStorageFile} executableFile 
     * @param {HSTRING} launchParams 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.setlauncherexecutablefileasync
     */
    SetLauncherExecutableFileWithParamsAsync(executableFile, launchParams) {
        if (!this.HasProp("__IGameListEntry2")) {
            if ((queryResult := this.QueryInterface(IGameListEntry2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry2 := IGameListEntry2(outPtr)
        }

        return this.__IGameListEntry2.SetLauncherExecutableFileWithParamsAsync(executableFile, launchParams)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TitleId() {
        if (!this.HasProp("__IGameListEntry2")) {
            if ((queryResult := this.QueryInterface(IGameListEntry2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry2 := IGameListEntry2(outPtr)
        }

        return this.__IGameListEntry2.get_TitleId()
    }

    /**
     * Updates the TitleID.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {HSTRING} id 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamelistentry.settitleidasync
     */
    SetTitleIdAsync(id) {
        if (!this.HasProp("__IGameListEntry2")) {
            if ((queryResult := this.QueryInterface(IGameListEntry2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry2 := IGameListEntry2(outPtr)
        }

        return this.__IGameListEntry2.SetTitleIdAsync(id)
    }

    /**
     * 
     * @returns {GameModeConfiguration} 
     */
    get_GameModeConfiguration() {
        if (!this.HasProp("__IGameListEntry2")) {
            if ((queryResult := this.QueryInterface(IGameListEntry2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameListEntry2 := IGameListEntry2(outPtr)
        }

        return this.__IGameListEntry2.get_GameModeConfiguration()
    }

;@endregion Instance Methods
}
