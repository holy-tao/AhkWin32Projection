#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationView.ahk
#Include .\IApplicationView2.ahk
#Include .\IApplicationView3.ahk
#Include .\IApplicationView4.ahk
#Include .\IApplicationView7.ahk
#Include .\IApplicationView9.ahk
#Include .\IApplicationViewWithContext.ahk
#Include .\IApplicationViewInteropStatics.ahk
#Include .\IApplicationViewStatics4.ahk
#Include .\IApplicationViewStatics2.ahk
#Include .\IApplicationViewStatics3.ahk
#Include .\IApplicationViewStatics.ahk
#Include .\IApplicationViewFullscreenStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ApplicationView.ahk
#Include .\ApplicationViewConsolidatedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the active application view and associated states and behaviors.
 * @remarks
 * A window (also called an **app view**) is the displayed portion of a Windows Runtime app. On Windows, a user's screen can have up to 4 windows of variable width displayed simultaneously. They do not overlap, and their top and bottom edges touch the top and bottom edges of the screen. There may be non-window areas between adjacent windows.
 * 
 * The window is not the same thing as the current page of the application. It is better thought of as the container of the pages; you can use the window reference in your program for all the pages of the application.
 * 
 * Each window has a corresponding [CoreWindow](../windows.ui.core/corewindow.md) that represents the UI processing thread (including the core input handlers and event dispatcher) for the window.
 * 
 * You can use the properties (or methods, for JavaScript) of the window in configuring your pages. For example: the [Orientation](applicationview_orientation.md) property tells you whether the window is portrait or landscape; for Windows the [AdjacentToLeftDisplayEdge](applicationview_adjacenttoleftdisplayedge.md) property tells you whether the left edge of the screen is the left border of the window; and the [isFullScreen](applicationview_isfullscreen.md) method tells you whether the window uses the entire screen. For examples of using these methods, see the [Application Views](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/Application%20Views) sample.
 * 
 * To obtain an object of this type, call [ApplicationView.GetForCurrentView](applicationview_getforcurrentview_1363600702.md).
 * 
 * > [!NOTE]
 * > Do not use the value returned in the [ ApplicationView.Value](applicationview_value.md) property when creating a page layout. This method is deprecated and may not be available in future releases.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ApplicationView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IApplicationView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IApplicationView.IID

    /**
     * Indicates whether the app terminates when the last window is closed.
     * @remarks
     * For info about using this property, see [App lifecycle](/windows/uwp/launch-resume/app-lifecycle).
     * 
     * This is a static member of the [ApplicationView](applicationview.md) class. For JavaScript this means that it is a method of the [ApplicationView](applicationview.md) class, not of the window object that [getForCurrentView](applicationview_getforcurrentview_1363600702.md) creates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.terminateapponfinalviewclose
     * @type {Boolean} 
     */
    static TerminateAppOnFinalViewClose {
        get => ApplicationView.get_TerminateAppOnFinalViewClose()
        set => ApplicationView.put_TerminateAppOnFinalViewClose(value)
    }

    /**
     * Gets or sets a value that indicates the windowing mode the app launches with.
     * @remarks
     * By default, PreferredLaunchWindowingMode is set to **Auto**. In this mode, the size and position of your app window on startup is managed automatically by Windows.
     * 
     * You can set PreferredLaunchWindowingMode to override the automatic behavior with one of these values. 
     * + **PreferredLaunchViewSize**: When launched, the window is sized as specified by the [ApplicationView.PreferredLaunchViewSize](applicationview_preferredlaunchviewsize.md) property.
     * + **FullScreen**: The window is launched in full-screen mode. (Full-screen mode in not the same as maximized. See [IsFullScreenMode](applicationview_isfullscreenmode.md) for more info.)
     * 
     * For the very first launch of an app the PreferredLaunchWindowingMode will always be **Auto** and the [ApplicationView.PreferredLaunchViewSize](applicationview_preferredlaunchviewsize.md) will be determined by system policies. The API applies to the next launch of the app.
     * 
     * 
     * You typically set this property when the user sets their preference via an in-app option, or when you call [TryEnterFullScreenMode](applicationview_tryenterfullscreenmode_1643702755.md) and [ExitFullScreenMode](applicationview_exitfullscreenmode_1516691675.md). You can set this property during app startup (before the call to [CoreWindow.Activate](../windows.ui.core/corewindow_activate_1797342875.md)) to specify a first launch behavior. However, you shouldn't set it during every launch as this can cause your app to do extra sizing and positioning work during startup.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.preferredlaunchwindowingmode
     * @type {Integer} 
     */
    static PreferredLaunchWindowingMode {
        get => ApplicationView.get_PreferredLaunchWindowingMode()
        set => ApplicationView.put_PreferredLaunchWindowingMode(value)
    }

    /**
     * Gets or sets the size that the app launches with when the [ApplicationView.PreferredLaunchWindowingMode](applicationview_preferredlaunchwindowingmode.md) property is set to **PreferredLaunchViewSize**, except in cases where the system manages the window size directly.
     * @remarks
     * This property only has an effect when the app is launched on a desktop device that is not in [Tablet mode (Windows 10 only)](/windows-hardware/design/device-experiences/continuum).
     * 
     * For the very first launch of an app the [PreferredLaunchWindowingMode](applicationview_preferredlaunchwindowingmode.md) will always be **Auto** and the ApplicationView.PreferredLaunchViewSize will be determined by system policies. The API applies to the next launch of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.preferredlaunchviewsize
     * @type {SIZE} 
     */
    static PreferredLaunchViewSize {
        get => ApplicationView.get_PreferredLaunchViewSize()
        set => ApplicationView.put_PreferredLaunchViewSize(value)
    }

    /**
     * > [!NOTE]
     * > ApplicationView static methods may be altered or unavailable for releases after Windows 8.1. Instead, use [ApplicationView.GetForCurrentView](applicationview_getforcurrentview_1363600702.md) to get an [ApplicationView](applicationview.md) object.
     * 
     * Gets the state of the current window (app view).
     * @remarks
     * To respond to a view state change, an app queries this property from inside the app window resize event handler to determine how to lay out the app in the changed view state.
     * 
     * This is a static member of the [ApplicationView](applicationview.md) class. For JavaScript this means that it is a method of the [ApplicationView](applicationview.md) class, not of the window object that [getForCurrentView](applicationview_getforcurrentview_1363600702.md) creates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.value
     * @type {Integer} 
     */
    static Value {
        get => ApplicationView.get_Value()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the window ID that corresponds to a specific [CoreWindow](../windows.ui.core/corewindow.md) managed by the app.
     * @remarks
     * Every view has an associated [CoreWindow](../windows.ui.core/corewindow.md), which handles the core UI events for the window and manages drawing operations to the window. An app can have multiple views, with separate UI threads. Use this method to determine which window is provided by a specific [CoreWindow](../windows.ui.core/corewindow.md) instance managed by your app.
     * 
     * For languages other than Javascript, this is a static member of the [ApplicationView](applicationview.md) class. JavaScript does not support this method ([CoreWindow](../windows.ui.core/corewindow.md) is not available as an API).
     * @param {ICoreWindow} window_ Reference to the [CoreWindow](../windows.ui.core/corewindow.md) object that contains a window handle used by the app.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.getapplicationviewidforwindow
     */
    static GetApplicationViewIdForWindow(window_) {
        if (!ApplicationView.HasProp("__IApplicationViewInteropStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewInteropStatics.IID)
            ApplicationView.__IApplicationViewInteropStatics := IApplicationViewInteropStatics(factoryPtr)
        }

        return ApplicationView.__IApplicationViewInteropStatics.GetApplicationViewIdForWindow(window_)
    }

    /**
     * Clears any properties the system has saved for any view PersistedStateId for the given application.
     * @remarks
     * If a view with a PersistedStateId still exists in the app at the time of calling this method, the system will save state for this identifier when that view is updated or closed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.clearallpersistedstate
     */
    static ClearAllPersistedState() {
        if (!ApplicationView.HasProp("__IApplicationViewStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewStatics4.IID)
            ApplicationView.__IApplicationViewStatics4 := IApplicationViewStatics4(factoryPtr)
        }

        return ApplicationView.__IApplicationViewStatics4.ClearAllPersistedState()
    }

    /**
     * Clears any properties the system has saved for the view with the specified identifier for the given application.
     * @remarks
     * If a view with this identifier still exists in the app at the time of calling this method, the system will save state for this identifier when that view is updated or closed.
     * @param {HSTRING} key The [PersistedStateId](applicationview_persistedstateid.md) for the view to be cleared.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.clearpersistedstate
     */
    static ClearPersistedState(key) {
        if (!ApplicationView.HasProp("__IApplicationViewStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewStatics4.IID)
            ApplicationView.__IApplicationViewStatics4 := IApplicationViewStatics4(factoryPtr)
        }

        return ApplicationView.__IApplicationViewStatics4.ClearPersistedState(key)
    }

    /**
     * Gets the view state and behavior settings of the active application.
     * @remarks
     * This is a static member of the [ApplicationView](applicationview.md) class. For JavaScript this means that it is a method of the [ApplicationView](applicationview.md) class, not of the window object that getForCurrentView creates.
     * 
     * > [!CAUTION]
     * > You can call `ApplicationView.GetForCurrentView` only after the [CoreWindow](../windows.ui.core/corewindow.md) has been constructed, so it is not safe to call this method in an app's constructor. Instead, the call should be deferred until [Application.OnLaunched](../windows.ui.xaml/application_onlaunched_859642554.md).
     * @returns {ApplicationView} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.getforcurrentview
     */
    static GetForCurrentView() {
        if (!ApplicationView.HasProp("__IApplicationViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewStatics2.IID)
            ApplicationView.__IApplicationViewStatics2 := IApplicationViewStatics2(factoryPtr)
        }

        return ApplicationView.__IApplicationViewStatics2.GetForCurrentView()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_TerminateAppOnFinalViewClose() {
        if (!ApplicationView.HasProp("__IApplicationViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewStatics2.IID)
            ApplicationView.__IApplicationViewStatics2 := IApplicationViewStatics2(factoryPtr)
        }

        return ApplicationView.__IApplicationViewStatics2.get_TerminateAppOnFinalViewClose()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_TerminateAppOnFinalViewClose(value) {
        if (!ApplicationView.HasProp("__IApplicationViewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewStatics2.IID)
            ApplicationView.__IApplicationViewStatics2 := IApplicationViewStatics2(factoryPtr)
        }

        return ApplicationView.__IApplicationViewStatics2.put_TerminateAppOnFinalViewClose(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_PreferredLaunchWindowingMode() {
        if (!ApplicationView.HasProp("__IApplicationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewStatics3.IID)
            ApplicationView.__IApplicationViewStatics3 := IApplicationViewStatics3(factoryPtr)
        }

        return ApplicationView.__IApplicationViewStatics3.get_PreferredLaunchWindowingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    static put_PreferredLaunchWindowingMode(value) {
        if (!ApplicationView.HasProp("__IApplicationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewStatics3.IID)
            ApplicationView.__IApplicationViewStatics3 := IApplicationViewStatics3(factoryPtr)
        }

        return ApplicationView.__IApplicationViewStatics3.put_PreferredLaunchWindowingMode(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    static get_PreferredLaunchViewSize() {
        if (!ApplicationView.HasProp("__IApplicationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewStatics3.IID)
            ApplicationView.__IApplicationViewStatics3 := IApplicationViewStatics3(factoryPtr)
        }

        return ApplicationView.__IApplicationViewStatics3.get_PreferredLaunchViewSize()
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    static put_PreferredLaunchViewSize(value) {
        if (!ApplicationView.HasProp("__IApplicationViewStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewStatics3.IID)
            ApplicationView.__IApplicationViewStatics3 := IApplicationViewStatics3(factoryPtr)
        }

        return ApplicationView.__IApplicationViewStatics3.put_PreferredLaunchViewSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Value() {
        if (!ApplicationView.HasProp("__IApplicationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewStatics.IID)
            ApplicationView.__IApplicationViewStatics := IApplicationViewStatics(factoryPtr)
        }

        return ApplicationView.__IApplicationViewStatics.get_Value()
    }

    /**
     * > [!NOTE]
     * > TryUnsnap may be altered or unavailable for releases after Windows 8.1. Apps can be continuously resized, but cannot be snapped, starting in Windows 8.1. Also, ApplicationView static methods may be altered or unavailable for releases after Windows 8.1. Use [ApplicationView.GetForCurrentView](applicationview_getforcurrentview_1363600702.md) to get an [ApplicationView](applicationview.md) object.
     * 
     * Attempts to unsnap a previously snapped app. This call will only succeed when the app is running in the foreground.
     * @remarks
     * This is a static member of the [ApplicationView](applicationview.md) class. For JavaScript this means that it is a method of the [ApplicationView](applicationview.md) class, not of the window object that [getForCurrentView](applicationview_getforcurrentview_1363600702.md) creates.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.tryunsnap
     */
    static TryUnsnap() {
        if (!ApplicationView.HasProp("__IApplicationViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewStatics.IID)
            ApplicationView.__IApplicationViewStatics := IApplicationViewStatics(factoryPtr)
        }

        return ApplicationView.__IApplicationViewStatics.TryUnsnap()
    }

    /**
     * Attempts to unsnap a previously snapped app.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.tryunsnaptofullscreen
     */
    static TryUnsnapToFullscreen() {
        if (!ApplicationView.HasProp("__IApplicationViewFullscreenStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ApplicationView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationViewFullscreenStatics.IID)
            ApplicationView.__IApplicationViewFullscreenStatics := IApplicationViewFullscreenStatics(factoryPtr)
        }

        return ApplicationView.__IApplicationViewFullscreenStatics.TryUnsnapToFullscreen()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the current orientation (landscape or portrait) of the window (app view) with respect to the display.
     * @remarks
     * For an example of using the [Orientation](applicationview_isscreencaptureenabled.md) property, see the [Application Views](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/Application%20Views) sample.
     * 
     * The property is a nonstatic member of the window object. For JavaScript, this means that it is a method of the window object that [getForCurrentView](applicationview_getforcurrentview_1363600702.md) creates, not of the [ApplicationView](applicationview.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * Gets a value that indicates whether the current window is in close proximity to the left edge of the screen.
     * @remarks
     * The system raises the [CoreWindow.SizeChanged](../windows.ui.core/corewindow_sizechanged.md) event when the value of this property changes. This is exposed to XAML apps as the [Window.SizeChanged](../windows.ui.xaml/window_sizechanged.md) event and to HTML apps as the [window.resize](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741886(v=vs.85)) event.
     * 
     * The property is a nonstatic member of the window object. For JavaScript, this means that it is a method of the window object that [getForCurrentView](applicationview_getforcurrentview_1363600702.md) creates, not of the [ApplicationView](applicationview.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.adjacenttoleftdisplayedge
     * @type {Boolean} 
     */
    AdjacentToLeftDisplayEdge {
        get => this.get_AdjacentToLeftDisplayEdge()
    }

    /**
     * Gets a value that indicates whether the current window is in close proximity to the right edge of the screen.
     * @remarks
     * The system raises the [CoreWindow.SizeChanged](../windows.ui.core/corewindow_sizechanged.md) event when the value of this property changes. This is exposed to XAML apps as the [Window.SizeChanged](../windows.ui.xaml/window_sizechanged.md) event and to HTML apps as the [window.resize](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741886(v=vs.85)) event.
     * 
     * The property is a nonstatic member of the window object. For JavaScript, this means that it is a method of the window object that [getForCurrentView](applicationview_getforcurrentview_1363600702.md) creates, not of the [ApplicationView](applicationview.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.adjacenttorightdisplayedge
     * @type {Boolean} 
     */
    AdjacentToRightDisplayEdge {
        get => this.get_AdjacentToRightDisplayEdge()
    }

    /**
     * > [!NOTE]
     * > IsFullScreen may be altered or unavailable for releases after Windows 10. Instead, use [IsFullScreenMode](applicationview_isfullscreenmode.md).
     * 
     * Gets a value that indicates whether the window touches both the left and right sides of the display.
     * @remarks
     * The system raises the [CoreWindow.SizeChanged](../windows.ui.core/corewindow_sizechanged.md) event when the value of this property changes. This is exposed to XAML apps as the [Window.SizeChanged](../windows.ui.xaml/window_sizechanged.md) event and to HTML apps as the [window.resize](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741886(v=vs.85)) event.
     * 
     * The property is a nonstatic member of the window object. For JavaScript, this means that it is a property of the window object that [getForCurrentView](applicationview_getforcurrentview_1363600702.md) creates, not of the [ApplicationView](applicationview.md) class.
     * 
     * > **Windows 10**
     * > In Windows 10, apps run in resizable windows and this property is deprecated. To check if the app is full screen, use the [IsFullScreenMode](applicationview_isfullscreenmode.md) property. To check if the app is close to the edges of the display, use the [AdjacentToLeftDisplayEdge](applicationview_adjacenttoleftdisplayedge.md) and [AdjacentToRightDisplayEdge](applicationview_adjacenttorightdisplayedge.md) properties.
     * 
     * > **Windows 8**
     * > In Windows 8, apps always use the full height of the screen, so this property returns **true** if the app touches both sides of the display.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.isfullscreen
     * @type {Boolean} 
     */
    IsFullScreen {
        get => this.get_IsFullScreen()
    }

    /**
     * Gets whether the window (app view) is on the Windows lock screen.
     * @remarks
     * The property is a nonstatic member of the window object. For JavaScript, this means that it is a method of the window object that [getForCurrentView](applicationview_getforcurrentview_1363600702.md) creates, not of the [ApplicationView](applicationview.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.isonlockscreen
     * @type {Boolean} 
     */
    IsOnLockScreen {
        get => this.get_IsOnLockScreen()
    }

    /**
     * Gets or sets whether screen capture is enabled for the window (app view).
     * @remarks
     * This property lets you protect against unwanted copies of the window. When screen capture is disabled for a window, the window appears black in images produced by screen capture operations. For an example of setting the isScreenCaptureEnabled property, see the [Disable screen capture sample](https://code.msdn.microsoft.com/windowsapps/Disable-screen-capture-00efe630).
     * 
     * The property is a nonstatic member of the window object. For JavaScript, this means that it is a method of the window object that [getForCurrentView](applicationview_getforcurrentview_1363600702.md) creates, not of the [ApplicationView](applicationview.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.isscreencaptureenabled
     * @type {Boolean} 
     */
    IsScreenCaptureEnabled {
        get => this.get_IsScreenCaptureEnabled()
        set => this.put_IsScreenCaptureEnabled(value)
    }

    /**
     * Gets or sets the displayed title of the window.
     * @remarks
     * The Title property provides a title for the window.
     * 
     * When the Title property is not set, the system shows the app's display name in the title bar, as specified in the **Display name** field in the app manifest (Package.appxmanifest). When you set the Title property, Windows may choose to append the app display name to the end of the Title value you set.
     * 
     * We recommend that you set a title that describes the window, not the app. If you have an app that can have multiple documents open, each window should have the document title, which is considered more informative than just showing the app name.
     * 
     * For example, assume you have an app named, "My Notes App", with a window showing a document named "Note 1". You should set the Title property to "Note 1". Windows appends the app display name so the title bar shows "Note 1 - My Notes App".
     * 
     * This property is a nonstatic member of the window object. For JavaScript, this means that it is a method of the window object that [getForCurrentView](applicationview_getforcurrentview_1363600702.md) creates, and not a method of the [ApplicationView](applicationview.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets the ID of the window (app view).
     * @remarks
     * The property is a nonstatic member of the window object. For JavaScript, this means that it is a property of the window object that [getForCurrentView](applicationview_getforcurrentview_1363600702.md) creates, not of the [ApplicationView](applicationview.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * > [!NOTE]
     * > SuppressSystemOverlays may be altered or unavailable for releases after Windows 10. Instead, use [TryEnterFullScreenMode](applicationview_tryenterfullscreenmode_1643702755.md) and [FullScreenSystemOverlayMode](applicationview_fullscreensystemoverlaymode.md).
     * 
     * Gets or sets a value indicating whether or not system overlays (such as overlay applications or the soft steering wheel) should be shown.
     * @remarks
     * > **Windows 10**
     * > For Universal Windows Platform (UWP) app on Windows 10, this property is deprecated. This property has an effect only on the mobile device family.
     * 
     * To launch your app in full screen mode, set [PreferredLaunchWindowingMode](applicationview_preferredlaunchwindowingmode.md) to **FullScreen**. To enter full screen mode after your app is launched, call [TryEnterFullScreenMode](applicationview_tryenterfullscreenmode_1643702755.md). To exit full screen mode, call [ExitFullScreenMode](applicationview_exitfullscreenmode_1516691675.md).
     * 
     * To suppress edge gestures, set [FullScreenSystemOverlayMode](applicationview_fullscreensystemoverlaymode.md) to **Minimal**.
     * 
     * > **Windows Phone 8.1**
     * > You can set your app to "full-screen" by setting this property to **true**. A full-screen app, such as a game, is not occluded by overlay apps. An overlay app is one that shows its UI in the Overlay Layer, which is positioned in a layer above the app and lock layers, but below certain other chrome elements (such as the SIP). An example of an overlay app is an instant messaging app that displays a UI that overlays the app below.
     * 
     * In addition, by setting **SuppressSystemOverlays** to **true**, accidental taps of the Search button are far less likely to affect the app. When **SuppressSystemOverlays** is set to **true**, the user must tap the Search button twice in close succession to actuate the Search experience, which overlays the running app. We recommend using this property to opt into this behavior only in these cases: user feedback shows that accidental taps of the Search button are likely based on the layout of your app; if your app shows full-screen media content; or if your app uses camera functionality or the viewfinder.
     * 
     * **SuppressSystemOverlays** is **true** by default for an app associated with the Games category, and **false** by default for an application associated with any other category.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.suppresssystemoverlays
     * @type {Boolean} 
     */
    SuppressSystemOverlays {
        get => this.get_SuppressSystemOverlays()
        set => this.put_SuppressSystemOverlays(value)
    }

    /**
     * Gets the visible region of the window (app view). The visible region is the region not occluded by chrome such as the status bar and app bar.
     * @remarks
     * Parts of a window (app view) can be covered up (occluded) by chrome, such as the status bar and the app bar. The non-occluded region is referred to as the visible bounds. Note that, when shown, the status bar and app bar occlude the window even if their opacity is not 100%.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.visiblebounds
     * @type {RECT} 
     */
    VisibleBounds {
        get => this.get_VisibleBounds()
    }

    /**
     * Gets a value that indicates the bounds used by the framework to lay out the contents of the window (app view).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.desiredboundsmode
     * @type {Integer} 
     */
    DesiredBoundsMode {
        get => this.get_DesiredBoundsMode()
    }

    /**
     * Gets the title bar of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.titlebar
     * @type {ApplicationViewTitleBar} 
     */
    TitleBar {
        get => this.get_TitleBar()
    }

    /**
     * Gets or sets a value that indicates how an app in full-screen mode responds to edge swipe actions.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.fullscreensystemoverlaymode
     * @type {Integer} 
     */
    FullScreenSystemOverlayMode {
        get => this.get_FullScreenSystemOverlayMode()
        set => this.put_FullScreenSystemOverlayMode(value)
    }

    /**
     * Gets a value that indicates whether the app is running in full-screen mode.
     * @remarks
     * The IsFullScreenMode property is set as a result of calls to the [TryEnterFullScreenMode](applicationview_tryenterfullscreenmode_1643702755.md) and [ExitFullScreenMode](applicationview_exitfullscreenmode_1516691675.md) methods. It can also be set to **true** when the app starts if the [PreferredLaunchWindowingMode](applicationview_preferredlaunchwindowingmode.md) property is set to **FullScreen**.
     * 
     * The system raises the [CoreWindow.SizeChanged](../windows.ui.core/corewindow_sizechanged.md) event when the value of this property changes. This is exposed to XAML apps as the [Window.SizeChanged](../windows.ui.xaml/window_sizechanged.md) event and to HTML apps as the [window.resize](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741886(v=vs.85)) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.isfullscreenmode
     * @type {Boolean} 
     */
    IsFullScreenMode {
        get => this.get_IsFullScreenMode()
    }

    /**
     * Gets the app view mode for the current view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.viewmode
     * @type {Integer} 
     */
    ViewMode {
        get => this.get_ViewMode()
    }

    /**
     * Gets or sets a string that identifies this view for tracking and saving state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.persistedstateid
     * @type {HSTRING} 
     */
    PersistedStateId {
        get => this.get_PersistedStateId()
        set => this.put_PersistedStateId(value)
    }

    /**
     * Gets the windowing environment for the view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.windowingenvironment
     * @type {WindowingEnvironment} 
     */
    WindowingEnvironment {
        get => this.get_WindowingEnvironment()
    }

    /**
     * Gets the context identifier for the view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.uicontext
     * @type {UIContext} 
     */
    UIContext {
        get => this.get_UIContext()
    }

    /**
     * Occurs when the window is removed from the list of recently used apps, or if the user executes a close gesture on it.
     * @type {TypedEventHandler<ApplicationView, ApplicationViewConsolidatedEventArgs>}
    */
    OnConsolidated {
        get {
            if(!this.HasProp("__OnConsolidated")){
                this.__OnConsolidated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{463c606a-8c82-5a29-a2bd-040781f25348}"),
                    ApplicationView,
                    ApplicationViewConsolidatedEventArgs
                )
                this.__OnConsolidatedToken := this.add_Consolidated(this.__OnConsolidated.iface)
            }
            return this.__OnConsolidated
        }
    }

    /**
     * This event is raised when the value of [VisibleBounds](applicationview_visiblebounds.md) changes, typically as a result of the status bar, app bar, or other chrome being shown or hidden.
     * @type {TypedEventHandler<ApplicationView, IInspectable>}
    */
    OnVisibleBoundsChanged {
        get {
            if(!this.HasProp("__OnVisibleBoundsChanged")){
                this.__OnVisibleBoundsChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{00c1f983-c836-565c-8bbf-7053055bdb4c}"),
                    ApplicationView,
                    IInspectable
                )
                this.__OnVisibleBoundsChangedToken := this.add_VisibleBoundsChanged(this.__OnVisibleBoundsChanged.iface)
            }
            return this.__OnVisibleBoundsChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnConsolidatedToken")) {
            this.remove_Consolidated(this.__OnConsolidatedToken)
            this.__OnConsolidated.iface.Dispose()
        }

        if(this.HasProp("__OnVisibleBoundsChangedToken")) {
            this.remove_VisibleBoundsChanged(this.__OnVisibleBoundsChangedToken)
            this.__OnVisibleBoundsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IApplicationView")) {
            if ((queryResult := this.QueryInterface(IApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView := IApplicationView(outPtr)
        }

        return this.__IApplicationView.get_Orientation()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AdjacentToLeftDisplayEdge() {
        if (!this.HasProp("__IApplicationView")) {
            if ((queryResult := this.QueryInterface(IApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView := IApplicationView(outPtr)
        }

        return this.__IApplicationView.get_AdjacentToLeftDisplayEdge()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AdjacentToRightDisplayEdge() {
        if (!this.HasProp("__IApplicationView")) {
            if ((queryResult := this.QueryInterface(IApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView := IApplicationView(outPtr)
        }

        return this.__IApplicationView.get_AdjacentToRightDisplayEdge()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullScreen() {
        if (!this.HasProp("__IApplicationView")) {
            if ((queryResult := this.QueryInterface(IApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView := IApplicationView(outPtr)
        }

        return this.__IApplicationView.get_IsFullScreen()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnLockScreen() {
        if (!this.HasProp("__IApplicationView")) {
            if ((queryResult := this.QueryInterface(IApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView := IApplicationView(outPtr)
        }

        return this.__IApplicationView.get_IsOnLockScreen()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScreenCaptureEnabled() {
        if (!this.HasProp("__IApplicationView")) {
            if ((queryResult := this.QueryInterface(IApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView := IApplicationView(outPtr)
        }

        return this.__IApplicationView.get_IsScreenCaptureEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsScreenCaptureEnabled(value) {
        if (!this.HasProp("__IApplicationView")) {
            if ((queryResult := this.QueryInterface(IApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView := IApplicationView(outPtr)
        }

        return this.__IApplicationView.put_IsScreenCaptureEnabled(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IApplicationView")) {
            if ((queryResult := this.QueryInterface(IApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView := IApplicationView(outPtr)
        }

        return this.__IApplicationView.put_Title(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IApplicationView")) {
            if ((queryResult := this.QueryInterface(IApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView := IApplicationView(outPtr)
        }

        return this.__IApplicationView.get_Title()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IApplicationView")) {
            if ((queryResult := this.QueryInterface(IApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView := IApplicationView(outPtr)
        }

        return this.__IApplicationView.get_Id()
    }

    /**
     * 
     * @param {TypedEventHandler<ApplicationView, ApplicationViewConsolidatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Consolidated(handler) {
        if (!this.HasProp("__IApplicationView")) {
            if ((queryResult := this.QueryInterface(IApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView := IApplicationView(outPtr)
        }

        return this.__IApplicationView.add_Consolidated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Consolidated(token) {
        if (!this.HasProp("__IApplicationView")) {
            if ((queryResult := this.QueryInterface(IApplicationView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView := IApplicationView(outPtr)
        }

        return this.__IApplicationView.remove_Consolidated(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SuppressSystemOverlays() {
        if (!this.HasProp("__IApplicationView2")) {
            if ((queryResult := this.QueryInterface(IApplicationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView2 := IApplicationView2(outPtr)
        }

        return this.__IApplicationView2.get_SuppressSystemOverlays()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SuppressSystemOverlays(value) {
        if (!this.HasProp("__IApplicationView2")) {
            if ((queryResult := this.QueryInterface(IApplicationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView2 := IApplicationView2(outPtr)
        }

        return this.__IApplicationView2.put_SuppressSystemOverlays(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_VisibleBounds() {
        if (!this.HasProp("__IApplicationView2")) {
            if ((queryResult := this.QueryInterface(IApplicationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView2 := IApplicationView2(outPtr)
        }

        return this.__IApplicationView2.get_VisibleBounds()
    }

    /**
     * 
     * @param {TypedEventHandler<ApplicationView, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VisibleBoundsChanged(handler) {
        if (!this.HasProp("__IApplicationView2")) {
            if ((queryResult := this.QueryInterface(IApplicationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView2 := IApplicationView2(outPtr)
        }

        return this.__IApplicationView2.add_VisibleBoundsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VisibleBoundsChanged(token) {
        if (!this.HasProp("__IApplicationView2")) {
            if ((queryResult := this.QueryInterface(IApplicationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView2 := IApplicationView2(outPtr)
        }

        return this.__IApplicationView2.remove_VisibleBoundsChanged(token)
    }

    /**
     * Sets a value indicating the bounds used by the framework to lay out the contents of the window (app view).
     * @param {Integer} boundsMode The bounds that the framework should use to lay out the contents of the window (app view).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.setdesiredboundsmode
     */
    SetDesiredBoundsMode(boundsMode) {
        if (!this.HasProp("__IApplicationView2")) {
            if ((queryResult := this.QueryInterface(IApplicationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView2 := IApplicationView2(outPtr)
        }

        return this.__IApplicationView2.SetDesiredBoundsMode(boundsMode)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredBoundsMode() {
        if (!this.HasProp("__IApplicationView2")) {
            if ((queryResult := this.QueryInterface(IApplicationView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView2 := IApplicationView2(outPtr)
        }

        return this.__IApplicationView2.get_DesiredBoundsMode()
    }

    /**
     * 
     * @returns {ApplicationViewTitleBar} 
     */
    get_TitleBar() {
        if (!this.HasProp("__IApplicationView3")) {
            if ((queryResult := this.QueryInterface(IApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView3 := IApplicationView3(outPtr)
        }

        return this.__IApplicationView3.get_TitleBar()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FullScreenSystemOverlayMode() {
        if (!this.HasProp("__IApplicationView3")) {
            if ((queryResult := this.QueryInterface(IApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView3 := IApplicationView3(outPtr)
        }

        return this.__IApplicationView3.get_FullScreenSystemOverlayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FullScreenSystemOverlayMode(value) {
        if (!this.HasProp("__IApplicationView3")) {
            if ((queryResult := this.QueryInterface(IApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView3 := IApplicationView3(outPtr)
        }

        return this.__IApplicationView3.put_FullScreenSystemOverlayMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullScreenMode() {
        if (!this.HasProp("__IApplicationView3")) {
            if ((queryResult := this.QueryInterface(IApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView3 := IApplicationView3(outPtr)
        }

        return this.__IApplicationView3.get_IsFullScreenMode()
    }

    /**
     * Attempts to place the app in full-screen mode.
     * @remarks
     * To preserve full screen mode when a user restarts the app, set [PreferredLaunchWindowingMode](applicationview_preferredlaunchwindowingmode.md) to **FullScreen** if the call to TryEnterFullScreenMode returns **true**. When you call [ExitFullScreenMode](applicationview_exitfullscreenmode_1516691675.md), you should set [PreferredLaunchWindowingMode](applicationview_preferredlaunchwindowingmode.md) back to **Auto** or **PreferredLaunchViewSize**.
     * 
     * The system raises the [CoreWindow.SizeChanged](../windows.ui.core/corewindow_sizechanged.md) event when the view enters or exits full screen mode. This is exposed to XAML apps as the [Window.SizeChanged](../windows.ui.xaml/window_sizechanged.md) event and to HTML apps as the [window.resize](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741886(v=vs.85)) event.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.tryenterfullscreenmode
     */
    TryEnterFullScreenMode() {
        if (!this.HasProp("__IApplicationView3")) {
            if ((queryResult := this.QueryInterface(IApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView3 := IApplicationView3(outPtr)
        }

        return this.__IApplicationView3.TryEnterFullScreenMode()
    }

    /**
     * Takes the app out of full-screen mode.
     * @remarks
     * To preserve full-screen mode when a user restarts the app, set [PreferredLaunchWindowingMode](applicationview_preferredlaunchwindowingmode.md) to **FullScreen** if the call to [TryEnterFullScreenMode](applicationview_tryenterfullscreenmode_1643702755.md) returns **true**. When you call ExitFullScreenMode, you should set [PreferredLaunchWindowingMode](applicationview_preferredlaunchwindowingmode.md) back to **Auto** or **PreferredLaunchViewSize**.
     * 
     * The system raises the [CoreWindow.SizeChanged](../windows.ui.core/corewindow_sizechanged.md) event when the view enters or exits full-screen mode. This is exposed to XAML apps as the [Window.SizeChanged](../windows.ui.xaml/window_sizechanged.md) event and to HTML apps as the [window.resize](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741886(v=vs.85)) event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.exitfullscreenmode
     */
    ExitFullScreenMode() {
        if (!this.HasProp("__IApplicationView3")) {
            if ((queryResult := this.QueryInterface(IApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView3 := IApplicationView3(outPtr)
        }

        return this.__IApplicationView3.ExitFullScreenMode()
    }

    /**
     * Shows system UI elements, like the title bar, over a full-screen app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.showstandardsystemoverlays
     */
    ShowStandardSystemOverlays() {
        if (!this.HasProp("__IApplicationView3")) {
            if ((queryResult := this.QueryInterface(IApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView3 := IApplicationView3(outPtr)
        }

        return this.__IApplicationView3.ShowStandardSystemOverlays()
    }

    /**
     * Attempts to change the size of the view to the specified size in effective pixels.
     * @remarks
     * A resize request affects only the view it was requested on. Resizing one view does not affect the size of any other views.
     * 
     * Even when this method returns **false**, the user can manually resize the view and cause a [SizeChanged](../windows.ui.core/corewindow_sizechanged.md) event to occur.
     * 
     * If the resize forces parts of the app to go outside of available work area, the system will move it back into the available work area.
     * 
     * 
     * The resize request has no effect and the method returns false in these cases:
     * 
     * + The requested size is larger than the available work area.
     * + The requested size is less than the view's minimum size. (See [SetPreferredMinSize](applicationview_setpreferredminsize_991571047.md).)
     * + This method is called while the app is running in [Tablet mode (Windows 10 only)](/windows-hardware/design/device-experiences/continuum).
     * 
     * 
     * We recommend that you not begin any layout work until the window's [SizeChanged](../windows.ui.core/corewindow_sizechanged.md) event occurs. This avoids two different layout passes (one that happens immediately after TryResizeView and then another when the [SizeChanged](../windows.ui.core/corewindow_sizechanged.md) event occurs).
     * @param {SIZE} value The new size of the view in effective pixels.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.tryresizeview
     */
    TryResizeView(value) {
        if (!this.HasProp("__IApplicationView3")) {
            if ((queryResult := this.QueryInterface(IApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView3 := IApplicationView3(outPtr)
        }

        return this.__IApplicationView3.TryResizeView(value)
    }

    /**
     * Sets the smallest size, in effective pixels, allowed for the app window.
     * @remarks
     * To remove the preferred minimum size and use and system default minimum size instead, set the [Size](../windows.foundation/size.md) value to "0,0".
     * 
     * The smallest allowed minimum size is 192 x 48 effective pixels. The largest allowed minimum size is 500 x 500 effective pixels. If you set a value outside of these bounds, it is coerced to be within the allowed bounds. (To learn about effective pixels, see [Introduction to Windows app design](/windows/apps/design/basics).)
     * 
     * Setting the preferred minimum size affects only the view it was requested on; setting it on one view does not impact the preferred minimum size of the other views.
     * 
     * The preferred minimum size is not persisted after the app is closed. You should always set your preferred minimum size on your view before [Window.Activate](../windows.ui.xaml/window_activate_1797342875.md) is called to present it.
     * 
     * If you set a preferred minimum size that is larger than the current size, the app is resized so that the preferred minimum size is honored.
     * @param {SIZE} minSize The smallest size allowed for the app window, or a [Size](../windows.foundation/size.md) whose height and width are both zero to use the system default minimum size.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.setpreferredminsize
     */
    SetPreferredMinSize(minSize) {
        if (!this.HasProp("__IApplicationView3")) {
            if ((queryResult := this.QueryInterface(IApplicationView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView3 := IApplicationView3(outPtr)
        }

        return this.__IApplicationView3.SetPreferredMinSize(minSize)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewMode() {
        if (!this.HasProp("__IApplicationView4")) {
            if ((queryResult := this.QueryInterface(IApplicationView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView4 := IApplicationView4(outPtr)
        }

        return this.__IApplicationView4.get_ViewMode()
    }

    /**
     * Determines whether the specified view mode is supported on the current device.
     * @param {Integer} viewMode A value of the enumeration that indicates the desired view mode.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.isviewmodesupported
     */
    IsViewModeSupported(viewMode) {
        if (!this.HasProp("__IApplicationView4")) {
            if ((queryResult := this.QueryInterface(IApplicationView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView4 := IApplicationView4(outPtr)
        }

        return this.__IApplicationView4.IsViewModeSupported(viewMode)
    }

    /**
     * Attempts to change the app view to the specified view mode using the specified options.
     * @remarks
     * The view mode preferences are requested values only. The system might override these values when your app is changed to the new view mode.
     * @param {Integer} viewMode A value of the enumeration that indicates the desired view mode.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.tryenterviewmodeasync
     */
    TryEnterViewModeAsync(viewMode) {
        if (!this.HasProp("__IApplicationView4")) {
            if ((queryResult := this.QueryInterface(IApplicationView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView4 := IApplicationView4(outPtr)
        }

        return this.__IApplicationView4.TryEnterViewModeAsync(viewMode)
    }

    /**
     * Attempts to change the app view to the specified view mode.
     * @param {Integer} viewMode A value of the enumeration that indicates the desired view mode.
     * @param {ViewModePreferences} viewModePreferences_ 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.tryenterviewmodeasync
     */
    TryEnterViewModeWithPreferencesAsync(viewMode, viewModePreferences_) {
        if (!this.HasProp("__IApplicationView4")) {
            if ((queryResult := this.QueryInterface(IApplicationView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView4 := IApplicationView4(outPtr)
        }

        return this.__IApplicationView4.TryEnterViewModeWithPreferencesAsync(viewMode, viewModePreferences_)
    }

    /**
     * Tries to hide the current app view. This method is a programmatic equivalent to a user closing the app.
     * @remarks
     * Consolidating an app view doesn't close it but rather hides it from the Windows shell, whether the user closed the app or this method is called programmatically. It can still be shown programmatically by the app using the various methods of [ApplicationViewSwitcher](/uwp/api/windows.ui.viewmanagement.applicationviewswitcher). To close the app view permanently, call [CoreWindow.Close](/uwp/api/windows.ui.core.corewindow.close).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.tryconsolidateasync
     */
    TryConsolidateAsync() {
        if (!this.HasProp("__IApplicationView4")) {
            if ((queryResult := this.QueryInterface(IApplicationView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView4 := IApplicationView4(outPtr)
        }

        return this.__IApplicationView4.TryConsolidateAsync()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PersistedStateId() {
        if (!this.HasProp("__IApplicationView7")) {
            if ((queryResult := this.QueryInterface(IApplicationView7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView7 := IApplicationView7(outPtr)
        }

        return this.__IApplicationView7.get_PersistedStateId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PersistedStateId(value) {
        if (!this.HasProp("__IApplicationView7")) {
            if ((queryResult := this.QueryInterface(IApplicationView7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView7 := IApplicationView7(outPtr)
        }

        return this.__IApplicationView7.put_PersistedStateId(value)
    }

    /**
     * 
     * @returns {WindowingEnvironment} 
     */
    get_WindowingEnvironment() {
        if (!this.HasProp("__IApplicationView9")) {
            if ((queryResult := this.QueryInterface(IApplicationView9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView9 := IApplicationView9(outPtr)
        }

        return this.__IApplicationView9.get_WindowingEnvironment()
    }

    /**
     * Returns the collection of display regions available for the view.
     * @returns {IVectorView<DisplayRegion>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationview.getdisplayregions
     */
    GetDisplayRegions() {
        if (!this.HasProp("__IApplicationView9")) {
            if ((queryResult := this.QueryInterface(IApplicationView9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationView9 := IApplicationView9(outPtr)
        }

        return this.__IApplicationView9.GetDisplayRegions()
    }

    /**
     * 
     * @returns {UIContext} 
     */
    get_UIContext() {
        if (!this.HasProp("__IApplicationViewWithContext")) {
            if ((queryResult := this.QueryInterface(IApplicationViewWithContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewWithContext := IApplicationViewWithContext(outPtr)
        }

        return this.__IApplicationViewWithContext.get_UIContext()
    }

;@endregion Instance Methods
}
