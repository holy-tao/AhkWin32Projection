#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITileFlyoutUpdateManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates [TileFlyoutUpdater](tileflyoutupdater.md) objects specific to an app's primary or secondary tile, for use with a tile flyout (mix view) notification. This class also enables you to retrieve a blank tile flyout XML template to which you can add your content to define the tile flyout notification.
  * 
  * This class is part of the following general API usage pattern: 
  * + Call [TileFlyoutUpdateManager.GetTemplateContent](tileflyoutupdatemanager_gettemplatecontent_739748376.md) to retrieve and fill in a blank tile flyout notification XML template
  * + Call the [TileFlyoutNotification](tileflyoutnotification_tileflyoutnotification_93177318.md) constructor to encapsulate the template content as a flyout notification
  * + Call one of the **TileFlyoutUpdateManager** methods to create a [TileFlyoutUpdater](tileflyoutupdater.md)
  * + Call [TileFlyoutUpdater.Update](tileflyoutupdater_update_298111616.md) to send the [TileFlyoutNotification](tileflyoutnotification.md) to the tile
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutupdatemanager
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class TileFlyoutUpdateManager extends IInspectable {
;@region Static Methods
    /**
     * Creates a new [TileFlyoutUpdater](tileflyoutupdater.md) object for a specified tile, for use with a tile flyout (mix view) notification. Because this method overload uses a tile ID, this tile can belong to another app in the same package as the calling app.
     * @returns {TileFlyoutUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutupdatemanager.createtileflyoutupdaterforapplication
     */
    static CreateTileFlyoutUpdaterForApplication() {
        if (!TileFlyoutUpdateManager.HasProp("__ITileFlyoutUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.TileFlyoutUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileFlyoutUpdateManagerStatics.IID)
            TileFlyoutUpdateManager.__ITileFlyoutUpdateManagerStatics := ITileFlyoutUpdateManagerStatics(factoryPtr)
        }

        return TileFlyoutUpdateManager.__ITileFlyoutUpdateManagerStatics.CreateTileFlyoutUpdaterForApplication()
    }

    /**
     * Creates a new [TileFlyoutUpdater](tileflyoutupdater.md) object for the calling app's tile, for use with a tile flyout (mix view) notification.
     * @param {HSTRING} applicationId 
     * @returns {TileFlyoutUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutupdatemanager.createtileflyoutupdaterforapplication
     */
    static CreateTileFlyoutUpdaterForApplicationWithId(applicationId) {
        if (!TileFlyoutUpdateManager.HasProp("__ITileFlyoutUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.TileFlyoutUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileFlyoutUpdateManagerStatics.IID)
            TileFlyoutUpdateManager.__ITileFlyoutUpdateManagerStatics := ITileFlyoutUpdateManagerStatics(factoryPtr)
        }

        return TileFlyoutUpdateManager.__ITileFlyoutUpdateManagerStatics.CreateTileFlyoutUpdaterForApplicationWithId(applicationId)
    }

    /**
     * Creates a new [TileFlyoutUpdater](tileflyoutupdater.md) object for one of an app's secondary tiles, for use with a tile flyout (mix view) notification.
     * @param {HSTRING} tileId The secondary tile's [ID](../windows.ui.startscreen/secondarytile_tileid.md), assigned to the secondary tile when it was created.
     * @returns {TileFlyoutUpdater} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutupdatemanager.createtileflyoutupdaterforsecondarytile
     */
    static CreateTileFlyoutUpdaterForSecondaryTile(tileId) {
        if (!TileFlyoutUpdateManager.HasProp("__ITileFlyoutUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.TileFlyoutUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileFlyoutUpdateManagerStatics.IID)
            TileFlyoutUpdateManager.__ITileFlyoutUpdateManagerStatics := ITileFlyoutUpdateManagerStatics(factoryPtr)
        }

        return TileFlyoutUpdateManager.__ITileFlyoutUpdateManagerStatics.CreateTileFlyoutUpdaterForSecondaryTile(tileId)
    }

    /**
     * Gets a blank XML template content that defines a tile flyout (mix view) notification. You can then fill in this template as needed, using Document Object Model (DOM)  API.
     * 
     * > [!NOTE]
     * > When you use the template retrieved through this method, you don't need to remove unused elements. They will be ignored.
     * @remarks
     * Because there is currently only one template, this method always fetches the following XML: 
     * 
     * ```xml
     * <tileflyout>
     *     <visual version="3">
     *         <binding template="TileFlyoutTemplate01">
     *             <subtile id="1" arguments="">
     *                 <image id="1" src=""/>
     *                 <text id="1"></text>
     *             </subtile>
     *             
     *             <subtile id="2" arguments="">
     *                 <image id="1" src=""/>
     *                 <text id="1"></text>
     *             </subtile>
     *             
     *             <subtile id="3" arguments="">
     *                 <image id="1" src=""/>
     *                 <text id="1"></text>
     *             </subtile>
     *             
     *             <subtile id="4" arguments="">
     *                 <image id="1" src=""/>
     *                 <text id="1"></text>
     *             </subtile>
     *             
     *             <subtile id="5" arguments="">
     *                 <image id="1" src=""/>
     *                 <text id="1"></text>
     *                 <text id="2"></text>
     *                 <text id="3"></text>
     *                 <text id="4"></text>
     *                 <text id="5"></text>
     *                 <text id="6"></text>
     *                 <text id="7"></text>
     *                 <text id="8"></text>
     *                 <text id="9"></text>
     *                 <text id="10"></text>
     *                 <text id="11"></text>
     *             </subtile>
     *             
     *             <subtile id="6" arguments="">
     *                 <image id="1" src=""/>
     *                 <text id="1"></text>
     *                 <text id="2"></text>
     *                 <text id="3"></text>
     *                 <text id="4"></text>
     *                 <text id="5"></text>
     *                 <text id="6"></text>
     *                 <text id="7"></text>
     *                 <text id="8"></text>
     *                 <text id="9"></text>
     *                 <text id="10"></text>
     *                 <text id="11"></text>
     *             </subtile>
     *             
     *             <subtile id="7" arguments="">
     *                 <image id="1" src=""/>
     *                 <text id="1"></text>
     *                 <text id="2"></text>
     *                 <text id="3"></text>
     *                 <text id="4"></text>
     *                 <text id="5"></text>
     *                 <text id="6"></text>
     *                 <text id="7"></text>
     *                 <text id="8"></text>
     *                 <text id="9"></text>
     *                 <text id="10"></text>
     *                 <text id="11"></text>
     *             </subtile>
     *             
     *             <subtile id="8" arguments="">
     *                 <image id="1" src=""/>
     *                 <text id="1"></text>
     *                 <text id="2"></text>
     *                 <text id="3"></text>
     *                 <text id="4"></text>
     *                 <text id="5"></text>
     *                 <text id="6"></text>
     *                 <text id="7"></text>
     *                 <text id="8"></text>
     *                 <text id="9"></text>
     *                 <text id="10"></text>
     *                 <text id="11"></text>
     *             </subtile>
     *         </binding>
     *     </visual>
     * </tileflyout>
     * ```
     * @param {Integer} type The specific template. At this time, the only valid value is **TileFlyoutTemplate01**.
     * @returns {XmlDocument} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.tileflyoutupdatemanager.gettemplatecontent
     */
    static GetTemplateContent(type) {
        if (!TileFlyoutUpdateManager.HasProp("__ITileFlyoutUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.TileFlyoutUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileFlyoutUpdateManagerStatics.IID)
            TileFlyoutUpdateManager.__ITileFlyoutUpdateManagerStatics := ITileFlyoutUpdateManagerStatics(factoryPtr)
        }

        return TileFlyoutUpdateManager.__ITileFlyoutUpdateManagerStatics.GetTemplateContent(type)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
