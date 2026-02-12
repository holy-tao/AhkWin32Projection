#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastOcclusionManagerPreviewStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a preview API for requesting that the OS apply a vertical offset when displaying app notifications, to avoid obscuring the UI of the calling app.
  * 
  * > [!IMPORTANT]
  * > The **Windows.UI.Notifications.Preview.ToastOcclusionManagerPreview** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * This API is being released as a preview to enable testing of the feature by enterprise customers. This API is likely to be removed and/or modified in a future release. Before using the API, apps should call [LimitedAccessFeatures.TryUnlockFeature](/uwp/api/windows.applicationmodel.limitedaccessfeatures.tryunlockfeature), passing in the feature ID and app token provided by Microsoft, to verify that the app is authorized to use the API. Calls by unauthorized apps will have no effect.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.preview.toastocclusionmanagerpreview
 * @namespace Windows.UI.Notifications.Preview
 * @version WindowsRuntime 1.4
 */
class ToastOcclusionManagerPreview extends IInspectable {
;@region Static Methods
    /**
     * Requests that the OS display app notifications with the specified vertical offset, in view pixels, in order to avoid the notification occluding content in the specified window.
     * 
     * > [!IMPORTANT]
     * > The **ToastOcclusionManagerPreview.SetToastWindowMargin** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * This API is being released as a preview to enable testing of the feature by enterprise customers. This API is likely to be removed and/or modified in a future release. Before using the API, apps should call [LimitedAccessFeatures.TryUnlockFeature](/uwp/api/windows.applicationmodel.limitedaccessfeatures.tryunlockfeature), passing in the feature ID and app token provided by Microsoft, to verify that the app is authorized to use the API. Calls by unauthorized apps will have no effect.
     * 
     * The following example code demonstrates how to check for the availability of **SetToastWindowMargin** for the calling app and, if it is available, call the API to request that app notifications be shifted up by 90 pixels. These calls should be made during app launch.
     * @param {WindowId} appWindowId The **WindowId** of the window for associated with the notification offset request. For the offset to be applied, the specified window must be maximized, in focus, on the primary screen, and the onscreen keyboard must not be visible.
     * @param {Float} margin The vertical offset with which app notifications are displayed, in view pixels. The current maximum value for the margin is 180 pixels. Requests for margins greater than 180 pixels will succeed, but will be clamped to 180 pixels. If a negative value is specified, it is clamped to 0.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.preview.toastocclusionmanagerpreview.settoastwindowmargin
     */
    static SetToastWindowMargin(appWindowId, margin) {
        if (!ToastOcclusionManagerPreview.HasProp("__IToastOcclusionManagerPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.Preview.ToastOcclusionManagerPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToastOcclusionManagerPreviewStatics.IID)
            ToastOcclusionManagerPreview.__IToastOcclusionManagerPreviewStatics := IToastOcclusionManagerPreviewStatics(factoryPtr)
        }

        return ToastOcclusionManagerPreview.__IToastOcclusionManagerPreviewStatics.SetToastWindowMargin(appWindowId, margin)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
