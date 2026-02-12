#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITileFlyoutNotification.ahk
#Include .\ITileFlyoutNotificationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the details of a tile flyout (mix view) notification. This includes the notification's XML content and, optionally, its expiration time. This class also provides a method by which you can retrieve the current flyout notification's XML content.
  * 
  * This class is part of the following general API usage pattern: 
  * + Call [TileFlyoutUpdateManager.GetTemplateContent](tileflyoutupdatemanager_gettemplatecontent_739748376.md) to retrieve and fill in a blank tile flyout notification XML template
  * + Call the [TileFlyoutNotification](tileflyoutnotification_tileflyoutnotification_93177318.md) constructor to encapsulate the template content as a flyout notification
  * + Call one of the [TileFlyoutUpdateManager](tileflyoutupdatemanager.md) methods to create a [TileFlyoutUpdater](tileflyoutupdater.md)
  * + Call [TileFlyoutUpdater.Update](tileflyoutupdater_update_298111616.md) to send the TileFlyoutNotification to the tile
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutnotification
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class TileFlyoutNotification extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITileFlyoutNotification

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITileFlyoutNotification.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [TileFlyoutNotification](tileflyoutnotification.md) object for use in a tile flyout (mix view) notification. This object provides the XML content of the notification— the sub-tiles to be displayed and the text and image elements used in each sub-tile.
     * @param {XmlDocument} content The XML content of the tile flyout notification.
     * @returns {TileFlyoutNotification} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutnotification.#ctor
     */
    static CreateTileFlyoutNotification(content) {
        if (!TileFlyoutNotification.HasProp("__ITileFlyoutNotificationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.TileFlyoutNotification")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileFlyoutNotificationFactory.IID)
            TileFlyoutNotification.__ITileFlyoutNotificationFactory := ITileFlyoutNotificationFactory(factoryPtr)
        }

        return TileFlyoutNotification.__ITileFlyoutNotificationFactory.CreateTileFlyoutNotification(content)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the XML description of the current tile flyout (mix view) notification. This content can then be examined or manipulated as necessary.
     * 
     * > [!NOTE]
     * > A tile flyout notification always includes the entire flyout. To update any part of the notification, you must resend the entire notification. For instance, to update the content of only one of the flyout's sub-tiles while leaving the rest of the notification unchanged, call this method to get the current XML payload, alter only the attributes of the specific **subtile** element, and resend the full payload in a new notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutnotification.content
     * @type {XmlDocument} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets or sets the time that the system will remove the tile flyout (mix view) notification. By default, a tile flyout notification does not expire. It is generally a best practice to explicitly set an expiration time to avoid stale content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutnotification.expirationtime
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
        if (!this.HasProp("__ITileFlyoutNotification")) {
            if ((queryResult := this.QueryInterface(ITileFlyoutNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileFlyoutNotification := ITileFlyoutNotification(outPtr)
        }

        return this.__ITileFlyoutNotification.get_Content()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ExpirationTime(value) {
        if (!this.HasProp("__ITileFlyoutNotification")) {
            if ((queryResult := this.QueryInterface(ITileFlyoutNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileFlyoutNotification := ITileFlyoutNotification(outPtr)
        }

        return this.__ITileFlyoutNotification.put_ExpirationTime(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ExpirationTime() {
        if (!this.HasProp("__ITileFlyoutNotification")) {
            if ((queryResult := this.QueryInterface(ITileFlyoutNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileFlyoutNotification := ITileFlyoutNotification(outPtr)
        }

        return this.__ITileFlyoutNotification.get_ExpirationTime()
    }

;@endregion Instance Methods
}
