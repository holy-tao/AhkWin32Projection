#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITileUpdateManagerForUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates [TileUpdater](tileupdater.md) objects used to change and update **Start** menu tiles for a specific user. This class also provides access to the XML content of the system-provided tile templates so that you can customize that content for use in updating your tiles.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdatemanagerforuser
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class TileUpdateManagerForUser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITileUpdateManagerForUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITileUpdateManagerForUser.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the user that receives the toast notifications created by this object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdatemanagerforuser.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Creates and initializes a new instance of the [TileUpdater](tileupdater.md), which lets you change the appearance of the calling app's tile for the bound [user](tileupdatemanagerforuser_user.md).
     * @returns {TileUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdatemanagerforuser.createtileupdaterforapplicationforuser
     */
    CreateTileUpdaterForApplication() {
        if (!this.HasProp("__ITileUpdateManagerForUser")) {
            if ((queryResult := this.QueryInterface(ITileUpdateManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdateManagerForUser := ITileUpdateManagerForUser(outPtr)
        }

        return this.__ITileUpdateManagerForUser.CreateTileUpdaterForApplication()
    }

    /**
     * Creates a new [TileUpdater](tileupdater.md) for a tile for the bound [user](tileupdatemanagerforuser_user.md). The tile can belong to the calling app or any other app in the same package. The [TileUpdater](tileupdater.md) lets a developer change the appearance of that tile.
     * @param {HSTRING} applicationId The package-relative application identifier (PRAID) of the tile. The specified app must be in the same package as the calling app. For more info on the PRAID, see the **Id** attribute of the [Application](/uwp/schemas/appxpackage/appxmanifestschema/element-application#attributes-and-elements) element.
     * 
     * If you are hosting background task(s) in an out-of-process COM server, separate from your main application, then pass as the argument for `applicationId` the PRAID of the application that defines the `windows.backgroundTask` extension in its own package manifest.
     * @returns {TileUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdatemanagerforuser.createtileupdaterforapplication
     */
    CreateTileUpdaterForApplicationWithId(applicationId) {
        if (!this.HasProp("__ITileUpdateManagerForUser")) {
            if ((queryResult := this.QueryInterface(ITileUpdateManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdateManagerForUser := ITileUpdateManagerForUser(outPtr)
        }

        return this.__ITileUpdateManagerForUser.CreateTileUpdaterForApplicationWithId(applicationId)
    }

    /**
     * Creates a new [TileUpdater](tileupdater.md), which enables you to change the appearance of a [secondary tile](../windows.ui.startscreen/secondarytile.md) for the bound [user](tileupdatemanagerforuser_user.md). The tile can belong to the calling app or any other app in the same package.
     * @param {HSTRING} tileId A unique ID for the tile.
     * @returns {TileUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdatemanagerforuser.createtileupdaterforsecondarytile
     */
    CreateTileUpdaterForSecondaryTile(tileId) {
        if (!this.HasProp("__ITileUpdateManagerForUser")) {
            if ((queryResult := this.QueryInterface(ITileUpdateManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdateManagerForUser := ITileUpdateManagerForUser(outPtr)
        }

        return this.__ITileUpdateManagerForUser.CreateTileUpdaterForSecondaryTile(tileId)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__ITileUpdateManagerForUser")) {
            if ((queryResult := this.QueryInterface(ITileUpdateManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdateManagerForUser := ITileUpdateManagerForUser(outPtr)
        }

        return this.__ITileUpdateManagerForUser.get_User()
    }

;@endregion Instance Methods
}
