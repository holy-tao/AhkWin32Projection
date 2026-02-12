#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationViewSwitcherStatics2.ahk
#Include .\IApplicationViewSwitcherStatics3.ahk
#Include .\IApplicationViewSwitcherStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the app view switching behaviors for an app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitcher
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ApplicationViewSwitcher extends IInspectable {
;@region Static Methods
    /**
     * Disables Windows shell control of the view selection on activation, and lets the app handle it instead.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitcher.disablesystemviewactivationpolicy
     */
    static DisableSystemViewActivationPolicy() {
        if (!ApplicationViewSwitcher.HasProp("__IApplicationViewSwitcherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewSwitcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewSwitcherStatics2.IID)
            ApplicationViewSwitcher.__IApplicationViewSwitcherStatics2 := IApplicationViewSwitcherStatics2(factoryPtr)
        }

        return ApplicationViewSwitcher.__IApplicationViewSwitcherStatics2.DisableSystemViewActivationPolicy()
    }

    /**
     * Displays a view as a standalone view in the desired view mode with the specified options.
     * @remarks
     * If this method succeeds, a new window is created next to the original window. It can only be called from an ASTA (core UI) thread.
     * 
     * The new window has its own UI thread (ASTA) and associated [CoreWindow](../windows.ui.core/corewindow.md). Developers should use thread-safe methods for communication between the windows, such as **window.postMessage** for JavaScript apps and the [CoreDispatcher](../windows.ui.core/coredispatcher.md) ([CoreWindow.Dispatcher](../windows.ui.core/corewindow_dispatcher.md)) messaging for C# and C++ developers.
     * @param {Integer} viewId The ID of the window to display.
     * @param {Integer} viewMode The desired view mode for the window.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitcher.tryshowasviewmodeasync
     */
    static TryShowAsViewModeAsync(viewId, viewMode) {
        if (!ApplicationViewSwitcher.HasProp("__IApplicationViewSwitcherStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewSwitcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewSwitcherStatics3.IID)
            ApplicationViewSwitcher.__IApplicationViewSwitcherStatics3 := IApplicationViewSwitcherStatics3(factoryPtr)
        }

        return ApplicationViewSwitcher.__IApplicationViewSwitcherStatics3.TryShowAsViewModeAsync(viewId, viewMode)
    }

    /**
     * Displays a view as a standalone view in the desired view mode.
     * @remarks
     * If this method succeeds, a new window is created next to the original window. It can only be called from an ASTA (core UI) thread.
     * 
     * The new window has its own UI thread (ASTA) and associated [CoreWindow](../windows.ui.core/corewindow.md). Developers should use thread-safe methods for communication between the windows, such as **window.postMessage** for JavaScript apps and the [CoreDispatcher](../windows.ui.core/coredispatcher.md) ([CoreWindow.Dispatcher](../windows.ui.core/corewindow_dispatcher.md)) messaging for C# and C++ developers.
     * @param {Integer} viewId The ID of the window to display.
     * @param {Integer} viewMode The desired view mode for the window.
     * @param {ViewModePreferences} viewModePreferences_ 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitcher.tryshowasviewmodeasync
     */
    static TryShowAsViewModeWithPreferencesAsync(viewId, viewMode, viewModePreferences_) {
        if (!ApplicationViewSwitcher.HasProp("__IApplicationViewSwitcherStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewSwitcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewSwitcherStatics3.IID)
            ApplicationViewSwitcher.__IApplicationViewSwitcherStatics3 := IApplicationViewSwitcherStatics3(factoryPtr)
        }

        return ApplicationViewSwitcher.__IApplicationViewSwitcherStatics3.TryShowAsViewModeWithPreferencesAsync(viewId, viewMode, viewModePreferences_)
    }

    /**
     * Disables the primary window (app view) when the app is activated, showing the most recently displayed window instead.
     * @remarks
     * By default, the app object displays the main window of the app when it is first activated. This method forces the app to display the most recently displayed window upon subsequent activations. Note that the app must call this method before completing the first non-hosted activation, and the app must also only call [CoreWindow.Activate](../windows.ui.core/icorewindow_activate_1797342875.md) for hosted activations from the UI thread of the displayed window.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitcher.disableshowingmainviewonactivation
     */
    static DisableShowingMainViewOnActivation() {
        if (!ApplicationViewSwitcher.HasProp("__IApplicationViewSwitcherStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewSwitcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewSwitcherStatics.IID)
            ApplicationViewSwitcher.__IApplicationViewSwitcherStatics := IApplicationViewSwitcherStatics(factoryPtr)
        }

        return ApplicationViewSwitcher.__IApplicationViewSwitcherStatics.DisableShowingMainViewOnActivation()
    }

    /**
     * Displays another window (app view) for the app on the screen, adjacent to the original window
     * @remarks
     * If this method succeeds, a new window is created next to the original window. It can only be called from an ASTA (core UI) thread.
     * 
     * The new window has its own UI thread (ASTA) and associated [CoreWindow](../windows.ui.core/corewindow.md). Developers should use thread-safe methods for communication between the windows, such as **window.postMessage** for JavaScript apps and the [CoreDispatcher](../windows.ui.core/coredispatcher.md) ([CoreWindow.Dispatcher](../windows.ui.core/corewindow_dispatcher.md)) messaging for C# and C++ developers.
     * @param {Integer} viewId The ID of the new window to display.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitcher.tryshowasstandaloneasync
     */
    static TryShowAsStandaloneAsync(viewId) {
        if (!ApplicationViewSwitcher.HasProp("__IApplicationViewSwitcherStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewSwitcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewSwitcherStatics.IID)
            ApplicationViewSwitcher.__IApplicationViewSwitcherStatics := IApplicationViewSwitcherStatics(factoryPtr)
        }

        return ApplicationViewSwitcher.__IApplicationViewSwitcherStatics.TryShowAsStandaloneAsync(viewId)
    }

    /**
     * Displays another window (app view) for the app on the screen, adjacent to the original window
     * @remarks
     * If this method succeeds, a new window is created next to the original window. It can only be called from an ASTA (core UI) thread.
     * 
     * The new window has its own UI thread (ASTA) and associated [CoreWindow](../windows.ui.core/corewindow.md). Developers should use thread-safe methods for communication between the windows, such as **window.postMessage** for JavaScript apps and the [CoreDispatcher](../windows.ui.core/coredispatcher.md) ([CoreWindow.Dispatcher](../windows.ui.core/corewindow_dispatcher.md)) messaging for C# and C++ developers.
     * @param {Integer} viewId The ID of the new window to display.
     * @param {Integer} sizePreference 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitcher.tryshowasstandaloneasync
     */
    static TryShowAsStandaloneWithSizePreferenceAsync(viewId, sizePreference) {
        if (!ApplicationViewSwitcher.HasProp("__IApplicationViewSwitcherStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewSwitcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewSwitcherStatics.IID)
            ApplicationViewSwitcher.__IApplicationViewSwitcherStatics := IApplicationViewSwitcherStatics(factoryPtr)
        }

        return ApplicationViewSwitcher.__IApplicationViewSwitcherStatics.TryShowAsStandaloneWithSizePreferenceAsync(viewId, sizePreference)
    }

    /**
     * Displays another window (app view) for the app on the screen, adjacent to the original window
     * @remarks
     * If this method succeeds, a new window is created next to the original window. It can only be called from an ASTA (core UI) thread.
     * 
     * The new window has its own UI thread (ASTA) and associated [CoreWindow](../windows.ui.core/corewindow.md). Developers should use thread-safe methods for communication between the windows, such as **window.postMessage** for JavaScript apps and the [CoreDispatcher](../windows.ui.core/coredispatcher.md) ([CoreWindow.Dispatcher](../windows.ui.core/corewindow_dispatcher.md)) messaging for C# and C++ developers.
     * @param {Integer} viewId The ID of the new window to display.
     * @param {Integer} sizePreference 
     * @param {Integer} anchorViewId 
     * @param {Integer} anchorSizePreference 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitcher.tryshowasstandaloneasync
     */
    static TryShowAsStandaloneWithAnchorViewAndSizePreferenceAsync(viewId, sizePreference, anchorViewId, anchorSizePreference) {
        if (!ApplicationViewSwitcher.HasProp("__IApplicationViewSwitcherStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewSwitcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewSwitcherStatics.IID)
            ApplicationViewSwitcher.__IApplicationViewSwitcherStatics := IApplicationViewSwitcherStatics(factoryPtr)
        }

        return ApplicationViewSwitcher.__IApplicationViewSwitcherStatics.TryShowAsStandaloneWithAnchorViewAndSizePreferenceAsync(viewId, sizePreference, anchorViewId, anchorSizePreference)
    }

    /**
     * Visually switches the calling window (app view) to a specified window.
     * @remarks
     * Unlike [SwitchAsync(System.Int32 viewId)](applicationviewswitcher_switchasync_1398322393.md), this method specifies *fromViewId* and frees the caller from executing the call on the Application Single-Threaded Apartment (ASTA) thread of the "from" view. By explicitly passing the same view ID as that inferred through the SwitchAsync(Int32) call, the result of the calls is identical.
     * @param {Integer} viewId 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitcher.switchasync
     */
    static SwitchAsync(viewId) {
        if (!ApplicationViewSwitcher.HasProp("__IApplicationViewSwitcherStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewSwitcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewSwitcherStatics.IID)
            ApplicationViewSwitcher.__IApplicationViewSwitcherStatics := IApplicationViewSwitcherStatics(factoryPtr)
        }

        return ApplicationViewSwitcher.__IApplicationViewSwitcherStatics.SwitchAsync(viewId)
    }

    /**
     * Visually transitions the calling window (app view) to a specified window.
     * @remarks
     * Unlike [SwitchAsync(System.Int32 viewId)](applicationviewswitcher_switchasync_1398322393.md), this method specifies *fromViewId* and frees the caller from executing the call on the Application Single-Threaded Apartment (ASTA) thread of the "from" view. By explicitly passing the same view ID as that inferred through the SwitchAsync(Int32) call, the result of the calls is identical.
     * @param {Integer} toViewId The ID of the window under preparation for display.
     * @param {Integer} fromViewId The ID of the calling, currently displayed window.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitcher.switchasync
     */
    static SwitchFromViewAsync(toViewId, fromViewId) {
        if (!ApplicationViewSwitcher.HasProp("__IApplicationViewSwitcherStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewSwitcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewSwitcherStatics.IID)
            ApplicationViewSwitcher.__IApplicationViewSwitcherStatics := IApplicationViewSwitcherStatics(factoryPtr)
        }

        return ApplicationViewSwitcher.__IApplicationViewSwitcherStatics.SwitchFromViewAsync(toViewId, fromViewId)
    }

    /**
     * Visually switches the calling window (app view) to another window.
     * @remarks
     * This method can only be called from the Application Single-Threaded Apartment (ASTA) thread of the calling, currently displayed window (core UI).
     * 
     * Unlike [SwitchAsync(System.Int32 toViewId, System.Int32 fromViewId)](applicationviewswitcher_switchasync_1708606889.md), this method infers *fromViewId* through the call from the ASTA thread.
     * @param {Integer} toViewId 
     * @param {Integer} fromViewId 
     * @param {Integer} options 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitcher.switchasync
     */
    static SwitchFromViewWithOptionsAsync(toViewId, fromViewId, options) {
        if (!ApplicationViewSwitcher.HasProp("__IApplicationViewSwitcherStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewSwitcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewSwitcherStatics.IID)
            ApplicationViewSwitcher.__IApplicationViewSwitcherStatics := IApplicationViewSwitcherStatics(factoryPtr)
        }

        return ApplicationViewSwitcher.__IApplicationViewSwitcherStatics.SwitchFromViewWithOptionsAsync(toViewId, fromViewId, options)
    }

    /**
     * Prepares your app to visually transition between two windows with a custom animation.
     * @remarks
     * The view ID can be obtained for the current app view with [ApplicationView.Id](applicationview_id.md). For a specific app view managed by the app, call [ApplicationView.GetApplicationViewIdForWindow](applicationview_getapplicationviewidforwindow_543884123.md) with the [CoreWindow](../windows.ui.core/corewindow.md) for the app view.
     * @param {Integer} toViewId The ID of the window from which your app is transitioning.
     * @param {Integer} fromViewId The ID of the window to which your app is transitioning.
     * @param {Integer} options Enumeration value that specifies thw view switching behaviors.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitcher.prepareforcustomanimatedswitchasync
     */
    static PrepareForCustomAnimatedSwitchAsync(toViewId, fromViewId, options) {
        if (!ApplicationViewSwitcher.HasProp("__IApplicationViewSwitcherStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationViewSwitcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewSwitcherStatics.IID)
            ApplicationViewSwitcher.__IApplicationViewSwitcherStatics := IApplicationViewSwitcherStatics(factoryPtr)
        }

        return ApplicationViewSwitcher.__IApplicationViewSwitcherStatics.PrepareForCustomAnimatedSwitchAsync(toViewId, fromViewId, options)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
