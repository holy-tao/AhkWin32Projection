#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ISplashScreen extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISplashScreen
     * @type {Guid}
     */
    static IID => Guid("{ca4d975c-d4d6-43f0-97c0-0833c6391c24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ImageLocation", "add_Dismissed", "remove_Dismissed"]

    /**
     * @type {RECT} 
     */
    ImageLocation {
        get => this.get_ImageLocation()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ImageLocation() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<SplashScreen, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Dismissed(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", cookie, "int")
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
    remove_Dismissed(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(8, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
