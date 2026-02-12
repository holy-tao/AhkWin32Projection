#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameSaveContainerInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Information about a game save container.
 * @remarks
 * **GameSaveContainerInfo** provides information about a game save container including its name, display name, modified time, and size.
 * 
 * > [!IMPORTANT]
 * > This API is targeted towards UWP games and apps with Xbox Live Enabled. Calls to these APIs made from sources that are not Xbox Live enabled will not be able to sync data to the cloud.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfo
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class GameSaveContainerInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameSaveContainerInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameSaveContainerInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The name of this game save container.
     * @remarks
     * The container name is used to identify the container, and is not the display name. See [DisplayName](gamesavecontainerinfo_displayname.md).
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfo.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * The total size, in bytes, of the game save container and its blobs.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfo.totalsize
     * @type {Integer} 
     */
    TotalSize {
        get => this.get_TotalSize()
    }

    /**
     * The name displayed to the user for this game save.
     * @remarks
     * Use [SubmitUpdatesAsync](gamesavecontainer_submitupdatesasync_1002100950.md) or [SubmitPropertySetUpdatesAsync](gamesavecontainer_submitpropertysetupdatesasync_435712146.md) to set the display name.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfo.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Date and time that the game save container was last modified.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfo.lastmodifiedtime
     * @type {DateTime} 
     */
    LastModifiedTime {
        get => this.get_LastModifiedTime()
    }

    /**
     * Indicates whether the container needs to sync before updates can be submitted with [SubmitUpdatesAsync](gamesavecontainer_submitupdatesasync_1002100950.md) or [SubmitPropertySetUpdatesAsync](gamesavecontainer_submitpropertysetupdatesasync_435712146.md).
     * @remarks
     * See [GetSyncOnDemandForUserAsync](gamesaveprovider_getsyncondemandforuserasync_1696921570.md) for more information about sync-on-demand game save providers.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.xboxlive.storage.gamesavecontainerinfo.needssync
     * @type {Boolean} 
     */
    NeedsSync {
        get => this.get_NeedsSync()
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
    get_Name() {
        if (!this.HasProp("__IGameSaveContainerInfo")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainerInfo := IGameSaveContainerInfo(outPtr)
        }

        return this.__IGameSaveContainerInfo.get_Name()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalSize() {
        if (!this.HasProp("__IGameSaveContainerInfo")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainerInfo := IGameSaveContainerInfo(outPtr)
        }

        return this.__IGameSaveContainerInfo.get_TotalSize()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IGameSaveContainerInfo")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainerInfo := IGameSaveContainerInfo(outPtr)
        }

        return this.__IGameSaveContainerInfo.get_DisplayName()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastModifiedTime() {
        if (!this.HasProp("__IGameSaveContainerInfo")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainerInfo := IGameSaveContainerInfo(outPtr)
        }

        return this.__IGameSaveContainerInfo.get_LastModifiedTime()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NeedsSync() {
        if (!this.HasProp("__IGameSaveContainerInfo")) {
            if ((queryResult := this.QueryInterface(IGameSaveContainerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameSaveContainerInfo := IGameSaveContainerInfo(outPtr)
        }

        return this.__IGameSaveContainerInfo.get_NeedsSync()
    }

;@endregion Instance Methods
}
