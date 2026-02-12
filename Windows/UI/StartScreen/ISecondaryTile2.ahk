#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SecondaryTileVisualElements.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class ISecondaryTile2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryTile2
     * @type {Guid}
     */
    static IID => Guid("{b2f6cc35-3250-4990-923c-294ab4b694dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_PhoneticName", "get_PhoneticName", "get_VisualElements", "put_RoamingEnabled", "get_RoamingEnabled", "add_VisualElementsRequested", "remove_VisualElementsRequested"]

    /**
     * @type {HSTRING} 
     */
    PhoneticName {
        get => this.get_PhoneticName()
        set => this.put_PhoneticName(value)
    }

    /**
     * @type {SecondaryTileVisualElements} 
     */
    VisualElements {
        get => this.get_VisualElements()
    }

    /**
     * @type {Boolean} 
     */
    RoamingEnabled {
        get => this.get_RoamingEnabled()
        set => this.put_RoamingEnabled(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PhoneticName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhoneticName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SecondaryTileVisualElements} 
     */
    get_VisualElements() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SecondaryTileVisualElements(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RoamingEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RoamingEnabled() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<SecondaryTile, VisualElementsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VisualElementsRequested(handler) {
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
    remove_VisualElementsRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
