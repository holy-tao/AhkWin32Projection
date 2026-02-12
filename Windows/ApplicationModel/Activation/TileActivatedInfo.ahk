#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITileActivatedInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the tile that launched your app.
 * @remarks
 * This object is passed as an argument to [ILaunchActivatedEventArgs2](ilaunchactivatedeventargs2.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.tileactivatedinfo
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class TileActivatedInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITileActivatedInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITileActivatedInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the notifications that have been shown on the tile that activated your app from most recent to oldest. The first notification represents what was on the tile when the user clicked it. If the tile was blank, the list is empty.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.tileactivatedinfo.recentlyshownnotifications
     * @type {IVectorView<ShownTileNotification>} 
     */
    RecentlyShownNotifications {
        get => this.get_RecentlyShownNotifications()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<ShownTileNotification>} 
     */
    get_RecentlyShownNotifications() {
        if (!this.HasProp("__ITileActivatedInfo")) {
            if ((queryResult := this.QueryInterface(ITileActivatedInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileActivatedInfo := ITileActivatedInfo(outPtr)
        }

        return this.__ITileActivatedInfo.get_RecentlyShownNotifications()
    }

;@endregion Instance Methods
}
