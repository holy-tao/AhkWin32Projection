#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProjectionManagerStatics2.ahk
#Include .\IProjectionManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines a set of methods for managing the windows (app views) sent to secondary displays, such as projectors.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.projectionmanager
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ProjectionManager extends IInspectable {
;@region Static Properties
    /**
     * Gets whether or not a projection display is available to use.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.projectionmanager.projectiondisplayavailable
     * @type {Boolean} 
     */
    static ProjectionDisplayAvailable {
        get => ProjectionManager.get_ProjectionDisplayAvailable()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously sends a window (app view) to the projector or other secondary display.
     * @remarks
     * If this method succeeds, an existing window (app view) is placed on a secondary display, if one is detected. Otherwise, the window is placed on the primary display. This window can only be accessed from an ASTA UI thread.
     * 
     * The moved window has its own ASTA UI thread and associated [CoreWindow](../windows.ui.core/corewindow.md). Always use thread-safe methods, such as [window.postMessage](https://developer.mozilla.org/en-US/docs/Web/API/Worker/postMessage) for JavaScript apps or the [CoreDispatcher](../windows.ui.core/coredispatcher.md) event messaging API for C# and C++ apps, when communicating between the windows.
     * 
     * Either the current app view window or the projection view window must be active for this call to succeed. The view ID can be obtained for the current app view with [ApplicationView.Id](applicationview_id.md). For a specific app view managed by the app, call [ApplicationView.GetApplicationViewIdForWindow](applicationview_getapplicationviewidforwindow_543884123.md) with the [CoreWindow](../windows.ui.core/corewindow.md) for the app view.
     * @param {Integer} projectionViewId The new ID of the window to be displayed by the projector or other secondary display.
     * @param {Integer} anchorViewId The ID of the original window before projection.
     * @param {DeviceInformation} displayDeviceInfo 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.projectionmanager.startprojectingasync
     */
    static StartProjectingWithDeviceInfoAsync(projectionViewId, anchorViewId, displayDeviceInfo) {
        if (!ProjectionManager.HasProp("__IProjectionManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ProjectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProjectionManagerStatics2.IID)
            ProjectionManager.__IProjectionManagerStatics2 := IProjectionManagerStatics2(factoryPtr)
        }

        return ProjectionManager.__IProjectionManagerStatics2.StartProjectingWithDeviceInfoAsync(projectionViewId, anchorViewId, displayDeviceInfo)
    }

    /**
     * Makes a request to asynchronously sends a window (app view) to the projector or other secondary display with the specified preferred placement.
     * @param {Integer} projectionViewId The new ID of the window to be displayed by the projector or other secondary display.
     * @param {Integer} anchorViewId The ID of the original window before projection.
     * @param {RECT} selection The area to one side of which the flyout is displayed.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.projectionmanager.requeststartprojectingasync
     */
    static RequestStartProjectingAsync(projectionViewId, anchorViewId, selection) {
        if (!ProjectionManager.HasProp("__IProjectionManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ProjectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProjectionManagerStatics2.IID)
            ProjectionManager.__IProjectionManagerStatics2 := IProjectionManagerStatics2(factoryPtr)
        }

        return ProjectionManager.__IProjectionManagerStatics2.RequestStartProjectingAsync(projectionViewId, anchorViewId, selection)
    }

    /**
     * Makes a request to asynchronously sends a window (app view) to the projector or other secondary display.
     * @param {Integer} projectionViewId The new ID of the window to be displayed by the projector or other secondary display.
     * @param {Integer} anchorViewId The ID of the original window before projection.
     * @param {RECT} selection The area to one side of which the flyout is displayed.
     * @param {Integer} prefferedPlacement 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.projectionmanager.requeststartprojectingasync
     */
    static RequestStartProjectingWithPlacementAsync(projectionViewId, anchorViewId, selection, prefferedPlacement) {
        if (!ProjectionManager.HasProp("__IProjectionManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ProjectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProjectionManagerStatics2.IID)
            ProjectionManager.__IProjectionManagerStatics2 := IProjectionManagerStatics2(factoryPtr)
        }

        return ProjectionManager.__IProjectionManagerStatics2.RequestStartProjectingWithPlacementAsync(projectionViewId, anchorViewId, selection, prefferedPlacement)
    }

    /**
     * Returns a string that is used to enumerate device services.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.projectionmanager.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!ProjectionManager.HasProp("__IProjectionManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ProjectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProjectionManagerStatics2.IID)
            ProjectionManager.__IProjectionManagerStatics2 := IProjectionManagerStatics2(factoryPtr)
        }

        return ProjectionManager.__IProjectionManagerStatics2.GetDeviceSelector()
    }

    /**
     * Asynchronously sends a window (app view) to the projector or other secondary display, and provides info about the display.
     * @remarks
     * If this method succeeds, an existing window (app view) is placed on a secondary display, if one is detected. Otherwise, the window is placed on the primary display. This window can only be accessed from an ASTA UI thread.
     * 
     * The moved window has its own ASTA UI thread and associated [CoreWindow](../windows.ui.core/corewindow.md). Always use thread-safe methods, such as [window.postMessage](https://developer.mozilla.org/en-US/docs/Web/API/Worker/postMessage) for JavaScript apps or the [CoreDispatcher](../windows.ui.core/coredispatcher.md) event messaging API for C# and C++ apps, when communicating between the windows.
     * 
     * Either the current app view window or the projection view window must be active for this call to succeed. The view ID can be obtained for the current app view with [ApplicationView.Id](applicationview_id.md). For a specific app view managed by the app, call [ApplicationView.GetApplicationViewIdForWindow](applicationview_getapplicationviewidforwindow_543884123.md) with the [CoreWindow](../windows.ui.core/corewindow.md) for the app view.
     * @param {Integer} projectionViewId The new ID of the window to be displayed by the projector or other secondary display.
     * @param {Integer} anchorViewId The ID of the original window before projection.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.projectionmanager.startprojectingasync
     */
    static StartProjectingAsync(projectionViewId, anchorViewId) {
        if (!ProjectionManager.HasProp("__IProjectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ProjectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProjectionManagerStatics.IID)
            ProjectionManager.__IProjectionManagerStatics := IProjectionManagerStatics(factoryPtr)
        }

        return ProjectionManager.__IProjectionManagerStatics.StartProjectingAsync(projectionViewId, anchorViewId)
    }

    /**
     * Asynchronously swaps the calling window (app view) with the window displayed on the projector or other secondary display. The result is that the calling window is displayed on the projector, and the formerly projected window is displayed on the device screen.
     * @param {Integer} projectionViewId The ID of the window currently displayed by the projector.
     * @param {Integer} anchorViewId The ID of the window to swap with the projected window.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.projectionmanager.swapdisplaysforviewsasync
     */
    static SwapDisplaysForViewsAsync(projectionViewId, anchorViewId) {
        if (!ProjectionManager.HasProp("__IProjectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ProjectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProjectionManagerStatics.IID)
            ProjectionManager.__IProjectionManagerStatics := IProjectionManagerStatics(factoryPtr)
        }

        return ProjectionManager.__IProjectionManagerStatics.SwapDisplaysForViewsAsync(projectionViewId, anchorViewId)
    }

    /**
     * Asynchronously hides a window (app view) displayed by a projector or other secondary display.
     * @param {Integer} projectionViewId The ID of the window currently displayed by the projector or other secondary display.
     * @param {Integer} anchorViewId The ID of the original window before projection.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.projectionmanager.stopprojectingasync
     */
    static StopProjectingAsync(projectionViewId, anchorViewId) {
        if (!ProjectionManager.HasProp("__IProjectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ProjectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProjectionManagerStatics.IID)
            ProjectionManager.__IProjectionManagerStatics := IProjectionManagerStatics(factoryPtr)
        }

        return ProjectionManager.__IProjectionManagerStatics.StopProjectingAsync(projectionViewId, anchorViewId)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_ProjectionDisplayAvailable() {
        if (!ProjectionManager.HasProp("__IProjectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ProjectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProjectionManagerStatics.IID)
            ProjectionManager.__IProjectionManagerStatics := IProjectionManagerStatics(factoryPtr)
        }

        return ProjectionManager.__IProjectionManagerStatics.get_ProjectionDisplayAvailable()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_ProjectionDisplayAvailableChanged(handler) {
        if (!ProjectionManager.HasProp("__IProjectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ProjectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProjectionManagerStatics.IID)
            ProjectionManager.__IProjectionManagerStatics := IProjectionManagerStatics(factoryPtr)
        }

        return ProjectionManager.__IProjectionManagerStatics.add_ProjectionDisplayAvailableChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_ProjectionDisplayAvailableChanged(token) {
        if (!ProjectionManager.HasProp("__IProjectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ProjectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProjectionManagerStatics.IID)
            ProjectionManager.__IProjectionManagerStatics := IProjectionManagerStatics(factoryPtr)
        }

        return ProjectionManager.__IProjectionManagerStatics.remove_ProjectionDisplayAvailableChanged(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
