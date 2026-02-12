#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreInputSourceBase.ahk
#Include .\ICorePointerInputSource.ahk
#Include .\ICoreKeyboardInputSource.ahk
#Include .\ICoreComponentFocusable.ahk
#Include .\ICoreTouchHitTesting.ahk
#Include .\ICoreClosestInteractiveBoundsRequested.ahk
#Include .\ICoreKeyboardInputSource2.ahk
#Include .\ICorePointerInputSource2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\InputEnabledEventArgs.ahk
#Include .\PointerEventArgs.ahk
#Include .\CharacterReceivedEventArgs.ahk
#Include .\KeyEventArgs.ahk
#Include .\CoreWindowEventArgs.ahk
#Include .\TouchHitTestingEventArgs.ahk
#Include .\CoreComponentInputSource.ahk
#Include .\ClosestInteractiveBoundsRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides a mechanism to receive input for a XAML framework element hosted in another framework, such as a DirectX interop framework.
 * @remarks
 * The CoreComponentInputSource class enables an app to handle input for a XAML framework element hosted in another framework, such as a DirectX interop framework. Call the [CoreComponentInputSource.DispatcherQueue](corecomponentinputsource_dispatcherqueue.md) property to get the DispatcherQueue of the thread where the CoreComponentInputSource was instantiated.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreComponentInputSource extends IInspectable {
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
     * Gets the input event dispatcher for the hosted XAML framework element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource.dispatcher
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

    /**
     * Gets or sets whether input is enabled for the hosted XAML framework element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource.isinputenabled
     * @type {Boolean} 
     */
    IsInputEnabled {
        get => this.get_IsInputEnabled()
        set => this.put_IsInputEnabled(value)
    }

    /**
     * Indicates whether the input device supports input capture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource.hascapture
     * @type {Boolean} 
     */
    HasCapture {
        get => this.get_HasCapture()
    }

    /**
     * Gets the current pointer position in the hosted XAML framework.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource.pointerposition
     * @type {POINT} 
     */
    PointerPosition {
        get => this.get_PointerPosition()
    }

    /**
     * Gets the pointer cursor used to specify interaction behavior with the hosted XAML framework element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource.pointercursor
     * @type {CoreCursor} 
     */
    PointerCursor {
        get => this.get_PointerCursor()
        set => this.put_PointerCursor(value)
    }

    /**
     * Gets whether the current hosted XAML control element has focus. If it does, keyboard input is delivered to that control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource.hasfocus
     * @type {Boolean} 
     */
    HasFocus {
        get => this.get_HasFocus()
    }

    /**
     * Gets the [DispatcherQueue](../windows.system/dispatcherqueue.md) associated with this [CoreComponentInputSource](corecomponentinputsource.md).
     * @remarks
     * Some platform objects require thread affinity for posting events back to the thread where the object was instantiated. The [DispatcherQueue](../windows.system/dispatcherqueue.md) lets you post work to this thread. 
     * 
     * These platform objects can be created on the UI thread, where the [DispatcherQueue](../windows.system/dispatcherqueue.md) already exists, or they can be created on a long running, non-UI thread with a DispatcherQueue created with the [DispatcherQueueController.CreateOnDedicatedThread](../windows.system/dispatcherqueuecontroller_createondedicatedthread_660689653.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource.dispatcherqueue
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

    /**
     * Raised when the hosted XAML control is enabled for input.
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
     * Raised when the pointer input capture stream is lost.
     * @remarks
     * This event is only raised if the input device supports pointer data capture.
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
     * Raised when the pointer enters the hosted XAML element.
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
     * Raised when the pointer exits the hosted XAML element.
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
     * Raised when the pointer is moved for the active hosted XAML element.
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
     * Raised when the pointer is "pressed" (such as a mouse button click or full screen press) for the active hosted XAML element.
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
     * Raised when the pointer is released (such as when a mouse button click or screen press is released) for the active hosted XAML element.
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
     * Raised when the mouse wheel is rotated for the active hosted XAML element.
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
     * Raised when a character is received (such as from a completed key press sequence) by the hosted XAML element.
     * @type {TypedEventHandler<IInspectable, CharacterReceivedEventArgs>}
    */
    OnCharacterReceived {
        get {
            if(!this.HasProp("__OnCharacterReceived")){
                this.__OnCharacterReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5aa4a848-86b2-506b-89ab-5eb5786420c6}"),
                    IInspectable,
                    CharacterReceivedEventArgs
                )
                this.__OnCharacterReceivedToken := this.add_CharacterReceived(this.__OnCharacterReceived.iface)
            }
            return this.__OnCharacterReceived
        }
    }

    /**
     * Raised when a key is pressed for the current active hosted XAML element.
     * @type {TypedEventHandler<IInspectable, KeyEventArgs>}
    */
    OnKeyDown {
        get {
            if(!this.HasProp("__OnKeyDown")){
                this.__OnKeyDown := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{eadffdf7-d70e-5688-906c-c2b1229ea16d}"),
                    IInspectable,
                    KeyEventArgs
                )
                this.__OnKeyDownToken := this.add_KeyDown(this.__OnKeyDown.iface)
            }
            return this.__OnKeyDown
        }
    }

    /**
     * Raised when a key press is released for the current active hosted XAML element.
     * @type {TypedEventHandler<IInspectable, KeyEventArgs>}
    */
    OnKeyUp {
        get {
            if(!this.HasProp("__OnKeyUp")){
                this.__OnKeyUp := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{eadffdf7-d70e-5688-906c-c2b1229ea16d}"),
                    IInspectable,
                    KeyEventArgs
                )
                this.__OnKeyUpToken := this.add_KeyUp(this.__OnKeyUp.iface)
            }
            return this.__OnKeyUp
        }
    }

    /**
     * Raised when a hosted XAML element gets focus.
     * @type {TypedEventHandler<IInspectable, CoreWindowEventArgs>}
    */
    OnGotFocus {
        get {
            if(!this.HasProp("__OnGotFocus")){
                this.__OnGotFocus := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1a8ac270-a777-50f7-88a1-e34e56c09449}"),
                    IInspectable,
                    CoreWindowEventArgs
                )
                this.__OnGotFocusToken := this.add_GotFocus(this.__OnGotFocus.iface)
            }
            return this.__OnGotFocus
        }
    }

    /**
     * Raised when a hosted XAML element loses focus.
     * @type {TypedEventHandler<IInspectable, CoreWindowEventArgs>}
    */
    OnLostFocus {
        get {
            if(!this.HasProp("__OnLostFocus")){
                this.__OnLostFocus := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1a8ac270-a777-50f7-88a1-e34e56c09449}"),
                    IInspectable,
                    CoreWindowEventArgs
                )
                this.__OnLostFocusToken := this.add_LostFocus(this.__OnLostFocus.iface)
            }
            return this.__OnLostFocus
        }
    }

    /**
     * Raised for a touch hit test on a hosted XAML element.
     * @type {TypedEventHandler<IInspectable, TouchHitTestingEventArgs>}
    */
    OnTouchHitTesting {
        get {
            if(!this.HasProp("__OnTouchHitTesting")){
                this.__OnTouchHitTesting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c76e9d25-6a96-58fd-874f-ae52bd603af8}"),
                    IInspectable,
                    TouchHitTestingEventArgs
                )
                this.__OnTouchHitTestingToken := this.add_TouchHitTesting(this.__OnTouchHitTesting.iface)
            }
            return this.__OnTouchHitTesting
        }
    }

    /**
     * > [!NOTE]
     * > Not intended for general use.
     * 
     * Occurs when a framework input manager requests the bounding rectangle of an interactive element within a specific bounding rectangle and closest to a specific pointer.
     * @type {TypedEventHandler<CoreComponentInputSource, ClosestInteractiveBoundsRequestedEventArgs>}
    */
    OnClosestInteractiveBoundsRequested {
        get {
            if(!this.HasProp("__OnClosestInteractiveBoundsRequested")){
                this.__OnClosestInteractiveBoundsRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e2c62d42-0577-5112-9e59-eae159bf39e9}"),
                    CoreComponentInputSource,
                    ClosestInteractiveBoundsRequestedEventArgs
                )
                this.__OnClosestInteractiveBoundsRequestedToken := this.add_ClosestInteractiveBoundsRequested(this.__OnClosestInteractiveBoundsRequested.iface)
            }
            return this.__OnClosestInteractiveBoundsRequested
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

        if(this.HasProp("__OnCharacterReceivedToken")) {
            this.remove_CharacterReceived(this.__OnCharacterReceivedToken)
            this.__OnCharacterReceived.iface.Dispose()
        }

        if(this.HasProp("__OnKeyDownToken")) {
            this.remove_KeyDown(this.__OnKeyDownToken)
            this.__OnKeyDown.iface.Dispose()
        }

        if(this.HasProp("__OnKeyUpToken")) {
            this.remove_KeyUp(this.__OnKeyUpToken)
            this.__OnKeyUp.iface.Dispose()
        }

        if(this.HasProp("__OnGotFocusToken")) {
            this.remove_GotFocus(this.__OnGotFocusToken)
            this.__OnGotFocus.iface.Dispose()
        }

        if(this.HasProp("__OnLostFocusToken")) {
            this.remove_LostFocus(this.__OnLostFocusToken)
            this.__OnLostFocus.iface.Dispose()
        }

        if(this.HasProp("__OnTouchHitTestingToken")) {
            this.remove_TouchHitTesting(this.__OnTouchHitTestingToken)
            this.__OnTouchHitTesting.iface.Dispose()
        }

        if(this.HasProp("__OnClosestInteractiveBoundsRequestedToken")) {
            this.remove_ClosestInteractiveBoundsRequested(this.__OnClosestInteractiveBoundsRequestedToken)
            this.__OnClosestInteractiveBoundsRequested.iface.Dispose()
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
     * Stops the capture of pointer input data (if the pointing device supports input capture).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource.releasepointercapture
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
     * Starts the capture of pointer input data (if the pointing device supports input capture).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource.setpointercapture
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
     * Gets the current status of a virtual key press.
     * @param {Integer} virtualKey_ The key from which to retrieve status.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource.getcurrentkeystate
     */
    GetCurrentKeyState(virtualKey_) {
        if (!this.HasProp("__ICoreKeyboardInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreKeyboardInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreKeyboardInputSource := ICoreKeyboardInputSource(outPtr)
        }

        return this.__ICoreKeyboardInputSource.GetCurrentKeyState(virtualKey_)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, CharacterReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CharacterReceived(handler) {
        if (!this.HasProp("__ICoreKeyboardInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreKeyboardInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreKeyboardInputSource := ICoreKeyboardInputSource(outPtr)
        }

        return this.__ICoreKeyboardInputSource.add_CharacterReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CharacterReceived(cookie) {
        if (!this.HasProp("__ICoreKeyboardInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreKeyboardInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreKeyboardInputSource := ICoreKeyboardInputSource(outPtr)
        }

        return this.__ICoreKeyboardInputSource.remove_CharacterReceived(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, KeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyDown(handler) {
        if (!this.HasProp("__ICoreKeyboardInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreKeyboardInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreKeyboardInputSource := ICoreKeyboardInputSource(outPtr)
        }

        return this.__ICoreKeyboardInputSource.add_KeyDown(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_KeyDown(cookie) {
        if (!this.HasProp("__ICoreKeyboardInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreKeyboardInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreKeyboardInputSource := ICoreKeyboardInputSource(outPtr)
        }

        return this.__ICoreKeyboardInputSource.remove_KeyDown(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, KeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyUp(handler) {
        if (!this.HasProp("__ICoreKeyboardInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreKeyboardInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreKeyboardInputSource := ICoreKeyboardInputSource(outPtr)
        }

        return this.__ICoreKeyboardInputSource.add_KeyUp(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_KeyUp(cookie) {
        if (!this.HasProp("__ICoreKeyboardInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreKeyboardInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreKeyboardInputSource := ICoreKeyboardInputSource(outPtr)
        }

        return this.__ICoreKeyboardInputSource.remove_KeyUp(cookie)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasFocus() {
        if (!this.HasProp("__ICoreComponentFocusable")) {
            if ((queryResult := this.QueryInterface(ICoreComponentFocusable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreComponentFocusable := ICoreComponentFocusable(outPtr)
        }

        return this.__ICoreComponentFocusable.get_HasFocus()
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, CoreWindowEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GotFocus(handler) {
        if (!this.HasProp("__ICoreComponentFocusable")) {
            if ((queryResult := this.QueryInterface(ICoreComponentFocusable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreComponentFocusable := ICoreComponentFocusable(outPtr)
        }

        return this.__ICoreComponentFocusable.add_GotFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_GotFocus(cookie) {
        if (!this.HasProp("__ICoreComponentFocusable")) {
            if ((queryResult := this.QueryInterface(ICoreComponentFocusable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreComponentFocusable := ICoreComponentFocusable(outPtr)
        }

        return this.__ICoreComponentFocusable.remove_GotFocus(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, CoreWindowEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LostFocus(handler) {
        if (!this.HasProp("__ICoreComponentFocusable")) {
            if ((queryResult := this.QueryInterface(ICoreComponentFocusable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreComponentFocusable := ICoreComponentFocusable(outPtr)
        }

        return this.__ICoreComponentFocusable.add_LostFocus(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_LostFocus(cookie) {
        if (!this.HasProp("__ICoreComponentFocusable")) {
            if ((queryResult := this.QueryInterface(ICoreComponentFocusable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreComponentFocusable := ICoreComponentFocusable(outPtr)
        }

        return this.__ICoreComponentFocusable.remove_LostFocus(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, TouchHitTestingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TouchHitTesting(handler) {
        if (!this.HasProp("__ICoreTouchHitTesting")) {
            if ((queryResult := this.QueryInterface(ICoreTouchHitTesting.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTouchHitTesting := ICoreTouchHitTesting(outPtr)
        }

        return this.__ICoreTouchHitTesting.add_TouchHitTesting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_TouchHitTesting(cookie) {
        if (!this.HasProp("__ICoreTouchHitTesting")) {
            if ((queryResult := this.QueryInterface(ICoreTouchHitTesting.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTouchHitTesting := ICoreTouchHitTesting(outPtr)
        }

        return this.__ICoreTouchHitTesting.remove_TouchHitTesting(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreComponentInputSource, ClosestInteractiveBoundsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ClosestInteractiveBoundsRequested(handler) {
        if (!this.HasProp("__ICoreClosestInteractiveBoundsRequested")) {
            if ((queryResult := this.QueryInterface(ICoreClosestInteractiveBoundsRequested.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreClosestInteractiveBoundsRequested := ICoreClosestInteractiveBoundsRequested(outPtr)
        }

        return this.__ICoreClosestInteractiveBoundsRequested.add_ClosestInteractiveBoundsRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ClosestInteractiveBoundsRequested(cookie) {
        if (!this.HasProp("__ICoreClosestInteractiveBoundsRequested")) {
            if ((queryResult := this.QueryInterface(ICoreClosestInteractiveBoundsRequested.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreClosestInteractiveBoundsRequested := ICoreClosestInteractiveBoundsRequested(outPtr)
        }

        return this.__ICoreClosestInteractiveBoundsRequested.remove_ClosestInteractiveBoundsRequested(cookie)
    }

    /**
     * Retrieves the unique ID for the input device that generated this key event.
     * 
     * > GetCurrentKeyEventDeviceId is not supported for all input devices.
     * @remarks
     * Use GetCurrentKeyEventDeviceId to differentiate between devices that can generate key events, such as multiple game controllers. The device id is useful for associating the input device with a specific user account.
     * 
     * To get a valid device ID, this method must be called from your [KeyUp](corecomponentinputsource_keyup.md) and [KeyDown](corecomponentinputsource_keydown.md) event handlers.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource.getcurrentkeyeventdeviceid
     */
    GetCurrentKeyEventDeviceId() {
        if (!this.HasProp("__ICoreKeyboardInputSource2")) {
            if ((queryResult := this.QueryInterface(ICoreKeyboardInputSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreKeyboardInputSource2 := ICoreKeyboardInputSource2(outPtr)
        }

        return this.__ICoreKeyboardInputSource2.GetCurrentKeyEventDeviceId()
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

;@endregion Instance Methods
}
