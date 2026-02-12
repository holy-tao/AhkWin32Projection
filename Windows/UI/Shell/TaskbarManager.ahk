#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITaskbarManager.ahk
#Include .\ITaskbarManager2.ahk
#Include .\ITaskbarManagerStatics.ahk
#Include .\ITaskbarManagerDesktopAppSupportStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods for pinning applications to the taskbar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.taskbarmanager
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class TaskbarManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITaskbarManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITaskbarManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the [TaskbarManager](taskbarmanager.md) object active in the current process.
     * @returns {TaskbarManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.taskbarmanager.getdefault
     */
    static GetDefault() {
        if (!TaskbarManager.HasProp("__ITaskbarManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.TaskbarManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITaskbarManagerStatics.IID)
            TaskbarManager.__ITaskbarManagerStatics := ITaskbarManagerStatics(factoryPtr)
        }

        return TaskbarManager.__ITaskbarManagerStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets whether the taskbar is present on the current device.
     * @remarks
     * Currently, the taskbar is only present on the Desktop device family.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.taskbarmanager.issupported
     * @type {Boolean} 
     */
    IsSupported {
        get => this.get_IsSupported()
    }

    /**
     * Gets whether pinning to the taskbar is allowed.
     * @remarks
     * Pinning to taskbar can be disabled through group policy, and is not available on some device families.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.taskbarmanager.ispinningallowed
     * @type {Boolean} 
     */
    IsPinningAllowed {
        get => this.get_IsPinningAllowed()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSupported() {
        if (!this.HasProp("__ITaskbarManager")) {
            if ((queryResult := this.QueryInterface(ITaskbarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITaskbarManager := ITaskbarManager(outPtr)
        }

        return this.__ITaskbarManager.get_IsSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPinningAllowed() {
        if (!this.HasProp("__ITaskbarManager")) {
            if ((queryResult := this.QueryInterface(ITaskbarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITaskbarManager := ITaskbarManager(outPtr)
        }

        return this.__ITaskbarManager.get_IsPinningAllowed()
    }

    /**
     * Checks if the currently active application is already pinned to the taskbar.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.taskbarmanager.iscurrentapppinnedasync
     */
    IsCurrentAppPinnedAsync() {
        if (!this.HasProp("__ITaskbarManager")) {
            if ((queryResult := this.QueryInterface(ITaskbarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITaskbarManager := ITaskbarManager(outPtr)
        }

        return this.__ITaskbarManager.IsCurrentAppPinnedAsync()
    }

    /**
     * Checks if the specified application is already pinned to the taskbar.
     * @param {AppListEntry} appListEntry_ An [AppListEntry](/uwp/api/Windows.ApplicationModel.Core.AppListEntry) corresponding to the application to check.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.taskbarmanager.isapplistentrypinnedasync
     */
    IsAppListEntryPinnedAsync(appListEntry_) {
        if (!this.HasProp("__ITaskbarManager")) {
            if ((queryResult := this.QueryInterface(ITaskbarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITaskbarManager := ITaskbarManager(outPtr)
        }

        return this.__ITaskbarManager.IsAppListEntryPinnedAsync(appListEntry_)
    }

    /**
     * Requests that the currently active application be pinned to the taskbar.
     * @remarks
     * Calling this method will display a dialog asking the user to confirm that they want to pin the app. If the user selects "no", this method will return false.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.taskbarmanager.requestpincurrentappasync
     */
    RequestPinCurrentAppAsync() {
        if (!this.HasProp("__ITaskbarManager")) {
            if ((queryResult := this.QueryInterface(ITaskbarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITaskbarManager := ITaskbarManager(outPtr)
        }

        return this.__ITaskbarManager.RequestPinCurrentAppAsync()
    }

    /**
     * Requests that the specified application be pinned to the taskbar.
     * @remarks
     * Calling this method will display a dialog asking the user to confirm that they want to pin the app. If the user selects "no", this method will return false.
     * @param {AppListEntry} appListEntry_ An [AppListEntry](/uwp/api/Windows.ApplicationModel.Core.AppListEntry) corresponding to the application to pin to the taskbar.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.taskbarmanager.requestpinapplistentryasync
     */
    RequestPinAppListEntryAsync(appListEntry_) {
        if (!this.HasProp("__ITaskbarManager")) {
            if ((queryResult := this.QueryInterface(ITaskbarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITaskbarManager := ITaskbarManager(outPtr)
        }

        return this.__ITaskbarManager.RequestPinAppListEntryAsync(appListEntry_)
    }

    /**
     * Checks if the specified secondary tile is pinned to taskbar. Requires user approval as described [here](/windows/uwp/design/shell/pin-to-taskbar#4-pin-your-app)
     * @remarks
     * This API can only be used with Limited-Access. See the docs for pinning secondary tiles to taskbar to learn more.
     * @param {HSTRING} tileId The [TileId](../windows.ui.startscreen/secondarytile_tileid.md) of the [SecondaryTile](../windows.ui.startscreen/secondarytile.md) that you want to check is pinned.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.taskbarmanager.issecondarytilepinnedasync
     */
    IsSecondaryTilePinnedAsync(tileId) {
        if (!this.HasProp("__ITaskbarManager2")) {
            if ((queryResult := this.QueryInterface(ITaskbarManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITaskbarManager2 := ITaskbarManager2(outPtr)
        }

        return this.__ITaskbarManager2.IsSecondaryTilePinnedAsync(tileId)
    }

    /**
     * Requests to pin the specified tile to taskbar. Requires user approval as described [here](/windows/uwp/design/shell/pin-to-taskbar#4-pin-your-app).
     * 
     * > [!IMPORTANT]
     * > The **TaskbarManager.RequestPinSecondaryTileAsync** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * This API can only be used with user approval, as described [here](/windows/uwp/design/shell/pin-to-taskbar#4-pin-your-app). See the docs for pinning secondary tiles to taskbar to learn more.
     * @param {SecondaryTile} secondaryTile_ The secondary tile to be pinned.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.taskbarmanager.requestpinsecondarytileasync
     */
    RequestPinSecondaryTileAsync(secondaryTile_) {
        if (!this.HasProp("__ITaskbarManager2")) {
            if ((queryResult := this.QueryInterface(ITaskbarManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITaskbarManager2 := ITaskbarManager2(outPtr)
        }

        return this.__ITaskbarManager2.RequestPinSecondaryTileAsync(secondaryTile_)
    }

    /**
     * Tries to unpin the secondary tile from taskbar. Requires user approval as described [here](/windows/uwp/design/shell/pin-to-taskbar#4-pin-your-app)
     * @remarks
     * This API can only be used with Limited-Access. See the docs for pinning secondary tiles to taskbar to learn more.
     * @param {HSTRING} tileId The [TileId](../windows.ui.startscreen/secondarytile_tileid.md) of the [SecondaryTile](../windows.ui.startscreen/secondarytile.md) you want to unpin.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.taskbarmanager.tryunpinsecondarytileasync
     */
    TryUnpinSecondaryTileAsync(tileId) {
        if (!this.HasProp("__ITaskbarManager2")) {
            if ((queryResult := this.QueryInterface(ITaskbarManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITaskbarManager2 := ITaskbarManager2(outPtr)
        }

        return this.__ITaskbarManager2.TryUnpinSecondaryTileAsync(tileId)
    }

;@endregion Instance Methods
}
