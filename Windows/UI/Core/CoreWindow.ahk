#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreWindow.ahk
#Include .\ICoreWindow2.ahk
#Include .\ICorePointerRedirector.ahk
#Include .\ICoreWindow3.ahk
#Include .\ICoreWindow4.ahk
#Include .\ICoreWindow5.ahk
#Include .\ICoreWindowWithContext.ahk
#Include .\ICoreWindowStatic.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreWindow.ahk
#Include .\WindowActivatedEventArgs.ahk
#Include .\AutomationProviderRequestedEventArgs.ahk
#Include .\CharacterReceivedEventArgs.ahk
#Include .\CoreWindowEventArgs.ahk
#Include .\InputEnabledEventArgs.ahk
#Include .\KeyEventArgs.ahk
#Include .\PointerEventArgs.ahk
#Include .\TouchHitTestingEventArgs.ahk
#Include .\WindowSizeChangedEventArgs.ahk
#Include .\VisibilityChangedEventArgs.ahk
#Include .\ClosestInteractiveBoundsRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the UWP app with input events and basic user interface behaviors.
 * @remarks
 * New instances of this class are obtained by calling [CoreApplication.CreateNewView](../windows.applicationmodel.core/coreapplication_createnewview_1643095864.md) and then inspecting the [CoreWindow](../windows.applicationmodel.core/coreapplicationview_corewindow.md) property on the returned [CoreApplicationView](../windows.applicationmodel.core/coreapplicationview.md) instance. Or you can obtain existing CoreWindow instances for a running app from the [CoreApplication.Views](../windows.applicationmodel.core/coreapplication_views.md) property, or by calling [CoreWindow.GetForCurrentThread](corewindow_getforcurrentthread_1771949562.md), as seen in the following example.
 * 
 * ```cppwinrt
 * // App.cpp
 * ...
 * // An implementation of IFrameworkView::Run.
 * void Run()
 * {
 *     CoreWindow window{ CoreWindow::GetForCurrentThread() };
 *     window.Activate();
 * 
 *     CoreDispatcher dispatcher{ window.Dispatcher() };
 *     dispatcher.ProcessEvents(CoreProcessEventsOption::ProcessUntilQuit);
 * }
 * 
 * // The CoreApplication::Run call indirectly calls the App::Run function above.
 * int __stdcall wWinMain(HINSTANCE, HINSTANCE, PWSTR, int)
 * {
 *     CoreApplication::Run(App());
 * }
 * ```
 * 
 * ```cppcx
 * void MyCoreWindowEvents::Run() // this is an implementation of IFrameworkView::Run() used to show context
 * {
 *     CoreWindow::GetForCurrentThread()->Activate();
 * 
 *     /...
 * 
 *     CoreWindow::GetForCurrentThread()->Dispatcher->ProcessEvents(CoreProcessEventsOption::ProcessUntilQuit);
 * }
 * ```
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreWindow extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreWindow

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreWindow.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the [CoreWindow](corewindow.md) instance for the currently active thread.
     * @returns {CoreWindow} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.getforcurrentthread
     */
    static GetForCurrentThread() {
        if (!CoreWindow.HasProp("__ICoreWindowStatic")) {
            activatableClassId := HSTRING.Create("Windows.UI.Core.CoreWindow")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreWindowStatic.IID)
            CoreWindow.__ICoreWindowStatic := ICoreWindowStatic(factoryPtr)
        }

        return CoreWindow.__ICoreWindowStatic.GetForCurrentThread()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the automation provider assigned to this window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.automationhostprovider
     * @type {IInspectable} 
     */
    AutomationHostProvider {
        get => this.get_AutomationHostProvider()
    }

    /**
     * Gets a [Rect](../windows.foundation/rect.md) value that contains the origin, height, and width of the client area of the window, in device-independent pixels (DIPs).
     * @remarks
     * The origin of the `Rect` is relative to the system window that includes both the _client_ and _non-client_ areas.
     * 
     * To convert from DIPs to physical pixels (and back), use these equations (where DPI is the dots per inch value for the screen):
     * 
     * + DIP value = (physical pixel x 96) / DPI
     * + physical pixel value = (DIP x DPI) / 96
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.bounds
     * @type {RECT} 
     */
    Bounds {
        get => this.get_Bounds()
    }

    /**
     * Gets the set of custom properties for the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.customproperties
     * @type {IPropertySet} 
     */
    CustomProperties {
        get => this.get_CustomProperties()
    }

    /**
     * Gets the event dispatcher for the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.dispatcher
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

    /**
     * Gets or sets the horizontal origin of the window's reading order alignment. If the language specified by the user interface is right-aligned (such as in Arabic or Hebrew), the horizontal origin of the reading layout for the window is on the right edge.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.flowdirection
     * @type {Integer} 
     */
    FlowDirection {
        get => this.get_FlowDirection()
        set => this.put_FlowDirection(value)
    }

    /**
     * Gets or sets a value that indicates whether input is enabled for the app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.isinputenabled
     * @type {Boolean} 
     */
    IsInputEnabled {
        get => this.get_IsInputEnabled()
        set => this.put_IsInputEnabled(value)
    }

    /**
     * Gets or sets the pointer cursor used by the app.
     * @remarks
     * Some applications, such as games, need to track relative mouse movements for specific functionality (for example, a virtual trackball or the viewing camera) and don't use the system cursor or absolute screen coordinates. For details on hiding the mouse cursor and ignoring absolute mouse data, see [Relative mouse movement and CoreWindow](/windows/uwp/gaming/relative-mouse-movement).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.pointercursor
     * @type {CoreCursor} 
     */
    PointerCursor {
        get => this.get_PointerCursor()
        set => this.put_PointerCursor(value)
    }

    /**
     * Gets the client coordinates of the pointer.
     * @remarks
     * You cannot read the pointer position with this API when the lock screen is present.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.pointerposition
     * @type {POINT} 
     */
    PointerPosition {
        get => this.get_PointerPosition()
        set => this.put_PointerPosition(value)
    }

    /**
     * Gets a value that indicates whether the window is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.visible
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
    }

    /**
     * Gets the **DispatcherQueue** for the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.dispatcherqueue
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

    /**
     * Gets a value that indicates the activation state of the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.activationmode
     * @type {Integer} 
     */
    ActivationMode {
        get => this.get_ActivationMode()
    }

    /**
     * Gets the context identifier for the core window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.uicontext
     * @type {UIContext} 
     */
    UIContext {
        get => this.get_UIContext()
    }

    /**
     * Is fired when the window completes activation or deactivation.
     * @type {TypedEventHandler<CoreWindow, WindowActivatedEventArgs>}
    */
    OnActivated {
        get {
            if(!this.HasProp("__OnActivated")){
                this.__OnActivated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{26a73b35-a7f9-52db-88d6-15726deb2523}"),
                    CoreWindow,
                    WindowActivatedEventArgs
                )
                this.__OnActivatedToken := this.add_Activated(this.__OnActivated.iface)
            }
            return this.__OnActivated
        }
    }

    /**
     * Is fired when a request for an automation handler is generated.
     * @type {TypedEventHandler<CoreWindow, AutomationProviderRequestedEventArgs>}
    */
    OnAutomationProviderRequested {
        get {
            if(!this.HasProp("__OnAutomationProviderRequested")){
                this.__OnAutomationProviderRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{54db5c04-81f7-5f46-9fb8-e49beec70a24}"),
                    CoreWindow,
                    AutomationProviderRequestedEventArgs
                )
                this.__OnAutomationProviderRequestedToken := this.add_AutomationProviderRequested(this.__OnAutomationProviderRequested.iface)
            }
            return this.__OnAutomationProviderRequested
        }
    }

    /**
     * Is fired when a new character is received by the input queue.
     * @remarks
     * Apps do not receive this event when an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input and sets [Handled](characterreceivedeventargs_handled.md) to **true**.
     * @type {TypedEventHandler<CoreWindow, CharacterReceivedEventArgs>}
    */
    OnCharacterReceived {
        get {
            if(!this.HasProp("__OnCharacterReceived")){
                this.__OnCharacterReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{73f846a8-0af6-5872-8fb8-ae2f56d8553e}"),
                    CoreWindow,
                    CharacterReceivedEventArgs
                )
                this.__OnCharacterReceivedToken := this.add_CharacterReceived(this.__OnCharacterReceived.iface)
            }
            return this.__OnCharacterReceived
        }
    }

    /**
     * Occurs when a window is closed (or the app terminates altogether).
     * @type {TypedEventHandler<CoreWindow, CoreWindowEventArgs>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d08e4f66-3457-57f2-ba0c-cb347133bd15}"),
                    CoreWindow,
                    CoreWindowEventArgs
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

    /**
     * Occurs when input is enabled or disabled for the app.
     * @type {TypedEventHandler<CoreWindow, InputEnabledEventArgs>}
    */
    OnInputEnabled {
        get {
            if(!this.HasProp("__OnInputEnabled")){
                this.__OnInputEnabled := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e230a64a-506a-59c3-bb61-5559ff995663}"),
                    CoreWindow,
                    InputEnabledEventArgs
                )
                this.__OnInputEnabledToken := this.add_InputEnabled(this.__OnInputEnabled.iface)
            }
            return this.__OnInputEnabled
        }
    }

    /**
     * The event that's raised when a non-system key is pressed.
     * 
     * The delegate type for this event is [TypedEventHandler\<TSender,TResult\>](/uwp/api/windows.foundation.typedeventhandler-2), where **TSender** is of type [CoreWindow](/uwp/api/windows.ui.core.corewindow?view=winrt-19041), and **TResult** is of type [KeyEventArgs](/uwp/api/windows.ui.core.keyeventargs).
     * @remarks
     * Apps do not receive this event when an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input and sets [Handled](keyeventargs_handled.md) to **true**.
     * @type {TypedEventHandler<CoreWindow, KeyEventArgs>}
    */
    OnKeyDown {
        get {
            if(!this.HasProp("__OnKeyDown")){
                this.__OnKeyDown := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a3ec0774-55ac-5d61-8232-b35c5d35c93c}"),
                    CoreWindow,
                    KeyEventArgs
                )
                this.__OnKeyDownToken := this.add_KeyDown(this.__OnKeyDown.iface)
            }
            return this.__OnKeyDown
        }
    }

    /**
     * The event that's raised when a non-system key is released after a press.
     * 
     * The delegate type for this event is [TypedEventHandler\<TSender,TResult\>](/uwp/api/windows.foundation.typedeventhandler-2), where **TSender** is of type [CoreWindow](/uwp/api/windows.ui.core.corewindow?view=winrt-19041), and **TResult** is of type [KeyEventArgs](/uwp/api/windows.ui.core.keyeventargs).
     * @remarks
     * Apps do not receive this event when an [IME](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input, and sets [Handled](keyeventargs_handled.md) to `true`.
     * @type {TypedEventHandler<CoreWindow, KeyEventArgs>}
    */
    OnKeyUp {
        get {
            if(!this.HasProp("__OnKeyUp")){
                this.__OnKeyUp := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a3ec0774-55ac-5d61-8232-b35c5d35c93c}"),
                    CoreWindow,
                    KeyEventArgs
                )
                this.__OnKeyUpToken := this.add_KeyUp(this.__OnKeyUp.iface)
            }
            return this.__OnKeyUp
        }
    }

    /**
     * Occurs when a pointer moves to another app. This event is raised after [PointerExited](corewindow_pointerexited.md) and is the final event received by the app for this pointer.
     * @type {TypedEventHandler<CoreWindow, PointerEventArgs>}
    */
    OnPointerCaptureLost {
        get {
            if(!this.HasProp("__OnPointerCaptureLost")){
                this.__OnPointerCaptureLost := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{420e1bb6-e99d-5e64-8e25-07467e3cae9e}"),
                    CoreWindow,
                    PointerEventArgs
                )
                this.__OnPointerCaptureLostToken := this.add_PointerCaptureLost(this.__OnPointerCaptureLost.iface)
            }
            return this.__OnPointerCaptureLost
        }
    }

    /**
     * Occurs when a pointer moves into the bounding box of the app.
     * @remarks
     * For touch input, the app receives this event before a [PointerPressed](icorewindow_pointerpressed.md) event.
     * @type {TypedEventHandler<CoreWindow, PointerEventArgs>}
    */
    OnPointerEntered {
        get {
            if(!this.HasProp("__OnPointerEntered")){
                this.__OnPointerEntered := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{420e1bb6-e99d-5e64-8e25-07467e3cae9e}"),
                    CoreWindow,
                    PointerEventArgs
                )
                this.__OnPointerEnteredToken := this.add_PointerEntered(this.__OnPointerEntered.iface)
            }
            return this.__OnPointerEntered
        }
    }

    /**
     * Occurs when the pointer moves outside the bounding box of the app.
     * @remarks
     * For touch input, the app receives this event before a [PointerReleased](icorewindow_pointerpressed.md) event.
     * @type {TypedEventHandler<CoreWindow, PointerEventArgs>}
    */
    OnPointerExited {
        get {
            if(!this.HasProp("__OnPointerExited")){
                this.__OnPointerExited := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{420e1bb6-e99d-5e64-8e25-07467e3cae9e}"),
                    CoreWindow,
                    PointerEventArgs
                )
                this.__OnPointerExitedToken := this.add_PointerExited(this.__OnPointerExited.iface)
            }
            return this.__OnPointerExited
        }
    }

    /**
     * Occurs when a pointer moves within the bounding box of the app.
     * @type {TypedEventHandler<CoreWindow, PointerEventArgs>}
    */
    OnPointerMoved {
        get {
            if(!this.HasProp("__OnPointerMoved")){
                this.__OnPointerMoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{420e1bb6-e99d-5e64-8e25-07467e3cae9e}"),
                    CoreWindow,
                    PointerEventArgs
                )
                this.__OnPointerMovedToken := this.add_PointerMoved(this.__OnPointerMoved.iface)
            }
            return this.__OnPointerMoved
        }
    }

    /**
     * Occurs when a mouse button is clicked, or the digitizer surface has been touched by a finger or pen, within the bounding rectangle of the app.
     * 
     * An interaction session starts when a single contact is detected and ends when that contact, and all subsequent contacts in the same session, are no longer detected.
     * 
     * This event is fired for the first contact detected in the interaction session. Details for all other concurrent contact pointers are exposed through a [PointerPointProperties](../windows.ui.input/pointerpointproperties.md) object (obtained by getting the [Properties](../windows.ui.input/pointerpoint_properties.md) property from a [PointerPoint](../windows.ui.input/pointerpoint.md) object).
     * @type {TypedEventHandler<CoreWindow, PointerEventArgs>}
    */
    OnPointerPressed {
        get {
            if(!this.HasProp("__OnPointerPressed")){
                this.__OnPointerPressed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{420e1bb6-e99d-5e64-8e25-07467e3cae9e}"),
                    CoreWindow,
                    PointerEventArgs
                )
                this.__OnPointerPressedToken := this.add_PointerPressed(this.__OnPointerPressed.iface)
            }
            return this.__OnPointerPressed
        }
    }

    /**
     * Occurs when a pressed mouse button is released, or a touch or pen contact is lifted from the digitizer surface, within the bounding rectangle of the app (or outside the bounding rectangle, if the pointer is captured).
     * @remarks
     * An interaction session starts when a single contact is detected and ends when that contact, and all subsequent contacts in the same session, are no longer detected.
     * 
     * This event is fired for each contact detected in the interaction session (except for mouse, where this event is fired only when the last mouse button is released).
     * @type {TypedEventHandler<CoreWindow, PointerEventArgs>}
    */
    OnPointerReleased {
        get {
            if(!this.HasProp("__OnPointerReleased")){
                this.__OnPointerReleased := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{420e1bb6-e99d-5e64-8e25-07467e3cae9e}"),
                    CoreWindow,
                    PointerEventArgs
                )
                this.__OnPointerReleasedToken := this.add_PointerReleased(this.__OnPointerReleased.iface)
            }
            return this.__OnPointerReleased
        }
    }

    /**
     * Occurs when a touch contact area intersects the bounding rectangle (or polygon) of a window that is registered for touch hit testing.
     * @type {TypedEventHandler<CoreWindow, TouchHitTestingEventArgs>}
    */
    OnTouchHitTesting {
        get {
            if(!this.HasProp("__OnTouchHitTesting")){
                this.__OnTouchHitTesting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{197654c9-0c47-502b-9aa1-0deb03ed9702}"),
                    CoreWindow,
                    TouchHitTestingEventArgs
                )
                this.__OnTouchHitTestingToken := this.add_TouchHitTesting(this.__OnTouchHitTesting.iface)
            }
            return this.__OnTouchHitTesting
        }
    }

    /**
     * The event that's raised when the mouse wheel is rotated.
     * 
     * The delegate type for this event is [TypedEventHandler\<TSender,TResult\>](/uwp/api/windows.foundation.typedeventhandler-2), where **TSender** is of type [CoreWindow](/uwp/api/windows.ui.core.corewindow?view=winrt-19041), and **TResult** is of type [PointerEventArgs](/uwp/api/windows.ui.core.pointereventargs).
     * @type {TypedEventHandler<CoreWindow, PointerEventArgs>}
    */
    OnPointerWheelChanged {
        get {
            if(!this.HasProp("__OnPointerWheelChanged")){
                this.__OnPointerWheelChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{420e1bb6-e99d-5e64-8e25-07467e3cae9e}"),
                    CoreWindow,
                    PointerEventArgs
                )
                this.__OnPointerWheelChangedToken := this.add_PointerWheelChanged(this.__OnPointerWheelChanged.iface)
            }
            return this.__OnPointerWheelChanged
        }
    }

    /**
     * Occurs when the window size is changed.
     * @remarks
     * The SizeChanged event is exposed to XAML apps as the [Window.SizeChanged](../windows.ui.xaml/window_sizechanged.md) event and to HTML apps as the [window.resize](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741886(v=vs.85)) event.
     * 
     * This event occurs when the window size changes or when one of the following properties changes:
     * 
     * 
     * + [ApplicationView.AdjacentToLeftDisplayEdge](../windows.ui.viewmanagement/applicationview_adjacenttoleftdisplayedge.md)
     * + [ApplicationView.AdjacentToRightDisplayEdge](../windows.ui.viewmanagement/applicationview_adjacenttorightdisplayedge.md)
     * + [ApplicationView.IsFullScreen](../windows.ui.viewmanagement/applicationview_isfullscreen.md)
     * + [ApplicationView.IsFullScreenMode](../windows.ui.viewmanagement/applicationview_isfullscreenmode.md)
     * + [UIViewSettings.UserInteractionMode](../windows.ui.viewmanagement/uiviewsettings_userinteractionmode.md)
     * You can use this event to listen for changes to the size or position of the current window.
     * @type {TypedEventHandler<CoreWindow, WindowSizeChangedEventArgs>}
    */
    OnSizeChanged {
        get {
            if(!this.HasProp("__OnSizeChanged")){
                this.__OnSizeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{318dbb67-4089-5690-9040-1d454fb2f686}"),
                    CoreWindow,
                    WindowSizeChangedEventArgs
                )
                this.__OnSizeChangedToken := this.add_SizeChanged(this.__OnSizeChanged.iface)
            }
            return this.__OnSizeChanged
        }
    }

    /**
     * Is fired when the window visibility is changed.
     * @type {TypedEventHandler<CoreWindow, VisibilityChangedEventArgs>}
    */
    OnVisibilityChanged {
        get {
            if(!this.HasProp("__OnVisibilityChanged")){
                this.__OnVisibilityChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{14b7f692-5583-52a1-aa42-fc1843c0f748}"),
                    CoreWindow,
                    VisibilityChangedEventArgs
                )
                this.__OnVisibilityChangedToken := this.add_VisibilityChanged(this.__OnVisibilityChanged.iface)
            }
            return this.__OnVisibilityChanged
        }
    }

    /**
     * Occurs on the input object receiving pointer input when the pointer is redirected to another input object (possibly in a separate process).
     * @type {TypedEventHandler<ICorePointerRedirector, PointerEventArgs>}
    */
    OnPointerRoutedAway {
        get {
            if(!this.HasProp("__OnPointerRoutedAway")){
                this.__OnPointerRoutedAway := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{29742d27-177d-54c3-b974-616fc45a2b0c}"),
                    ICorePointerRedirector,
                    PointerEventArgs
                )
                this.__OnPointerRoutedAwayToken := this.add_PointerRoutedAway(this.__OnPointerRoutedAway.iface)
            }
            return this.__OnPointerRoutedAway
        }
    }

    /**
     * Occurs when captured pointer input previously being delivered to another object, transitions to being delivered to this object.
     * @type {TypedEventHandler<ICorePointerRedirector, PointerEventArgs>}
    */
    OnPointerRoutedTo {
        get {
            if(!this.HasProp("__OnPointerRoutedTo")){
                this.__OnPointerRoutedTo := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{29742d27-177d-54c3-b974-616fc45a2b0c}"),
                    ICorePointerRedirector,
                    PointerEventArgs
                )
                this.__OnPointerRoutedToToken := this.add_PointerRoutedTo(this.__OnPointerRoutedTo.iface)
            }
            return this.__OnPointerRoutedTo
        }
    }

    /**
     * Occurs on all input objects ever associated with, but not currently receiving input from, a pointer that fires a [CoreIndependentInputSource.PointerReleased](coreindependentinputsource_pointerreleased.md) event on an input object.
     * @type {TypedEventHandler<ICorePointerRedirector, PointerEventArgs>}
    */
    OnPointerRoutedReleased {
        get {
            if(!this.HasProp("__OnPointerRoutedReleased")){
                this.__OnPointerRoutedReleased := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{29742d27-177d-54c3-b974-616fc45a2b0c}"),
                    ICorePointerRedirector,
                    PointerEventArgs
                )
                this.__OnPointerRoutedReleasedToken := this.add_PointerRoutedReleased(this.__OnPointerRoutedReleased.iface)
            }
            return this.__OnPointerRoutedReleased
        }
    }

    /**
     * > [!NOTE]
     * > Not intended for general use.
     * 
     * Occurs when a framework input manager requests the bounding rectangle of an interactive element within a specific bounding rectangle and closest to a specific pointer.
     * @type {TypedEventHandler<CoreWindow, ClosestInteractiveBoundsRequestedEventArgs>}
    */
    OnClosestInteractiveBoundsRequested {
        get {
            if(!this.HasProp("__OnClosestInteractiveBoundsRequested")){
                this.__OnClosestInteractiveBoundsRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{21a652d2-bfe2-5b2e-a2ab-ca45253be8b0}"),
                    CoreWindow,
                    ClosestInteractiveBoundsRequestedEventArgs
                )
                this.__OnClosestInteractiveBoundsRequestedToken := this.add_ClosestInteractiveBoundsRequested(this.__OnClosestInteractiveBoundsRequested.iface)
            }
            return this.__OnClosestInteractiveBoundsRequested
        }
    }

    /**
     * Occurs when a user starts to resize the window.
     * @type {TypedEventHandler<CoreWindow, IInspectable>}
    */
    OnResizeStarted {
        get {
            if(!this.HasProp("__OnResizeStarted")){
                this.__OnResizeStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6368ae3d-52d4-5290-b936-717a9acf5bea}"),
                    CoreWindow,
                    IInspectable
                )
                this.__OnResizeStartedToken := this.add_ResizeStarted(this.__OnResizeStarted.iface)
            }
            return this.__OnResizeStarted
        }
    }

    /**
     * Occurs when a user finishes resizing the window.
     * @type {TypedEventHandler<CoreWindow, IInspectable>}
    */
    OnResizeCompleted {
        get {
            if(!this.HasProp("__OnResizeCompleted")){
                this.__OnResizeCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6368ae3d-52d4-5290-b936-717a9acf5bea}"),
                    CoreWindow,
                    IInspectable
                )
                this.__OnResizeCompletedToken := this.add_ResizeCompleted(this.__OnResizeCompleted.iface)
            }
            return this.__OnResizeCompleted
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

        if(this.HasProp("__OnAutomationProviderRequestedToken")) {
            this.remove_AutomationProviderRequested(this.__OnAutomationProviderRequestedToken)
            this.__OnAutomationProviderRequested.iface.Dispose()
        }

        if(this.HasProp("__OnCharacterReceivedToken")) {
            this.remove_CharacterReceived(this.__OnCharacterReceivedToken)
            this.__OnCharacterReceived.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        if(this.HasProp("__OnInputEnabledToken")) {
            this.remove_InputEnabled(this.__OnInputEnabledToken)
            this.__OnInputEnabled.iface.Dispose()
        }

        if(this.HasProp("__OnKeyDownToken")) {
            this.remove_KeyDown(this.__OnKeyDownToken)
            this.__OnKeyDown.iface.Dispose()
        }

        if(this.HasProp("__OnKeyUpToken")) {
            this.remove_KeyUp(this.__OnKeyUpToken)
            this.__OnKeyUp.iface.Dispose()
        }

        if(this.HasProp("__OnPointerCaptureLostToken")) {
            this.remove_PointerCaptureLost(this.__OnPointerCaptureLostToken)
            this.__OnPointerCaptureLost.iface.Dispose()
        }

        if(this.HasProp("__OnPointerEnteredToken")) {
            this.remove_PointerEntered(this.__OnPointerEnteredToken)
            this.__OnPointerEntered.iface.Dispose()
        }

        if(this.HasProp("__OnPointerExitedToken")) {
            this.remove_PointerExited(this.__OnPointerExitedToken)
            this.__OnPointerExited.iface.Dispose()
        }

        if(this.HasProp("__OnPointerMovedToken")) {
            this.remove_PointerMoved(this.__OnPointerMovedToken)
            this.__OnPointerMoved.iface.Dispose()
        }

        if(this.HasProp("__OnPointerPressedToken")) {
            this.remove_PointerPressed(this.__OnPointerPressedToken)
            this.__OnPointerPressed.iface.Dispose()
        }

        if(this.HasProp("__OnPointerReleasedToken")) {
            this.remove_PointerReleased(this.__OnPointerReleasedToken)
            this.__OnPointerReleased.iface.Dispose()
        }

        if(this.HasProp("__OnTouchHitTestingToken")) {
            this.remove_TouchHitTesting(this.__OnTouchHitTestingToken)
            this.__OnTouchHitTesting.iface.Dispose()
        }

        if(this.HasProp("__OnPointerWheelChangedToken")) {
            this.remove_PointerWheelChanged(this.__OnPointerWheelChangedToken)
            this.__OnPointerWheelChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSizeChangedToken")) {
            this.remove_SizeChanged(this.__OnSizeChangedToken)
            this.__OnSizeChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVisibilityChangedToken")) {
            this.remove_VisibilityChanged(this.__OnVisibilityChangedToken)
            this.__OnVisibilityChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPointerRoutedAwayToken")) {
            this.remove_PointerRoutedAway(this.__OnPointerRoutedAwayToken)
            this.__OnPointerRoutedAway.iface.Dispose()
        }

        if(this.HasProp("__OnPointerRoutedToToken")) {
            this.remove_PointerRoutedTo(this.__OnPointerRoutedToToken)
            this.__OnPointerRoutedTo.iface.Dispose()
        }

        if(this.HasProp("__OnPointerRoutedReleasedToken")) {
            this.remove_PointerRoutedReleased(this.__OnPointerRoutedReleasedToken)
            this.__OnPointerRoutedReleased.iface.Dispose()
        }

        if(this.HasProp("__OnClosestInteractiveBoundsRequestedToken")) {
            this.remove_ClosestInteractiveBoundsRequested(this.__OnClosestInteractiveBoundsRequestedToken)
            this.__OnClosestInteractiveBoundsRequested.iface.Dispose()
        }

        if(this.HasProp("__OnResizeStartedToken")) {
            this.remove_ResizeStarted(this.__OnResizeStartedToken)
            this.__OnResizeStarted.iface.Dispose()
        }

        if(this.HasProp("__OnResizeCompletedToken")) {
            this.remove_ResizeCompleted(this.__OnResizeCompletedToken)
            this.__OnResizeCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_AutomationHostProvider() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.get_AutomationHostProvider()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Bounds() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.get_Bounds()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_CustomProperties() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.get_CustomProperties()
    }

    /**
     * 
     * @returns {CoreDispatcher} 
     */
    get_Dispatcher() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.get_Dispatcher()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FlowDirection() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.get_FlowDirection()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FlowDirection(value) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.put_FlowDirection(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInputEnabled() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.get_IsInputEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsInputEnabled(value) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.put_IsInputEnabled(value)
    }

    /**
     * 
     * @returns {CoreCursor} 
     */
    get_PointerCursor() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.get_PointerCursor()
    }

    /**
     * 
     * @param {CoreCursor} value 
     * @returns {HRESULT} 
     */
    put_PointerCursor(value) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.put_PointerCursor(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_PointerPosition() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.get_PointerPosition()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.get_Visible()
    }

    /**
     * Activates the window. This method is called to present the window on the screen.
     * @remarks
     * The window is presented if the app is the foreground window. If the app has more than one window, the activating window is presented when the app is set to the foreground.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.activate
     */
    Activate() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.Activate()
    }

    /**
     * Closes a secondary window and exits the message loop.
     * @remarks
     * This method also causes the [ProcessEvents](coredispatcher_processevents_1611214514.md) operation to exit the event-processing loop.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.close
     */
    Close() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.Close()
    }

    /**
     * Asynchronously retrieves the state of a virtual key.
     * @param {Integer} virtualKey_ The virtual key for which state is returned.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.getasynckeystate
     */
    GetAsyncKeyState(virtualKey_) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.GetAsyncKeyState(virtualKey_)
    }

    /**
     * Retrieves the state of a virtual key.
     * @param {Integer} virtualKey_ The virtual key for which state is returned.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.getkeystate
     */
    GetKeyState(virtualKey_) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.GetKeyState(virtualKey_)
    }

    /**
     * Dissociates pointer input from the app, if previously associated through [SetPointerCapture](corewindow_setpointercapture_651539121.md), and restores normal pointer input processing.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.releasepointercapture
     */
    ReleasePointerCapture() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.ReleasePointerCapture()
    }

    /**
     * Associates pointer input with the app. Once a pointer is captured, all subsequent events associated with that pointer are fired by the app.
     * @remarks
     * A pointer can be captured only by a single app at any time. Only the foreground window can capture the pointer. Pointer events continue even if the pointer moves outside the bounds of the app.
     * 
     * A pointer can only be captured when contact is detected (mouse button pressed, touch contact down, stylus in contact), and the pointer is within the bounding rectangle of the app.
     * 
     * The pointer is released on a [PointerReleased](corewindow_pointerreleased.md) or a [PointerCaptureLost](corewindow_pointercapturelost.md) event, or [ReleasePointerCapture](corewindow_releasepointercapture_193058457.md) is explicitly called.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.setpointercapture
     */
    SetPointerCapture() {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.SetPointerCapture()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, WindowActivatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Activated(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_Activated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Activated(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_Activated(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, AutomationProviderRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AutomationProviderRequested(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_AutomationProviderRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_AutomationProviderRequested(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_AutomationProviderRequested(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, CharacterReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CharacterReceived(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_CharacterReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CharacterReceived(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_CharacterReceived(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, CoreWindowEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Closed(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_Closed(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, InputEnabledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InputEnabled(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_InputEnabled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_InputEnabled(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_InputEnabled(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, KeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyDown(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_KeyDown(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_KeyDown(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_KeyDown(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, KeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyUp(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_KeyUp(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_KeyUp(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_KeyUp(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerCaptureLost(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_PointerCaptureLost(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerCaptureLost(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_PointerCaptureLost(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerEntered(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_PointerEntered(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerEntered(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_PointerEntered(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerExited(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_PointerExited(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerExited(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_PointerExited(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerMoved(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_PointerMoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerMoved(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_PointerMoved(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerPressed(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_PointerPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerPressed(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_PointerPressed(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerReleased(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_PointerReleased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerReleased(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_PointerReleased(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, TouchHitTestingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TouchHitTesting(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_TouchHitTesting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_TouchHitTesting(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_TouchHitTesting(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerWheelChanged(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_PointerWheelChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerWheelChanged(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_PointerWheelChanged(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, WindowSizeChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SizeChanged(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_SizeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_SizeChanged(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_SizeChanged(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, VisibilityChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VisibilityChanged(handler) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.add_VisibilityChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_VisibilityChanged(cookie) {
        if (!this.HasProp("__ICoreWindow")) {
            if ((queryResult := this.QueryInterface(ICoreWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow := ICoreWindow(outPtr)
        }

        return this.__ICoreWindow.remove_VisibilityChanged(cookie)
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_PointerPosition(value) {
        if (!this.HasProp("__ICoreWindow2")) {
            if ((queryResult := this.QueryInterface(ICoreWindow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow2 := ICoreWindow2(outPtr)
        }

        return this.__ICoreWindow2.put_PointerPosition(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ICorePointerRedirector, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerRoutedAway(handler) {
        if (!this.HasProp("__ICorePointerRedirector")) {
            if ((queryResult := this.QueryInterface(ICorePointerRedirector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerRedirector := ICorePointerRedirector(outPtr)
        }

        return this.__ICorePointerRedirector.add_PointerRoutedAway(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerRoutedAway(cookie) {
        if (!this.HasProp("__ICorePointerRedirector")) {
            if ((queryResult := this.QueryInterface(ICorePointerRedirector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerRedirector := ICorePointerRedirector(outPtr)
        }

        return this.__ICorePointerRedirector.remove_PointerRoutedAway(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<ICorePointerRedirector, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerRoutedTo(handler) {
        if (!this.HasProp("__ICorePointerRedirector")) {
            if ((queryResult := this.QueryInterface(ICorePointerRedirector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerRedirector := ICorePointerRedirector(outPtr)
        }

        return this.__ICorePointerRedirector.add_PointerRoutedTo(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerRoutedTo(cookie) {
        if (!this.HasProp("__ICorePointerRedirector")) {
            if ((queryResult := this.QueryInterface(ICorePointerRedirector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerRedirector := ICorePointerRedirector(outPtr)
        }

        return this.__ICorePointerRedirector.remove_PointerRoutedTo(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<ICorePointerRedirector, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerRoutedReleased(handler) {
        if (!this.HasProp("__ICorePointerRedirector")) {
            if ((queryResult := this.QueryInterface(ICorePointerRedirector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerRedirector := ICorePointerRedirector(outPtr)
        }

        return this.__ICorePointerRedirector.add_PointerRoutedReleased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerRoutedReleased(cookie) {
        if (!this.HasProp("__ICorePointerRedirector")) {
            if ((queryResult := this.QueryInterface(ICorePointerRedirector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerRedirector := ICorePointerRedirector(outPtr)
        }

        return this.__ICorePointerRedirector.remove_PointerRoutedReleased(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, ClosestInteractiveBoundsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ClosestInteractiveBoundsRequested(handler) {
        if (!this.HasProp("__ICoreWindow3")) {
            if ((queryResult := this.QueryInterface(ICoreWindow3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow3 := ICoreWindow3(outPtr)
        }

        return this.__ICoreWindow3.add_ClosestInteractiveBoundsRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ClosestInteractiveBoundsRequested(cookie) {
        if (!this.HasProp("__ICoreWindow3")) {
            if ((queryResult := this.QueryInterface(ICoreWindow3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow3 := ICoreWindow3(outPtr)
        }

        return this.__ICoreWindow3.remove_ClosestInteractiveBoundsRequested(cookie)
    }

    /**
     * Retrieves the unique ID for the input device that generated this key event.
     * 
     * > GetCurrentKeyEventDeviceId is not supported for all input devices.
     * @remarks
     * Use GetCurrentKeyEventDeviceId to differentiate between devices that can generate key events, such as multiple game controllers. The device id is useful for associating the input device with a specific user account.
     * 
     * To get a valid device ID, this method must be called from your [KeyUp](corewindow_keyup.md) and [KeyDown](corewindow_keydown.md) event handlers.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindow.getcurrentkeyeventdeviceid
     */
    GetCurrentKeyEventDeviceId() {
        if (!this.HasProp("__ICoreWindow3")) {
            if ((queryResult := this.QueryInterface(ICoreWindow3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow3 := ICoreWindow3(outPtr)
        }

        return this.__ICoreWindow3.GetCurrentKeyEventDeviceId()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ResizeStarted(handler) {
        if (!this.HasProp("__ICoreWindow4")) {
            if ((queryResult := this.QueryInterface(ICoreWindow4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow4 := ICoreWindow4(outPtr)
        }

        return this.__ICoreWindow4.add_ResizeStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ResizeStarted(cookie) {
        if (!this.HasProp("__ICoreWindow4")) {
            if ((queryResult := this.QueryInterface(ICoreWindow4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow4 := ICoreWindow4(outPtr)
        }

        return this.__ICoreWindow4.remove_ResizeStarted(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ResizeCompleted(handler) {
        if (!this.HasProp("__ICoreWindow4")) {
            if ((queryResult := this.QueryInterface(ICoreWindow4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow4 := ICoreWindow4(outPtr)
        }

        return this.__ICoreWindow4.add_ResizeCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ResizeCompleted(cookie) {
        if (!this.HasProp("__ICoreWindow4")) {
            if ((queryResult := this.QueryInterface(ICoreWindow4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow4 := ICoreWindow4(outPtr)
        }

        return this.__ICoreWindow4.remove_ResizeCompleted(cookie)
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        if (!this.HasProp("__ICoreWindow5")) {
            if ((queryResult := this.QueryInterface(ICoreWindow5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow5 := ICoreWindow5(outPtr)
        }

        return this.__ICoreWindow5.get_DispatcherQueue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActivationMode() {
        if (!this.HasProp("__ICoreWindow5")) {
            if ((queryResult := this.QueryInterface(ICoreWindow5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindow5 := ICoreWindow5(outPtr)
        }

        return this.__ICoreWindow5.get_ActivationMode()
    }

    /**
     * 
     * @returns {UIContext} 
     */
    get_UIContext() {
        if (!this.HasProp("__ICoreWindowWithContext")) {
            if ((queryResult := this.QueryInterface(ICoreWindowWithContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowWithContext := ICoreWindowWithContext(outPtr)
        }

        return this.__ICoreWindowWithContext.get_UIContext()
    }

;@endregion Instance Methods
}
