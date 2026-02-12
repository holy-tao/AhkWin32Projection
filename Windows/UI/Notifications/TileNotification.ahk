#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITileNotification.ahk
#Include .\ITileNotificationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines an update to a tile, including its visuals, identification tag, and expiration time.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tilenotification
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class TileNotification extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITileNotification

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITileNotification.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates and initializes a new instance of the [TileNotification](tilenotification.md) object for use with a [TileUpdater](tileupdater.md).
     * @param {XmlDocument} content The object that provides the content for the tile notification.
     * @returns {TileNotification} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tilenotification.#ctor
     */
    static CreateTileNotification(content) {
        if (!TileNotification.HasProp("__ITileNotificationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.TileNotification")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileNotificationFactory.IID)
            TileNotification.__ITileNotificationFactory := ITileNotificationFactory(factoryPtr)
        }

        return TileNotification.__ITileNotificationFactory.CreateTileNotification(content)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the XML description of the notification content, which you can then manipulate to alter the notification.
     * @remarks
     * The retrieved elements and their attributes are manipulated through Document Object Model (DOM) manipulation functions to customize the tile content. See [tile schema](/uwp/schemas/tiles/tilesschema/schema-root) for an explanation of tile elements and attributes found in the XML document.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tilenotification.content
     * @type {XmlDocument} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets or sets the time that Windows will remove the notification from the tile. By default, a tile update does not expire. It is a best practice to explicitly set an expiration time to avoid stale content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tilenotification.expirationtime
     * @type {IReference<DateTime>} 
     */
    ExpirationTime {
        get => this.get_ExpirationTime()
        set => this.put_ExpirationTime(value)
    }

    /**
     * Gets or sets a string that Windows can use to prevent duplicate notification content from appearing in the queue.
     * @remarks
     * Use tags to replace notifications in the stack. If a new notification arrives with the same tag as an existing notification, the new notification replaces the old. For instance, if your tile shows stock prices, you want to show the most up-to-date info. An existing stock price update waiting in the queue to be displayed should be replaced by the latest quotes rather than showing them one after the other.
     * 
     * A new notification with a matching tag replaces any existing notification with the same tag, but the new notification does not necessarily inherit the older notification's place in the queue.
     * 
     * The tag should relate to the content of the notification. For example, a notification in a stock quote app could use the stock symbol (such as "msft") while a weather app notification could be tagged with the zip code (such as "98052") of the forecast. Do not simply number your notifications as "notification1", "notification2" and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tilenotification.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
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
        if (!this.HasProp("__ITileNotification")) {
            if ((queryResult := this.QueryInterface(ITileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileNotification := ITileNotification(outPtr)
        }

        return this.__ITileNotification.get_Content()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ExpirationTime(value) {
        if (!this.HasProp("__ITileNotification")) {
            if ((queryResult := this.QueryInterface(ITileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileNotification := ITileNotification(outPtr)
        }

        return this.__ITileNotification.put_ExpirationTime(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ExpirationTime() {
        if (!this.HasProp("__ITileNotification")) {
            if ((queryResult := this.QueryInterface(ITileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileNotification := ITileNotification(outPtr)
        }

        return this.__ITileNotification.get_ExpirationTime()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if (!this.HasProp("__ITileNotification")) {
            if ((queryResult := this.QueryInterface(ITileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileNotification := ITileNotification(outPtr)
        }

        return this.__ITileNotification.put_Tag(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tag() {
        if (!this.HasProp("__ITileNotification")) {
            if ((queryResult := this.QueryInterface(ITileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileNotification := ITileNotification(outPtr)
        }

        return this.__ITileNotification.get_Tag()
    }

;@endregion Instance Methods
}
