#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppWindow.ahk
#Include .\IAppWindowStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppWindow.ahk
#Include .\AppWindowChangedEventArgs.ahk
#Include .\AppWindowClosedEventArgs.ahk
#Include .\AppWindowCloseRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a system-managed container for the content of an app.
 * @remarks
 * > [!NOTE]
 * > AppWindow is currently in preview. This means you can submit apps that use AppWindow to the Store, but some platform and framework components are known to not work with AppWindow (see Limitations).
 * 
 * An AppWindow can be used to represent a displayed portion of a Windows Runtime app when it has more than one window. It is similar in concept to an [ApplicationView](../windows.ui.viewmanagement/applicationview.md), but not the same in behavior and lifetime.
 * 
 * Unlike [ApplicationView](../windows.ui.viewmanagement/applicationview.md), each AppWindow does not have a corresponding [CoreWindow](../windows.ui.core/corewindow.md). They all share the same UI processing thread (including the event dispatcher) from which they were created.
 * 
 * To obtain an object of this type, call [AppWindow.TryCreateAsync](appwindow_trycreateasync_1875892381.md).
 * 
 * To connect content to your AppWindow, call [ElementCompositionPreview.SetAppWindowContent](../windows.ui.xaml.hosting/elementcompositionpreview_setappwindowcontent_20712035.md).
 * 
 * You can only connect XAML content to your AppWindow, there is no support for native DirectX or Holographic content.
 * 
 * To specify a preferred minimum size for the app window, use the [WindowManagementPreview.SetPreferredMinSize](/uwp/api/windows.ui.windowmanagement.preview.windowmanagementpreview.setpreferredminsize) method.
 * 
 * > [!TIP]
 * >For more info and code demonstrating AppWindow, see [Show multiple views for an app](/windows/uwp/design/layout/show-multiple-views) and [Show multiple views with AppWindow](/windows/uwp/design/layout/app-window).
 * >
 * > A sample that shows how to use the AppWindow API can be found in the Windows Universal Samples repo on GitHub under [Samples/AppWindow](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/AppWindow).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindow extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppWindow

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppWindow.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Attempts to asynchronously create a new instance of AppWindow.
     * @returns {IAsyncOperation<AppWindow>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.trycreateasync
     */
    static TryCreateAsync() {
        if (!AppWindow.HasProp("__IAppWindowStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WindowManagement.AppWindow")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppWindowStatics.IID)
            AppWindow.__IAppWindowStatics := IAppWindowStatics(factoryPtr)
        }

        return AppWindow.__IAppWindowStatics.TryCreateAsync()
    }

    /**
     * Clears any properties the system has saved for any window PersistedStateId for the given application.
     * @remarks
     * If a view with a PersistedStateId still exists in the app at the time of calling this method, the system will save state for this ID when that view is updated or closed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.clearallpersistedstate
     */
    static ClearAllPersistedState() {
        if (!AppWindow.HasProp("__IAppWindowStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WindowManagement.AppWindow")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppWindowStatics.IID)
            AppWindow.__IAppWindowStatics := IAppWindowStatics(factoryPtr)
        }

        return AppWindow.__IAppWindowStatics.ClearAllPersistedState()
    }

    /**
     * Clears any properties the system has saved for the window with the specified ID for the given application.
     * @remarks
     * If a view with this ID still exists in the app at the time of calling this method, the system will save state for this ID when that view is updated or closed.
     * @param {HSTRING} key The [PersistedStateId](appwindow_persistedstateid.md) for the view to be cleared.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.clearpersistedstate
     */
    static ClearPersistedState(key) {
        if (!AppWindow.HasProp("__IAppWindowStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WindowManagement.AppWindow")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppWindowStatics.IID)
            AppWindow.__IAppWindowStatics := IAppWindowStatics(factoryPtr)
        }

        return AppWindow.__IAppWindowStatics.ClearPersistedState(key)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the app content currently attached to the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.content
     * @type {UIContentRoot} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets the dispatcher queue for the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.dispatcherqueue
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

    /**
     * Gets the frame for the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.frame
     * @type {AppWindowFrame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * Gets a value that indicates whether the window can be seen on a display.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.isvisible
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
    }

    /**
     * Gets or sets a string that identifies this window for tracking and saving state.
     * @remarks
     * This identifier is used by the shell when the window moves or changes size so that the system can recreate a window with the same experience at a later time or in another session.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.persistedstateid
     * @type {HSTRING} 
     */
    PersistedStateId {
        get => this.get_PersistedStateId()
        set => this.put_PersistedStateId(value)
    }

    /**
     * Gets the presenter for the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.presenter
     * @type {AppWindowPresenter} 
     */
    Presenter {
        get => this.get_Presenter()
    }

    /**
     * Gets or sets the displayed title of the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets the title bar of the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.titlebar
     * @type {AppWindowTitleBar} 
     */
    TitleBar {
        get => this.get_TitleBar()
    }

    /**
     * Gets the UI context for the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.uicontext
     * @type {UIContext} 
     */
    UIContext {
        get => this.get_UIContext()
    }

    /**
     * Gets the windowing environment for the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.windowingenvironment
     * @type {WindowingEnvironment} 
     */
    WindowingEnvironment {
        get => this.get_WindowingEnvironment()
    }

    /**
     * Occurs when a property of the app window has changed.
     * @type {TypedEventHandler<AppWindow, AppWindowChangedEventArgs>}
    */
    OnChanged {
        get {
            if(!this.HasProp("__OnChanged")){
                this.__OnChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c6a30887-6f60-597f-b918-757cab5f3a76}"),
                    AppWindow,
                    AppWindowChangedEventArgs
                )
                this.__OnChangedToken := this.add_Changed(this.__OnChanged.iface)
            }
            return this.__OnChanged
        }
    }

    /**
     * Occurs when the app window has been closed.
     * @remarks
     * This event is preceded by a [CloseRequested](appwindow_closerequested.md) event.
     * @type {TypedEventHandler<AppWindow, AppWindowClosedEventArgs>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7f62c430-89b3-5873-93ca-bb4d71a390e4}"),
                    AppWindow,
                    AppWindowClosedEventArgs
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

    /**
     * Occurs after the window starts to close, but before it is closed and before the Closed event occurs.
     * @remarks
     * > [!IMPORTANT]
     * > This event occurs only when the app has the App Close Confirmation restricted capability (`<rescap:Capability Name="confirmAppClose"/>`), so it is not applicable to most apps. For more info, see [App capability declarations - Restricted capabilities](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
     * @type {TypedEventHandler<AppWindow, AppWindowCloseRequestedEventArgs>}
    */
    OnCloseRequested {
        get {
            if(!this.HasProp("__OnCloseRequested")){
                this.__OnCloseRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c0359718-173d-5f19-b76a-91929b2b0451}"),
                    AppWindow,
                    AppWindowCloseRequestedEventArgs
                )
                this.__OnCloseRequestedToken := this.add_CloseRequested(this.__OnCloseRequested.iface)
            }
            return this.__OnCloseRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnChangedToken")) {
            this.remove_Changed(this.__OnChangedToken)
            this.__OnChanged.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        if(this.HasProp("__OnCloseRequestedToken")) {
            this.remove_CloseRequested(this.__OnCloseRequestedToken)
            this.__OnCloseRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {UIContentRoot} 
     */
    get_Content() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.get_Content()
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.get_DispatcherQueue()
    }

    /**
     * 
     * @returns {AppWindowFrame} 
     */
    get_Frame() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.get_Frame()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.get_IsVisible()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PersistedStateId() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.get_PersistedStateId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PersistedStateId(value) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.put_PersistedStateId(value)
    }

    /**
     * 
     * @returns {AppWindowPresenter} 
     */
    get_Presenter() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.get_Presenter()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.put_Title(value)
    }

    /**
     * 
     * @returns {AppWindowTitleBar} 
     */
    get_TitleBar() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.get_TitleBar()
    }

    /**
     * 
     * @returns {UIContext} 
     */
    get_UIContext() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.get_UIContext()
    }

    /**
     * 
     * @returns {WindowingEnvironment} 
     */
    get_WindowingEnvironment() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.get_WindowingEnvironment()
    }

    /**
     * Closes the app window.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.closeasync
     */
    CloseAsync() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.CloseAsync()
    }

    /**
     * Returns a placement object that describes the app window's display region, offset, and size.
     * @returns {AppWindowPlacement} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.getplacement
     */
    GetPlacement() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.GetPlacement()
    }

    /**
     * Returns the collection of display regions available for the app window.
     * @returns {IVectorView<DisplayRegion>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.getdisplayregions
     */
    GetDisplayRegions() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.GetDisplayRegions()
    }

    /**
     * Makes a request to position the window in the specified display region.
     * @param {DisplayRegion} displayRegion_ The display region to move the window to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.requestmovetodisplayregion
     */
    RequestMoveToDisplayRegion(displayRegion_) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.RequestMoveToDisplayRegion(displayRegion_)
    }

    /**
     * Makes a request to position the window next to the current view.
     * @remarks
     * The move request is ignored if the [AppWindow.WindowingEnvironment](appwindow_windowingenvironment.md) is `Tiled`.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.requestmoveadjacenttocurrentview
     */
    RequestMoveAdjacentToCurrentView() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.RequestMoveAdjacentToCurrentView()
    }

    /**
     * Makes a request to position the window next to the specified anchor window.
     * @remarks
     * The move request is ignored if the [AppWindow.WindowingEnvironment](appwindow_windowingenvironment.md) is `Tiled`.
     * @param {AppWindow} anchorWindow The window to position this window next to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.requestmoveadjacenttowindow
     */
    RequestMoveAdjacentToWindow(anchorWindow) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.RequestMoveAdjacentToWindow(anchorWindow)
    }

    /**
     * Makes a request to position the window at the specified offset relative to the anchor window.
     * @remarks
     * If the [AppWindow.WindowingEnvironment](appwindow_windowingenvironment.md) is `Tiled`, the window is placed on the same [DisplayRegion](displayregion.md) as the anchor window.
     * @param {AppWindow} anchorWindow The window to position this window relative to.
     * @param {POINT} contentOffset The offset of the window relative to the anchor window.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.requestmoverelativetowindowcontent
     */
    RequestMoveRelativeToWindowContent(anchorWindow, contentOffset) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.RequestMoveRelativeToWindowContent(anchorWindow, contentOffset)
    }

    /**
     * Makes a request to position the window at the specified offset relative to the current view.
     * @remarks
     * If the [AppWindow.WindowingEnvironment](appwindow_windowingenvironment.md) is `Tiled`, the window is placed on the same [DisplayRegion](displayregion.md) as the current view.
     * @param {POINT} contentOffset The offset of the window relative to the current view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.requestmoverelativetocurrentviewcontent
     */
    RequestMoveRelativeToCurrentViewContent(contentOffset) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.RequestMoveRelativeToCurrentViewContent(contentOffset)
    }

    /**
     * Makes a request to position the window in the specified display region at the specified offset.
     * @remarks
     * The `displayRegionOffset` parameter is ignored if the [AppWindow.WindowingEnvironment](appwindow_windowingenvironment.md) is `Tiled`.
     * @param {DisplayRegion} displayRegion_ The display region to move the window to.
     * @param {POINT} displayRegionOffset The offset of the window in the display region.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.requestmoverelativetodisplayregion
     */
    RequestMoveRelativeToDisplayRegion(displayRegion_, displayRegionOffset) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.RequestMoveRelativeToDisplayRegion(displayRegion_, displayRegionOffset)
    }

    /**
     * Makes a request to set the window to the specified size.
     * @param {SIZE} frameSize The requested size.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.requestsize
     */
    RequestSize(frameSize) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.RequestSize(frameSize)
    }

    /**
     * Attempts to asynchronously show the current app window.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindow.tryshowasync
     */
    TryShowAsync() {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.TryShowAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<AppWindow, AppWindowChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.remove_Changed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppWindow, AppWindowClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.remove_Closed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppWindow, AppWindowCloseRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CloseRequested(handler) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.add_CloseRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CloseRequested(token) {
        if (!this.HasProp("__IAppWindow")) {
            if ((queryResult := this.QueryInterface(IAppWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindow := IAppWindow(outPtr)
        }

        return this.__IAppWindow.remove_CloseRequested(token)
    }

;@endregion Instance Methods
}
