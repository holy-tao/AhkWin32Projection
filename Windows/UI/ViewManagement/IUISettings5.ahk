#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IUISettings5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUISettings5
     * @type {Guid}
     */
    static IID => Guid("{5349d588-0cb5-5f05-bd34-706b3231f0bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AutoHideScrollBars", "add_AutoHideScrollBarsChanged", "remove_AutoHideScrollBarsChanged"]

    /**
     * @type {Boolean} 
     */
    AutoHideScrollBars {
        get => this.get_AutoHideScrollBars()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoHideScrollBars() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<UISettings, UISettingsAutoHideScrollBarsChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AutoHideScrollBarsChanged(handler) {
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
    remove_AutoHideScrollBarsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
