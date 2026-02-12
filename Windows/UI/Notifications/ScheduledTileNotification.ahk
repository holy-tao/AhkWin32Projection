#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IScheduledTileNotification.ahk
#Include .\IScheduledTileNotificationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines the visual content and timing for a single, non-recurring scheduled update to a tile.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtilenotification
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ScheduledTileNotification extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScheduledTileNotification

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScheduledTileNotification.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates and initializes a new instance of the [ScheduledTileNotification](scheduledtilenotification.md) object for use with a [TileUpdater](tileupdater.md).
     * @param {XmlDocument} content The object that provides the content for the tile notification.
     * @param {DateTime} deliveryTime The time at which the tile should be updated with the notification information.
     * @returns {ScheduledTileNotification} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtilenotification.#ctor
     */
    static CreateScheduledTileNotification(content, deliveryTime) {
        if (!ScheduledTileNotification.HasProp("__IScheduledTileNotificationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.ScheduledTileNotification")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScheduledTileNotificationFactory.IID)
            ScheduledTileNotification.__IScheduledTileNotificationFactory := IScheduledTileNotificationFactory(factoryPtr)
        }

        return ScheduledTileNotification.__IScheduledTileNotificationFactory.CreateScheduledTileNotification(content, deliveryTime)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the XML description of the content of the scheduled tile update.
     * @remarks
     * This information is set when the [ScheduledTileNotification](scheduledtilenotification.md) is created.
     * 
     * The retrieved elements and their attributes are manipulated through Document Object Model (DOM) manipulation functions. See [Tile schema](/uwp/schemas/tiles/tilesschema/schema-root) for an explanation of tile elements and attributes found in the XML document.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtilenotification.content
     * @type {XmlDocument} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets the time at which the tile is scheduled to be updated.
     * @remarks
     * This value is set when the [ScheduledTileNotification](scheduledtilenotification.md) is created. For the tile to be updated at the specified time, the notification must be added to the schedule through the [TileUpdater.addToSchedule](tileupdater_addtoschedule_1446725541.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtilenotification.deliverytime
     * @type {DateTime} 
     */
    DeliveryTime {
        get => this.get_DeliveryTime()
    }

    /**
     * Gets or sets the time after which the tile notification should no longer be shown. By default, a tile notification does not expire. It is a best practice to explicitly set an expiration time to avoid stale content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtilenotification.expirationtime
     * @type {IReference<DateTime>} 
     */
    ExpirationTime {
        get => this.get_ExpirationTime()
        set => this.put_ExpirationTime(value)
    }

    /**
     * Gets or sets a string that Windows can use to prevent duplicate notification content from appearing in the queue.
     * @remarks
     * ScheduledTileNotification.tag and [ScheduledTileNotification.id](scheduledtilenotification_id.md) serve similar purposes: 
     * + The ScheduledTileNotification.tag property is used by Windows to prevent duplicate notification content from appearing in the queue at the same time. It allows the notification to be updated in-place in the queue to prevent it from containing out-of-date information.
     * + The [ScheduledTileNotification.id](scheduledtilenotification_id.md) property identifies the notification in the schedule. This allows the notification to be identified or removed from the schedule.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtilenotification.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Gets or sets the unique ID that is used to identify the scheduled tile in the schedule.
     * @remarks
     * [ScheduledTileNotification.tag](scheduledtilenotification_tag.md) and ScheduledTileNotification.id serve similar purposes: 
     * + The [ScheduledTileNotification.tag](scheduledtilenotification_tag.md) property is used by Windows to prevent duplicate notification content from appearing in the queue at the same time. It allows the notification to be updated in-place in the queue to prevent it from containing out-of-date information.
     * + The id property identifies the notification in the schedule. This allows the notification to be identified or removed from the schedule.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtilenotification.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
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
        if (!this.HasProp("__IScheduledTileNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledTileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledTileNotification := IScheduledTileNotification(outPtr)
        }

        return this.__IScheduledTileNotification.get_Content()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DeliveryTime() {
        if (!this.HasProp("__IScheduledTileNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledTileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledTileNotification := IScheduledTileNotification(outPtr)
        }

        return this.__IScheduledTileNotification.get_DeliveryTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ExpirationTime(value) {
        if (!this.HasProp("__IScheduledTileNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledTileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledTileNotification := IScheduledTileNotification(outPtr)
        }

        return this.__IScheduledTileNotification.put_ExpirationTime(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ExpirationTime() {
        if (!this.HasProp("__IScheduledTileNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledTileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledTileNotification := IScheduledTileNotification(outPtr)
        }

        return this.__IScheduledTileNotification.get_ExpirationTime()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if (!this.HasProp("__IScheduledTileNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledTileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledTileNotification := IScheduledTileNotification(outPtr)
        }

        return this.__IScheduledTileNotification.put_Tag(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tag() {
        if (!this.HasProp("__IScheduledTileNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledTileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledTileNotification := IScheduledTileNotification(outPtr)
        }

        return this.__IScheduledTileNotification.get_Tag()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IScheduledTileNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledTileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledTileNotification := IScheduledTileNotification(outPtr)
        }

        return this.__IScheduledTileNotification.put_Id(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IScheduledTileNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledTileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledTileNotification := IScheduledTileNotification(outPtr)
        }

        return this.__IScheduledTileNotification.get_Id()
    }

;@endregion Instance Methods
}
