#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITileUpdater.ahk
#Include .\ITileUpdater2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Changes the content of the specific tile that the updater is bound to.
 * @remarks
 * To get an instance of this object, call the [TileUpdateManager.CreateTileUpdaterForApplication](tileupdatemanager_createtileupdaterforapplication_1541898748.md) or [TileUpdateManager.CreateTileUpdaterForSecondaryTile](tileupdatemanager_createtileupdaterforsecondarytile_445640521.md) method.
 * 
 * When it is created, TileUpdater is bound to a specific app or secondary tile, so the methods of this class affect only the single tile that the object instance is bound to.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class TileUpdater extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITileUpdater

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITileUpdater.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies whether a tile can be updated through notifications.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.setting
     * @type {Integer} 
     */
    Setting {
        get => this.get_Setting()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Applies a change in content or appearance to the tile.
     * @param {TileNotification} notification_ The object that supplies the new XML definition for the tile's content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.update
     */
    Update(notification_) {
        if (!this.HasProp("__ITileUpdater")) {
            if ((queryResult := this.QueryInterface(ITileUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater := ITileUpdater(outPtr)
        }

        return this.__ITileUpdater.Update(notification_)
    }

    /**
     * Removes all updates and causes the tile to display its default content as declared in the app's manifest.
     * @remarks
     * > [!NOTE]
     * > This method does not stop periodic updates. If your tile is using periodic updates, you must also call [StopPeriodicUpdate](tileupdater_stopperiodicupdate_376301793.md) to prevent further updates.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.clear
     */
    Clear() {
        if (!this.HasProp("__ITileUpdater")) {
            if ((queryResult := this.QueryInterface(ITileUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater := ITileUpdater(outPtr)
        }

        return this.__ITileUpdater.Clear()
    }

    /**
     * Enables the tile to queue up to five notifications. This enables the notification queue on all tile sizes.
     * @remarks
     * When queuing is enabled, a maximum of five tile notifications can automatically cycle on the tile. Be careful about enabling cycling unless your app explicitly wants to use it, otherwise you can potentially have outdated notifications cycling through. Generally, the queue is FIFO (first in, first out), so that when it is full and a new notification arrives, the oldest notification is removed. However, notifications can be given a [Tag](tilenotification_tag.md), which allows a new notification with that same [Tag](tilenotification_tag.md) to replace its older notification in the queue, regardless of its position.
     * 
     * When your tile is based on a peek template, notification cycling is timed so that the full content is always shown before the tile cycles to the next notification.
     * 
     * As of Windows 8.1, you can also enable the notification queue for only specific tile sizes. See the following topics: 
     * + [EnableNotificationQueueForSquare150x150](tileupdater_enablenotificationqueueforsquare150x150_2087406043.md)
     * + [EnableNotificationQueueForSquare310x310](tileupdater_enablenotificationqueueforsquare310x310_2095794587.md)
     * + [EnableNotificationQueueForWide310x150](tileupdater_enablenotificationqueueforwide310x150_1310885892.md)
     * We recommend that you disable the notification queu when using a large tile with one of the following templates, which already show three notifications simultaneously. This avoids a tile that's distractingly busy to the user. In that case, you may want to use the size-specific enable methods instead of EnableNotificationQueue. 
     * + [TileSquare310x310SmallImagesAndTextList01](tiletemplatetype.md)
     * + [TileSquare310x310SmallImagesAndTextList02](tiletemplatetype.md)
     * + [TileSquare310x310SmallImagesAndTextList03](tiletemplatetype.md)
     * + [TileSquare310x310SmallImagesAndTextList04](tiletemplatetype.md)
     * + [TileSquare310x310TextList01](tiletemplatetype.md)
     * + [TileSquare310x310TextList02](tiletemplatetype.md)
     * + [TileSquare310x310TextList03](tiletemplatetype.md)
     * @param {Boolean} enable **True** to enable queuing; otherwise **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.enablenotificationqueue
     */
    EnableNotificationQueue(enable) {
        if (!this.HasProp("__ITileUpdater")) {
            if ((queryResult := this.QueryInterface(ITileUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater := ITileUpdater(outPtr)
        }

        return this.__ITileUpdater.EnableNotificationQueue(enable)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Setting() {
        if (!this.HasProp("__ITileUpdater")) {
            if ((queryResult := this.QueryInterface(ITileUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater := ITileUpdater(outPtr)
        }

        return this.__ITileUpdater.get_Setting()
    }

    /**
     * Adds a [ScheduledTileNotification](scheduledtilenotification.md) to the schedule.
     * @remarks
     * If your call to this method returns a failure code, examine these possible causes: 
     * + **Possible cause**: You've exceeded the maximum allowed number of scheduled notifications.
     * 
     * **Fix**: TileUpdater.addToSchedule will fail if you attempt to schedule more than 4096 notifications. Reduce your number of scheduled notifications.
     * + **Possible cause**: Your notification is scheduled for a time in the past relative to the current system clock time.
     * 
     * **Fix**: Make sure that the scheduled notification time is in the future. Examine the system clock time.
     * @param {ScheduledTileNotification} scheduledTile The scheduled tile update object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.addtoschedule
     */
    AddToSchedule(scheduledTile) {
        if (!this.HasProp("__ITileUpdater")) {
            if ((queryResult := this.QueryInterface(ITileUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater := ITileUpdater(outPtr)
        }

        return this.__ITileUpdater.AddToSchedule(scheduledTile)
    }

    /**
     * Removes an upcoming tile update from the schedule.
     * @param {ScheduledTileNotification} scheduledTile The notification to remove from the schedule.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.removefromschedule
     */
    RemoveFromSchedule(scheduledTile) {
        if (!this.HasProp("__ITileUpdater")) {
            if ((queryResult := this.QueryInterface(ITileUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater := ITileUpdater(outPtr)
        }

        return this.__ITileUpdater.RemoveFromSchedule(scheduledTile)
    }

    /**
     * Retrieves a list of scheduled updates to the tile.
     * @returns {IVectorView<ScheduledTileNotification>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.getscheduledtilenotifications
     */
    GetScheduledTileNotifications() {
        if (!this.HasProp("__ITileUpdater")) {
            if ((queryResult := this.QueryInterface(ITileUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater := ITileUpdater(outPtr)
        }

        return this.__ITileUpdater.GetScheduledTileNotifications()
    }

    /**
     * Begins a series of timed content changes for the tile that the updater is bound to, beginning immediately.
     * @param {Uri} tileContent The Uniform Resource Identifier (URI) from which the XML content of the tile update will be retrieved.
     * @param {Integer} requestedInterval The frequency with which the Uniform Resource Identifier (URI) is polled for new tile content, following the initial update at *startTime*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.startperiodicupdate
     */
    StartPeriodicUpdate(tileContent, requestedInterval) {
        if (!this.HasProp("__ITileUpdater")) {
            if ((queryResult := this.QueryInterface(ITileUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater := ITileUpdater(outPtr)
        }

        return this.__ITileUpdater.StartPeriodicUpdate(tileContent, requestedInterval)
    }

    /**
     * Begins a series of timed updates for the tile that the updater is bound to. Update content is retrieved from a specified Uniform Resource Identifier (URI). Updates begin at a specified time.
     * @param {Uri} tileContent The Uniform Resource Identifier (URI) from which the XML content of the tile update will be retrieved.
     * @param {DateTime} startTime The time at which the Uniform Resource Identifier (URI) should first be polled for new tile content.
     * @param {Integer} requestedInterval The frequency with which the Uniform Resource Identifier (URI) is polled for new tile content, following the initial update at *startTime*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.startperiodicupdate
     */
    StartPeriodicUpdateAtTime(tileContent, startTime, requestedInterval) {
        if (!this.HasProp("__ITileUpdater")) {
            if ((queryResult := this.QueryInterface(ITileUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater := ITileUpdater(outPtr)
        }

        return this.__ITileUpdater.StartPeriodicUpdateAtTime(tileContent, startTime, requestedInterval)
    }

    /**
     * Cancels the current series of timed updates for the tile that the updater is bound to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.stopperiodicupdate
     */
    StopPeriodicUpdate() {
        if (!this.HasProp("__ITileUpdater")) {
            if ((queryResult := this.QueryInterface(ITileUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater := ITileUpdater(outPtr)
        }

        return this.__ITileUpdater.StopPeriodicUpdate()
    }

    /**
     * Begins a series of timed updates that cycle on the tile that the updater is bound to. Update content is retrieved from an array of specified Uniform Resource Identifier (URI), the first update happening immediately and subsequent updates occurring at the periodic interval thereafter.
     * 
     * > [!NOTE]
     * > To use this feature, you must first enable the tile's notification queue by calling [EnableNotificationQueue](tileupdater_enablenotificationqueue_1798421599.md).
     * @param {IIterable<Uri>} tileContents An array of up to five Uniform Resource Identifier (URI) from which the XML content of the cycling tile updates will be retrieved. If the array contains more than five Uniform Resource Identifier (URI), the method will fail.
     * @param {Integer} requestedInterval The frequency with which the Uniform Resource Identifier (URI) is polled for new tile content, following the initial update at *startTime*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.startperiodicupdatebatch
     */
    StartPeriodicUpdateBatch(tileContents, requestedInterval) {
        if (!this.HasProp("__ITileUpdater")) {
            if ((queryResult := this.QueryInterface(ITileUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater := ITileUpdater(outPtr)
        }

        return this.__ITileUpdater.StartPeriodicUpdateBatch(tileContents, requestedInterval)
    }

    /**
     * Begins a series of timed updates that cycle on the tile that the updater is bound to. Update content is retrieved from an array of specified Uniform Resource Identifier (URI) with updates beginning at a specified time and subsequent updates occurring at the periodic interval thereafter.
     * 
     * > [!NOTE]
     * > To use this feature, you must first enable the tile's notification queue by calling [EnableNotificationQueue](tileupdater_enablenotificationqueue_1798421599.md).
     * @param {IIterable<Uri>} tileContents An array of up to five Uniform Resource Identifier (URI) from which the XML content of the cycling tile updates will be retrieved. If the array contains more than five Uniform Resource Identifier (URI), the method will fail.
     * @param {DateTime} startTime The time at which the initial Uniform Resource Identifier (URI) should first be polled for new content.
     * @param {Integer} requestedInterval The frequency with which the Uniform Resource Identifier (URI) is polled for new tile content, following the initial update at *startTime*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.startperiodicupdatebatch
     */
    StartPeriodicUpdateBatchAtTime(tileContents, startTime, requestedInterval) {
        if (!this.HasProp("__ITileUpdater")) {
            if ((queryResult := this.QueryInterface(ITileUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater := ITileUpdater(outPtr)
        }

        return this.__ITileUpdater.StartPeriodicUpdateBatchAtTime(tileContents, startTime, requestedInterval)
    }

    /**
     * Enables the tile to queue up to five notifications on the medium tile.
     * @param {Boolean} enable **True** to enable queuing on this tile size; otherwise **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.enablenotificationqueueforsquare150x150
     */
    EnableNotificationQueueForSquare150x150(enable) {
        if (!this.HasProp("__ITileUpdater2")) {
            if ((queryResult := this.QueryInterface(ITileUpdater2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater2 := ITileUpdater2(outPtr)
        }

        return this.__ITileUpdater2.EnableNotificationQueueForSquare150x150(enable)
    }

    /**
     * Enables the tile to queue up to five notifications on the wide tile.
     * @param {Boolean} enable **True** to enable queuing on this tile size; otherwise **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.enablenotificationqueueforwide310x150
     */
    EnableNotificationQueueForWide310x150(enable) {
        if (!this.HasProp("__ITileUpdater2")) {
            if ((queryResult := this.QueryInterface(ITileUpdater2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater2 := ITileUpdater2(outPtr)
        }

        return this.__ITileUpdater2.EnableNotificationQueueForWide310x150(enable)
    }

    /**
     * Enables the tile to queue up to five notifications on the large tile.
     * @remarks
     * We recommend that you disable the notification queu when using a large tile with one of the following templates, which already show three notifications simultaneously. This avoids a tile that's distractingly busy to the user. 
     * + [TileSquare310x310SmallImagesAndTextList01](tiletemplatetype.md)
     * + [TileSquare310x310SmallImagesAndTextList02](tiletemplatetype.md)
     * + [TileSquare310x310SmallImagesAndTextList03](tiletemplatetype.md)
     * + [TileSquare310x310SmallImagesAndTextList04](tiletemplatetype.md)
     * + [TileSquare310x310TextList01](tiletemplatetype.md)
     * + [TileSquare310x310TextList02](tiletemplatetype.md)
     * + [TileSquare310x310TextList03](tiletemplatetype.md)
     * @param {Boolean} enable **True** to enable queuing on this tile size; otherwise **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileupdater.enablenotificationqueueforsquare310x310
     */
    EnableNotificationQueueForSquare310x310(enable) {
        if (!this.HasProp("__ITileUpdater2")) {
            if ((queryResult := this.QueryInterface(ITileUpdater2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileUpdater2 := ITileUpdater2(outPtr)
        }

        return this.__ITileUpdater2.EnableNotificationQueueForSquare310x310(enable)
    }

;@endregion Instance Methods
}
