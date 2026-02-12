#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITileFlyoutUpdater.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to send or clear a tile flyout (mix view) notification. This class also provides methods to start and stop [periodic](/previous-versions/windows/apps/jj150587(v=win.10)) tile flyout notifications.
  * 
  * This class is part of the following general API usage pattern: 
  * + Call [TileFlyoutUpdateManager.GetTemplateContent](tileflyoutupdatemanager_gettemplatecontent_739748376.md) to retrieve and fill in a blank tile flyout notification XML template
  * + Call the [TileFlyoutNotification](tileflyoutnotification_tileflyoutnotification_93177318.md) constructor to encapsulate the template content as a flyout notification
  * + Call one of the [TileFlyoutUpdateManager](tileflyoutupdatemanager.md) methods to create a TileFlyoutUpdater
  * + Call [TileFlyoutUpdater.Update](tileflyoutupdater_update_298111616.md) to send the [TileFlyoutNotification](tileflyoutnotification.md) to the tile
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutupdater
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class TileFlyoutUpdater extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITileFlyoutUpdater

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITileFlyoutUpdater.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies whether a tile's flyout can be updated through notifications.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutupdater.setting
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
     * Sends a new tile flyout (mix view) notification to the primary or secondary tile associated with the updater.
     * 
     * > [!NOTE]
     * > Sending a tile flyout notification to a device that does not support hover causes an exception to be thrown. Always verify the device's hover capability before you call this method.
     * @param {TileFlyoutNotification} notification_ The notification object that supplies the new content for the tile's flyout.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutupdater.update
     */
    Update(notification_) {
        if (!this.HasProp("__ITileFlyoutUpdater")) {
            if ((queryResult := this.QueryInterface(ITileFlyoutUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileFlyoutUpdater := ITileFlyoutUpdater(outPtr)
        }

        return this.__ITileFlyoutUpdater.Update(notification_)
    }

    /**
     * Removes the current tile flyout (mix view) notification. A tile flyout notification does not have a default expiration time, so unless one is set explicitly through [TileFlyoutNotification.ExpirationTime](tileflyoutnotification_expirationtime.md), this method is the only way to remove the flyout.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutupdater.clear
     */
    Clear() {
        if (!this.HasProp("__ITileFlyoutUpdater")) {
            if ((queryResult := this.QueryInterface(ITileFlyoutUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileFlyoutUpdater := ITileFlyoutUpdater(outPtr)
        }

        return this.__ITileFlyoutUpdater.Clear()
    }

    /**
     * Launches a series of [periodic](/previous-versions/windows/apps/jj150587(v=win.10)) updates for a tile flyout (mix view) notification, beginning with an immediate update when the method is called. Update content is retrieved from a specified Uniform Resource Identifier (URI).
     * @param {Uri} tileFlyoutContent The Uniform Resource Identifier (URI) from which the XML content of the tile flyout update is retrieved.
     * @param {Integer} requestedInterval The frequency with which the Uniform Resource Identifier (URI) is polled for new content, following the initial update.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutupdater.startperiodicupdate
     */
    StartPeriodicUpdate(tileFlyoutContent, requestedInterval) {
        if (!this.HasProp("__ITileFlyoutUpdater")) {
            if ((queryResult := this.QueryInterface(ITileFlyoutUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileFlyoutUpdater := ITileFlyoutUpdater(outPtr)
        }

        return this.__ITileFlyoutUpdater.StartPeriodicUpdate(tileFlyoutContent, requestedInterval)
    }

    /**
     * Launches a series of [periodic](/previous-versions/windows/apps/jj150587(v=win.10)) updates for a tile flyout (mix view) notification, beginning at a specified time. Update content is retrieved from a specified Uniform Resource Identifier (URI).
     * @param {Uri} tileFlyoutContent The Uniform Resource Identifier (URI) from which the XML content of the tile flyout update is retrieved.
     * @param {DateTime} startTime The date and time at which the Uniform Resource Identifier (URI) should first be polled for new content.
     * @param {Integer} requestedInterval The frequency with which the Uniform Resource Identifier (URI) is polled for new content, following the initial update at *startTime*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutupdater.startperiodicupdate
     */
    StartPeriodicUpdateAtTime(tileFlyoutContent, startTime, requestedInterval) {
        if (!this.HasProp("__ITileFlyoutUpdater")) {
            if ((queryResult := this.QueryInterface(ITileFlyoutUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileFlyoutUpdater := ITileFlyoutUpdater(outPtr)
        }

        return this.__ITileFlyoutUpdater.StartPeriodicUpdateAtTime(tileFlyoutContent, startTime, requestedInterval)
    }

    /**
     * Cancels the current series of [periodic](/previous-versions/windows/apps/jj150587(v=win.10)) tile flyout (mix view) notification updates for the primary or secondary tile associated with the updater.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutupdater.stopperiodicupdate
     */
    StopPeriodicUpdate() {
        if (!this.HasProp("__ITileFlyoutUpdater")) {
            if ((queryResult := this.QueryInterface(ITileFlyoutUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileFlyoutUpdater := ITileFlyoutUpdater(outPtr)
        }

        return this.__ITileFlyoutUpdater.StopPeriodicUpdate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Setting() {
        if (!this.HasProp("__ITileFlyoutUpdater")) {
            if ((queryResult := this.QueryInterface(ITileFlyoutUpdater.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileFlyoutUpdater := ITileFlyoutUpdater(outPtr)
        }

        return this.__ITileFlyoutUpdater.get_Setting()
    }

;@endregion Instance Methods
}
