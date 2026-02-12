#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ESimServiceInfo.ahk
#Include .\ESimWatcher.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IESimManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESimManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{0bfa2c0c-df88-4631-bf04-c12e281b3962}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServiceInfo", "TryCreateESimWatcher", "add_ServiceInfoChanged", "remove_ServiceInfoChanged"]

    /**
     * @type {ESimServiceInfo} 
     */
    ServiceInfo {
        get => this.get_ServiceInfo()
    }

    /**
     * 
     * @returns {ESimServiceInfo} 
     */
    get_ServiceInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ESimServiceInfo(value)
    }

    /**
     * 
     * @returns {ESimWatcher} 
     */
    TryCreateESimWatcher() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ESimWatcher(result_)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ServiceInfoChanged(handler) {
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
    remove_ServiceInfoChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
