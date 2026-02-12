#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactPanel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactPanel
     * @type {Guid}
     */
    static IID => Guid("{41bf1265-d2ee-4b97-a80a-7d8d64cca6f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ClosePanel", "get_HeaderColor", "put_HeaderColor", "add_LaunchFullAppRequested", "remove_LaunchFullAppRequested", "add_Closing", "remove_Closing"]

    /**
     * @type {IReference<Color>} 
     */
    HeaderColor {
        get => this.get_HeaderColor()
        set => this.put_HeaderColor(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClosePanel() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_HeaderColor() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_HeaderColor(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ContactPanel, ContactPanelLaunchFullAppRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LaunchFullAppRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
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
    remove_LaunchFullAppRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ContactPanel, ContactPanelClosingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closing(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_Closing(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
