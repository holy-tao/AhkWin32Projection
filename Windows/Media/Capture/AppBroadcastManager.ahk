#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to global broadcast settings for the current device and broadcast provider settings.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastmanager
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastManager extends IInspectable {
;@region Static Methods
    /**
     * Gets an object that exposes the global broadcast settings for the current device.
     * @returns {AppBroadcastGlobalSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastmanager.getglobalsettings
     */
    static GetGlobalSettings() {
        if (!AppBroadcastManager.HasProp("__IAppBroadcastManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.AppBroadcastManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBroadcastManagerStatics.IID)
            AppBroadcastManager.__IAppBroadcastManagerStatics := IAppBroadcastManagerStatics(factoryPtr)
        }

        return AppBroadcastManager.__IAppBroadcastManagerStatics.GetGlobalSettings()
    }

    /**
     * Updates the global broadcast settings for the current device.
     * @param {AppBroadcastGlobalSettings} value An object that exposes the global broadcast settings for the current device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastmanager.applyglobalsettings
     */
    static ApplyGlobalSettings(value) {
        if (!AppBroadcastManager.HasProp("__IAppBroadcastManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.AppBroadcastManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBroadcastManagerStatics.IID)
            AppBroadcastManager.__IAppBroadcastManagerStatics := IAppBroadcastManagerStatics(factoryPtr)
        }

        return AppBroadcastManager.__IAppBroadcastManagerStatics.ApplyGlobalSettings(value)
    }

    /**
     * Gets an object that exposes broadcast provider settings.
     * @returns {AppBroadcastProviderSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastmanager.getprovidersettings
     */
    static GetProviderSettings() {
        if (!AppBroadcastManager.HasProp("__IAppBroadcastManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.AppBroadcastManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBroadcastManagerStatics.IID)
            AppBroadcastManager.__IAppBroadcastManagerStatics := IAppBroadcastManagerStatics(factoryPtr)
        }

        return AppBroadcastManager.__IAppBroadcastManagerStatics.GetProviderSettings()
    }

    /**
     * Updates the broadcast provider settings.
     * @param {AppBroadcastProviderSettings} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastmanager.applyprovidersettings
     */
    static ApplyProviderSettings(value) {
        if (!AppBroadcastManager.HasProp("__IAppBroadcastManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.AppBroadcastManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBroadcastManagerStatics.IID)
            AppBroadcastManager.__IAppBroadcastManagerStatics := IAppBroadcastManagerStatics(factoryPtr)
        }

        return AppBroadcastManager.__IAppBroadcastManagerStatics.ApplyProviderSettings(value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
