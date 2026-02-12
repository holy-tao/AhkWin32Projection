#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastPlugInManager.ahk
#Include .\IAppBroadcastPlugInManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages app broadcast plugins.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpluginmanager
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastPlugInManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastPlugInManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastPlugInManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default plugin for app broadcast.
     * @returns {AppBroadcastPlugInManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpluginmanager.getdefault
     */
    static GetDefault() {
        if (!AppBroadcastPlugInManager.HasProp("__IAppBroadcastPlugInManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.AppBroadcastPlugInManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBroadcastPlugInManagerStatics.IID)
            AppBroadcastPlugInManager.__IAppBroadcastPlugInManagerStatics := IAppBroadcastPlugInManagerStatics(factoryPtr)
        }

        return AppBroadcastPlugInManager.__IAppBroadcastPlugInManagerStatics.GetDefault()
    }

    /**
     * Gets the app broadcast plugin associated with the specified user.
     * @param {User} user_ The user for which the app broadcast plugin should be retrieved.
     * @returns {AppBroadcastPlugInManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpluginmanager.getforuser
     */
    static GetForUser(user_) {
        if (!AppBroadcastPlugInManager.HasProp("__IAppBroadcastPlugInManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.AppBroadcastPlugInManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBroadcastPlugInManagerStatics.IID)
            AppBroadcastPlugInManager.__IAppBroadcastPlugInManagerStatics := IAppBroadcastPlugInManagerStatics(factoryPtr)
        }

        return AppBroadcastPlugInManager.__IAppBroadcastPlugInManagerStatics.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value indicating if the broadcast provider is available.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpluginmanager.isbroadcastprovideravailable
     * @type {Boolean} 
     */
    IsBroadcastProviderAvailable {
        get => this.get_IsBroadcastProviderAvailable()
    }

    /**
     * Gets a read-only list of all app broadcast plugins.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpluginmanager.pluginlist
     * @type {IVectorView<AppBroadcastPlugIn>} 
     */
    PlugInList {
        get => this.get_PlugInList()
    }

    /**
     * Gets or sets the default app broadcast plugin.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpluginmanager.defaultplugin
     * @type {AppBroadcastPlugIn} 
     */
    DefaultPlugIn {
        get => this.get_DefaultPlugIn()
        set => this.put_DefaultPlugIn(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBroadcastProviderAvailable() {
        if (!this.HasProp("__IAppBroadcastPlugInManager")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPlugInManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPlugInManager := IAppBroadcastPlugInManager(outPtr)
        }

        return this.__IAppBroadcastPlugInManager.get_IsBroadcastProviderAvailable()
    }

    /**
     * 
     * @returns {IVectorView<AppBroadcastPlugIn>} 
     */
    get_PlugInList() {
        if (!this.HasProp("__IAppBroadcastPlugInManager")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPlugInManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPlugInManager := IAppBroadcastPlugInManager(outPtr)
        }

        return this.__IAppBroadcastPlugInManager.get_PlugInList()
    }

    /**
     * 
     * @returns {AppBroadcastPlugIn} 
     */
    get_DefaultPlugIn() {
        if (!this.HasProp("__IAppBroadcastPlugInManager")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPlugInManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPlugInManager := IAppBroadcastPlugInManager(outPtr)
        }

        return this.__IAppBroadcastPlugInManager.get_DefaultPlugIn()
    }

    /**
     * 
     * @param {AppBroadcastPlugIn} value 
     * @returns {HRESULT} 
     */
    put_DefaultPlugIn(value) {
        if (!this.HasProp("__IAppBroadcastPlugInManager")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPlugInManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPlugInManager := IAppBroadcastPlugInManager(outPtr)
        }

        return this.__IAppBroadcastPlugInManager.put_DefaultPlugIn(value)
    }

;@endregion Instance Methods
}
