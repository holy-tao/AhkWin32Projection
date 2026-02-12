#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindow.ahk
#Include .\IWindow2.ahk
#Include .\IWindow3.ahk
#Include .\IWindow4.ahk
#Include .\IWindowStatics.ahk
#Include .\WindowActivatedEventHandler.ahk
#Include ..\Core\WindowActivatedEventArgs.ahk
#Include .\WindowClosedEventHandler.ahk
#Include ..\Core\CoreWindowEventArgs.ahk
#Include .\WindowSizeChangedEventHandler.ahk
#Include ..\Core\WindowSizeChangedEventArgs.ahk
#Include .\WindowVisibilityChangedEventHandler.ahk
#Include ..\Core\VisibilityChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an application window.
 * @remarks
 * This class represents the window of the current [Application](application.md). In the same manner as the static [Application](application_application_1221375020.md) property, the static [Current](application_current.md) property will return the app window object. From this object, an app can utilize the [Dispatcher](window_dispatcher.md) or determine the size of the Window from the [Bounds](window_bounds.md) property. The most common usage for Window is setting a [UIElement](uielement.md) to the [Content](window_content.md) that represents the app UI. This is usually done as part of app activation (for example in the [OnLaunched](application_onlaunched_859642554.md) override.) You can change this window content throughout the lifetime of the window.
 * 
 * There is no XAML representation of the Window class because it is not a control.
 * 
 * A Window object is just surfacing information from [CoreWindow](../windows.ui.core/corewindow.md), which in turn is referencing the window created by the system.
 * 
 * Make sure to call [Activate](window_activate_1797342875.md) on any Window you use on initial activation. If you use the default app templates from Microsoft Visual Studio, calling [Window.Activate](window_activate_1797342875.md) is part of the initial code in the app.xaml code-behind file.
 * 
 * The LayoutAwarePage class that is part of some application templates in Microsoft Visual Studio has handling for the [SizeChanged](window_sizechanged.md) event, which is used for keeping track of visual states that match values of [ApplicationViewState](../windows.ui.viewmanagement/applicationviewstate.md). LayoutAwarePage also has code that checks [Bounds](window_bounds.md) and uses this value to influence how page-wide input events are handled.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.window
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class Window extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindow

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindow.IID

    /**
     * Gets the window of the current thread.
     * @remarks
     * The value of this property depends on the thread from which it is called. If called from a UI thread, the value is the Window instance for that thread. On any other thread, the value is `null`.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.window.current
     * @type {Window} 
     */
    static Current {
        get => Window.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Window} 
     */
    static get_Current() {
        if (!Window.HasProp("__IWindowStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Window")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowStatics.IID)
            Window.__IWindowStatics := IWindowStatics(factoryPtr)
        }

        return Window.__IWindowStatics.get_Current()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a [Rect](../windows.foundation/rect.md) value that contains the origin, height, and width of the client area of the window, in device-independent pixels (DIPs).
     * @remarks
     * The origin of the `Rect` is relative to the system window that includes both the _client_ and _non-client_ areas.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.window.bounds
     * @type {RECT} 
     */
    Bounds {
        get => this.get_Bounds()
    }

    /**
     * Gets a value that reports whether the window is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.window.visible
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
    }

    /**
     * Gets or sets the visual root of an application window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.window.content
     * @type {UIElement} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets an internal *core* object for the application window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.window.corewindow
     * @type {CoreWindow} 
     */
    CoreWindow {
        get => this.get_CoreWindow()
    }

    /**
     * Gets the [CoreDispatcher](../windows.ui.core/coredispatcher.md) object for the [Window](window.md), which is generally the [CoreDispatcher](../windows.ui.core/coredispatcher.md) for the UI thread.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.window.dispatcher
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

    /**
     * Gets the [Compositor](../windows.ui.composition/compositor.md) for this window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.window.compositor
     * @type {Compositor} 
     */
    Compositor {
        get => this.get_Compositor()
    }

    /**
     * Gets the context identifier for the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.window.uicontext
     * @type {UIContext} 
     */
    UIContext {
        get => this.get_UIContext()
    }

    /**
     * Occurs when the window has successfully been activated.
     * @remarks
     * This event occurs when a [Window](window.md) has been activated or deactivated by the system. An app can determine what the status of the [Window](window.md) activation is by checking the [WindowActivatedEventArgs.WindowActivationState](../windows.ui.core/windowactivatedeventargs_windowactivationstate.md) property. A [Window](window.md) could be visible on screen but not be active (for example, in snapped apps). Additionally, if any other parts of the system takes focus away from the window, this event will occur. This could happen as a result of user interaction or code, and the [WindowActivationState](../windows.ui.core/windowactivatedeventargs_windowactivationstate.md) will indicate which action has taken place.
     * @type {WindowActivatedEventHandler}
    */
    OnActivated {
        get {
            if(!this.HasProp("__OnActivated")){
                this.__OnActivated := WinRTEventHandler(
                    WindowActivatedEventHandler,
                    WindowActivatedEventHandler.IID,
                    IInspectable,
                    WindowActivatedEventArgs
                )
                this.__OnActivatedToken := this.add_Activated(this.__OnActivated.iface)
            }
            return this.__OnActivated
        }
    }

    /**
     * Occurs when the window has closed.
     * @remarks
     * The Closed event occurs when a [Window](window.md) closes. However, UWP app typically use a single [Window](window.md) instance, and do not open and close additional [Window](window.md) instances.
     * @type {WindowClosedEventHandler}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    WindowClosedEventHandler,
                    WindowClosedEventHandler.IID,
                    IInspectable,
                    CoreWindowEventArgs
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

    /**
     * Occurs when the app window has first rendered or has changed its rendering size.
     * @remarks
     * This event occurs whenever there are changes in the [Bounds](window_bounds.md) values for the app window. This might be because the user resizes your app or changes the display orientation. Another trigger is if the user moves your app to a new display that has a different resolution and the app window expands to fill it.
     * 
     * Window.SizeChanged is the event to handle in order to detect that the user has deliberately resized your app or rotated the display on a PC that detects orientation. You may want to detect that the app window has changed from landscape to portrait orientation or vice versa. The app window orientation might influence how you want the individual controls within the app window to appear. For example, you might want to display data lists in a [ListView](../windows.ui.xaml.controls/listview.md) for portrait orientation, but in a [GridView](../windows.ui.xaml.controls/gridview.md) for landscape orientation. Typically you would compare the ratio of `Window.Current.Bounds.Width` to `Window.Current.Bounds.Height` in order to determine the orientation based on the [Bounds](window_bounds.md), and you'd do this whenever Window.SizeChanged fires. Exactly how you interpret width/height ratios is up to you.
     * 
     * If you're attaching handlers for Window.SizeChanged at the [Page](../windows.ui.xaml.controls/page.md) level within a handler for the [FrameworkElement.Loaded](frameworkelement_loaded.md) event, you should detach those handlers in a [FrameworkElement.Unloaded](frameworkelement_unloaded.md) event handler from that [Page](../windows.ui.xaml.controls/page.md). The [Window.Current](window_current.md) instance remains active between page navigations and should only have a handler active for the most current page code.
     * 
     * 
     * <!--Do we need further justification? Not sure it is an outright leak so don't want to state that.-->
     * A Window.SizeChanged handler is not how you enforce the minimum size that your app can be resized to. That's controlled by the app manifest. However, your logic for changing the visual states should be able to load a state that's designed for the minimum width you intended, and you'd typically use the [Bounds](window_bounds.md) values and Window.SizeChanged handling to detect when the app window is using minimum width.
     * 
     * For more info on how to use Window.SizeChanged to detect changes in the app window environment and load the appropriate visual states for your app, see [Quickstart: Designing apps for different window sizes](/previous-versions/windows/apps/dn297195(v=win.10)).
     * 
     * 
     * <!--Are there any VS templates that add default Window.SizeChanged anymore? This was in the old layoutawarepage but not the new one. And yet it seems like pretty important basic app functionality, just as important as the nav and suspension support-->
     * 
     * <!--Does SizeChanged fire on suspension/close? It appears it does but want to verify-->
     * There's another event named [SizeChanged](frameworkelement_sizechanged.md) that exists on [FrameworkElement](frameworkelement.md) derived types ([Window](window.md) is not a [FrameworkElement](frameworkelement.md) type). [FrameworkElement.SizeChanged](frameworkelement_sizechanged.md) events might fire in many of the same circumstances that cause Window.SizeChanged to fire. An app window size change can cause the root visual element (typically a [Page](../windows.ui.xaml.controls/page.md) or panel) to change its size. This sets off a cascade of layout invalidations for any the subelements that are using adaptive layout to fill available space. Each element that has new dimensions because of a layout pass will fire its own [FrameworkElement.SizeChanged](frameworkelement_sizechanged.md) event.
     * 
     * 
     * <!--More work to do here. How does FE.SizeChanged relate? For device orientation change, should be pointing to DisplayInformation.OrientationChanged? It may be that a mix of all three events is what's really needed to account for all resize scenarios.-->
     * 
     * <!--The data in WindowSizeChangedEventArgs seems pretty useless for most scenarios especially if you use Window.Current.Bounds instead of WindowSizeChangedEventArgs.Size. And when would you set to Handled, what does that even do?-->
     * @type {WindowSizeChangedEventHandler}
    */
    OnSizeChanged {
        get {
            if(!this.HasProp("__OnSizeChanged")){
                this.__OnSizeChanged := WinRTEventHandler(
                    WindowSizeChangedEventHandler,
                    WindowSizeChangedEventHandler.IID,
                    IInspectable,
                    WindowSizeChangedEventArgs
                )
                this.__OnSizeChangedToken := this.add_SizeChanged(this.__OnSizeChanged.iface)
            }
            return this.__OnSizeChanged
        }
    }

    /**
     * Occurs when the value of the [Visible](window_visible.md) property changes.
     * @remarks
     * [VisibilityChangedEventArgs](../windows.ui.core/visibilitychangedeventargs.md) includes a Boolean **Visible** property that you should check to determine the current visibility state.
     * 
     * <!--TBW discussion of the factors of window visibility. Lower z order behind and otherwise occluded probably factor in. Should we mention WM_VISIBILITYCHANGED and or CoreWindow? One scenario mentioned in the  BC doc that spawns this is so that apps that do perform some background (eg a video app that continues to play the bg audio after user or system hides window) can make the right choices about shutting down some (but not all) resources.-->
     * @type {WindowVisibilityChangedEventHandler}
    */
    OnVisibilityChanged {
        get {
            if(!this.HasProp("__OnVisibilityChanged")){
                this.__OnVisibilityChanged := WinRTEventHandler(
                    WindowVisibilityChangedEventHandler,
                    WindowVisibilityChangedEventHandler.IID,
                    IInspectable,
                    VisibilityChangedEventArgs
                )
                this.__OnVisibilityChangedToken := this.add_VisibilityChanged(this.__OnVisibilityChanged.iface)
            }
            return this.__OnVisibilityChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnActivatedToken")) {
            this.remove_Activated(this.__OnActivatedToken)
            this.__OnActivated.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        if(this.HasProp("__OnSizeChangedToken")) {
            this.remove_SizeChanged(this.__OnSizeChangedToken)
            this.__OnSizeChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVisibilityChangedToken")) {
            this.remove_VisibilityChanged(this.__OnVisibilityChangedToken)
            this.__OnVisibilityChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Bounds() {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.get_Bounds()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.get_Visible()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Content() {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.get_Content()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.put_Content(value)
    }

    /**
     * 
     * @returns {CoreWindow} 
     */
    get_CoreWindow() {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.get_CoreWindow()
    }

    /**
     * 
     * @returns {CoreDispatcher} 
     */
    get_Dispatcher() {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.get_Dispatcher()
    }

    /**
     * 
     * @param {WindowActivatedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Activated(handler) {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.add_Activated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Activated(token) {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.remove_Activated(token)
    }

    /**
     * 
     * @param {WindowClosedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.remove_Closed(token)
    }

    /**
     * 
     * @param {WindowSizeChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SizeChanged(handler) {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.add_SizeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SizeChanged(token) {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.remove_SizeChanged(token)
    }

    /**
     * 
     * @param {WindowVisibilityChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VisibilityChanged(handler) {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.add_VisibilityChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VisibilityChanged(token) {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.remove_VisibilityChanged(token)
    }

    /**
     * Attempts to activate the application window by bringing it to the foreground and setting the input focus to it.
     * @remarks
     * If you use the default app templates from Microsoft Visual Studio, Window.Activate is part of the initial code in the app.xaml code-behind file. Specifically, Activate is called from the default [OnLaunched](application_onlaunched_859642554.md) override. In cases where the template produces a page navigation experience, previous states are detected so that the navigation framework isn't overwritten if it already existed, but Activate is called regardless.
     * 
     * Calling Activate is required for all app activation scenario, not just app launch.
     * 
     * This method is important for the correct operation of an app. If an app does not call Activate on the [Current](application_current.md) window, and the app is not visible on screen, then the app will be terminated after 15 seconds if it's a UWP app. If the app or its splash screen is kept on screen there is no time limit, but eventually the app needs to call Activate to progress. Also, certain app contracts extend the time limit.
     * 
     * You can modify the default [OnLaunched](application_onlaunched_859642554.md) implementation in order to delay calling Activate. You might do this to have all app rendering be complete before the main [Window](window.md) is shown. For example, a delay can be useful to finish loading [Image](../windows.ui.xaml.controls/image.md) source files in the initial UI. (These load asynchronously and it's impractical to handle [ImageOpened](../windows.ui.xaml.controls/image_imageopened.md) from app.xaml code-behind.) On the other hand, delaying the call can create an undesirable user experience if the splash screen is visible for too long.
     * 
     * For secondary windows, you also need to call Activate. For more info about secondary windows, see [Show multiple views for an app](/windows/uwp/design/layout/show-multiple-views).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.window.activate
     */
    Activate() {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.Activate()
    }

    /**
     * Closes the application window.
     * @remarks
     * UWP app typically use a single [Window](window.md) instance, and do not open and close additional [Window](window.md) instances. Additionally, you will not typically provide custom UI to enable users to close the app window.
     * 
     * The [Closed](window_closed.md) event occurs when a [Window](window.md) closes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.window.close
     */
    Close() {
        if (!this.HasProp("__IWindow")) {
            if ((queryResult := this.QueryInterface(IWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow := IWindow(outPtr)
        }

        return this.__IWindow.Close()
    }

    /**
     * Makes a XAML element interact with the system as if it’s the title bar.
     * @remarks
     * This method lets you specify a XAML element that interacts with the system as if it’s the app window's title bar. When you use this method, you typically set the [CoreApplicationViewTitleBar.ExtendViewIntoTitleBar](../windows.applicationmodel.core/coreapplicationviewtitlebar_extendviewintotitlebar.md) property to **true** in order to hide the default system title bar. However, even when the default system title bar is not hidden, this can be used to make additional regions in your app behave like the title bar.
     * 
     * 
     * 
     * Use the [CoreApplicationView.TitleBar](../windows.applicationmodel.core/coreapplicationview_titlebar.md) property to get the instance of [CoreApplicationViewTitleBar](../windows.applicationmodel.core/coreapplicationviewtitlebar.md) for your app window, like this.
     * 
     * ```csharp
     * // Requires using Windows.ApplicationModel.Core
     * CoreApplicationView coreView = CoreApplication.GetCurrentView();
     * CoreApplicationViewTitleBar coreTitleBar = coreView.TitleBar;
     * coreTitleBar.ExtendViewIntoTitleBar = true;
     * 
     * // -- OR --
     * 
     * CoreApplication.GetCurrentView().TitleBar.ExtendViewIntoTitleBar = true;
     * ```
     * 
     * > [!NOTE]
     * > This method has no effect when an app is run on a mobile device, because apps are always full-screen on mobile devices and do not have a window title bar.
     * @param {UIElement} value Custom XAML content that should act as the title bar. To use multiple objects, wrap them in a container element such as one derived from [Panel](../windows.ui.xaml.controls/panel.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.window.settitlebar
     */
    SetTitleBar(value) {
        if (!this.HasProp("__IWindow2")) {
            if ((queryResult := this.QueryInterface(IWindow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow2 := IWindow2(outPtr)
        }

        return this.__IWindow2.SetTitleBar(value)
    }

    /**
     * 
     * @returns {Compositor} 
     */
    get_Compositor() {
        if (!this.HasProp("__IWindow3")) {
            if ((queryResult := this.QueryInterface(IWindow3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow3 := IWindow3(outPtr)
        }

        return this.__IWindow3.get_Compositor()
    }

    /**
     * 
     * @returns {UIContext} 
     */
    get_UIContext() {
        if (!this.HasProp("__IWindow4")) {
            if ((queryResult := this.QueryInterface(IWindow4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindow4 := IWindow4(outPtr)
        }

        return this.__IWindow4.get_UIContext()
    }

;@endregion Instance Methods
}
