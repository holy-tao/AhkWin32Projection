#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class IWindowsIntegrityPolicyStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsIntegrityPolicyStatics
     * @type {Guid}
     */
    static IID => Guid("{7d1d81db-8d63-4789-9ea5-ddcf65a94f3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsEnabled", "get_IsEnabledForTrial", "get_CanDisable", "get_IsDisableSupported", "add_PolicyChanged", "remove_PolicyChanged"]

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsEnabledForTrial {
        get => this.get_IsEnabledForTrial()
    }

    /**
     * @type {Boolean} 
     */
    CanDisable {
        get => this.get_CanDisable()
    }

    /**
     * @type {Boolean} 
     */
    IsDisableSupported {
        get => this.get_IsDisableSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabledForTrial() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDisable() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisableSupported() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PolicyChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
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
    remove_PolicyChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
