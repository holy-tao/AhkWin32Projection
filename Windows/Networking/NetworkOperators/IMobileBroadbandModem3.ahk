#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MobileBroadbandPco.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandModem3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandModem3
     * @type {Guid}
     */
    static IID => Guid("{e9fec6ea-2f34-4582-9102-c314d2a87eec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetPcoAsync", "get_IsInEmergencyCallMode", "add_IsInEmergencyCallModeChanged", "remove_IsInEmergencyCallModeChanged"]

    /**
     * @type {Boolean} 
     */
    IsInEmergencyCallMode {
        get => this.get_IsInEmergencyCallMode()
    }

    /**
     * 
     * @returns {IAsyncOperation<MobileBroadbandPco>} 
     */
    TryGetPcoAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MobileBroadbandPco, operation)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInEmergencyCallMode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandModem, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsInEmergencyCallModeChanged(handler) {
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
    remove_IsInEmergencyCallModeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
