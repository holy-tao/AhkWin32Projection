#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBadgeUpdateManagerForUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates [BadgeUpdater](badgeupdater.md) objects that you use to manipulate a tile's badge overlay for a specific user. This class also provides access to the XML content of the system-provided badge templates so that you can customize that content for use in updating your badges.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdatemanagerforuser
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class BadgeUpdateManagerForUser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBadgeUpdateManagerForUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBadgeUpdateManagerForUser.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the user targeted by the badge update manager.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdatemanagerforuser.user
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
     * Creates a new [BadgeUpdater](badgeupdater.md) for the bound [user](badgeupdatemanagerforuser_user.md) and the specified app tile's badge, usually the tile of another app in the package. The [BadgeUpdater](badgeupdater.md) lets you change the appearance or content of that badge.
     * @returns {BadgeUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdatemanagerforuser.createbadgeupdaterforapplication
     */
    CreateBadgeUpdaterForApplication() {
        if (!this.HasProp("__IBadgeUpdateManagerForUser")) {
            if ((queryResult := this.QueryInterface(IBadgeUpdateManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBadgeUpdateManagerForUser := IBadgeUpdateManagerForUser(outPtr)
        }

        return this.__IBadgeUpdateManagerForUser.CreateBadgeUpdaterForApplication()
    }

    /**
     * Creates and initializes a new instance of the [BadgeUpdater](badgeupdater.md), which lets you change the appearance or content of the badge for the bound [user](badgeupdatemanagerforuser_user.md) on the calling app's tile.
     * @param {HSTRING} applicationId 
     * @returns {BadgeUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdatemanagerforuser.createbadgeupdaterforapplication
     */
    CreateBadgeUpdaterForApplicationWithId(applicationId) {
        if (!this.HasProp("__IBadgeUpdateManagerForUser")) {
            if ((queryResult := this.QueryInterface(IBadgeUpdateManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBadgeUpdateManagerForUser := IBadgeUpdateManagerForUser(outPtr)
        }

        return this.__IBadgeUpdateManagerForUser.CreateBadgeUpdaterForApplicationWithId(applicationId)
    }

    /**
     * Creates a [BadgeUpdater](badgeupdater.md), which enables you to change the appearance or content of a badge on a [secondary tile](../windows.ui.startscreen/secondarytile.md) for the bound [user](badgeupdatemanagerforuser_user.md). The tile can belong to the calling app or any other app in the same package.
     * @param {HSTRING} tileId The ID of the secondary tile.
     * @returns {BadgeUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdatemanagerforuser.createbadgeupdaterforsecondarytile
     */
    CreateBadgeUpdaterForSecondaryTile(tileId) {
        if (!this.HasProp("__IBadgeUpdateManagerForUser")) {
            if ((queryResult := this.QueryInterface(IBadgeUpdateManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBadgeUpdateManagerForUser := IBadgeUpdateManagerForUser(outPtr)
        }

        return this.__IBadgeUpdateManagerForUser.CreateBadgeUpdaterForSecondaryTile(tileId)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IBadgeUpdateManagerForUser")) {
            if ((queryResult := this.QueryInterface(IBadgeUpdateManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBadgeUpdateManagerForUser := IBadgeUpdateManagerForUser(outPtr)
        }

        return this.__IBadgeUpdateManagerForUser.get_User()
    }

;@endregion Instance Methods
}
