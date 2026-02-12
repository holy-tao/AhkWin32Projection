#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IRadialControllerMenuItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerMenuItem
     * @type {Guid}
     */
    static IID => Guid("{c80fc98d-ad0b-4c9c-8f2f-136a2373a6ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayText", "get_Tag", "put_Tag", "add_Invoked", "remove_Invoked"]

    /**
     * @type {HSTRING} 
     */
    DisplayText {
        get => this.get_DisplayText()
    }

    /**
     * @type {IInspectable} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayText() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Tag() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RadialControllerMenuItem, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Invoked(handler) {
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
    remove_Invoked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
