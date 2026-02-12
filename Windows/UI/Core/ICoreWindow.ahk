#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include .\CoreDispatcher.ahk
#Include .\CoreCursor.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Specifies an interface for a window object and its input events as well as basic user interface behaviors.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreWindow extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWindow
     * @type {Guid}
     */
    static IID => Guid("{79b9d5f2-879e-4b89-b798-79e47598030c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AutomationHostProvider", "get_Bounds", "get_CustomProperties", "get_Dispatcher", "get_FlowDirection", "put_FlowDirection", "get_IsInputEnabled", "put_IsInputEnabled", "get_PointerCursor", "put_PointerCursor", "get_PointerPosition", "get_Visible", "Activate", "Close", "GetAsyncKeyState", "GetKeyState", "ReleasePointerCapture", "SetPointerCapture", "add_Activated", "remove_Activated", "add_AutomationProviderRequested", "remove_AutomationProviderRequested", "add_CharacterReceived", "remove_CharacterReceived", "add_Closed", "remove_Closed", "add_InputEnabled", "remove_InputEnabled", "add_KeyDown", "remove_KeyDown", "add_KeyUp", "remove_KeyUp", "add_PointerCaptureLost", "remove_PointerCaptureLost", "add_PointerEntered", "remove_PointerEntered", "add_PointerExited", "remove_PointerExited", "add_PointerMoved", "remove_PointerMoved", "add_PointerPressed", "remove_PointerPressed", "add_PointerReleased", "remove_PointerReleased", "add_TouchHitTesting", "remove_TouchHitTesting", "add_PointerWheelChanged", "remove_PointerWheelChanged", "add_SizeChanged", "remove_SizeChanged", "add_VisibilityChanged", "remove_VisibilityChanged"]

    /**
     * Specifies the property that gets the automation provider assigned to this window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.automationhostprovider
     * @type {IInspectable} 
     */
    AutomationHostProvider {
        get => this.get_AutomationHostProvider()
    }

    /**
     * Specifies the property that gets the bounding rectangle of the window.
     * @remarks
     * To convert from device-independent pixel (DIP) to physical pixels (and back), use the following equations (where DPI is the dots per inch value for the screen):
     * + DIP value = (physical pixel x 96) / DPI
     * + physical pixel value = (DIP x DPI) / 96
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.bounds
     * @type {RECT} 
     */
    Bounds {
        get => this.get_Bounds()
    }

    /**
     * Specifies a property that gets the set of custom properties for the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.customproperties
     * @type {IPropertySet} 
     */
    CustomProperties {
        get => this.get_CustomProperties()
    }

    /**
     * Specifies a property that gets the event dispatcher for the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.dispatcher
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

    /**
     * Specifies the property that gets or sets the horizontal origin of the window's reading order alignment. If the language specified by the user interface is right-aligned (such as in Arabic or Hebrew), the horizontal origin of the reading layout for the window is on the right edge.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.flowdirection
     * @type {Integer} 
     */
    FlowDirection {
        get => this.get_FlowDirection()
        set => this.put_FlowDirection(value)
    }

    /**
     * Specifies a property that gets or sets whether input is enabled for the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.isinputenabled
     * @type {Boolean} 
     */
    IsInputEnabled {
        get => this.get_IsInputEnabled()
        set => this.put_IsInputEnabled(value)
    }

    /**
     * Gets or sets the pointer cursor used by the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.pointercursor
     * @type {CoreCursor} 
     */
    PointerCursor {
        get => this.get_PointerCursor()
        set => this.put_PointerCursor(value)
    }

    /**
     * Specifies a property that gets the position of the pointer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.pointerposition
     * @type {POINT} 
     */
    PointerPosition {
        get => this.get_PointerPosition()
    }

    /**
     * Specifies the property that gets whether the window is visible or not.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.visible
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_AutomationHostProvider() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Bounds() {
        value := RECT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_CustomProperties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }

    /**
     * 
     * @returns {CoreDispatcher} 
     */
    get_Dispatcher() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreDispatcher(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FlowDirection() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FlowDirection(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInputEnabled() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsInputEnabled(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CoreCursor} 
     */
    get_PointerCursor() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreCursor(value)
    }

    /**
     * 
     * @param {CoreCursor} value 
     * @returns {HRESULT} 
     */
    put_PointerCursor(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_PointerPosition() {
        value := POINT()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies a method that activates the window. This method is called to present the window on the screen.
     * @remarks
     * The window will be presented if the app is the foreground window. If the app has more than one window, the activating window will be presented when the app is set to the foreground.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.activate
     */
    Activate() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies the method that closes the window and exits the message loop.
     * @remarks
     * This method also causes the [ProcessEvents](coredispatcher_processevents_1611214514.md) operation to exit the event processing loop.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.close
     */
    Close() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies a method that returns the state of a virtual key asynchronously.
     * @param {Integer} virtualKey_ The virtual key for which state will be returned.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.getasynckeystate
     */
    GetAsyncKeyState(virtualKey_) {
        result := ComCall(20, this, "int", virtualKey_, "uint*", &KeyState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return KeyState
    }

    /**
     * Specifies a method that gets the state of a key.
     * @param {Integer} virtualKey_ The virtual key for which state will be returned.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.getkeystate
     */
    GetKeyState(virtualKey_) {
        result := ComCall(21, this, "int", virtualKey_, "uint*", &KeyState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return KeyState
    }

    /**
     * Specifies a method that dissociates pointer input from the app, if previously associated through [SetPointerCapture](corewindow_setpointercapture_651539121.md), and restores normal pointer input processing.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.releasepointercapture
     */
    ReleasePointerCapture() {
        result := ComCall(22, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies a method that associates pointer input with the app. Once a pointer is captured, all subsequent events associated with that pointer are fired by the app.
     * 
     * A pointer can be captured only by a single app at any time.
     * 
     * Pointer events continue even if the pointer moves outside the bounds of the app.
     * @remarks
     * Only the foreground window can capture the pointer.
     * 
     * A pointer can only be captured when contact is detected (mouse button pressed, touch contact down, stylus in contact), and the pointer is within the bounding rectangle of the app.
     * 
     * The pointer is released on a [PointerReleased](corewindow_pointerreleased.md) or a [PointerCaptureLost](corewindow_pointercapturelost.md) event, or [ReleasePointerCapture](corewindow_releasepointercapture_193058457.md) is explicitly called.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorewindow.setpointercapture
     */
    SetPointerCapture() {
        result := ComCall(23, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, WindowActivatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Activated(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(24, this, "ptr", handler, "ptr", pCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Activated(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(25, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, AutomationProviderRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AutomationProviderRequested(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(26, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_AutomationProviderRequested(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(27, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, CharacterReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CharacterReceived(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(28, this, "ptr", handler, "ptr", pCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CharacterReceived(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(29, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, CoreWindowEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(30, this, "ptr", handler, "ptr", pCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Closed(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(31, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, InputEnabledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InputEnabled(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(32, this, "ptr", handler, "ptr", pCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_InputEnabled(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(33, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, KeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyDown(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(34, this, "ptr", handler, "ptr", pCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_KeyDown(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(35, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, KeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyUp(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(36, this, "ptr", handler, "ptr", pCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_KeyUp(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(37, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerCaptureLost(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(38, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerCaptureLost(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(39, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerEntered(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(40, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerEntered(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(41, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerExited(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(42, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerExited(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(43, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerMoved(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(44, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerMoved(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(45, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerPressed(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(46, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerPressed(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(47, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerReleased(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(48, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerReleased(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(49, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, TouchHitTestingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TouchHitTesting(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(50, this, "ptr", handler, "ptr", pCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_TouchHitTesting(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(51, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerWheelChanged(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(52, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerWheelChanged(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(53, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, WindowSizeChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SizeChanged(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(54, this, "ptr", handler, "ptr", pCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_SizeChanged(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(55, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, VisibilityChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VisibilityChanged(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(56, this, "ptr", handler, "ptr", pCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_VisibilityChanged(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(57, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
