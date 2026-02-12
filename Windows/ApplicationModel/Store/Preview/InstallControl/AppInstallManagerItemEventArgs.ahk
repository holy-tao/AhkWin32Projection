#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppInstallManagerItemEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [ItemCompleted](appinstallmanager_itemcompleted.md) and [ItemStatusChanged](appinstallmanager_itemstatuschanged.md) events.
 * @remarks
 * An instance of this class is passed to the event handler that you implement for the [AppInstallManager.ItemCompleted](appinstallmanager_itemcompleted.md) and [AppInstallManager.ItemStatusChanged](appinstallmanager_itemstatuschanged.md) events.
 * 
 * > [!IMPORTANT]
 * > Access to this API is protected by a private capability that is restricted to apps that are developed by Microsoft.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanageritemeventargs
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class AppInstallManagerItemEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppInstallManagerItemEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppInstallManagerItemEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object that describes the app that has finished installing (for the [ItemCompleted](appinstallmanager_itemcompleted.md) event) or whose installation status has changed (for the [ItemStatusChanged](appinstallmanager_itemstatuschanged.md) event).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanageritemeventargs.item
     * @type {AppInstallItem} 
     */
    Item {
        get => this.get_Item()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppInstallItem} 
     */
    get_Item() {
        if (!this.HasProp("__IAppInstallManagerItemEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppInstallManagerItemEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManagerItemEventArgs := IAppInstallManagerItemEventArgs(outPtr)
        }

        return this.__IAppInstallManagerItemEventArgs.get_Item()
    }

;@endregion Instance Methods
}
