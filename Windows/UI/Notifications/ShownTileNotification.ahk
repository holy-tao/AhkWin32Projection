#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IShownTileNotification.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides info about a tile notification that was displayed in the **Start** menu.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.showntilenotification
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ShownTileNotification extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShownTileNotification

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShownTileNotification.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the arguments from the notification’s XML payload for the tile size that was displayed, or an empty string if there were no arguments provided for that size.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.showntilenotification.arguments
     * @type {HSTRING} 
     */
    Arguments {
        get => this.get_Arguments()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Arguments() {
        if (!this.HasProp("__IShownTileNotification")) {
            if ((queryResult := this.QueryInterface(IShownTileNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShownTileNotification := IShownTileNotification(outPtr)
        }

        return this.__IShownTileNotification.get_Arguments()
    }

;@endregion Instance Methods
}
