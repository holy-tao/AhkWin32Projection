#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreInputSourceBase.ahk
#Include .\ICorePointerInputSource.ahk
#Include .\ICorePointerInputSource2.ahk
#Include .\ICorePointerRedirector.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\InputEnabledEventArgs.ahk
#Include .\PointerEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Surfaces core input APIs for interoperation scenarios.
 * @remarks
 * Create an instance of this class by calling [SwapChainBackgroundPanel.CreateCoreIndependentInputSource](../windows.ui.xaml.controls/swapchainbackgroundpanel_createcoreindependentinputsource_467679991.md) or [SwapChainPanel.CreateCoreIndependentInputSource](../windows.ui.xaml.controls/swapchainpanel_createcoreindependentinputsource_467679991.md).
 * 
 * The CoreIndependentInputSource class enables an app to handle input and rendering independent of the XAML UI thread, because you're intentionally providing the input processing logic on a background thread. You must call [CreateCoreIndependentInputSource](../windows.ui.xaml.controls/swapchainpanel_createcoreindependentinputsource_467679991.md) from a non-UI thread, otherwise the [CreateCoreIndependentInputSource](../windows.ui.xaml.controls/swapchainpanel_createcoreindependentinputsource_467679991.md) method call will fail.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsource
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreIndependentInputSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreInputSourceBase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreInputSourceBase.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the event dispatcher for the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsource.dispatcher
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

    /**
     * Gets or sets a value that indicates whether input is enabled for the UWP app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsource.isinputenabled
     * @type {Boolean} 
     */
    IsInputEnabled {
        get => this.get_IsInputEnabled()
        set => this.put_IsInputEnabled(value)
    }

    /**
     * Gets a value that reports whether the window has pointer capture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsource.hascapture
     * @type {Boolean} 
     */
    HasCapture {
        get => this.get_HasCapture()
    }

    /**
     * Gets the client coordinates of the pointer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsource.pointerposition
     * @type {POINT} 
     */
    PointerPosition {
        get => this.get_PointerPosition()
    }

    /**
     * Gets or sets the pointer cursor used by the app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsource.pointercursor
     * @type {CoreCursor} 
     */
    PointerCursor {
        get => this.get_PointerCursor()
        set => this.put_PointerCursor(value)
    }

    /**
     * Gets the [DispatcherQueue](../windows.system/dispatcherqueue.md) associated with this [CoreIndependentInputSource](coreindependentinputsource.md).
     * @remarks
     * Some platform objects require thread affinity for posting events back to the thread where the object was instantiated. The [DispatcherQueue](../windows.system/dispatcherqueue.md) lets you post work to this thread. 
     * 
     * These platform objects can be created on the UI thread, where the [DispatcherQueue](../windows.system/dispatcherqueue.md) already exists, or they can be created on a long running, non-UI thread with a DispatcherQueue created with the [DispatcherQueueController.CreateOnDedicatedThread](../windows.system/dispatcherqueuecontroller_createondedicatedthread_660689653.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsource.dispatcherqueue
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

    /**
     * Occurs when input is enabled or disabled for the UWP app.
     * @type {TypedEventHandler<IInspectable, InputEnabledEventArgs>}
    */
    OnInputEnabled {
        get {
            if(!this.HasProp("__OnInputEnabled")){
                this.__OnInputEnabled := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c9965f1c-3641-51b6-b823-048ec3628fb0}"),
                    IInspectable,
                    InputEnabledEventArgs
                )
                this.__OnInputEnabledToken := this.add_InputEnabled(this.__OnInputEnabled.iface)
            }
            return this.__OnInputEnabled
        }
    }

    /**
     * Occurs when a pointer moves to another UWP app. This event is raised after [PointerExited](coreindependentinputsource_pointerexited.md) and is the final event received by the app for this pointer.
     * @type {TypedEventHandler<IInspectable, PointerEventArgs>}
    */
    OnPointerCaptureLost {
        get {
            if(!this.HasProp("__OnPointerCaptureLost")){
                this.__OnPointerCaptureLost := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{26aabf41-a0fd-5e66-b188-6c74182d00cd}"),
                    IInspectable,
                    PointerEventArgs
                )
                this.__OnPointerCaptureLostToken := this.add_PointerCaptureLost(this.__OnPointerCaptureLost.iface)
            }
            return this.__OnPointerCaptureLost
        }
    }

    /**
     * Occurs when a pointer moves into the bounding box of the UWP app.
     * @remarks
     * For touch input, the app receives this event before a [PointerPressed](coreindependentinputsource_pointerpressed.md) event.
     * @type {TypedEventHandler<IInspectable, PointerEventArgs>}
    */
    OnPointerEntered {
        get {
            if(!this.HasProp("__OnPointerEntered")){
                this.__OnPointerEntered := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{26aabf41-a0fd-5e66-b188-6c74182d00cd}"),
                    IInspectable,
                    PointerEventArgs
                )
                this.__OnPointerEnteredToken := this.add_PointerEntered(this.__OnPointerEntered.iface)
            }
            return this.__OnPointerEntered
        }
    }

    /**
     * Occurs when the pointer moves outside the bounding box of the UWP app.
     * @remarks
     * For touch input, the app receives this event before a [PointerReleased](coreindependentinputsource_pointerreleased.md) event.
     * @type {TypedEventHandler<IInspectable, PointerEventArgs>}
    */
    OnPointerExited {
        get {
            if(!this.HasProp("__OnPointerExited")){
                this.__OnPointerExited := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{26aabf41-a0fd-5e66-b188-6c74182d00cd}"),
                    IInspectable,
                    PointerEventArgs
                )
                this.__OnPointerExitedToken := this.add_PointerExited(this.__OnPointerExited.iface)
            }
            return this.__OnPointerExited
        }
    }

    /**
     * Occurs when a pointer moves within the bounding box of the UWP app.
     * @type {TypedEventHandler<IInspectable, PointerEventArgs>}
    */
    OnPointerMoved {
        get {
            if(!this.HasProp("__OnPointerMoved")){
                this.__OnPointerMoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{26aabf41-a0fd-5e66-b188-6c74182d00cd}"),
                    IInspectable,
                    PointerEventArgs
                )
                this.__OnPointerMovedToken := this.add_PointerMoved(this.__OnPointerMoved.iface)
            }
            return this.__OnPointerMoved
        }
    }

    /**
     * Occurs when a mouse button is clicked, or a touch or pen contact is detected, within the bounding rectangle of the UWP app.
     * @type {TypedEventHandler<IInspectable, PointerEventArgs>}
    */
    OnPointerPressed {
        get {
            if(!this.HasProp("__OnPointerPressed")){
                this.__OnPointerPressed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{26aabf41-a0fd-5e66-b188-6c74182d00cd}"),
                    IInspectable,
                    PointerEventArgs
                )
                this.__OnPointerPressedToken := this.add_PointerPressed(this.__OnPointerPressed.iface)
            }
            return this.__OnPointerPressed
        }
    }

    /**
     * Occurs when a mouse button is released, or a touch or pen contact is lifted, within the bounding rectangle of the UWP app.
     * @type {TypedEventHandler<IInspectable, PointerEventArgs>}
    */
    OnPointerReleased {
        get {
            if(!this.HasProp("__OnPointerReleased")){
                this.__OnPointerReleased := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{26aabf41-a0fd-5e66-b188-6c74182d00cd}"),
                    IInspectable,
                    PointerEventArgs
                )
                this.__OnPointerReleasedToken := this.add_PointerReleased(this.__OnPointerReleased.iface)
            }
            return this.__OnPointerReleased
        }
    }

    /**
     * Occurs when the wheel button is rotated.
     * @type {TypedEventHandler<IInspectable, PointerEventArgs>}
    */
    OnPointerWheelChanged {
        get {
            if(!this.HasProp("__OnPointerWheelChanged")){
                this.__OnPointerWheelChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{26aabf41-a0fd-5e66-b188-6c74182d00cd}"),
                    IInspectable,
                    PointerEventArgs
                )
                this.__OnPointerWheelChangedToken := this.add_PointerWheelChanged(this.__OnPointerWheelChanged.iface)
            }
            return this.__OnPointerWheelChanged
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
     * @remarks
     * A [CoreIndependentInputSource.PointerPressed](coreindependentinputsource_pointerpressed.md) event is not fired for the associated pointer if a [PointerRoutedTo](coreindependentinputsource_pointerroutedto.md) event is fired on the input object first.
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

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnInputEnabledToken")) {
            this.remove_InputEnabled(this.__OnInputEnabledToken)
            this.__OnInputEnabled.iface.Dispose()
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

        if(this.HasProp("__OnPointerWheelChangedToken")) {
            this.remove_PointerWheelChanged(this.__OnPointerWheelChangedToken)
            this.__OnPointerWheelChanged.iface.Dispose()
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

        super.__Delete()
    }

    /**
     * 
     * @returns {CoreDispatcher} 
     */
    get_Dispatcher() {
        if (!this.HasProp("__ICoreInputSourceBase")) {
            if ((queryResult := this.QueryInterface(ICoreInputSourceBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputSourceBase := ICoreInputSourceBase(outPtr)
        }

        return this.__ICoreInputSourceBase.get_Dispatcher()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInputEnabled() {
        if (!this.HasProp("__ICoreInputSourceBase")) {
            if ((queryResult := this.QueryInterface(ICoreInputSourceBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputSourceBase := ICoreInputSourceBase(outPtr)
        }

        return this.__ICoreInputSourceBase.get_IsInputEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsInputEnabled(value) {
        if (!this.HasProp("__ICoreInputSourceBase")) {
            if ((queryResult := this.QueryInterface(ICoreInputSourceBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputSourceBase := ICoreInputSourceBase(outPtr)
        }

        return this.__ICoreInputSourceBase.put_IsInputEnabled(value)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, InputEnabledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InputEnabled(handler) {
        if (!this.HasProp("__ICoreInputSourceBase")) {
            if ((queryResult := this.QueryInterface(ICoreInputSourceBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputSourceBase := ICoreInputSourceBase(outPtr)
        }

        return this.__ICoreInputSourceBase.add_InputEnabled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_InputEnabled(cookie) {
        if (!this.HasProp("__ICoreInputSourceBase")) {
            if ((queryResult := this.QueryInterface(ICoreInputSourceBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputSourceBase := ICoreInputSourceBase(outPtr)
        }

        return this.__ICoreInputSourceBase.remove_InputEnabled(cookie)
    }

    /**
     * Disables pointer capture for the UWP app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsource.releasepointercapture
     */
    ReleasePointerCapture() {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.ReleasePointerCapture()
    }

    /**
     * Enables pointer capture for the UWP app.
     * @remarks
     * The app must be in the foreground for this method to succeed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsource.setpointercapture
     */
    SetPointerCapture() {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.SetPointerCapture()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasCapture() {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.get_HasCapture()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_PointerPosition() {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.get_PointerPosition()
    }

    /**
     * 
     * @returns {CoreCursor} 
     */
    get_PointerCursor() {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.get_PointerCursor()
    }

    /**
     * 
     * @param {CoreCursor} value 
     * @returns {HRESULT} 
     */
    put_PointerCursor(value) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.put_PointerCursor(value)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerCaptureLost(handler) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.add_PointerCaptureLost(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerCaptureLost(cookie) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.remove_PointerCaptureLost(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerEntered(handler) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.add_PointerEntered(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerEntered(cookie) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.remove_PointerEntered(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerExited(handler) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.add_PointerExited(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerExited(cookie) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.remove_PointerExited(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerMoved(handler) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.add_PointerMoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerMoved(cookie) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.remove_PointerMoved(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerPressed(handler) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.add_PointerPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerPressed(cookie) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.remove_PointerPressed(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerReleased(handler) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.add_PointerReleased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerReleased(cookie) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.remove_PointerReleased(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerWheelChanged(handler) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.add_PointerWheelChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerWheelChanged(cookie) {
        if (!this.HasProp("__ICorePointerInputSource")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource := ICorePointerInputSource(outPtr)
        }

        return this.__ICorePointerInputSource.remove_PointerWheelChanged(cookie)
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        if (!this.HasProp("__ICorePointerInputSource2")) {
            if ((queryResult := this.QueryInterface(ICorePointerInputSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICorePointerInputSource2 := ICorePointerInputSource2(outPtr)
        }

        return this.__ICorePointerInputSource2.get_DispatcherQueue()
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

;@endregion Instance Methods
}
