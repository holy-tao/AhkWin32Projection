#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IconElement.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAutoSuggestBox2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutoSuggestBox2
     * @type {Guid}
     */
    static IID => Guid("{aa87ddde-e679-45b2-a7c9-9aedc39db886}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_QueryIcon", "put_QueryIcon", "add_QuerySubmitted", "remove_QuerySubmitted"]

    /**
     * @type {IconElement} 
     */
    QueryIcon {
        get => this.get_QueryIcon()
        set => this.put_QueryIcon(value)
    }

    /**
     * 
     * @returns {IconElement} 
     */
    get_QueryIcon() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IconElement(value)
    }

    /**
     * 
     * @param {IconElement} value 
     * @returns {HRESULT} 
     */
    put_QueryIcon(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AutoSuggestBox, AutoSuggestBoxQuerySubmittedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QuerySubmitted(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_QuerySubmitted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
