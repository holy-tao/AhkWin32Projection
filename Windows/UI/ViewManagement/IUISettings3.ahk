#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Color.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IUISettings3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUISettings3
     * @type {Guid}
     */
    static IID => Guid("{03021be4-5254-4781-8194-5168f7d06d7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetColorValue", "add_ColorValuesChanged", "remove_ColorValuesChanged"]

    /**
     * 
     * @param {Integer} desiredColor 
     * @returns {Color} 
     */
    GetColorValue(desiredColor) {
        value := Color()
        result := ComCall(6, this, "int", desiredColor, "ptr", value, "int")
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
    add_ColorValuesChanged(handler) {
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
    remove_ColorValuesChanged(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(8, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
