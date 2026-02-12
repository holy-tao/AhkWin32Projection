#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBadgeNotification.ahk
#Include .\IBadgeNotificationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines the content, associated metadata, and expiration time of an update to a tile's badge overlay. A badge can display a number from 1 to 99 or a [status glyph](/previous-versions/windows/apps/hh779719(v=win.10)).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgenotification
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class BadgeNotification extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBadgeNotification

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBadgeNotification.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates and initializes a new instance of the [BadgeNotification](badgenotification.md).
     * @remarks
     * The value attribute can be a number from 1-99 or a status glyph. See the [Badge overview](/previous-versions/windows/apps/hh779719(v=win.10)) for a complete list of available images.
     * @param {XmlDocument} content The XML content that defines the badge update.
     * @returns {BadgeNotification} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgenotification.#ctor
     */
    static CreateBadgeNotification(content) {
        if (!BadgeNotification.HasProp("__IBadgeNotificationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.BadgeNotification")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBadgeNotificationFactory.IID)
            BadgeNotification.__IBadgeNotificationFactory := IBadgeNotificationFactory(factoryPtr)
        }

        return BadgeNotification.__IBadgeNotificationFactory.CreateBadgeNotification(content)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the XML that defines the value or glyph used as the tile's badge.
     * @remarks
     * The retrieved elements and their attributes are manipulated through Document Object Model (DOM) manipulation functions to customize the badge content. See [badge schema](/uwp/schemas/tiles/badgeschema/schema-root)for an explanation of badge elements and attributes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgenotification.content
     * @type {XmlDocument} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets or sets the time that Windows will remove the badge from the tile. By default, local badge notifications do not expire and push, periodic, and scheduled badge notifications expire after three days. It is a best practice to explicitly set an expiration time to avoid stale content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgenotification.expirationtime
     * @type {IReference<DateTime>} 
     */
    ExpirationTime {
        get => this.get_ExpirationTime()
        set => this.put_ExpirationTime(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {XmlDocument} 
     */
    get_Content() {
        if (!this.HasProp("__IBadgeNotification")) {
            if ((queryResult := this.QueryInterface(IBadgeNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBadgeNotification := IBadgeNotification(outPtr)
        }

        return this.__IBadgeNotification.get_Content()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ExpirationTime(value) {
        if (!this.HasProp("__IBadgeNotification")) {
            if ((queryResult := this.QueryInterface(IBadgeNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBadgeNotification := IBadgeNotification(outPtr)
        }

        return this.__IBadgeNotification.put_ExpirationTime(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ExpirationTime() {
        if (!this.HasProp("__IBadgeNotification")) {
            if ((queryResult := this.QueryInterface(IBadgeNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBadgeNotification := IBadgeNotification(outPtr)
        }

        return this.__IBadgeNotification.get_ExpirationTime()
    }

;@endregion Instance Methods
}
