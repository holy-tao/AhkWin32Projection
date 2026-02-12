#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include .\CoreCursor.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the behavior of pointer input (for processing on a worker thread).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorepointerinputsource
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICorePointerInputSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorePointerInputSource
     * @type {Guid}
     */
    static IID => Guid("{bbf1bb18-e47a-48eb-8807-f8f8d3ea4551}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReleasePointerCapture", "SetPointerCapture", "get_HasCapture", "get_PointerPosition", "get_PointerCursor", "put_PointerCursor", "add_PointerCaptureLost", "remove_PointerCaptureLost", "add_PointerEntered", "remove_PointerEntered", "add_PointerExited", "remove_PointerExited", "add_PointerMoved", "remove_PointerMoved", "add_PointerPressed", "remove_PointerPressed", "add_PointerReleased", "remove_PointerReleased", "add_PointerWheelChanged", "remove_PointerWheelChanged"]

    /**
     * Occurs if the pointer input source has capture functionality.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorepointerinputsource.hascapture
     * @type {Boolean} 
     */
    HasCapture {
        get => this.get_HasCapture()
    }

    /**
     * Gets the current position of the pointer in screen coordinates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorepointerinputsource.pointerposition
     * @type {POINT} 
     */
    PointerPosition {
        get => this.get_PointerPosition()
    }

    /**
     * Gets or sets the pointer cursor type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorepointerinputsource.pointercursor
     * @type {CoreCursor} 
     */
    PointerCursor {
        get => this.get_PointerCursor()
        set => this.put_PointerCursor(value)
    }

    /**
     * Stops the capture of pointer input data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorepointerinputsource.releasepointercapture
     */
    ReleasePointerCapture() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Starts the capture of pointer input data, if the pointer input device supports it.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorepointerinputsource.setpointercapture
     */
    SetPointerCapture() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasCapture() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_PointerPosition() {
        value := POINT()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {CoreCursor} 
     */
    get_PointerCursor() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
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
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerCaptureLost(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", cookie, "int")
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

        result := ComCall(13, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerEntered(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", cookie, "int")
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

        result := ComCall(15, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerExited(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", cookie, "int")
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

        result := ComCall(17, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerMoved(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(18, this, "ptr", handler, "ptr", cookie, "int")
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

        result := ComCall(19, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerPressed(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(20, this, "ptr", handler, "ptr", cookie, "int")
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

        result := ComCall(21, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerReleased(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(22, this, "ptr", handler, "ptr", cookie, "int")
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

        result := ComCall(23, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerWheelChanged(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(24, this, "ptr", handler, "ptr", cookie, "int")
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

        result := ComCall(25, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
