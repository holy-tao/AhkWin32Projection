#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreKeyboardInputSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreKeyboardInputSource
     * @type {Guid}
     */
    static IID => Guid("{231c9088-e469-4df1-b208-6e490d71cb90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentKeyState", "add_CharacterReceived", "remove_CharacterReceived", "add_KeyDown", "remove_KeyDown", "add_KeyUp", "remove_KeyUp"]

    /**
     * 
     * @param {Integer} virtualKey_ 
     * @returns {Integer} 
     */
    GetCurrentKeyState(virtualKey_) {
        result := ComCall(6, this, "int", virtualKey_, "uint*", &KeyState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return KeyState
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, CharacterReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CharacterReceived(handler) {
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
    remove_CharacterReceived(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(8, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, KeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyDown(handler) {
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
    remove_KeyDown(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(10, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, KeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyUp(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", pCookie, "int")
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

        result := ComCall(12, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
