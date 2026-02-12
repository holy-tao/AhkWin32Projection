#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BluetoothLEConnectionParameters.ahk
#Include .\BluetoothLEConnectionPhy.ahk
#Include .\BluetoothLEPreferredConnectionParametersRequest.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEDevice6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEDevice6
     * @type {Guid}
     */
    static IID => Guid("{ca7190ef-0cae-573c-a1ca-e1fc5bfc39e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectionParameters", "GetConnectionPhy", "RequestPreferredConnectionParameters", "add_ConnectionParametersChanged", "remove_ConnectionParametersChanged", "add_ConnectionPhyChanged", "remove_ConnectionPhyChanged"]

    /**
     * 
     * @returns {BluetoothLEConnectionParameters} 
     */
    GetConnectionParameters() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEConnectionParameters(result_)
    }

    /**
     * 
     * @returns {BluetoothLEConnectionPhy} 
     */
    GetConnectionPhy() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEConnectionPhy(result_)
    }

    /**
     * 
     * @param {BluetoothLEPreferredConnectionParameters} preferredConnectionParameters 
     * @returns {BluetoothLEPreferredConnectionParametersRequest} 
     */
    RequestPreferredConnectionParameters(preferredConnectionParameters) {
        result := ComCall(8, this, "ptr", preferredConnectionParameters, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEPreferredConnectionParametersRequest(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothLEDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionParametersChanged(handler) {
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
    remove_ConnectionParametersChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothLEDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionPhyChanged(handler) {
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
    remove_ConnectionPhyChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
