#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBadgeUpdateManagerStatics2.ahk
#Include .\IBadgeUpdateManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates [BadgeUpdater](badgeupdater.md) objects that you use to manipulate a tile's badge overlay. This class also provides access to the XML content of the system-provided badge templates so that you can customize that content for use in updating your badges.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdatemanager
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class BadgeUpdateManager extends IInspectable {
;@region Static Methods
    /**
     * Creates and initializes a new [BadgeUpdateManagerForUser](badgeupdatemanagerforuser.md) for the specified user, which lets you change the appearance or content of the badge on a tile for a specific user.
     * @param {User} user_ The user who will receive the tile badge updates.
     * @returns {BadgeUpdateManagerForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdatemanager.getforuser
     */
    static GetForUser(user_) {
        if (!BadgeUpdateManager.HasProp("__IBadgeUpdateManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.BadgeUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBadgeUpdateManagerStatics2.IID)
            BadgeUpdateManager.__IBadgeUpdateManagerStatics2 := IBadgeUpdateManagerStatics2(factoryPtr)
        }

        return BadgeUpdateManager.__IBadgeUpdateManagerStatics2.GetForUser(user_)
    }

    /**
     * Creates and initializes a new instance of the [BadgeUpdater](badgeupdater.md) for a specified app tile's badge, usually the tile of another app in the package. The [BadgeUpdater](badgeupdater.md) lets you change the appearance or content of that badge.
     * @remarks
     * The app identified by *applicationId* must belong to the same package as the caller.
     * @returns {BadgeUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdatemanager.createbadgeupdaterforapplication
     */
    static CreateBadgeUpdaterForApplication() {
        if (!BadgeUpdateManager.HasProp("__IBadgeUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.BadgeUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBadgeUpdateManagerStatics.IID)
            BadgeUpdateManager.__IBadgeUpdateManagerStatics := IBadgeUpdateManagerStatics(factoryPtr)
        }

        return BadgeUpdateManager.__IBadgeUpdateManagerStatics.CreateBadgeUpdaterForApplication()
    }

    /**
     * Creates and initializes a new instance of the [BadgeUpdater](badgeupdater.md), which lets you change the appearance or content of the badge on the calling app's tile.
     * @param {HSTRING} applicationId 
     * @returns {BadgeUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdatemanager.createbadgeupdaterforapplication
     */
    static CreateBadgeUpdaterForApplicationWithId(applicationId) {
        if (!BadgeUpdateManager.HasProp("__IBadgeUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.BadgeUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBadgeUpdateManagerStatics.IID)
            BadgeUpdateManager.__IBadgeUpdateManagerStatics := IBadgeUpdateManagerStatics(factoryPtr)
        }

        return BadgeUpdateManager.__IBadgeUpdateManagerStatics.CreateBadgeUpdaterForApplicationWithId(applicationId)
    }

    /**
     * Creates and initializes a new instance of the [BadgeUpdater](badgeupdater.md), which enables you to change the appearance or content of a badge on a [secondary tile](../windows.ui.startscreen/secondarytile.md). The tile can belong to the calling app or any other app in the same package.
     * @param {HSTRING} tileId The unique ID of the tile.
     * @returns {BadgeUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdatemanager.createbadgeupdaterforsecondarytile
     */
    static CreateBadgeUpdaterForSecondaryTile(tileId) {
        if (!BadgeUpdateManager.HasProp("__IBadgeUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.BadgeUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBadgeUpdateManagerStatics.IID)
            BadgeUpdateManager.__IBadgeUpdateManagerStatics := IBadgeUpdateManagerStatics(factoryPtr)
        }

        return BadgeUpdateManager.__IBadgeUpdateManagerStatics.CreateBadgeUpdaterForSecondaryTile(tileId)
    }

    /**
     * Gets the XML content of one of the predefined badge templates so that you can customize it for a badge update.
     * @remarks
     * Instead of creating the full XML payload yourself, you can get the default template and then use Document Object Model (DOM) manipulation functions to customize the part of the content that you want to change. You package this XML in a [BadgeNotification](badgenotification.md) and send it to the tile through the [BadgeUpdater](badgeupdater.md) that you create through the other methods of this class.
     * 
     * See [badge schema](/uwp/schemas/tiles/badgeschema/schema-root)for an explanation of badge elements and attributes.
     * @param {Integer} type The type of badge template, either a glyph or a number.
     * @returns {XmlDocument} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdatemanager.gettemplatecontent
     */
    static GetTemplateContent(type) {
        if (!BadgeUpdateManager.HasProp("__IBadgeUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.BadgeUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBadgeUpdateManagerStatics.IID)
            BadgeUpdateManager.__IBadgeUpdateManagerStatics := IBadgeUpdateManagerStatics(factoryPtr)
        }

        return BadgeUpdateManager.__IBadgeUpdateManagerStatics.GetTemplateContent(type)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
