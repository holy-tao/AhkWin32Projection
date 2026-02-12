#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IUISettings2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUISettings2
     * @type {Guid}
     */
    static IID => Guid("{bad82401-2721-44f9-bb91-2bb228be442f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextScaleFactor", "add_TextScaleFactorChanged", "remove_TextScaleFactorChanged"]

    /**
     * @type {Float} 
     */
    TextScaleFactor {
        get => this.get_TextScaleFactor()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TextScaleFactor() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<UISettings, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextScaleFactorChanged(handler) {
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
    remove_TextScaleFactorChanged(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(8, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
