#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITileUpdateManagerStatics.ahk
#Include .\ITileUpdateManagerStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates [TileUpdater](tileupdater.md) objects used to change and update **Start** menu tiles. This class also provides access to the XML content of the system-provided tile templates so that you can customize that content for use in updating your tiles.
 * @remarks
 * This is a static factory class and requires no instantiation.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdatemanager
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class TileUpdateManager extends IInspectable {
;@region Static Methods
    /**
     * Creates and initializes a new instance of the [TileUpdater](tileupdater.md) for a tile that belongs to another app in the same package as the calling app. The [TileUpdater](tileupdater.md) lets a developer change the appearance of that tile.
     * @remarks
     * This method is used only in conjunction with multi-app packages. The app identified by *applicationId* must belong to the same package as the caller.
     * 
     * Although you can specify the calling application's tile in this method, [createTileUpdaterForApplication](tileupdatemanager_createtileupdaterforapplication_1541898748.md) is the preferred method to use with single-app packages.
     * @returns {TileUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdatemanager.createtileupdaterforapplication
     */
    static CreateTileUpdaterForApplication() {
        if (!TileUpdateManager.HasProp("__ITileUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.TileUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileUpdateManagerStatics.IID)
            TileUpdateManager.__ITileUpdateManagerStatics := ITileUpdateManagerStatics(factoryPtr)
        }

        return TileUpdateManager.__ITileUpdateManagerStatics.CreateTileUpdaterForApplication()
    }

    /**
     * Creates and initializes a new instance of the [TileUpdater](tileupdater.md), which lets you change the appearance of the calling app's tile.
     * @param {HSTRING} applicationId 
     * @returns {TileUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdatemanager.createtileupdaterforapplication
     */
    static CreateTileUpdaterForApplicationWithId(applicationId) {
        if (!TileUpdateManager.HasProp("__ITileUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.TileUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileUpdateManagerStatics.IID)
            TileUpdateManager.__ITileUpdateManagerStatics := ITileUpdateManagerStatics(factoryPtr)
        }

        return TileUpdateManager.__ITileUpdateManagerStatics.CreateTileUpdaterForApplicationWithId(applicationId)
    }

    /**
     * Creates and initializes a new instance of the [TileUpdater](tileupdater.md), which enables you to change the appearance of a [secondary tile](../windows.ui.startscreen/secondarytile.md). The tile can belong to the calling app or any other app in the same package.
     * @param {HSTRING} tileId A unique ID for the tile.
     * @returns {TileUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdatemanager.createtileupdaterforsecondarytile
     */
    static CreateTileUpdaterForSecondaryTile(tileId) {
        if (!TileUpdateManager.HasProp("__ITileUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.TileUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileUpdateManagerStatics.IID)
            TileUpdateManager.__ITileUpdateManagerStatics := ITileUpdateManagerStatics(factoryPtr)
        }

        return TileUpdateManager.__ITileUpdateManagerStatics.CreateTileUpdaterForSecondaryTile(tileId)
    }

    /**
     * Gets the XML content of one of the predefined tile templates so that you can customize it for a tile update.
     * 
     * > [!NOTE]
     * > When this method is called on a Windows 8 system, it returns a [version 1 template](/previous-versions/windows/apps/hh761491(v=win.10)). When this method is called on a Windows 8.1 system, it returns a [version 2 template](/previous-versions/windows/apps/hh761491(v=win.10)). However, if an app specifies Windows 8 compatibility in its manifest, this method returns a [version 1 template](/previous-versions/windows/apps/hh761491(v=win.10)).
     * @remarks
     * You can use Document Object Model (DOM) manipulation functions to customize the template content for use in a [TileNotification](tilenotification.md) update that you will send to the tile through the [TileUpdater](tileupdater.md) that you create through the other methods of this class.
     * 
     * See [tile schema](/uwp/schemas/tiles/tilesschema/schema-root) for an explanation of tile elements and attributes.
     * @param {Integer} type The name of the template.
     * @returns {XmlDocument} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdatemanager.gettemplatecontent
     */
    static GetTemplateContent(type) {
        if (!TileUpdateManager.HasProp("__ITileUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.TileUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileUpdateManagerStatics.IID)
            TileUpdateManager.__ITileUpdateManagerStatics := ITileUpdateManagerStatics(factoryPtr)
        }

        return TileUpdateManager.__ITileUpdateManagerStatics.GetTemplateContent(type)
    }

    /**
     * Creates and initializes a new [TileUpdateManagerForUser](tileupdatemanagerforuser.md) for the specified user, which lets you change the appearance or content of a tile for a specific user.
     * @param {User} user_ The user who will receive the tile updates.
     * @returns {TileUpdateManagerForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdatemanager.getforuser
     */
    static GetForUser(user_) {
        if (!TileUpdateManager.HasProp("__ITileUpdateManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.TileUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileUpdateManagerStatics2.IID)
            TileUpdateManager.__ITileUpdateManagerStatics2 := ITileUpdateManagerStatics2(factoryPtr)
        }

        return TileUpdateManager.__ITileUpdateManagerStatics2.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
