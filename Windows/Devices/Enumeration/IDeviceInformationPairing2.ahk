#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DeviceInformationCustomPairing.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\DevicePairingResult.ahk
#Include .\DeviceUnpairingResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceInformationPairing2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceInformationPairing2
     * @type {Guid}
     */
    static IID => Guid("{f68612fd-0aee-4328-85cc-1c742bb1790d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProtectionLevel", "get_Custom", "PairWithProtectionLevelAndSettingsAsync", "UnpairAsync"]

    /**
     * @type {Integer} 
     */
    ProtectionLevel {
        get => this.get_ProtectionLevel()
    }

    /**
     * @type {DeviceInformationCustomPairing} 
     */
    Custom {
        get => this.get_Custom()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevel() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DeviceInformationCustomPairing} 
     */
    get_Custom() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformationCustomPairing(value)
    }

    /**
     * 
     * @param {Integer} minProtectionLevel 
     * @param {IDevicePairingSettings} devicePairingSettings 
     * @returns {IAsyncOperation<DevicePairingResult>} 
     */
    PairWithProtectionLevelAndSettingsAsync(minProtectionLevel, devicePairingSettings) {
        result := ComCall(8, this, "int", minProtectionLevel, "ptr", devicePairingSettings, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DevicePairingResult, result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<DeviceUnpairingResult>} 
     */
    UnpairAsync() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceUnpairingResult, result_)
    }
}
