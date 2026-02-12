#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\InkPresenter.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class ICoreInkIndependentInputSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreInkIndependentInputSource
     * @type {Guid}
     */
    static IID => Guid("{39b38da9-7639-4499-a5b5-191d00e35b16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_PointerEntering", "remove_PointerEntering", "add_PointerHovering", "remove_PointerHovering", "add_PointerExiting", "remove_PointerExiting", "add_PointerPressing", "remove_PointerPressing", "add_PointerMoving", "remove_PointerMoving", "add_PointerReleasing", "remove_PointerReleasing", "add_PointerLost", "remove_PointerLost", "get_InkPresenter"]

    /**
     * @type {InkPresenter} 
     */
    InkPresenter {
        get => this.get_InkPresenter()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerEntering(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", cookie, "int")
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
    remove_PointerEntering(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(7, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerHovering(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", cookie, "int")
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
    remove_PointerHovering(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(9, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerExiting(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", cookie, "int")
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
    remove_PointerExiting(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(11, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerPressing(handler) {
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
    remove_PointerPressing(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(13, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerMoving(handler) {
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
    remove_PointerMoving(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(15, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerReleasing(handler) {
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
    remove_PointerReleasing(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(17, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerLost(handler) {
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
    remove_PointerLost(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(19, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {InkPresenter} 
     */
    get_InkPresenter() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkPresenter(value)
    }
}
