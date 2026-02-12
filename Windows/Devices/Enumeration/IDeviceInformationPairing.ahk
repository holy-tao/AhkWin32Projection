#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\DevicePairingResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceInformationPairing extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceInformationPairing
     * @type {Guid}
     */
    static IID => Guid("{2c4769f5-f684-40d5-8469-e8dbaab70485}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPaired", "get_CanPair", "PairAsync", "PairWithProtectionLevelAsync"]

    /**
     * @type {Boolean} 
     */
    IsPaired {
        get => this.get_IsPaired()
    }

    /**
     * @type {Boolean} 
     */
    CanPair {
        get => this.get_CanPair()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaired() {
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
    get_CanPair() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<DevicePairingResult>} 
     */
    PairAsync() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DevicePairingResult, result_)
    }

    /**
     * 
     * @param {Integer} minProtectionLevel 
     * @returns {IAsyncOperation<DevicePairingResult>} 
     */
    PairWithProtectionLevelAsync(minProtectionLevel) {
        result := ComCall(9, this, "int", minProtectionLevel, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DevicePairingResult, result_)
    }
}
