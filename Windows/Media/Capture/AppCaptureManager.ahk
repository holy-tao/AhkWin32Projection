#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCaptureManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to app capture settings.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemanager
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureManager extends IInspectable {
;@region Static Methods
    /**
     * Gets the current app capture settings.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {AppCaptureSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemanager.getcurrentsettings
     */
    static GetCurrentSettings() {
        if (!AppCaptureManager.HasProp("__IAppCaptureManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.AppCaptureManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppCaptureManagerStatics.IID)
            AppCaptureManager.__IAppCaptureManagerStatics := IAppCaptureManagerStatics(factoryPtr)
        }

        return AppCaptureManager.__IAppCaptureManagerStatics.GetCurrentSettings()
    }

    /**
     * Applies app capture settings.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {AppCaptureSettings} appCaptureSettings_ The settings to apply.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemanager.applysettings
     */
    static ApplySettings(appCaptureSettings_) {
        if (!AppCaptureManager.HasProp("__IAppCaptureManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.AppCaptureManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppCaptureManagerStatics.IID)
            AppCaptureManager.__IAppCaptureManagerStatics := IAppCaptureManagerStatics(factoryPtr)
        }

        return AppCaptureManager.__IAppCaptureManagerStatics.ApplySettings(appCaptureSettings_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
