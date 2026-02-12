#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\XboxLiveDeviceAddress.ahk
#Include .\XboxLiveEndpointPair.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class IXboxLiveEndpointPairCreationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXboxLiveEndpointPairCreationResult
     * @type {Guid}
     */
    static IID => Guid("{d9a8bb95-2aab-4d1e-9794-33ecc0dcf0fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceAddress", "get_Status", "get_IsExistingPathEvaluation", "get_EndpointPair"]

    /**
     * @type {XboxLiveDeviceAddress} 
     */
    DeviceAddress {
        get => this.get_DeviceAddress()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Boolean} 
     */
    IsExistingPathEvaluation {
        get => this.get_IsExistingPathEvaluation()
    }

    /**
     * @type {XboxLiveEndpointPair} 
     */
    EndpointPair {
        get => this.get_EndpointPair()
    }

    /**
     * 
     * @returns {XboxLiveDeviceAddress} 
     */
    get_DeviceAddress() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveDeviceAddress(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
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
    get_IsExistingPathEvaluation() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {XboxLiveEndpointPair} 
     */
    get_EndpointPair() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveEndpointPair(value)
    }
}
