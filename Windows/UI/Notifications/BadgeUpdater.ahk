#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBadgeUpdater.ahk
#Include ..\..\..\Guid.ahk

/**
 * Updates a badge overlay on the specific tile that the updater is bound to.
 * @remarks
 * To get an instance of this object, call the [BadgeUpdateManager.CreateBadgeUpdaterForApplication](badgeupdatemanager_createbadgeupdaterforapplication_1263267855.md) or [BadgeUpdateManager.CreateBadgeUpdaterForSecondaryTile](badgeupdatemanager_createbadgeupdaterforsecondarytile_131286133.md) method.
 * 
 * When it is created, BadgeUpdater is bound to a specific app or secondary tile, so the methods of this class affect only the single tile that the object instance is bound to.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdater
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class BadgeUpdater extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBadgeUpdater

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBadgeUpdater.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Applies a change to the badge's glyph or number.
     * @param {BadgeNotification} notification_ The object that supplies the new XML definition for the badge.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdater.update
     */
    Update(notification_) {
        if (!this.HasProp("__IBadgeUpdater")) {
            if ((queryResult := this.QueryInterface(IBadgeUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBadgeUpdater := IBadgeUpdater(outPtr)
        }

        return this.__IBadgeUpdater.Update(notification_)
    }

    /**
     * Removes the badge from the tile that the updater is bound to.
     * @remarks
     * The badge can also be cleared by setting the badge value to "0" or "none".
     * 
     * > [!NOTE]
     * > If your badge is using periodic updates, you must also call [StopPeriodicUpdate](badgeupdater_stopperiodicupdate_376301793.md) or the badge will reappear at the next polling interval.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdater.clear
     */
    Clear() {
        if (!this.HasProp("__IBadgeUpdater")) {
            if ((queryResult := this.QueryInterface(IBadgeUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBadgeUpdater := IBadgeUpdater(outPtr)
        }

        return this.__IBadgeUpdater.Clear()
    }

    /**
     * Begins a series of timed updates for the badge from a web resource that the updater is bound to, beginning immediately. Note that only web resources (http/https) are allowed in a periodic update.
     * @param {Uri} badgeContent The Uniform Resource Identifier (URI) from which the XML content of the badge update will be retrieved.
     * @param {Integer} requestedInterval The frequency with which the Uniform Resource Identifier (URI) is polled for new badge content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdater.startperiodicupdate
     */
    StartPeriodicUpdate(badgeContent, requestedInterval) {
        if (!this.HasProp("__IBadgeUpdater")) {
            if ((queryResult := this.QueryInterface(IBadgeUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBadgeUpdater := IBadgeUpdater(outPtr)
        }

        return this.__IBadgeUpdater.StartPeriodicUpdate(badgeContent, requestedInterval)
    }

    /**
     * Begins a series of timed updates for the badge from a web resource that the updater is bound to. Updates begin at a specified time. Note that only web resources (http/https) are allowed in a periodic update.
     * @param {Uri} badgeContent The Uniform Resource Identifier (URI) from which the XML content of the badge update will be retrieved.
     * @param {DateTime} startTime The time at which the Uniform Resource Identifier (URI) should first be polled for new badge content.
     * @param {Integer} requestedInterval The frequency with which the Uniform Resource Identifier (URI) is polled for new badge content, following the initial update at *startTime*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdater.startperiodicupdate
     */
    StartPeriodicUpdateAtTime(badgeContent, startTime, requestedInterval) {
        if (!this.HasProp("__IBadgeUpdater")) {
            if ((queryResult := this.QueryInterface(IBadgeUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBadgeUpdater := IBadgeUpdater(outPtr)
        }

        return this.__IBadgeUpdater.StartPeriodicUpdateAtTime(badgeContent, startTime, requestedInterval)
    }

    /**
     * Cancels the current series of timed updates for the badge that the updater is bound to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.badgeupdater.stopperiodicupdate
     */
    StopPeriodicUpdate() {
        if (!this.HasProp("__IBadgeUpdater")) {
            if ((queryResult := this.QueryInterface(IBadgeUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBadgeUpdater := IBadgeUpdater(outPtr)
        }

        return this.__IBadgeUpdater.StopPeriodicUpdate()
    }

;@endregion Instance Methods
}
