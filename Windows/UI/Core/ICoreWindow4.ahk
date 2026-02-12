#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreWindow4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWindow4
     * @type {Guid}
     */
    static IID => Guid("{35caf0d0-47f0-436c-af97-0dd88f6f5f02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ResizeStarted", "remove_ResizeStarted", "add_ResizeCompleted", "remove_ResizeCompleted"]

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ResizeStarted(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", pCookie, "int")
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
    remove_ResizeStarted(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(7, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ResizeCompleted(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", pCookie, "int")
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
    remove_ResizeCompleted(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(9, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
