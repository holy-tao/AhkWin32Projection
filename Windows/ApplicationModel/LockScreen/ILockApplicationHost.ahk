#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.LockScreen
 * @version WindowsRuntime 1.4
 */
class ILockApplicationHost extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILockApplicationHost
     * @type {Guid}
     */
    static IID => Guid("{38ee31ad-d94f-4e7c-81fa-4f4436506281}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestUnlock", "add_Unlocking", "remove_Unlocking"]

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestUnlock() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<LockApplicationHost, LockScreenUnlockingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Unlocking(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Unlocking(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
