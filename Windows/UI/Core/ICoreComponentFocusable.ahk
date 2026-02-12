#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreComponentFocusable extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreComponentFocusable
     * @type {Guid}
     */
    static IID => Guid("{52f96fa3-8742-4411-ae69-79a85f29ac8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HasFocus", "add_GotFocus", "remove_GotFocus", "add_LostFocus", "remove_LostFocus"]

    /**
     * @type {Boolean} 
     */
    HasFocus {
        get => this.get_HasFocus()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasFocus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, CoreWindowEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GotFocus(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", pCookie, "int")
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
    remove_GotFocus(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(8, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, CoreWindowEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LostFocus(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", pCookie, "int")
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
    remove_LostFocus(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(10, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
